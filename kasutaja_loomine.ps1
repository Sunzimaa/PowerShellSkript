# Kasutaja andmete küsimine
$eesnimi = Read-Host "Sisesta oma eesnimi"
$perenimi = Read-Host "Sisesta oma perenimi"

# Kasutajanime loomine (eesnimi.perenimi, muudetud väikeste tähtedega)
$kasutajanimi = ($eesnimi + "." + $perenimi).ToLower()

# Täisnimi ja kirjeldus
$fullName = "$eesnimi $perenimi"
$description = "Kasutaja $fullName, loodud automaatselt."

Write-Host "Loodud kasutajanimi: $kasutajanimi"
Write-Host "Täisnimi: $fullName"
Write-Host "Kirjeldus: $description"

# Lokaalse kasutaja loomine ja parooli määramine
$parool = ConvertTo-SecureString "Parool1!" -AsPlainText -Force

try {
    # Kasutaja loomine, veateate kuvamise tasemega SilentlyContinue
    New-LocalUser -Name $kasutajanimi -FullName $fullName -Description $description -Password $parool -ErrorAction SilentlyContinue
    
    # Kontrollime, kas kasutaja loomine õnnestus
    if ($?) {
        Write-Host "Kasutaja $kasutajanimi on edukalt loodud."
    } else {
        Write-Host "Kasutaja loomine ebaõnnestus. Palun kontrollige veateateid."
    }
} catch {
    # Kuvame täiendava veateate, kui midagi läheb valesti
    Write-Host "Esines viga kasutaja loomisel: $_" -ForegroundColor Red
}

# Kontroll, kas kasutaja eksisteerib juba
if (Get-LocalUser -Name $kasutajanimi -ErrorAction SilentlyContinue) {
    Write-Host "Kasutaja $kasutajanimi juba eksisteerib!" -ForegroundColor Yellow
} else {
    Write-Host "Kasutaja ei eksisteeri, loome uue." -ForegroundColor Green
}
