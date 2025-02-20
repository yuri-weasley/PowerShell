


function Add-ApplicationPool {
    param(
        [String[]] $ComputersName, 
        [String] $ApplicationPoolName
    )

    $ComputersName | ForEach-Object {
        Enter-PSSession -ComputerName $_

        $AppCmdArgs = "add apppool /name:$ApplicationPoolName"
    }
}