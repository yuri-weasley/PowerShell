
function Get-FileSHA1 {
    param(
        [Parameter(
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = "FullName",
            Mandatory = $true
        )]
        [string] $filePath
    )

    begin {
        $sha1 = New-Object System.Security.Cryptography.SHA1Managed
        $prettyHashSB = New-Object System.Text.StringBuilder
    }

    process {
        $fileContent = Get-Content $filePath 
        $fileBytes = [System.Text.Encoding]::UTF8.GetBytes($fileContent)

        $hash = $sha1.ComputeHash($fileBytes)

            foreach ($byte in $hash) {
                <# $byte is thash item #>
            $hexaNotation = $byte.ToString("X2")
            $prettyHashSB.Append($hexaNotation) > $null
        }

        $prettyHashSB.ToString()
        $prettyHashSB.Clear() > $null
    }

    end {
        $sha1.Dispose()
    }

}

$arquivo = "C:\Users\wesll\OneDrive\Área de Trabalho\estudos\alura\PowerShell\ShaFile.ps1"
$hashDoArquivo = Get-FileSHA1 $arquivo

Write-Host "O hash do $arquivo eh $hashDoArquivo" -BackgroundColor Red -ForegroundColor Yellow

function Get-FileSHA256() {

}
function Get-FileSHA384() {

}
function Get-FileSHA512() {

}
