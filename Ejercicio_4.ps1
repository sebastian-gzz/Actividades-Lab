Import-Module -Name MicrosoftTeams
Import-Module -Name Report
Import-Module -Name TeamPhoto
Import-Module -Name User
Import-Module -Name Teams
Import-Module -Name MicrosoftTeams

Login-User
$AllTeams = Get-Team -User $cred.UserName
$salida = $false
do{
    Write-Host "__[1]Opciones de Manejo de Equipos [2]Agregar Usuarios a Equipos con Permisos [3]Crear Reporte de los Equipos [4]Salir__"
    $opc = Read-Host -Prompt "Ingrese la categoria que desea" -ErrorAction SilentlyContinue 
    switch($opc){
        1{
            Write-Host "__[1]Ver Equipos [2]Crear Equipo [3]Eliminar Equipos (ocupa permisos)__"
            $opc2 = Read-Host -Prompt "Ingrese la opcion que desea" -ErrorAction SilentlyContinue
            switch($opc2){
                1{
                    View-Teams
                }
                2{
                    Create-Teams
                }
                3{
                    Erase-Teams
                }
                default{
                    Write-Host "Opcion invalida regresando"
                }
            }
        }
        2{
            Add-User
        }
        3{
            Create-Report
        }
        4{
        Disconnect-MicrosoftTeams
            $salida = $true
        }
    }
}while($salida -eq $false)