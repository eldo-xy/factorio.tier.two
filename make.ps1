# Read the info.json file
$json = Get-Content -Path 'info.json' | ConvertFrom-Json

# Get the version number from the json
$version = $json.version

# Create the zip filename and folder name
$zipName = "tiertwo_$($version)"
$folderName = $zipName

# Get all the files in the current directory, excluding the specified files and directories
$files = Get-ChildItem -Recurse | Where-Object {
    $_.FullName -notmatch '\\\.git\\' -and
    $_.Name -ne 'README.md' -and
    $_.Name -ne 'make.ps1' -and
    $_.Name -ne '.gitignore'
}

# Create the new directory
New-Item -ItemType Directory -Force -Path $folderName

# Copy the files to the new directory
$files | ForEach-Object {
    $relativePath = $_.FullName.Substring((Resolve-Path .).Path.Length + 1)
    $dest = Join-Path $folderName $relativePath
    if (-Not (Test-Path (Split-Path -Path $dest -Parent))) {
        New-Item -ItemType Directory -Force -Path (Split-Path -Path $dest -Parent) | Out-Null
    }
    Copy-Item -Path $_.FullName -Destination $dest
}

# Create the zip file
Compress-Archive -Path $folderName -DestinationPath "$zipName.zip"

# Remove the temporary directory
Remove-Item -Recurse -Force -Path $folderName