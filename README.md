# Steam-Workshop-Hard-Link-Backup
Preventing Steam from deleting Steam Workshop Downloads by using hard links as backup

## Usage
in `Steam Workshop` 3 scripts a provided for the user to use

`Update [Hard Links].ps1` create a copy of your Steam Workshop

`Move [HardLinks] except [Workshop] to [Backups].ps1`
move the files that are in [HardLinks] but not in [Workshop] to [Backups] folder

`Move [HardLinks] except [Workshop] to [Removed].ps1`
move the files that are in [HardLinks] but not in [Workshop] to [Removed] folder

---

by default `Wallpaper Engine` is blacklisted, because I haven't written a specialized version for `Wallpaper Engine.

for more information on how this works reference

https://github.com/w-e-w/Wallpaper-Engine-Hard-Link-Backup
