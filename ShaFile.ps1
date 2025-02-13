
function Get-FileSHA1($filePath) {
    $fileContent = Get-Content $filePath 
    $fileBytes = [System.Text.Encoding]::UTF8.GetBytes($fileContent)

    $sha1 = New-Object System.Security.Cryptography.SHA1Managed

    $hash = $sha1.ComputeHash($fileBytes)

    $prettyHashSB = New-Object System.Text.StringBuilder
    foreach ($byte in $hash) {
        <# $byte is thash item #>
        $hexaNotation = $byte.ToString("X2")
        $prettyHashSB.Append($hexaNotation)
    }

    Write-Host $hash -BackgroundColor Red -ForegroundColor Yellow
}
Get-FileSHA1 C:\Users\wesll\OneDrive\Área de Trabalho\estudos\alura\PowerShell\ShaFile.ps1

function Get-FileSHA256() {

}
function Get-FileSHA384() {

}
function Get-FileSHA512() {

}
