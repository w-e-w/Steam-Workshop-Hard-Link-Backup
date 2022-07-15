. "$PSScriptRoot\Workshop module - config.ps1"
. "$PSScriptRoot\Workshop module.ps1"
$HardLink_Sync_root
$workshops = select_workshops $HardLink_Sync_root $whitelist_workshop_id $blacklist_workshop_id
find_extra_files_workshops_move_location $workshops $Workshop_content_path $HardLinks_Folder_Name $Backups_Folder_Name $Timestamp

