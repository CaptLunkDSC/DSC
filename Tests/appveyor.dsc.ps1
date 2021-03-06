# This script will invoke a DSC configuration
# This is a simple proof of concept

"`n`tPerforming DSC Configuration`n"

. .\DSC-Configurations\Domain\DSC01.ps1


( DC01 -ConfigurationData $ConfigData -safemodeAdministratorCred "" -domainCred "").FullName |

    Set-Content -Path .\Artifacts.txt


Start-DscConfiguration .\DC01 -Wait -Force -verbose


<#

    #If we want to test something in the res kit...



    #Initialize some variables, move to the project root

        $ProjectRoot = $ENV:APPVEYOR_BUILD_FOLDER

        Set-Location $ProjectRoot

   

    #Grab DSC, we would host this typically...

        New-Item -Path C:\TEMP\ -ItemType Directory -FOrce | Out-Null

        $URL = "https://gallery.technet.microsoft.com/scriptcenter/DSC-Resource-Kit-All-c449312d/file/131371/2/DSC%20Resource%20Kit%20Wave%2010%2002182015.zip"

        $ZIPPath = "C:\TEMP\DSC.ZIP"

        $DSCPath = "$env:ProgramFiles\WindowsPowerShell\Modules\"

        $Client = New-Object System.Net.WebClient

        $Client.DownloadFile($URL, $ZIPPath)

        Unblock-File $ZIPPath



    #Extract it

        [System.Reflection.Assembly]::LoadWithPartialName("System.IO.Compression.FileSystem") | Out-Null

        [System.IO.Compression.ZipFile]::ExtractToDirectory($ZIPPath, $DSCPath)



#>