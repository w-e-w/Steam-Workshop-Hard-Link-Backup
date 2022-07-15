. "$PSScriptRoot\Workshop module - config.ps1"
. "$PSScriptRoot\Workshop module.ps1"

$workshops = select_workshops $Workshop_content_path $whitelist_workshop_id $blacklist_workshop_id
hard_link_copy_workshops $workshops $HardLink_Sync_root $HardLinks_Folder_Name $Removed_Folder_Name "$Timestamp Conflict"
