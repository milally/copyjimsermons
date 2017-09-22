# This is a script written to copy Jim Weaver's Sermon recodings
# Author: Michael S. Lally
# Created: 2017-09-08

Write-Output "Script starting. This will take a while so be patient."
# Load the taglib dll found at http://download.banshee.fm/taglib-sharp/2.1.0.0/ 
[Reflection.Assembly]::LoadFile("C:\Windows\System32\taglib-sharp.dll")
$i=0
# Find all of the MP3 files we want
#$files = Get-ChildItem -Path "C:\Users\Public\Music\Sermon" -Recurse –File -Filter *.mp3
$files = Get-ChildItem -Path "Z:\Corporate Business\Audio" -Recurse –File -Filter *.mp3
Foreach ($file in $files) {
	$content = $file.FullName

# Load up the MP3 file. 
	$media = [TagLib.File]::Create($content)

# check the MP3 tags
	if ($media.Tag.Artists -like '*Weaver*') {
# found a match so increase our counter and copy the file.
		$i++
		Copy-Item -force $content "J:\Jim Sermons\"
	}
}
Write-Output "Work complete. Copied $i files."