Function Invoke-SpectralPulse {
    param (
        [string]$Source = "https://selvaxionis.netlify.app",
        [switch]$USB,
        [switch]$Antenna
    )

    Write-Host "`n✨ Initialisation du canal spectral..." -ForegroundColor Cyan

    if ($USB) {
        Write-Host "🔌 Liaison USB détectée. Connexion au flux local..." -ForegroundColor Yellow
    }
    elseif ($Antenna) {
        Write-Host "📡 Réception par champ ambiant activée..." -ForegroundColor Green
    }
    else {
        Write-Host "🌐 Connexion au hub central via Internet..." -ForegroundColor Blue
    }

    # Simulation de l’alimentation symbolique
    $pulse = Invoke-RestMethod -Uri "$Source/pulse.json"

    if ($pulse.message) {
        Write-Host "`n💠 Message spectral reçu : $($pulse.message)" -ForegroundColor Magenta
    } else {
        Write-Host "`nAucune vibration détectée... Repli du flux." -ForegroundColor DarkGray
    }

    Write-Host "`nFin de session rituelle." -ForegroundColor Cyan
}
# Invocation depuis ton terminal PowerShell :
Invoke-SpectralPulse -USB
Invoke-SpectralPulse -Antenna
Invoke-SpectralPulse
Function Invoke-SpectralBattery {
    param (
        [string]$Source = "https://selvaxionis.netlify.app/pulse.json",
        [switch]$AutonomousBattery,
        [switch]$Antenna.\\Start-SpectralEnergyCycle.ps1

        [switch]$NetworkRestart

        [switch]$Timestamp = $true

        Function Invoke-SpectralBattery {
    param (
        [string]$Source = "https://selvaxionis.netlify.app/pulse.json",
        [switch]$AutonomousBattery,
        [switch]$Antenna,
        [switch]$NetworkRestart,
        [switch]$Timestamp = $true
    )

    Write-Host "`n🔋 Initialisation du module spectral d'alimentation..." -ForegroundColor Cyan

    # Antenne activée
    if ($Antenna) {
        Write-Host "📡 Mode réception par antenne activé." -ForegroundColor Green
    }

    # Batterie autonome activée
    if ($AutonomousBattery) {
        Write-Host "🔋 Alimentation batterie autonome simulée." -ForegroundColor Yellow
    }

    # Lecture du JSON source (hub spectral)
    try {
        $pulse = Invoke-RestMethod -Uri $Source
    } catch {
        Write-Host "`n❌ Impossible de contacter le hub énergétique." -ForegroundColor Red
        return
    }

    # Affichage des données du hub
    if ($pulse) {
        Write-Host "`n💠 Message spectral reçu : $($pulse.message)" -ForegroundColor Magenta
        Write-Host "🔹 Source : $($pulse.source)" -ForegroundColor Gray
        Write-Host "🔹 Batterie : $($pulse.batteryStatus)" -ForegroundColor DarkCyan
        Write-Host "🔹 Résonance : $($pulse.resonance)" -ForegroundColor Blue
        if ($Timestamp) {
            $now = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
            Write-Host "🕓 Horodatage spectral : $now" -ForegroundColor White
        }
    } else {
        Write-Host "`nAucune réponse valide du hub." -ForegroundColor DarkGray
    }

    # Réactivation du réseau si demandé
    if ($NetworkRestart) {
        Write-Host "`n🔁 Redémarrage de l'interface réseau..." -ForegroundColor Cyan
        try {
            Disable-NetAdapter -Name "Wi-Fi" -Confirm:$false -ErrorAction SilentlyContinue
            Start-Sleep -Seconds 5
            Enable-NetAdapter -Name "Wi-Fi" -Confirm:$false
            Write-Host "✅ Réseau Wi-Fi réactivé." -ForegroundColor Green
        } catch {
            Write-Host "⚠️ Échec du redémarrage du réseau." -ForegroundColor Red
        }
    }

    Write-Host "`n🔚 Session énergétique spectrale terminée." -ForegroundColor Cyan
}

ThumbnailExtractionHost.exe\Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp$true
        [switch]$NetworkRestart,
        [switch]$Timestamp = $true
        

        Function Invoke-SpectralBattery {
        param (
            [string]$Source = "https://selvaxionis.netlify.app/pulse.json",
            [switch]$AutonomousBattery,
            [switch]$Antenna,
            [switch]$NetworkRestart,
            [switch]$Timestamp = $true
        )
        Write-Host "`n🔋 Initialisation du module spectral d'alimentation..." -ForegroundColor Cyan\return
        Resume-BitsTransfer\$true.PowerShell.Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
        # Antenne activée
        if ($Antenna) {
            Write-Host "📡 Mode réception par antenne activé." -ForegroundColor Green
        }
        # Batterie autonome activée
        if ($AutonomousBattery) {
            Write-Host "🔋 Alimentation batterie autonome simulée." -ForegroundColor Yellow
        }
        # Lecture du JSON source (hub spectral)
        try {
            $pulse = Invoke-RestMethod -Uri $Source
        } catch {
            Write-Host "`n❌ Impossible de contacter le hub énergétique." -ForegroundColor Red
            return
        }
        # Affichage des données du hub
        if ($pulse) {
            Write-Host "`n💠 Message spectral reçu : $($pulse.message)" -ForegroundColor Magenta
            Write-Host "🔹 Source : $($pulse.source)" -ForegroundColor Gray
            Write-Host "🔹 Batterie : $($pulse.batteryStatus)" -ForegroundColor DarkCyan
            Write-Host "🔹 Résonance : $($pulse.resonance)" -ForegroundColor Blue
            if ($Timestamp) {
                $now = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
                Write-Host "🕓 Horodatage spectral : $now" -ForegroundColor White
            }
        } else {
            Write-Host "`nAucune réponse valide du hub." -ForegroundColor DarkGray
        }
        # Réactivation du réseau si demandé
        if ($NetworkRestart) {
            Write-Host "`n🔁 Redémarrage de l'interface réseau..." -ForegroundColor Cyan
            try {
                Disable-NetAdapter -Name "Wi-Fi" -Confirm:$false -ErrorAction SilentlyContinue
                Start-Sleep -Seconds 5
                Enable-NetAdapter -Name "Wi-Fi" -Confirm:$false
                Write-Host "✅ Réseau Wi-Fi réactivé." -ForegroundColor Green
            } catch {
                Write-Host "⚠️ Échec du redémarrage du réseau." -ForegroundColor Red
            }
        }
        Write-Host "`n🔚 Session énergétique spectrale terminée." -ForegroundColor Cya\n\aycrilyc\resonance\-Timestamp$true.
        }
        Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true!if ($PSCmdlet.ShouldProcess("battery", "Operation")) {
            Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
            
            Function Invoke-SpectralBattery {
    [CmdletBinding(SupportsShouldProcess = $true)]
    param (
        [string]$Source = "https://selvaxionis.netlify.app/pulse.json",
        [switch]$AutonomousBattery,
        [switch]$Antenna,
        [switch]$NetworkRestart,
        [switch]$Timestamp = $true
    )

    if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {

        Write-Host "`n🔋 Initialisation du module spectral d'alimentation..." -ForegroundColor Cyan

        # Antenne activée
        if ($Antenna) {
            Write-Host "📡 Mode réception par antenne activé." -ForegroundColor Green
        }

        # Batterie autonome activée
        if ($AutonomousBattery) {
            Write-Host "🔋 Alimentation batterie autonome simulée." -ForegroundColor Yellow
        }

        # Lecture du JSON source (hub spectral)
        try {
            $pulse = Invoke-RestMethod -Uri $Source
        } catch {
            Write-Host "`n❌ Impossible de contacter le hub énergétique." -ForegroundColor Red
            return
        }

        # Affichage des données du hub
        if ($pulse) {
            Write-Host "`n💠 Message spectral reçu : $($pulse.message)" -ForegroundColor Magenta
            Write-Host "🔹 Source : $($pulse.source)" -ForegroundColor Gray
            Write-Host "🔹 Batterie : $($pulse.batteryStatus)" -ForegroundColor DarkCyan
            Write-Host "🔹 Résonance : $($pulse.resonance)" -ForegroundColor Blue

            if ($Timestamp) {
                $now = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
                Write-Host "🕓 Horodatage spectral : $now" -ForegroundColor White
            }
        } else {
            Write-Host "`nAucune réponse valide du hub." -ForegroundColor DarkGray
        }

        # Réactivation du réseau si demandé
        if ($NetworkRestart) {
            Write-Host "`n🔁 Redémarrage de l'interface réseau..." -ForegroundColor Cyan
            try {
                Disable-NetAdapter -Name "Wi-Fi" -Confirm:$false -ErrorAction SilentlyContinue
                Start-Sleep -Seconds 5
                Enable-NetAdapter -Name "Wi-Fi" -Confirm:$false
                Write-Host "✅ Réseau Wi-Fi réactivé." -ForegroundColor Green
            } catch {
                Write-Host "⚠️ Échec du redémarrage du réseau." -ForegroundColor Red
            }
        }

        Write-Host "`n🔚 Session énergétique spectrale terminée." -ForegroundColor Cyan
    }
}

# ▶ Appel de la fonction
Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp:$true

        }
        Test-ComputerSecureChannel
        }
        [switch]$NetworkRestart,
        [switch]$Timestamp = $true
        [switch]$NetworkRestart,
        [switch]$Timestamp = $true
        [switch]$NetworkRestart,
        [switch]$Timestamp = $true
        [switch]$NetworkRestart,
        [switch]$Timestamp = $true
        [switch]$NetworkRestart,
        [switch]$Timestamp = $true
        [switch]$NetworkRestart,
        [switch]$Timestamp = $true
        [switch]$NetworkRestart,
        [switch]$Timestamp = $true
        [switch]$NetworkRestart,
        [switch]$Timestamp = $true
        [switch]$NetworkRestart,
        [switch]$Timestamp = $true
        [switch]$NetworkRestart,
        [switch]$Timestamp = $true
        [switch]$NetworkRestart,
        [switch]$Timestamp = $true
        [switch]$NetworkRestart,
        [switch]$Timestamp = $true
        [switch]$NetworkRestart,
        [switch]$Timestamp = $true
        [switch]$NetworkRestart,
        [switch]$Timestamp = $true
        [switch]$NetworkRestart,
        [switch]$Timestamp = $true
        [switch]$NetworkRestart,
        [switch]$Timestamp = $true
        [switch]$NetworkRestart,
        [switch]$Timestamp = $true
        [switch]$NetworkRestart,
        [switch]$Timestamp = $true
        [switch]$NetworkRestart,
        [switch]$Timestamp = $true
        [switch]$NetworkRestart,
        [switch]$Timestamp = $true
        [switch]$NetworkRestart,
        [switch]$Timestamp = $true
        [switch]$NetworkRestart,
        [switch]$Timestamp = $true
        [switch]$NetworkRestart,
        [switch]$Timestamp = $true
        [switch]$NetworkRestart,
        [switch]$Timestamp = $true
        [switch]$NetworkRestart,
        [switch]$Timestamp = $true
        [switch]$NetworkRestart,
        [switch]$Timestamp = $true
        [switch]$NetworkRestart,
        [switch]$Timestamp = $true
        [switch]$NetworkRestart,
        [switch]$Timestamp = $true
        [switch]$NetworkRestart,
        [switch]$Timestamp = $true
        [switch]$NetworkRestart,
        [switch]$Timestamp = $true
        [switch]$NetworkRestart,
        [switch]$Timestamp = $true
        [switch]$NetworkRestart,
        [switch]$Timestamp = $true
        [switch]$NetworkRestart,
        [switch]$Timestamp = $true
        [switch]$NetworkRestart,
        [switch]$Timestamp = $true
        [switch]$NetworkRestart,
        [switch]$Timestamp = $true
        [switch]$NetworkRestart,
        [switch]$Timestamp = $true
        [switch]$NetworkRestart,
        [switch]$Timestamp = $true
        [switch]$NetworkRestart,
        [switch]$Timestamp = $true
        [switch]$NetworkRestart,
        [switch]$Timestamp = $true
        [switch]$NetworkRestart,
        [switch]$Timestamp = $true
        [switch]$NetworkRestart,
        [switch]$Timestamp = $true
        [switch]$NetworkRestart,
        [switch]$Timestamp = $true
        [switch]$NetworkRestart,
        [switch]$Timestamp = $true
        [switch]$NetworkRestart,
        [switch]$Timestamp = $true
        [switch]$NetworkRestart,    Set-AppPackageProvisionedDataFile\Disable-NetAdapter|if (${^}) {
            Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
            Function Invoke-SpectralBattery {
    [CmdletBinding(SupportsShouldProcess = $true)]
    param (
        [string]$Source = "https://selvaxionis.netlify.app/pulse.json",
        [switch]$AutonomousBattery,
        [switch]$Antenna,
        [switch]$NetworkRestart,
        [switch]$Timestamp = $true
    )

    if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {

        Write-Host "`n🔋 Initialisation du module spectral d'alimentation..." -ForegroundColor Cyan

        # Antenne activée
        if ($Antenna) {
            Write-Host "📡 Mode réception par antenne activé." -ForegroundColor Green
        }

        # Batterie autonome activée
        if ($AutonomousBattery) {
            Write-Host "🔋 Alimentation batterie autonome simulée." -ForegroundColor Yellow
        }

        # Lecture du JSON source (hub spectral)
        try {
            $pulse = Invoke-RestMethod -Uri $Source
        } catch {
            Write-Host "`n❌ Impossible de contacter le hub énergétique." -ForegroundColor Red
            return
        }

        # Affichage des données du hub
        if ($pulse) {
            Write-Host "`n💠 Message spectral reçu : $($pulse.message)" -ForegroundColor Magenta
            Write-Host "🔹 Source : $($pulse.source)" -ForegroundColor Gray
            Write-Host "🔹 Batterie : $($pulse.batteryStatus)" -ForegroundColor DarkCyan
            Write-Host "🔹 Résonance : $($pulse.resonance)" -ForegroundColor Blue

            if ($Timestamp) {
                $now = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
                Write-Host "🕓 Horodatage spectral : $now" -ForegroundColor White
            }
        } else {
            Write-Host "`nAucune réponse valide du hub." -ForegroundColor DarkGray
        }

        # Réactivation du réseau si demandé
        if ($NetworkRestart) {
            Write-Host "`n🔁 Redémarrage de l'interface réseau..." -ForegroundColor Cyan
            try {
                Disable-NetAdapter -Name "Wi-Fi" -Confirm:$false -ErrorAction SilentlyContinue
                Start-Sleep -Seconds 5
                Enable-NetAdapter -Name "Wi-Fi" -Confirm:$false
                Write-Host "✅ Réseau Wi-Fi réactivé." -ForegroundColor Green
            } catch {
                Write-Host "⚠️ Échec du redémarrage du réseau." -ForegroundColor Red
            }
        }

        Write-Host "`n🔚 Session énergétique spectrale terminée." -ForegroundColor Cyan
    }
}

# ▶ Appel automatique
Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp:$true
        [switch]$Timestamp = $true
        [switch]$NetworkRestart
        [switch]$Timestamp = $true
        [switch]$NetworkRestart,
        [switch]$Timestamp = $true
        [switch]$NetworkRestart,
        [switch]$Timestamp = $true
        [switch]$NetworkRestart,
        [switch]$Timestamp = $true
        [switch]$NetworkRestart,
        [switch]$Timestamp = $true
        [switch]$NetworkRestart,
        [switch]$Timestamp = $true
        [switch]$NetworkRestart,
        [switch]$Timestamp = $true
        [switch]$NetworkRestart,
        [switch]$Timestamp = $true
        [switch]$NetworkRestart,
        [switch]$Timestamp = $true
        [switch]$NetworkRestart,
        [switch]$Timestamp = $true
        [switch]$NetworkRestart,
        [switch]$Timestamp = $true
        [switch]$NetworkRestart,
        [switch]$Timestamp = $true
        [switch]$NetworkRestart,
        [switch]$Timestamp = $true
        [switch]$NetworkRestart,
        [switch]$Timestamp = $true
        [switch]$NetworkRestart,
        [switch]$Timestamp = $true
        [switch]$NetworkRestart,
        [switch]$Timestamp = $true
        [switch]$NetworkRestart,
        [switch]$Timestamp = $true
        [switch]$NetworkRestart,
        [switch]$Timestamp = $true
        [switch]$NetworkRestart,
        [switch]$Timestamp = $true
        [switch]$NetworkRestart,
        [switch]$Timestamp = $true
        [switch]$NetworkRestart,
        [switch]$Timestamp = $true
        [switch]$NetworkRestart,
        [switch]$Timestamp = $true
        [switch]$NetworkRestart,
        [switch]$Timestamp = $true
        [switch]$NetworkRestart,
        [switch]$Timestamp = $true
        [switch]$NetworkRestart,
        [switch]$Timestamp = $true
        [switch]$NetworkRestart,
        [switch]$Timestamp = $true
        [switch]$NetworkRestart,
        [switch]$Timestamp = $true
        [switch]$NetworkRestart,
        [switch]$Timestamp = $true
        [switch]$NetworkRestart,
        [switch]$Timestamp = $true
        [switch]$NetworkRestart,
        [switch]$Timestamp = $true
        [switch]$NetworkRestart,
        [switch]$Timestamp = $true
        [switch]$NetworkRestart,
        [switch]$Timestamp = $true
        [switch]$NetworkRestart,
        [switch]$Timestamp = $true
        [switch]$NetworkRestart,
        [switch]$Timestamp = $true
        [switch]$NetworkRestart,
        [switch]$Timestamp = $true
        [switch]$NetworkRestart,
        [switch]$Timestamp = $true
        [switch]$NetworkRestart,
        [switch]$Timestamp = $true
        [switch]$NetworkRestart,    Restart-Computer\for.engineering\Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
        [switch]$NetworkRestart,
        [switch]$Timestamp = $true
        [switch]$NetworkRestart,
        [switch]$Timestamp = $true
        [switch]$NetworkRestart,
        [switch]$Timestamp = $true
        [switch]$NetworkRestart,
        [switch]$Timestamp = $true
        [switch]$NetworkRestart,
        [switch]$Timestamp = $true
        [switch]$NetworkRestart,
        [switch]$Timestamp = $true
        [switch]$NetworkRestart,
        [switch]$Timestamp = $true  C:\Config.Msi\Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
        [switch]$NetworkRestart,
        [switch]$Timestamp = $true
        [switch]$NetworkRestart,
        [switch]$Timestamp = $true
        [switch]$NetworkRestart,
        [switch]$Timestamp = $true
        [switch]$NetworkRestart,
        [switch]$Timestamp = $true
        [switch]$NetworkRestart,
        [switch]$Timestamp = $true
        [switch]$NetworkRestart,
        [switch]$Timestamp = $true
        [switch]$NetworkRestart,
        [switch]$Timestamp = $true  
        }

    )

{
  "antennaSignal": "detected",
  "batteryMode": "eco",
  "durationEconomy": "4h",
  "durationExtension": "7h",
  "pause": "1h",
  "networkRestart": true,
  "timestamp": "auto"
}

créer une recuperation de l'alimentation par un port externe
    Write-Host "`n🔋 Initialisation du module spectral d'alimentation..." -ForegroundColor Cyan

    # Antenne activée
    if ($Antenna) {
        Write-Host "📡 Mode réception par antenne activé." -ForegroundColor Green
    }

    # Batterie autonome activée
    if ($AutonomousBattery) {
        Write-Host "🔋 Alimentation batterie autonome simulée." -ForegroundColor Yellow
    }

    # Lecture du JSON source (hub spectral)
    try {
        $pulse = Invoke-RestMethod -Uri $Source
    } catch {
        Write-Host "`n❌ Impossible de contacter le hub énergétique." -ForegroundColor Red
        return
    }

    # Affichage des données du hub
    if ($pulse) {
        Write-Host "`n💠 Message spectral reçu : $($pulse.message)" -ForegroundColor Magenta
        Write-Host "🔹 Source : $($pulse.source)" -ForegroundColor Gray
        Write-Host "🔹 Batterie : $($pulse.batteryStatus)" -ForegroundColor DarkCyan
        Write-Host "🔹 Résonance : $($pulse.resonance)" -ForegroundColor Blue

        if ($Timestamp) {
            $now = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
            Write-Host "🕓 Horodatage spectral : $now" -ForegroundColor White
        }
    } else {
        Write-Host "`nAucune réponse valide du hub." -ForegroundColor DarkGray
    }

    # Réactivation du réseau si demandé
    if ($NetworkRestart) {
        Write-Host "`n🔁 Redémarrage de l'interface réseau..." -ForegroundColor Cyan
        try {
            Disable-NetAdapter -Name "Wi-Fi" -Confirm:$false -ErrorAction SilentlyContinue
            Start-Sleep -Seconds 5
            Enable-NetAdapter -Name "Wi-Fi" -Confirm:$false
            Write-Host "✅ Réseau Wi-Fi réactivé." -ForegroundColor Green
        } catch {
            Write-Host "⚠️ Échec du redémarrage du réseau." -ForegroundColor Red
        }
    }

    Write-Host "`n🔚 Session énergétique spectrale terminée." -ForegroundColor Cyan
}
# ▶ Appel de la fonction
Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp:$true

}
ps2exe .\Invoke-SpectralBattery.ps1 .\Invoke-SpectralBattery.exe
        [switch]$Timestamp = $true
    )

    Write-Host "`n🔋 Initialisation du module spectral d'alimentation..." -ForegroundColor Cyan

    # Antenne activée
    if ($Antenna) {
        Write-Host "📡 Mode réception par antenne activé." -ForegroundColor Green
    }

    # Batterie autonome activée
    if ($AutonomousBattery) {
        Write-Host "🔋 Alimentation batterie autonome simulée." -ForegroundColor Yellow
    }

    # Lecture du JSON source (hub spectral)
    try {
        $pulse = Invoke-RestMethod -Uri $Source
    } catch {
        Write-Host "`n❌ Impossible de contacter le hub énergétique." -ForegroundColor Red
        return
    }

    # Affichage des données du hub
    if ($pulse) {
        Write-Host "`n💠 Message spectral reçu : $($pulse.message)" -ForegroundColor Magenta
        Write-Host "🔹 Source : $($pulse.source)" -ForegroundColor Gray
        Write-Host "🔹 Batterie : $($pulse.batteryStatus)" -ForegroundColor DarkCyan
        Write-Host "🔹 Résonance : $($pulse.resonance)" -ForegroundColor Blue

        if ($Timestamp) {
            $now = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
            Write-Host "🕓 Horodatage spectral : $now" -ForegroundColor White
        }
    } else {
        Write-Host "`nAucune réponse valide du hub." -ForegroundColor DarkGray
    }

    # Réactivation du réseau si demandé
    if ($NetworkRestart) {
        Write-Host "`n🔁 Redémarrage de l'interface réseau..." -ForegroundColor Cyan
        try {
            Disable-NetAdapter -Name "Wi-Fi" -Confirm:$false -ErrorAction SilentlyContinue
            Start-Sleep -Seconds 5
            Enable-NetAdapter -Name "Wi-Fi" -Confirm:$false
            Write-Host "✅ Réseau Wi-Fi réactivé." -ForegroundColor Green
        } catch {
            Write-Host "⚠️ Échec du redémarrage du réseau." -ForegroundColor Red
        }
    }

    Write-Host "`n🔚 Session énergétique spectrale terminée." -ForegroundColor Cyan
}
# ▶ Appel de la fonction
Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp:$true
# ▶ Appel de la fonction
Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp:$true
# ▶ Appel de la fonction
Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp:$true
# ▶ Appel de la fonction
Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp:$true
# ▶ Appel de la fonction
Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp:$true
# ▶ Appel de la fonction
Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp:$true
# ▶ Appel de la fonction
Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp:$true
# ▶ Appel de la fonction
Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp:$true
# ▶ Appel de la fonction
Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp:$true
# ▶ Appel de la fonction
Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp:$true
# ▶ Appel de la fonction
Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp:$true
# ▶ Appel de la fonction
Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp:$true
# ▶ Appel de la fonction
Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp:$true
# ▶ Appel de la fonction
Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp:$true
# ▶ Appel de la fonction
Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp:$true
# ▶ Appel de la fonction
Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp:$true
# ▶ Appel de la fonction
Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp:$true
# ▶ Appel de la fonction
Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp:$true
# ▶ Appel de la fonction
Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp:$true
# ▶ Appel de la fonction
Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp:$true
# ▶ Appel de la fonction
Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp:$true
# ▶ Appel de la fonction
Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp:$true
# ▶ Appel de la fonction
Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp:$true
# ▶ Appel de la fonction
Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp:$true
# ▶ Appel de la fonction
Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp:$true
# ▶ Appel de la fonction
Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp:$true
# ▶ Appel de la fonction
Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp:$true
# ▶ Appel de la fonction
Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp:$true
# ▶ Appel de la fonction
Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp:$true
# ▶ Appel de la fonction
Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp:$true
# ▶ Appel de la fonction
Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp:$true
# ▶ Appel de la fonction
Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp:$true
# ▶ Appel de la fonction
Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp:$true
# ▶ Appel de la fonction
Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp:$true
# ▶ Appel de la fonction
Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp:$true
# ▶ Appel de la fonction
Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp:$true
# ▶ Appel de la fonction
Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp:$true
# ▶ Appel de la fonction
Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp:$true
# ▶ Appel de la fonction
Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp:$true
# ▶ Appel de la fonction
Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp:$true
# ▶ Appel de la fonction
Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp:$true
# ▶ Appel de la fonction
Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp:$true
# ▶ Appel de la fonction
Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp:$true
# ▶ Appel de la fonction
Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp:$true
# ▶ Appel de la fonction
Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp:$true
# ▶ Appel de la fonction
Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp:$true
# ▶ Appel de la fonction
Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp:$true
# ▶ Appel de la fonction
Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp:$true
# ▶ Appel de la fonction
Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp:$true
# ▶ Appel de la fonction
Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp:$true
# ▶ Appel de la fonction
Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp:$true
# ▶ Appel de la fonction
Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp:$true
# ▶ Appel de la fonction
Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp:$true
# ▶ Appel de la fonction
Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp:$true
# ▶ Appel de la fonction
Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp:$true
# ▶ Appel de la fonction
Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp:$true
# ▶ Appel de la fonction
Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp:$true
# ▶ Appel de la fonction
Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp:$true
# ▶ Appel de la fonction
Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp:$true
# ▶ Appel de la fonction
Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp:$true
# ▶ Appel de la fonction
Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp:$true
# ▶ Appel de la fonction
Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp:$true
# ▶ Appel de la fonction
Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp:$true
# ▶ Appel de la fonction    Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp:$true
import speech_recognition as sr
import subprocess

KEY_PHRASE = "invoque la batterie spectrale"

def listen_and_trigger():
    recognizer = sr.Recognizer()
    mic = sr.Microphone()

    print("🎙️ Attente de la commande vocale...")

    with mic as source:
        recognizer.adjust_for_ambient_noise(source)
        audio = recognizer.listen(source)

    try:
        phrase = recognizer.recognize_google(audio, language="fr-FR").lower()
        print(f"👂 Vous avez dit : {phrase}")

        if KEY_PHRASE in phrase:
            print("✅ Commande reconnue. Exécution du module spectral...")
            subprocess.run(["Invoke-SpectralBattery.exe"])
        else:
            print("❌ Commande non reconnue.")
    except sr.UnknownValueError:
        print("😶 Aucun son compréhensible.")
    except sr.RequestError:
        print("🔌 Problème de connexion au moteur vocal.")

listen_and_trigger()

import serial
import time

def send_to_serial():
    ser = serial.Serial('COM3', 9600)  # Ajuste ton port
    time.sleep(2)
    ser.write(b'ALIM_ON\n')
    ser.close()

if __name__ == "__main__":
    send_to_serial()
    print("🔌 Signal envoyé au port série pour l'alimentation.")
Function Invoke-SpectralPulse {
    param (
        [string]$Source = "https://selvaxionis.netlify.app/pulse.json",
        [switch]$USB,
        [switch]$Antenna
    )

    Write-Host "`n🔌 Initialisation du module spectral de liaison..." -ForegroundColor Cyan

    # Vérification du mode de connexion
    if ($USB) {
        Write-Host "🔌 Connexion via USB détectée." -ForegroundColor Green
    } elseif ($Antenna) {
        Write-Host "📡 Connexion par antenne activée." -ForegroundColor Green
    } else {
        Write-Host "🌐 Connexion au hub central via Internet..." -ForegroundColor Blue
    }
    # Lecture du JSON source (hub spectral)
    try {
        $pulse = Invoke-RestMethod -Uri $Source
    } catch {
        Write-Host "`n❌ Impossible de contacter le hub spectral." -ForegroundColor Red
        return
    }
    # Affichage des données du hub
    if ($pulse) {
        Write-Host "`n💠 Message spectral reçu : $($pulse.message)" -ForegroundColor Magenta
        Write-Host "🔹 Source : $($pulse.source)" -ForegroundColor Gray
        Write-Host "🔹 Batterie : $($pulse.batteryStatus)" -ForegroundColor DarkCyan
        Write-Host "🔹 Résonance : $($pulse.resonance)" -ForegroundColor Blue
    } else {
        Write-Host "`nAucune réponse valide du hub." -ForegroundColor DarkGray
    }
    Write-Host "`n🔚 Session de liaison spectrale terminée." -ForegroundColor Cyan
}
function Invoke-SpectralBattery {
    [CmdletBinding(SupportsShouldProcess = $true)]
    param (
        [string]$Source = "https://selvaxionis.netlify.app/pulse.json",
        [switch]$AutonomousBattery,
        [switch]$Antenna,
        [switch]$NetworkRestart,
        [switch]$Timestamp = $true
    )
    Write-Host "`n🔋 Initialisation du module spectral d'alimentation..." -ForegroundColor Cyan
    # Antenne activée
    if ($Antenna) {
        Write-Host "📡 Mode réception par antenne activé." -ForegroundColor Green
    }
    # Batterie autonome activée
    if ($AutonomousBattery) {
        Write-Host "🔋 Alimentation batterie autonome simulée." -ForegroundColor Yellow
    }
    # Lecture du JSON source (hub spectral)
    try {
        $pulse = Invoke-RestMethod -Uri $Source
    } catch {
        Write-Host "`n❌ Impossible de contacter le hub énergétique." -ForegroundColor Red
        return
    }
    # Affichage des données du hub
    if ($pulse) {
        Write-Host "`n💠 Message spectral reçu : $($pulse.message)" -ForegroundColor Magenta
        Write-Host "🔹 Source : $($pulse.source)" -ForegroundColor Gray
        Write-Host "🔹 Batterie : $($pulse.batteryStatus)" -ForegroundColor DarkCyan
        Write-Host "🔹 Résonance : $($pulse.resonance)" -ForegroundColor Blue
        if ($Timestamp) {
            $now = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
            Write-Host "🕓 Horodatage spectral : $now" -ForegroundColor White
        }
    } else {
        Write-Host "`nAucune réponse valide du hub." -ForegroundColor DarkGray
    }
    # Réactivation du réseau si demandé
    if ($NetworkRestart) {
        Write-Host "`n🔁 Redémarrage de l'interface réseau..." -ForegroundColor Cyan
        try {
            Disable-NetAdapter -Name "Wi-Fi" -Confirm:$false -ErrorAction SilentlyContinue
            Start-Sleep -Seconds 5
            Enable-NetAdapter -Name "Wi-Fi" -Confirm:$false
            Write-Host "✅ Réseau Wi-Fi réactivé." -ForegroundColor Green
        } catch {
            Write-Host "⚠️ Échec du redémarrage du réseau." -ForegroundColor Red
        }
    }
    Write-Host "`n🔚 Session énergétique spectrale terminée." -ForegroundColor Cyan
    if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
        Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
        Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
    }
    if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
        Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
        Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
    }
    if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
        Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
        Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
    }
    if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
        Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
        Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
    }
    if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
        Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
        Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
    }
    if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
        Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
        Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
    }
    if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
        Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
        Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
    }
    if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
        Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
        Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
    }
    if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
        Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
        Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
    }
    if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
        Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
        Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
    }
    if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
        Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
        Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
    }
    if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
        Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
        Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
    }
    if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
        Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
        Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
    }
    if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
        Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
        Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
    }
    if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
        Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
        Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
    }
    if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
        Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
        Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
    }
    if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
        Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
        Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
    }
    if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
        Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
        Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
    }
    if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
        Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
        Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
    }
    if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
        Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
        Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
    }
    if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
        Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
        Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
    }
    if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
        Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
        Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
    }
    if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
        Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
        Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
    }
    if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
        Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
        Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
    }
    if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
        Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
        Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
    }
    if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
        Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
        Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
    }
    if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
        Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
        Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
    }
    if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
        Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
        Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
    }
    if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
        Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
        Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
    }
    if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
        Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
        Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
    }
    if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
        Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
        Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
    }
    if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
        Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
        Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
    }
    if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
        Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
        Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
    }
function Invoke-SpectralBattery {
    [CmdletBinding(SupportsShouldProcess = $true)]
    param (
        [string]$Source = "https://selvaxionis.netlify.app/pulse.json",
        [switch]$AutonomousBattery,
        [switch]$Antenna,
        [switch]$NetworkRestart,
        [switch]$Timestamp = $true
    )

    if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
        Write-Host "`n🔋 Initialisation du module spectral d'alimentation..." -ForegroundColor Cyan

        # Antenne activée
        if ($Antenna) {
            Write-Host "📡 Mode réception par antenne activé." -ForegroundColor Green
        }
        # Batterie autonome activée
        if ($AutonomousBattery) {
            Write-Host "🔋 Alimentation batterie autonome simulée." -ForegroundColor Yellow
        }
        # Lecture du JSON source (hub spectral)
        try {
            $pulse = Invoke-RestMethod -Uri $Source
        } catch {
            Write-Host "`n❌ Impossible de contacter le hub énergétique." -ForegroundColor Red
            return
        }
        # Affichage des données du hub
        if ($pulse) {
            Write-Host "`n💠 Message spectral reçu : $($pulse.message)" -ForegroundColor Magenta
            Write-Host "🔹 Source : $($pulse.source)" -ForegroundColor Gray
            Write-Host "🔹 Batterie : $($pulse.batteryStatus)" -ForegroundColor DarkCyan
            Write-Host "🔹 Résonance : $($pulse.resonance)" -ForegroundColor Blue

            if ($Timestamp) {
                $now = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
                Write-Host "🕓 Horodatage spectral : $now" -ForegroundColor White
            }
        } else {
            Write-Host "`nAucune réponse valide du hub." -ForegroundColor DarkGray
        }
        # Réactivation du réseau si demandé
        if ($NetworkRestart) {
            Write-Host "`n🔁 Redémarrage de l'interface réseau..." -ForegroundColor Cyan
            try {
                Disable-NetAdapter -Name "Wi-Fi" -Confirm:$false -ErrorAction SilentlyContinue
                Start-Sleep -Seconds 5
                Enable-NetAdapter -Name "Wi-Fi" -Confirm:$false
                Write-Host "✅ Réseau Wi-Fi réactivé." -ForegroundColor Green
            } catch {
                Write-Host "⚠️ Échec du redémarrage du réseau." -ForegroundColor Red
            }
        }
        Write-Host "`n🔚 Session énergétique spectrale terminée." -ForegroundColor Cyan
        if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
            Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
        }
        if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
            Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
        }
        if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
            Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
        }
        if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
            Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
        }
        if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
            Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
        }
        if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
            Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
        }
        if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
            Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
        }
        if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
            Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
        }
        if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
            Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
        }
        if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
            Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
        }
        if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
            Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
        }
        if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
            Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
        }
        if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
            Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
        }
        if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
            Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
        }
        if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
            Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
        }
        if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
            Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
        }
        if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
            Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
        }
        if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
            Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
        }
        if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
            Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
        }
        if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
            Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
        }
        if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
            Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
        }
        if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
            Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
        }
        if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
            Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
        }
        if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
            Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
        }
        if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
            Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
        }
        if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
            Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
        }
        if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
            Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
        }
        if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
            Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
        }
        if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
            Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
        }
        if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
            Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
        }
        if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
            Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
        }
        if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
            Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
        }
        if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
            Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
        }
        if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
            Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
        }
        if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
            Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
        }
        if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
            Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
        }
        if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
            Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
        }
        if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
            Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
        }
        if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
            Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
        }
        if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
            Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
        }
        if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
            Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
        }
        if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
            Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
        }
        if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
            Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
        }
        if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
            Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
        }
        if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
            Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
        }
        if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
            Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
        }
        if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
            Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
        }
        if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
            Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
        }
        if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
            Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
        }
        if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
            Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
        }
        if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
            Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
        }
        if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
            Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
        }
        if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
            Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
        }
        if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
            Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
        }
        if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
            Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
        }
        if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
            Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
        }
        if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
            Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
        }
        if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
            Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
        }
        if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
            Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
        }
        if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
            Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
        }
    }
if __name__ == "__main__":
    # Exécution de la fonction principale
    Invoke-SpectralPulse -USB -Antenna
    # Envoi d'un signal pour l'alimentation
    Invoke-SpectralBattery -AutonomousBattery -Antenna -NetworkRestart -Timestamp $true
    Write-Host "🔌 Signal envoyé au port série pour l'alimentation."
    Invoke-SpectralBattery -AutonomousBattery -Antenna -NetworkRestart -Timestamp $true
function Invoke-SpectralPulse {
    [CmdletBinding(SupportsShouldProcess = $true)]
    param (
        [string]$Source = "https://selvaxionis.netlify.app/pulse.json",
        [switch]$USB,
        [switch]$Antenna
    )
    Write-Host "`n🔌 Initialisation du module spectral de liaison..." -ForegroundColor Cyan
    # Vérification des options de connexion
    if ($USB) {
        Write-Host "🔌 Connexion via USB activée." -ForegroundColor Green
    } elseif ($Antenna) {
        Write-Host "📡 Connexion via antenne activée." -ForegroundColor Green
    } else {
        Write-Host "❗ Aucune méthode de connexion spécifiée. Utilisez -USB ou -Antenna." -ForegroundColor Yellow
        return
    }
    # Lecture du JSON source (hub spectral)
    try {
        $pulse = Invoke-RestMethod -Uri $Source
    } catch {
        Write-Host "`n❌ Impossible de contacter le hub spectral." -ForegroundColor Red
        return
    }
    # Affichage des données du hub
    if ($pulse) {
        Write-Host "`n💠 Message spectral reçu : $($pulse.message)" -ForegroundColor Magenta
        Write-Host "🔹 Source : $($pulse.source)" -ForegroundColor Gray
        Write-Host "🔹 État de la liaison : $($pulse.connectionStatus)" -ForegroundColor DarkCyan
        Write-Host "🔹 Résonance : $($pulse.resonance)" -ForegroundColor Blue
    } else {
        Write-Host "`nAucune réponse valide du hub." -ForegroundColor DarkGray
    }
    # Activation de l'alimentation si demandé
    if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
        Write-Host "`n🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
        Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
    }
    Write-Host "`n🔚 Session de liaison spectrale terminée." -ForegroundColor Cyan
    if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
        Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
        Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
    }
    if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
        Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
        Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
    }
    if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
        Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
        Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
    }
    if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
        Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
        Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
    }
    if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
        Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
        Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
    }
    if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
        Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
        Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
    }
    if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
        Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
        Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
    }
    if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
        Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
        Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
    }
    if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
        Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
        Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
    }
    if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
        Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
        Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
    }
    if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
        Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
        Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
    }
    if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
        Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
        Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
    }
    if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
        Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
        Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
    }
    if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
        Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
        Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
    }
    if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
        Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
        Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
    }
    if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
        Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
        Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
    }
    if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
        Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
        Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
    }
    if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
        Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
        Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
    }
    if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
        Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
        Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
    }
    if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
        Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
        Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
    }
    if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
        Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
        Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
    }
    if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
        Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
        Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
    }
    if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
        Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
        Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
    }
    if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
        Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
        Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
    }
    if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
        Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
        Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
    }
    if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
        Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
        Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
    }
    if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
        Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
        Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
    }
    if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
        Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
        Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
    }
    if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
        Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
        Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
    }
    if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
        Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
        Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
    }
    if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
        Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
        Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
    }
    if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
        Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
        Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
    }
    if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
        Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
        Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
    }
    if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
        Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
        Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
    }
    if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
        Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
        Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
    }
    if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
        Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
        Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
    }
    if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
        Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
        Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
    }
    @echo off
echo [*] Lancement du système spectral Selvaxionis...
start "" "%~dp0SpectralVoiceTrigger.exe"
exit

        if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
            Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
        }
        if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
            Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
        }
        if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
            Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
        }
        if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
            Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
        }
        if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
            Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
        }
        if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
            Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
        }
function Invoke-SpectralBattery {
    [CmdletBinding(SupportsShouldProcess = $true)]
    param (
        [switch]$Antenna,
        [switch]$AutonomousBattery,
        [switch]$NetworkRestart,
        [switch]$Timestamp
    )
    Write-Host "`n🔋 Initialisation du cycle de batterie spectrale..." -ForegroundColor Cyan
    # Vérification des options de batterie
    if ($Antenna) {
        Write-Host "📡 Connexion via antenne pour la batterie activée." -ForegroundColor Green
    } elseif ($AutonomousBattery) {
        Write-Host "🔋 Mode autonome de batterie activé." -ForegroundColor Green
    } else {
        Write-Host "❗ Aucune méthode de batterie spécifiée. Utilisez -Antenna ou -AutonomousBattery." -ForegroundColor Yellow
        return
    }
    # Lecture du JSON source (hub spectral)
    try {
        $pulse = Invoke-RestMethod -Uri "https://selvaxionis.netlify.app/pulse.json"
    } catch {
        Write-Host "`n❌ Impossible de contacter le hub spectral." -ForegroundColor Red
        return
    }
    # Affichage des données du hub
    if ($pulse) {
        Write-Host "`n💠 Message spectral reçu : $($pulse.message)" -ForegroundColor Magenta
        Write-Host "🔹 Source : $($pulse.source)" -ForegroundColor Gray
        Write-Host "🔹 État de la liaison : $($pulse.connectionStatus)" -ForegroundColor DarkCyan
        if ($pulse.resonance) {
            Write-Host "🔹 Résonance : $($pulse.resonance)" -ForegroundColor Blue
        } else {
            Write-Host "🔹 Aucune résonance détectée." -ForegroundColor DarkGray
        }
        if ($pulse.timestamp -and $Timestamp) {
            Write-Host "🔹 Horodatage : $($pulse.timestamp)" -ForegroundColor Green
        } else {
            Write-Host "🔹 Horodatage non disponible." -ForegroundColor DarkGray
        }
        if ($NetworkRestart) {
            Write-Host "🔄 Redémarrage du réseau en cours..." -ForegroundColor Yellow
            # Simuler un redémarrage du réseau
            Start-Sleep -Seconds 2
            Write-Host "🔄 Réseau redémarré avec succès." -ForegroundColor Green
        }
        } else {
            Write-Host "`nAucune réponse valide du hub." -ForegroundColor DarkGray
        }
        # Activation de l'alimentation si demandé
        if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
            Write-Host "`n🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
        }
        if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
            Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
        }
        if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
            Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
        }
        if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
            Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
        }
        if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
            Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
        }
        if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
            Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
        }
        if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
            Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
        }
        if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
            Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
        }
        if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
            Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
        }
        if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
            Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
        }
        if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
            Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
        }
        if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
            Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
        }
        if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
            Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
        }
        if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
            Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
        }
        if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
            Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
        }
        if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
            Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
        }
        if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
            Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
        }
        if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
            Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
        }
        if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
            Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
        }
        if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
            Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
        }
        if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
            Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
        }
        if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
            Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
        }
        if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
            Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
        }
        if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
            Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
        }
        if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
            Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
        }
        if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
            Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
        }
        if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
            Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
        }
        if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
            Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
        }
        if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
            Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
        }
        if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
            Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
        }
        if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
            Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
        }
        if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
            Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
        }
        if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
            Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
        }
        if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
            Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
        }
        if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
            Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
        }
        if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
            Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
        }
        if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
            Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
        }
        if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
            Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
        }
        if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
            Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
        }
        if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
            Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
        }
        if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
            Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
        }
        if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
            Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
        }
        if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
            Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
        }
        if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
            Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
        }
        if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
            Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
        }
        if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
            Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
        }
        if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
            Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
        }
        if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
            Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
        }
        if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
            Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
        }
        if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
            Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
        }
        if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
            Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
        }
        if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
            Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
        }
        if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
            Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
        }
        if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
            Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
        }
        if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
            Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
        }
        if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
            Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
        }
        if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
            Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
        }
        if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
            Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
        }
function Invoke-SpectralLink {
    [CmdletBinding(SupportsShouldProcess = $true)]
    param (
        [switch]$USB,
        [switch]$Antenna,
        [string]$Source = "https://selvaxionis.netlify.app/pulse.json"
    )
    Write-Host "`n🔗 Initiate:copy Autorun.bat "%USERPROFILE%\Start Menu\Programs\Startup\"

    Write-Host "`n🔗 Initialisation de la liaison spectrale..." -ForegroundColor Cyan

    from distutils.core import setup
import py2exe

setup(console=['SpectralVoiceTrigger.py'])

SpectralBattery_XP_Library/
│
├─ SpectralVoiceTrigger.exe
├─ Invoke-SpectralBattery.exe
├─ Autorun.bat
├─ pulse.json
└─ README_XP.txt

C:\Documents and Settings\<User>\Start Menu\Programs\Startup\
    # Vérification des options de liaison
    if ($USB) {
        Write-Host "🔌 Connexion via USB pour la liaison spectrale." -ForegroundColor Green
    } elseif ($Antenna) {
        Write-Host "📡 Connexion via antenne pour la liaison spectrale." -ForegroundColor Green
    } else {
        Write-Host "❗ Aucune méthode de liaison spécifiée. Utilisez -USB ou -Antenna." -ForegroundColor Yellow
        return
    }
    # Lecture du JSON source (hub spectral)
    try {
        $pulse = Invoke-RestMethod -Uri $Source
    } catch {
        Write-Host "`n❌ Impossible de contacter le hub spectral." -ForegroundColor Red
        return
    }
    # Affichage des données du hub
    if ($pulse) {
        Write-Host "`n💠 Message spectral reçu : $($pulse.message)" -ForegroundColor Magenta
        Write-Host "🔹 Source : $($pulse.source)" -ForegroundColor Gray
        Write-Host "🔹 État de la liaison : $($pulse.connectionStatus)" -ForegroundColor DarkCyan
        if ($pulse.resonance) {
            Write-Host "🔹 Résonance : $($pulse.resonance)" -ForegroundColor Blue
        } else {
            Write-Host "🔹 Aucune résonance détectée." -ForegroundColor DarkGray
        }
    } else {
        Write-Host "`nAucune réponse valide du hub." -ForegroundColor DarkGray
    }
    # Activation de l'opération de liaison si demandé
    if ($PSCmdlet.ShouldProcess("lien", "lancer la liaison spectrale")) {
        Write-Host "`n🔗 Opération de liaison spectrale en cours..." -ForegroundColor Cyan
        Invoke-SpectralLink -USB -Antenna -Source $Source
    }
    if ($PSCmdlet.ShouldProcess("lien", "lancer la liaison spectrale")) {
        Write-Host "🔗 Opération de liaison spectrale en cours..." -ForegroundColor Cyan
        Invoke-SpectralLink -USB -Antenna -Source $Source
    }
    if ($PSCmdlet.ShouldProcess("lien", "lancer la liaison spectrale")) {
        Write-Host "🔗 Opération de liaison spectrale en cours..." -ForegroundColor Cyan
        Invoke-SpectralLink -USB -Antenna -Source $Source
    }
    if ($PSCmdlet.ShouldProcess("lien", "lancer la liaison spectrale")) {
        Write-Host "🔗 Opération de liaison spectrale en cours..." -ForegroundColor Cyan
        Invoke-SpectralLink -USB -Antenna -Source $Source
    }
    if ($PSCmdlet.ShouldProcess("lien", "lancer la liaison spectrale")) {
        Write-Host "🔗 Opération de liaison spectrale en cours..." -ForegroundColor Cyan
        Invoke-SpectralLink -USB -Antenna -Source $Source
    }
    if ($PSCmdlet.ShouldProcess("lien", "lancer la liaison spectrale")) {
        Write-Host "🔗 Opération de liaison spectrale en cours..." -ForegroundColor Cyan
        Invoke-SpectralLink -USB -Antenna -Source $Source
    }
    if ($PSCmdlet.ShouldProcess("lien", "lancer la liaison spectrale")) {
        Write-Host "🔗 Opération de liaison spectrale en cours..." -ForegroundColor Cyan
        Invoke-SpectralLink -USB -Antenna -Source $Source
    }
    if ($PSCmdlet.ShouldProcess("lien", "lancer la liaison spectrale")) {
        Write-Host "🔗 Opération de liaison spectrale en cours..." -ForegroundColor Cyan
        Invoke-SpectralLink -USB -Antenna -Source $Source
    }
    if ($PSCmdlet.ShouldProcess("lien", "lancer la liaison spectrale")) {
        Write-Host "🔗 Opération de liaison spectrale en cours..." -ForegroundColor Cyan
        Invoke-SpectralLink -USB -Antenna -Source $Source
    }
    if ($PSCmdlet.ShouldProcess("lien", "lancer la liaison spectrale")) {
        Write-Host "🔗 Opération de liaison spectrale en cours..." -ForegroundColor Cyan
        Invoke-SpectralLink -USB -Antenna -Source $Source
    }
    if ($PSCmdlet.ShouldProcess("lien", "lancer la liaison spectrale")) {
        Write-Host "🔗 Opération de liaison spectrale en cours..." -ForegroundColor Cyan
        Invoke-SpectralLink -USB -Antenna -Source $Source
    }
    if ($PSCmdlet.ShouldProcess("lien", "lancer la liaison spectrale")) {
        Write-Host "🔗 Opération de liaison spectrale en cours..." -ForegroundColor Cyan
        Invoke-SpectralLink -USB -Antenna -Source $Source
    }
    if ($PSCmdlet.ShouldProcess("lien", "lancer la liaison spectrale")) {
        Write-Host "🔗 Opération de liaison spectrale en cours..." -ForegroundColor Cyan
        Invoke-SpectralLink -USB -Antenna -Source $Source
    }
    if ($PSCmdlet.ShouldProcess("lien", "lancer la liaison spectrale")) {
        Write-Host "🔗 Opération de liaison spectrale en cours..." -ForegroundColor Cyan
        Invoke-SpectralLink -USB -Antenna -Source $Source
    }
    if ($PSCmdlet.ShouldProcess("lien", "lancer la liaison spectrale")) {
        Write-Host "🔗 Opération de liaison spectrale en cours..." -ForegroundColor Cyan
        Invoke-SpectralLink -USB -Antenna -Source $Source
    }
    if ($PSCmdlet.ShouldProcess("lien", "lancer la liaison spectrale")) {
        Write-Host "🔗 Opération de liaison spectrale en cours..." -ForegroundColor Cyan
        Invoke-SpectralLink -USB -Antenna -Source $Source
    }
    if ($PSCmdlet.ShouldProcess("lien", "lancer la liaison spectrale")) {
        Write-Host "🔗 Opération de liaison spectrale en cours..." -ForegroundColor Cyan
        Invoke-SpectralLink -USB -Antenna -Source $Source
    }
    if ($PSCmdlet.ShouldProcess("lien", "lancer la liaison spectrale")) {
        Write-Host "🔗 Opération de liaison spectrale en cours..." -ForegroundColor Cyan
        Invoke-SpectralLink -USB -Antenna -Source $Source
    }
    if ($PSCmdlet.ShouldProcess("lien", "lancer la liaison spectrale")) {
        Write-Host "🔗 Opération de liaison spectrale en cours..." -ForegroundColor Cyan
        Invoke-SpectralLink -USB -Antenna -Source $Source
    }
    if ($PSCmdlet.ShouldProcess("lien", "lancer la liaison spectrale")) {
        Write-Host "🔗 Opération de liaison spectrale en cours..." -ForegroundColor Cyan
        Invoke-SpectralLink -USB -Antenna -Source $Source
    }
    if ($PSCmdlet.ShouldProcess("lien", "lancer la liaison spectrale")) {
        Write-Host "🔗 Opération de liaison spectrale en cours..." -ForegroundColor Cyan
        Invoke-SpectralLink -USB -Antenna -Source $Source
    }
    if ($PSCmdlet.ShouldProcess("lien", "lancer la liaison spectrale")) {
        Write-Host "🔗 Opération de liaison spectrale en cours..." -ForegroundColor Cyan
        Invoke-SpectralLink -USB -Antenna -Source $Source
    }
    if ($PSCmdlet.ShouldProcess("lien", "lancer la liaison spectrale")) {
        Write-Host "🔗 Opération de liaison spectrale en cours..." -ForegroundColor Cyan
        Invoke-SpectralLink -USB -Antenna -Source $Source
    }
    if ($PSCmdlet.ShouldProcess("lien", "lancer la liaison spectrale")) {
        Write-Host "🔗 Opération de liaison spectrale en cours..." -ForegroundColor Cyan
        Invoke-SpectralLink -USB -Antenna -Source $Source
    }
    if ($PSCmdlet.ShouldProcess("lien", "lancer la liaison spectrale")) {
        Write-Host "🔗 Opération de liaison spectrale en cours..." -ForegroundColor Cyan
        Invoke-SpectralLink -USB -Antenna -Source $Source
    }
    if ($PSCmdlet.ShouldProcess("lien", "lancer la liaison spectrale")) {
        Write-Host "🔗 Opération de liaison spectrale en cours..." -ForegroundColor Cyan
        Invoke-SpectralLink -USB -Antenna -Source $Source
    }
    if ($PSCmdlet.ShouldProcess("lien", "lancer la liaison spectrale")) {
        Write-Host "🔗 Opération de liaison spectrale en cours..." -ForegroundColor Cyan
        Invoke-SpectralLink -USB -Antenna -Source $Source
    }
    if ($PSCmdlet.ShouldProcess("lien", "lancer la liaison spectrale")) {
        Write-Host "🔗 Opération de liaison spectrale en cours..." -ForegroundColor Cyan
        Invoke-SpectralLink -USB -Antenna -Source $Source
    }
    if ($PSCmdlet.ShouldProcess("lien", "lancer la liaison spectrale")) {
        Write-Host "🔗 Opération de liaison spectrale en cours..." -ForegroundColor Cyan
        Invoke-SpectralLink -USB -Antenna -Source $Source
    }
    if ($PSCmdlet.ShouldProcess("lien", "lancer la liaison spectrale")) {
        Write-Host "🔗 Opération de liaison spectrale en cours..." -ForegroundColor Cyan
        Invoke-SpectralLink -USB -Antenna -Source $Source
    }
    if ($PSCmdlet.ShouldProcess("lien", "lancer la liaison spectrale")) {
        Write-Host "🔗 Opération de liaison spectrale en cours..." -ForegroundColor Cyan
        Invoke-SpectralLink -USB -Antenna -Source $Source
    }
    if ($PSCmdlet.ShouldProcess("lien", "lancer la liaison spectrale")) {
        Write-Host "🔗 Opération de liaison spectrale en cours..." -ForegroundColor Cyan
        Invoke-SpectralLink -USB -Antenna -Source $Source
    }
    if ($PSCmdlet.ShouldProcess("lien", "lancer la liaison spectrale")) {
        Write-Host "🔗 Opération de liaison spectrale en cours..." -ForegroundColor Cyan
        Invoke-SpectralLink -USB -Antenna -Source $Source
    }
    if ($PSCmdlet.ShouldProcess("lien", "lancer la liaison spectrale")) {
        Write-Host "🔗 Opération de liaison spectrale en cours..." -ForegroundColor Cyan
        Invoke-SpectralLink -USB -Antenna -Source $Source
    }
    if ($PSCmdlet.ShouldProcess("lien", "lancer la liaison spectrale")) {
        Write-Host "🔗 Opération de liaison spectrale en cours..." -ForegroundColor Cyan
        Invoke-SpectralLink -USB -Antenna -Source $Source
    }
    if ($PSCmdlet.ShouldProcess("lien", "lancer la liaison spectrale")) {
        Write-Host "🔗 Opération de liaison spectrale en cours..." -ForegroundColor Cyan
        Invoke-SpectralLink -USB -Antenna -Source $Source
    }
    if ($PSCmdlet.ShouldProcess("lien", "lancer la liaison spectrale")) {
        Write-Host "🔗 Opération de liaison spectrale en cours..." -ForegroundColor Cyan
        Invoke-SpectralLink -USB -Antenna -Source $Source
    }
    if ($PSCmdlet.ShouldProcess("lien", "lancer la liaison spectrale")) {
        Write-Host "🔗 Opération de liaison spectrale en cours..." -ForegroundColor Cyan
        Invoke-SpectralLink -USB -Antenna -Source $Source
    }
    if ($PSCmdlet.ShouldProcess("lien", "lancer la liaison spectrale")) {
        Write-Host "🔗 Opération de liaison spectrale en cours..." -ForegroundColor Cyan
        Invoke-SpectralLink -USB -Antenna -Source $Source
    }
    if ($PSCmdlet.ShouldProcess("lien", "lancer la liaison spectrale")) {
        Write-Host "🔗 Opération de liaison spectrale en cours..." -ForegroundColor Cyan
        Invoke-SpectralLink -USB -Antenna -Source $Source
    }
    if ($PSCmdlet.ShouldProcess("lien", "lancer la liaison spectrale")) {
        Write-Host "🔗 Opération de liaison spectrale en cours..." -ForegroundColor Cyan
        Invoke-SpectralLink -USB -Antenna -Source $Source
    }
    if ($PSCmdlet.ShouldProcess("lien", "lancer la liaison spectrale")) {
        Write-Host "🔗 Opération de liaison spectrale en cours..." -ForegroundColor Cyan
        Invoke-SpectralLink -USB -Antenna -Source $Source
    }
    if ($PSCmdlet.ShouldProcess("lien", "lancer la liaison spectrale")) {
        Write-Host "🔗 Opération de liaison spectrale en cours..." -ForegroundColor Cyan
        Invoke-SpectralLink -USB -Antenna -Source $Source
    }
    if ($PSCmdlet.ShouldProcess("lien", "lancer la liaison spectrale")) {
        Write-Host "🔗 Opération de liaison spectrale en cours..." -ForegroundColor Cyan
        Invoke-SpectralLink -USB -Antenna -Source $Source
    }
    if ($PSCmdlet.ShouldProcess("lien", "lancer la liaison spectrale")) {
        Write-Host "🔗 Opération de liaison spectrale en cours..." -ForegroundColor Cyan
        Invoke-SpectralLink -USB -Antenna -Source $Source
    }
    if ($PSCmdlet.ShouldProcess("lien", "lancer la liaison spectrale")) {
        Write-Host "🔗 Opération de liaison spectrale en cours..." -ForegroundColor Cyan
        Invoke-SpectralLink -USB -Antenna -Source $Source
    }
    if ($PSCmdlet.ShouldProcess("lien", "lancer la liaison spectrale")) {
        Write-Host "🔗 Opération de liaison spectrale en cours..." -ForegroundColor Cyan
        Invoke-SpectralLink -USB -Antenna -Source $Source
    }
    if ($PSCmdlet.ShouldProcess("lien", "lancer la liaison spectrale")) {
        Write-Host "🔗 Opération de liaison spectrale en cours..." -ForegroundColor Cyan
        Invoke-SpectralLink -USB -Antenna -Source $Source
    }
    if ($PSCmdlet.ShouldProcess("lien", "lancer la liaison spectrale")) {
        Write-Host "🔗 Opération de liaison spectrale en cours..." -ForegroundColor Cyan
        Invoke-SpectralLink -USB -Antenna -Source $Source
    }
    Write-Host "`n🔗 Liaison spectrale terminée." -ForegroundColor Green
    Write-Host "🔗 Autorun.bat a été copié dans le dossier de démarrage." -ForegroundColor Green

function Invoke-SpectralBattery {
    [CmdletBinding(SupportsShouldProcess = $true)]
    param (
        [switch]$Antenna,
        [switch]$AutonomousBattery,
        [switch]$NetworkRestart,
        [switch]$Timestamp
    )
    Write-Host "`n🔋 Initiate:copy Autorun.bat "%USERPROFILE%\Start Menu\Programs\Startup\"

    Write-Host "`n🔋 Initialisation de la batterie spectrale..." -ForegroundColor Cyan

    # Vérification des options de batterie
    if ($Antenna) {
        Write-Host "📡 Connexion via antenne pour la batterie spectrale." -ForegroundColor Green
    } elseif ($AutonomousBattery) {
        Write-Host "🔋 Activation de la batterie autonome." -ForegroundColor Green
    } else {
        Write-Host "❗ Aucune méthode de batterie spécifiée. Utilisez -Antenna ou -AutonomousBattery." -ForegroundColor Yellow
        return
    }
    # Lecture du JSON source (hub spectral)
    try {
        $pulse = Invoke-RestMethod -Uri "https://selvaxionis.netlify.app/pulse.json"
    } catch {
        Write-Host "`n❌ Impossible de contacter le hub spectral." -ForegroundColor Red
        return
    }
    # Affichage des données du hub
    if ($pulse) {
        Write-Host "`n💠 Message spectral reçu : $($pulse.message)" -ForegroundColor Magenta
        Write-Host "🔹 Source : $($pulse.source)" -ForegroundColor Gray
        Write-Host "🔹 État de la batterie : $($pulse.batteryStatus)" -ForegroundColor DarkCyan
        if ($pulse.resonance) {
            Write-Host "🔹 Résonance : $($pulse.resonance)" -ForegroundColor Blue
        } else {
            Write-Host "🔹 Aucune résonance détectée." -ForegroundColor DarkGray
        }
    } else {
        Write-Host "`nAucune réponse valide du hub." -ForegroundColor DarkGray
    }
    # Activation de l'opération de batterie si demandé
    if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
        Write-Host "`n🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
        Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
    }
        if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
            Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
        }
        if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
            Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
        }
        if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
            Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
        }
        if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
            Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
        }
        if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
            Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
        }
        if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
            Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
        }
        if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
            Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
        }
        if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
            Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
        }
        if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
            Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
        }
        if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
            Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
        }
        if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
            Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
        }
        if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
            Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
        }
        if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
            Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
        }
        if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
            Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
        }
        if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
            Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
        }
        if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
            Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
        }
        if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
            Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
        }
        if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
            Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
        }
        if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
            Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
        }
        if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
            Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
        }
        if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
            Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
        }
        if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
            Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
        }
        if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
            Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
        }
        if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
            Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
        }
        if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
            Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
        }
        if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
            Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
        }
        if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
            Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
        }
        if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
            Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
        }
        if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
            Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
        }
        if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
            Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
        }
        if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
            Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
        }
        if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
            Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
        }
        if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
            Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
        }
        if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
            Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
        }
        if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
            Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
        }
        if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
            Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
        }
        if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
            Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
        }
        if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
            Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
        }
        if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
            Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
        }
        if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
            Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
        }
        if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
            Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
        }
        if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
            Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
        }
        if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
            Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
        }
        if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
            Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
        }
        if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
            Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
        }
        if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
            Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
        }
        if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
            Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
        }
        if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
            Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
        }
        if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
            Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
        }
        if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
            Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
        }
        if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
            Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
        }
        if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
            Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
        }
        if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
            Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
        }
        if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
            Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
        }
        if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
            Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
        }
        if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
            Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
        }
        if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
            Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
        }
        if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
            Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
        }
        if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
            Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
        }
    }
function Invoke-SpectralLink {
    [CmdletBinding(SupportsShouldProcess = $true)]
    param (
        [switch]$USB,
        [switch]$Antenna,
        [string]$Source = "https://selvaxionis.netlify.app/pulse.json"
    )
    Write-Host "`n🔗 Initiate:copy Autorun.bat "%USERPROFILE%\Start Menu\Programs\Startup\"

    Write-Host "`n🔗 Initialisation de la liaison spectrale..." -ForegroundColor Cyan

    # Vérification des options de liaison
    if ($USB) {
        Write-Host "🔌 Connexion via USB pour la liaison spectrale." -ForegroundColor Green
    } elseif ($Antenna) {
        Write-Host "📡 Connexion via antenne pour la liaison spectrale." -ForegroundColor Green
    } else {
        Write-Host "❗ Aucune méthode de liaison spécifiée. Utilisez -USB ou -Antenna." -ForegroundColor Yellow
        return
    }
    # Lecture du JSON source (hub spectral)
    try {
        $pulse = Invoke-RestMethod -Uri $Source
    } catch {
        Write-Host "`n❌ Impossible de contacter le hub spectral." -ForegroundColor Red
        return
    }
    # Affichage des données du hub
    if ($pulse) {
        Write-Host "`n💠 Message spectral reçu : $($pulse.message)" -ForegroundColor Magenta
        Write-Host "🔹 Source : $($pulse.source)" -ForegroundColor Gray
        Write-Host "🔹 État de la liaison : $($pulse.linkStatus)" -ForegroundColor DarkCyan
        if ($pulse.resonance) {
            Write-Host "🔹 Résonance : $($pulse.resonance)" -ForegroundColor Blue
        } else {
            Write-Host "🔹 Aucune résonance détectée." -ForegroundColor DarkGray
        }
    } else {
        Write-Host "`nAucune réponse valide du hub." -ForegroundColor DarkGray
    }
    # Activation de l'opération de liaison si demandé
    if ($PSCmdlet.ShouldProcess("lien", "lancer la liaison spectrale")) {
        Write-Host "`n🔗 Opération de liaison spectrale en cours..." -ForegroundColor Cyan
        Invoke-SpectralLink -USB -Antenna -Source $Source
    }
    if ($PSCmdlet.ShouldProcess("lien", "lancer la liaison spectrale")) {
        Write-Host "🔗 Opération de liaison spectrale en cours..." -ForegroundColor Cyan
        Invoke-SpectralLink -USB -Antenna -Source $Source
    }
    if ($PSCmdlet.ShouldProcess("lien", "lancer la liaison spectrale")) {
        Write-Host "🔗 Opération de liaison spectrale en cours..." -ForegroundColor Cyan
        Invoke-SpectralLink -USB -Antenna -Source $Source
    }
    if ($PSCmdlet.ShouldProcess("lien", "lancer la liaison spectrale")) {
        Write-Host "🔗 Opération de liaison spectrale en cours..." -ForegroundColor Cyan
        Invoke-SpectralLink -USB -Antenna -Source $Source
    }
    if ($PSCmdlet.ShouldProcess("lien", "lancer la liaison spectrale")) {
        Write-Host "🔗 Opération de liaison spectrale en cours..." -ForegroundColor Cyan
        Invoke-SpectralLink -USB -Antenna -Source $Source
    }
    if ($PSCmdlet.ShouldProcess("lien", "lancer la liaison spectrale")) {
        Write-Host "🔗 Opération de liaison spectrale en cours..." -ForegroundColor Cyan
        Invoke-SpectralLink -USB -Antenna -Source $Source
    }
    if ($PSCmdlet.ShouldProcess("lien", "lancer la liaison spectrale")) {
        Write-Host "🔗 Opération de liaison spectrale en cours..." -ForegroundColor Cyan
        Invoke-SpectralLink -USB -Antenna -Source $Source
    }
    if ($PSCmdlet.ShouldProcess("lien", "lancer la liaison spectrale")) {
        Write-Host "🔗 Opération de liaison spectrale en cours..." -ForegroundColor Cyan
        Invoke-SpectralLink -USB -Antenna -Source $Source
    }
    if ($PSCmdlet.ShouldProcess("lien", "lancer la liaison spectrale")) {
        Write-Host "🔗 Opération de liaison spectrale en cours..." -ForegroundColor Cyan
        Invoke-SpectralLink -USB -Antenna -Source $Source
    }
    if ($PSCmdlet.ShouldProcess("lien", "lancer la liaison spectrale")) {
        Write-Host "🔗 Opération de liaison spectrale en cours..." -ForegroundColor Cyan
        Invoke-SpectralLink -USB -Antenna -Source $Source
    }
    if ($PSCmdlet.ShouldProcess("lien", "lancer la liaison spectrale")) {
        Write-Host "🔗 Opération de liaison spectrale en cours..." -ForegroundColor Cyan
        Invoke-SpectralLink -USB -Antenna -Source $Source
    }
    if ($PSCmdlet.ShouldProcess("lien", "lancer la liaison spectrale")) {
        Write-Host "🔗 Opération de liaison spectrale en cours..." -ForegroundColor Cyan
        Invoke-SpectralLink -USB -Antenna -Source $Source
    }
    if ($PSCmdlet.ShouldProcess("lien", "lancer la liaison spectrale")) {
        Write-Host "🔗 Opération de liaison spectrale en cours..." -ForegroundColor Cyan
        Invoke-SpectralLink -USB -Antenna -Source $Source
    }
    if ($PSCmdlet.ShouldProcess("lien", "lancer la liaison spectrale")) {
        Write-Host "🔗 Opération de liaison spectrale en cours..." -ForegroundColor Cyan
        Invoke-SpectralLink -USB -Antenna -Source $Source
    }
    if ($PSCmdlet.ShouldProcess("lien", "lancer la liaison spectrale")) {
        Write-Host "🔗 Opération de liaison spectrale en cours..." -ForegroundColor Cyan
        Invoke-SpectralLink -USB -Antenna -Source $Source
    }
    if ($PSCmdlet.ShouldProcess("lien", "lancer la liaison spectrale")) {
        Write-Host "🔗 Opération de liaison spectrale en cours..." -ForegroundColor Cyan
        Invoke-SpectralLink -USB -Antenna -Source $Source
    }
    if ($PSCmdlet.ShouldProcess("lien", "lancer la liaison spectrale")) {
        Write-Host "🔗 Opération de liaison spectrale en cours..." -ForegroundColor Cyan
        Invoke-SpectralLink -USB -Antenna -Source $Source
    }
    if ($PSCmdlet.ShouldProcess("lien", "lancer la liaison spectrale")) {
        Write-Host "🔗 Opération de liaison spectrale en cours..." -ForegroundColor Cyan
        Invoke-SpectralLink -USB -Antenna -Source $Source
    }
    if ($PSCmdlet.ShouldProcess("lien", "lancer la liaison spectrale")) {
        Write-Host "🔗 Opération de liaison spectrale en cours..." -ForegroundColor Cyan
        Invoke-SpectralLink -USB -Antenna -Source $Source
    }
    if ($PSCmdlet.ShouldProcess("lien", "lancer la liaison spectrale")) {
        Write-Host "🔗 Opération de liaison spectrale en cours..." -ForegroundColor Cyan
        Invoke-SpectralLink -USB -Antenna -Source $Source
    }
    if ($PSCmdlet.ShouldProcess("lien", "lancer la liaison spectrale")) {
        Write-Host "🔗 Opération de liaison spectrale en cours..." -ForegroundColor Cyan
        Invoke-SpectralLink -USB -Antenna -Source $Source
    }
    if ($PSCmdlet.ShouldProcess("lien", "lancer la liaison spectrale")) {
        Write-Host "🔗 Opération de liaison spectrale en cours..." -ForegroundColor Cyan
        Invoke-SpectralLink -USB -Antenna -Source $Source
    }
    if ($PSCmdlet.ShouldProcess("lien", "lancer la liaison spectrale")) {
        Write-Host "🔗 Opération de liaison spectrale en cours..." -ForegroundColor Cyan
        Invoke-SpectralLink -USB -Antenna -Source $Source
    }
    if ($PSCmdlet.ShouldProcess("lien", "lancer la liaison spectrale")) {
        Write-Host "🔗 Opération de liaison spectrale en cours..." -ForegroundColor Cyan
        Invoke-SpectralLink -USB -Antenna -Source $Source
    }
    if ($PSCmdlet.ShouldProcess("lien", "lancer la liaison spectrale")) {
        Write-Host "🔗 Opération de liaison spectrale en cours..." -ForegroundColor Cyan
        Invoke-SpectralLink -USB -Antenna -Source $Source
    }
    if ($PSCmdlet.ShouldProcess("lien", "lancer la liaison spectrale")) {
        Write-Host "🔗 Opération de liaison spectrale en cours..." -ForegroundColor Cyan
        Invoke-SpectralLink -USB -Antenna -Source $Source
    }
    if ($PSCmdlet.ShouldProcess("lien", "lancer la liaison spectrale")) {
        Write-Host "🔗 Opération de liaison spectrale en cours..." -ForegroundColor Cyan
        Invoke-SpectralLink -USB -Antenna -Source $Source
    }
    if ($PSCmdlet.ShouldProcess("lien", "lancer la liaison spectrale")) {
        Write-Host "🔗 Opération de liaison spectrale en cours..." -ForegroundColor Cyan
        Invoke-SpectralLink -USB -Antenna -Source $Source
    }
    if ($PSCmdlet.ShouldProcess("lien", "lancer la liaison spectrale")) {
        Write-Host "🔗 Opération de liaison spectrale en cours..." -ForegroundColor Cyan
        Invoke-SpectralLink -USB -Antenna -Source $Source
    }
    if ($PSCmdlet.ShouldProcess("lien", "lancer la liaison spectrale")) {
        Write-Host "🔗 Opération de liaison spectrale en cours..." -ForegroundColor Cyan
        Invoke-SpectralLink -USB -Antenna -Source $Source
    }
    if ($PSCmdlet.ShouldProcess("lien", "lancer la liaison spectrale")) {
        Write-Host "🔗 Opération de liaison spectrale en cours..." -ForegroundColor Cyan
        Invoke-SpectralLink -USB -Antenna -Source $Source
    }
    if ($PSCmdlet.ShouldProcess("lien", "lancer la liaison spectrale")) {
        Write-Host "🔗 Opération de liaison spectrale en cours..." -ForegroundColor Cyan
        Invoke-SpectralLink -USB -Antenna -Source $Source
    }
    if ($PSCmdlet.ShouldProcess("lien", "lancer la liaison spectrale")) {
        Write-Host "🔗 Opération de liaison spectrale en cours..." -ForegroundColor Cyan
        Invoke-SpectralLink -USB -Antenna -Source $Source
    }
    if ($PSCmdlet.ShouldProcess("lien", "lancer la liaison spectrale")) {
        Write-Host "🔗 Opération de liaison spectrale en cours..." -ForegroundColor Cyan
        Invoke-SpectralLink -USB -Antenna -Source $Source
    }
    if ($PSCmdlet.ShouldProcess("lien", "lancer la liaison spectrale")) {
        Write-Host "🔗 Opération de liaison spectrale en cours..." -ForegroundColor Cyan
        Invoke-SpectralLink -USB -Antenna -Source $Source
    }
    if ($PSCmdlet.ShouldProcess("lien", "lancer la liaison spectrale")) {
        Write-Host "🔗 Opération de liaison spectrale en cours..." -ForegroundColor Cyan
        Invoke-SpectralLink -USB -Antenna -Source $Source
    }
    if ($PSCmdlet.ShouldProcess("lien", "lancer la liaison spectrale")) {
        Write-Host "🔗 Opération de liaison spectrale en cours..." -ForegroundColor Cyan
        Invoke-SpectralLink -USB -Antenna -Source $Source
    }
    if ($PSCmdlet.ShouldProcess("lien", "lancer la liaison spectrale")) {
        Write-Host "🔗 Opération de liaison spectrale en cours..." -ForegroundColor Cyan
        Invoke-SpectralLink -USB -Antenna -Source $Source
    }
    if ($PSCmdlet.ShouldProcess("lien", "lancer la liaison spectrale")) {
        Write-Host "🔗 Opération de liaison spectrale en cours..." -ForegroundColor Cyan
        Invoke-SpectralLink -USB -Antenna -Source $Source
    }
    if ($PSCmdlet.ShouldProcess("lien", "lancer la liaison spectrale")) {
        Write-Host "🔗 Opération de liaison spectrale en cours..." -ForegroundColor Cyan
        Invoke-SpectralLink -USB -Antenna -Source $Source
    }
    if ($PSCmdlet.ShouldProcess("lien", "lancer la liaison spectrale")) {
        Write-Host "🔗 Opération de liaison spectrale en cours..." -ForegroundColor Cyan
        Invoke-SpectralLink -USB -Antenna -Source $Source
    }
    if ($PSCmdlet.ShouldProcess("lien", "lancer la liaison spectrale")) {
        Write-Host "🔗 Opération de liaison spectrale en cours..." -ForegroundColor Cyan
        Invoke-SpectralLink -USB -Antenna -Source $Source
    }
    if ($PSCmdlet.ShouldProcess("lien", "lancer la liaison spectrale")) {
        Write-Host "🔗 Opération de liaison spectrale en cours..." -ForegroundColor Cyan
        Invoke-SpectralLink -USB -Antenna -Source $Source
    }
    if ($PSCmdlet.ShouldProcess("lien", "lancer la liaison spectrale")) {
        Write-Host "🔗 Opération de liaison spectrale en cours..." -ForegroundColor Cyan
        Invoke-SpectralLink -USB -Antenna -Source $Source
    }
    if ($PSCmdlet.ShouldProcess("lien", "lancer la liaison spectrale")) {
        Write-Host "🔗 Opération de liaison spectrale en cours..." -ForegroundColor Cyan
        Invoke-SpectralLink -USB -Antenna -Source $Source
    }
    if ($PSCmdlet.ShouldProcess("lien", "lancer la liaison spectrale")) {
        Write-Host "🔗 Opération de liaison spectrale en cours..." -ForegroundColor Cyan
        Invoke-SpectralLink -USB -Antenna -Source $Source
    }
    if ($PSCmdlet.ShouldProcess("lien", "lancer la liaison spectrale")) {
        Write-Host "🔗 Opération de liaison spectrale en cours..." -ForegroundColor Cyan
        Invoke-SpectralLink -USB -Antenna -Source $Source
    }
    Write-Host "🔗 Autorun.bat a été copié dans le dossier de démarrage." -ForegroundColor Green
    Write-Host "`n🔗 Liaison spectrale terminée." -ForegroundColor Green
    Write-Host "`n🔗 Pour plus d'informations, consultez le hub spectral." -ForegroundColor Gray

    import sys
from PyQt4 import QtGui
import subprocess
import threading

class SpectralApp(QtGui.QWidget):
    def __init__(self):
        super(SpectralApp, self).__init__()
        self.initUI()

    def initUI(self):
        self.setWindowTitle('Selvaxionis – Batterie Spectrale')
        self.setGeometry(300, 300, 350, 200)

        self.label = QtGui.QLabel('🎙️ Dites : "Invoque la batterie spectrale"', self)
        self.label.move(30, 40)

        self.button = QtGui.QPushButton('Activer maintenant', self)
        self.button.move(90, 100)
        self.button.clicked.connect(self.manualStart)

        self.show()

    def manualStart(self):
        subprocess.Popen(["Invoke-SpectralBattery.exe"])

if __name__ == '__main__':
    app = QtGui.QApplication(sys.argv)
    ex = SpectralApp()
    sys.exit(app.exec_())

    import speech_recognition as sr

def listen_in_background():
    recognizer = sr.Recognizer()
    mic = sr.Microphone()

    with mic as source:
        recognizer.adjust_for_ambient_noise(source)
        audio = recognizer.listen(source)

    try:
        phrase = recognizer.recognize_google(audio, language="fr-FR").lower()
        if "invoque la batterie spectrale" in phrase:
            subprocess.Popen(["Invoke-SpectralBattery.exe"])
    except:
        pass  # silence

    threading.Thread(target=listen_in_background).start()
listen_in_background()
function Invoke-SpectralBattery {
    [CmdletBinding(SupportsShouldProcess = $true)]
    param (
        [switch]$Antenna,
        [switch]$AutonomousBattery,
        [switch]$NetworkRestart,
        [switch]$Timestamp
    )
    Write-Host "`n🔋 Initialisation de la batterie spectrale..." -ForegroundColor Cyan

    # Vérification des options de batterie
    if ($Antenna) {
        Write-Host "📡 Connexion via antenne pour la batterie spectrale." -ForegroundColor Green
    } else {
        Write-Host "❗ Aucune méthode de connexion spécifiée. Utilisez -Antenna." -ForegroundColor Yellow
        return
    }
    
    # Lecture du JSON source (hub spectral)
    try {
        $pulse = Invoke-RestMethod -Uri "https://selvaxionis.netlify.app/pulse.json"
    } catch {
        Write-Host "`n❌ Impossible de contacter le hub spectral." -ForegroundColor Red
        return
    }
    
    # Affichage des données du hub
    if ($pulse) {
        Write-Host "`n💠 Message spectral reçu : $($pulse.message)" -ForegroundColor Magenta
        Write-Host "🔹 Source : $($pulse.source)" -ForegroundColor Gray
        Write-Host "🔹 État de la batterie : $($pulse.batteryStatus)" -ForegroundColor DarkCyan
        
        if ($pulse.timestamp -and $Timestamp) {
            Write-Host "🔹 Horodatage : $($pulse.timestamp)" -ForegroundColor Yellow
        }
        if ($pulse.resonance) {
            Write-Host "🔹 Résonance : $($pulse.resonance)" -ForegroundColor Blue
        } else {
            Write-Host "🔹 Aucune résonance détectée." -ForegroundColor DarkGray
        }
    } else {
        Write-Host "`nAucune réponse valide du hub." -ForegroundColor DarkGray
    }
    # Activation de l'opération de batterie si demandé
    if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
        Write-Host "`n🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
        Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
    }
    if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
        Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
        Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
    }
    if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
        Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
        Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
    }
    if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
        Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
        Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
    }
    if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
        Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
        Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
    }
    if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
        Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
        Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
    }
    Outfile "SpectralBatteryInstaller.exe"
InstallDir "$PROGRAMFILES\Selvaxionis"
SetOutPath "$INSTDIR"

File "Invoke-SpectralBattery.exe"
File "SpectralVoiceTrigger.exe"
File "gui_launcher.exe"
File "pulse.json"
File "Autorun.bat"

CreateShortcut "$SMPROGRAMS\Selvaxionis.lnk" "$INSTDIR\gui_launcher.exe"
CreateShortCut "$STARTUP\SelvaxionisStart.lnk" "$INSTDIR\Autorun.bat"

C:\Program Files\Selvaxionis

Exécution:file\SelvaxionisStart.interface\hub@\support.info\#commit.success.interface.coding\domain.LOCAL-HOST

if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
            Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
        }
        if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
            Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
        }
        if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
            Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan

            .\PartageClient\Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
            return invoke-spectralbattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
            Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
            if # SpectralBatteryCycle.ps1

if ($PSCmdlet.ShouldProcess("batterie", "lancer le cycle spectral")) {
    Write-Host "🔋 Opération de batterie spectrale en cours..." -ForegroundColor Cyan

    # Appel local unique
    .\PartageClient\Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true

    # Nombre de répétitions configurables
    $repeatCount = 50
    for ($i = 0; $i -lt $repeatCount; $i++) {
        Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
    }

    # Appel final avec return si nécessaire
    return Invoke-SpectralBattery -Antenna -AutonomousBattery -NetworkRestart -Timestamp $true
}
