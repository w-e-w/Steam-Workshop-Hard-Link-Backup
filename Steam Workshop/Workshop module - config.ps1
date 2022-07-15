# choose which Workshops you wished this script to operate on
# whitelist has precedence over blacklist
$whitelist_workshop_id = @(
    
)
#the Workshops the script will skip
$blacklist_workshop_id = @(
    "431960" # Wallpaper Engine
)

# path to the root where the workshop backups will be
$HardLink_Sync_root = "$env:USERPROFILE\Steam Workshop Backup"

$HardLinks_Folder_Name = "HardLinks"
$Backups_Folder_Name = "Backups"
$Removed_Folder_Name = "Removed"

# path to steam workshop content
$Workshop_content_path = "C:\Program Files (x86)\Steam\steamapps\workshop\content"



# conflict folder sufix times tamp
$Timestamp_Format = " yyyy-MM-dd HH-mm-ss"
$Script_Start_Time = Get-Date
$Timestamp = $Script_Start_Time.ToString($Timestamp_Format)

# ==================== initialize ====================
if (-Not (Test-Path -LiteralPath $Workshop_content_path -Type Container)) {
    Write-Error "Steam Workshop content directory not found at:`n$Workshop_content_path"
    exit
}

if ($null -eq (New-Item -Path $HardLink_Sync_root -ItemType Directory -Force)){
    Write-Error "Unable to create directory:`n$HardLink_Sync_root"
    exit
}
