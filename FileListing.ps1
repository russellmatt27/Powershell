# Define the directory to scan
$directory = "C:\Path\To\Directory"

# Define the output CSV file
$outputCsv = "C:\Path\To\Directory\FileList.csv"

# Get all files in the directory, sort them alphabetically, and select properties
$fileList = Get-ChildItem -Path $directory -File -Recurse |
    Select-Object @{Name='FileName';Expression={$_.Name}},
                  @{Name='Directory';Expression={$_.DirectoryName}},
                  @{Name='SizeInBytes';Expression={$_.Length}},
                  @{Name='LastModified';Expression={$_.LastWriteTime}},
                  @{Name='Created';Expression={$_.CreationTime}},
                  @{Name='Extension';Expression={$_.Extension}},
                  @{Name='FullPath';Expression={$_.FullName}} |
    Sort-Object FileName

# Export the file list to a CSV
$fileList | Export-Csv -Path $outputCsv -NoTypeInformation -Encoding UTF8

# Notify the user
Write-Output "File listing has been created: $outputCsv"
Write-Host "Total files found: $($filelist.Count)"
