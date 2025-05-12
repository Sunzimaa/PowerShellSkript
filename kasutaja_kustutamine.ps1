# Küsi kasutaja ees- ja perenimi, kelle soovitakse süsteemist kustutada
$eesnimi = Read-Host "Sisesta eesnimi"
$perenimi = Read-Host "Sisesta perenimi"

# Kasutajanimi loomiseks (eesnimi.perenimi, muudetud väikeste tähtedega)
$kasutajanimi = ($eesnimi + "." + $perenimi).ToLower()

Write-Host "Kasutajanimi, mida püütakse kustutada: $kasutajanimi"

# Proovime kasutaja kustutamist
try {
    # Kontrollime, kas kasutaja eksisteerib süsteemis
    $userExists = Get-LocalUser -Name $kasutajanimi -ErrorAction SilentlyContinue

    if ($userExists) {
        # Kasutaja olemas, proovime kustutada
        Remove-LocalUser -Name $kasutajanimi -ErrorAction SilentlyContinue
        # Kontrollime, kas kustutamine õnnestus
        if ($?) {
            Write-Host "Kasutaja $kasutajanimi on edukalt kustutatud." -ForegroundColor Green
        } else {
            Write-Host "Kasutaja $kasutajanimi kustutamine ebaõnnestus." -ForegroundColor Red
        }
    } else {
        Write-Host "Kasutajat $kasutajanimi ei leitud. Kustutamine ei õnnestunud." -ForegroundColor Red
    }
} catch {
    Write-Host "Esines viga kasutaja kustutamisel: $_" -ForegroundColor Red
}


