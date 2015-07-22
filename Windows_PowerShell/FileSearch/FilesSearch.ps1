param([string]$SearchPath, [string]$Text, [string]$ResultPath)

function GetHelp() {
	Write-Host "Example: FileSearch.ps1 -SearchPath <SearchPath> -Text <Text> -ResultPath <ResultPath>"
}

function FileSearch([string]$SearchPath, [string]$Text, [string]$ResultPath) {
	$PathArray = @()

	# gets all the files in $SearchPath and below
	Get-ChildItem $SearchPath -Filter "*" -Recurse | 
	   Where-Object { $_.Attributes -ne "Directory"} | 
		  ForEach-Object {
			 If ($_.FullName | Select-String -Pattern $Text) {
				#add path to array if it contains text pattern
				$PathArray += $_.FullName
			 }
		  }
	#Write-Host "Contents of ArrayPath:"
	$PathArray | ForEach-Object {$_} | Out-File $ResultPath
}

if ($SearchPath -AND $Text -AND $ResultPath) {
	FileSearch -SearchPath $SearchPath -Text $Text -ResultPath $ResultPath
} else {
	GetHelp
}
