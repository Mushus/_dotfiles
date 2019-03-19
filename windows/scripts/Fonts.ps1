Param(
    [string] $fontName = "all"
)

Set-StrictMode -Version Latest

$fontTable = @{
    inconsolata = @{
        "Inconsolata-Regular.ttf" = "https://github.com/google/fonts/raw/master/ofl/inconsolata/Inconsolata-Regular.ttf";
        "Inconsolata-Bold.ttf" = "https://github.com/google/fonts/raw/master/ofl/inconsolata/Inconsolata-Bold.ttf";
    };
}

$pathTmp = "${PSScriptRoot}\tmp"
$addFontScript = "${PSScriptRoot}\lib\Add-Font.ps1"

function Install-Fonts($name)
{
    $fonts = $fontTable[$name]
    foreach ($font in $fonts.GetEnumerator()) {
        $fontName = $font.Key
        $savePath = "${pathTmp}\${fontName}"
        Invoke-WebRequest -Uri $font.Value -OutFile $savePath
        powershell $addFontScript $savePath
    }
}

If (-not(Test-Path $pathTmp)) {
    New-Item $pathTmp -ItemType Directory
}

If ($fontName -eq "all") {
    foreach ($fonts in $fontTable.keys) {
        Install-Fonts($fonts)
    }
}

If (Test-Path $pathTmp) {
    Remove-Item $pathTmp -Recurse
}