. "$PSScriptRoot\..\bulk-directory-link-lib\bulk_directory_link_lib.ps1"

function select_workshops {
    param (
        [String]$Workshop_content_path,
        $whitelist_workshop_id,
        $blacklist_workshop_id
    )
    if (-Not (Test-Path -LiteralPath $Workshop_content_path -Type Container)) {
        Write-Error "Workshop Content directory not found at:`n$blacklist_workshop_id"
        exit
    }
    if ($whitelist_workshop_id.Count -eq 0 ) {
        $workshops = Get-ChildItem -LiteralPath $Workshop_content_path -Directory | Where-Object { $_.Name -notcontains $blacklist_workshop_id } | Where-Object {$_.Name -match "^[0-9]+$"}
    }
    else {
        $workshops = Get-ChildItem -LiteralPath $Workshop_content_path -Directory | Where-Object { $_.Name -contains $whitelist_workshop_id}
    }
    if ($workshops.Count -eq 0) {
        Write-Host "no Workshop selected"
    }
    return $workshops
}

function hard_link_copy_workshops {
    param (
        $workshops,
        [string]$HardLink_Sync_root,
        [string]$HardLinks_Folder_Name,
        [string]$Removed_Folder_Name,
        [string]$conflict_move_sub_dir_suffix
    )
    foreach ($workshop in $workshops) {
        foreach ($item in Get-ChildItem -LiteralPath $workshop.FullName -Directory) {
            hard_link_copy $item.FullName "$HardLink_Sync_root\$($workshop.Name)\$HardLinks_Folder_Name" "$HardLink_Sync_root\$($workshop.Name)\$Removed_Folder_Name" $conflict_move_sub_dir_suffix
        }
        
    } 
}

function find_extra_files_workshops_move_location {
    param (
        $workshops,
        [string]$Workshop_content_path,
        [string]$src_dir_name,
        [string]$move_dir_name,
        [string]$move_sub_dir_suffix
    )
    foreach ($workshop in $workshops) {
        $Hardlinks_path = "$($workshop.FullName)\$src_dir_name"
        find_extra_files_move_location $Hardlinks_path "$Workshop_content_path\$($workshop.Name)" "$($workshop.FullName)\$move_dir_name" $move_sub_dir_suffix
        # Remove Empty Directorys
        remove_dirs_with_nothing_but_sub_dirs_recurse $Hardlinks_path
    }
}