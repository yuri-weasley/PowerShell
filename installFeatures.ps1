

function Install-windowsFeaturesInServers {
    param(
        [String[]] $computers,
        [String] $featureName
    )

    $jobScriptBlock = {
        param(
            [String] $computerName,
            [String] $featureName
        )
        Install-windowsFeature -ComputerName $computerName -Name $featureName
    }

    $computers | ForEach-Object {
        Start-Job -Name "JOB_$_" -ScriptBlock $jobScriptBlock -ArgumentList ($_, $featureName)
    }
}