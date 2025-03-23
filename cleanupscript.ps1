# Can be used for clean up folders
# Create a variable:
$numberofdays 
$duration = (Get-Date).AddDays(-($numberofdays))
$path

# Delete folders recursively based on the numberofday
Get-ChildItem -Path $path -Recurse -Force | Where-Object { !$_.PSIsContainer -and $_.CreationTime -lt $duration } | Remove-Item -Force

# Clean up job
Get-ChildItem -Path $path -Recurse -Force | Where-Object { $_.PSIsContainer -and (Get-ChildItem -Path $_.FullName -Recurse -Force | Where-Object { !$_.PSIsContainer }) -eq $null } | Remove-Item -Force -Recurse
