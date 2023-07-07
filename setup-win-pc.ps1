# 1. Make sure the Microsoft App Installer is installed:
#    https://www.microsoft.com/en-us/p/app-installer/9nblggh4nns1
# 2. Edit the list of apps to install.
# 3. Run this script as administrator.

Write-Output "Installing Apps"
$apps = @(
    ### general utils ###
    @{name = "Ghisler.TotalCommander"},# TotalCommander
    @{name = "Google.Chrome" },
    @{name = "Microsoft.Edge" },
    @{name = "Microsoft.dotnet" },
    @{name = "Microsoft.PowerShell" },
    @{name = "Microsoft.PowerToys" },# Must have windows extensions like search bar, multirename, unlocked used files, etc..
    @{name = "Notepad++.Notepad++" },
    @{name = "Miro.Miro"},
    @{name = "JGraph.Draw"}#DrawIO Desktop
    @{name = "7zip.7zip" },
    @{name = "Adobe.Acrobat.Reader.64-bit" },
    #@{name = "GnuPG.Gpg4win" },
    @{name = "JohnMacFarlane.Pandoc" },#Markup converter
    @{name = "OpenJS.NodeJS.LTS" },
    @{name = "VideoLAN.VLC" },
    @{name = "WinDirStat.WinDirStat" },

    ### dev tools ###
    @{name = "Microsoft.SQLServerManagementStudio" }, # Includes AzureDataStudio
    @{name = "Microsoft.VisualStudio.2022.Professional" },
    @{name = "Microsoft.VisualStudioCode" },
    @{name = "Microsoft.WindowsTerminal" },
    @{name = "Postman.Postman "},
    @{name = "Axosoft.GitKraken" },
    @{name = "Git.Git" },
    @{name = "JanDeDobbeleer.OhMyPosh" },
    @{name = "JetBrains.Toolbox" },
    @{name = "JetBrains.ReSharper" },
    @{name = "Docker.DockerDesktop"},
    @{name = "Kubernetes.kubectl"},
    @{naem = "Microsoft.Azure.Kubelogin"}
);
Foreach ($app in $apps) {
    $listApp = winget list --exact -q $app.name
    if (![String]::Join("", $listApp).Contains($app.name)) {
        Write-host "Installing: " $app.name
        Try {
            winget install -e -h --accept-source-agreements --accept-package-agreements --id $app.name
            Write-Host "[$((Get-Date).TimeofDay)] Installed-Succ: " $app.name
        } Catch { 
            Write-host "[$((Get-Date).TimeofDay)] Install-Error: " $app.name
        }
    }
    else {
        Write-host "Install-Skipped: " $app.name " (already installed)"
    }
}