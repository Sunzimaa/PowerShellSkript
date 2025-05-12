# Kontrollib domeeni ühenduvust ja liikmelisust
try {
    $domain = [System.DirectoryServices.ActiveDirectory.Domain]::GetCurrentDomain()
    Write-Host "Connected to domain: $($domain.Name)"
} catch {
    Write-Host "Error: Could not connect to domain. Please ensure you are connected to the domain 'marten.com'"
    exit 1
}

# Funktsioon parooli keerukuse kontrollimiseks
function Test-PasswordComplexity {
    param([string]$Password)
    if ($Password.Length -lt 8) { return $false }
    if ($Password -notmatch '[A-Z]') { return $false }
    if ($Password -notmatch '[a-z]') { return $false }
    if ($Password -notmatch '[0-9]') { return $false }
    if ($Password -notmatch '[^A-Za-z0-9]') { return $false }
    return $true
}

# Küsib kasutaja eesnime
$firstName = Read-Host "Enter the user's first name (eesnimi)"
# Küsib kasutaja perekonnanime
$lastName = Read-Host "Enter the user's last name (perekonnanimi)"

# Koostab kasutajanime (eesnime esimene täht + perekonnanimi)
$username = ($firstName.Substring(0,1) + $lastName).ToLower()

# Kontrollib, kas kasutaja juba eksisteerib domeenis
try {
    $existingUser = Get-ADUser -Filter {SamAccountName -eq $username} -ErrorAction Stop
    if ($existingUser) {
        Write-Host "Error: Kasutaja '$username' on juba olemas domeenis sitajunn.uss"
        exit 1
    }
} catch [Microsoft.ActiveDirectory.Management.ADIdentityNotFoundException] {
    # Kui kasutajat ei leita, jätkame
} catch {
    Write-Host "Error kontrollides kasutajat domeenis: $_"
    exit 1
}

# Kuvab parooli nõuded
Write-Host "`nPassword requirements:"
Write-Host "- At least 8 characters"
Write-Host "- At least one uppercase letter"
Write-Host "- At least one lowercase letter"
Write-Host "- At least one number"
Write-Host "- At least one special character"

# Küsib ja valideerib parooli
do {
    $plainPassword = Read-Host "Enter a password for the new user"
    if (-not (Test-PasswordComplexity -Password $plainPassword)) {
        Write-Host "Password does not meet the requirements. Please try again."
        continue
    }
    $password = ConvertTo-SecureString -String $plainPassword -AsPlainText -Force
    break
} while ($true)

# Loob uue domeeni kasutaja
try {
    $userParams = @{
        Name = "$firstName $lastName"
        GivenName = $firstName
        Surname = $lastName
        SamAccountName = $username
        UserPrincipalName = "$username@marten.com"
        AccountPassword = $password
        Enabled = $true
        PasswordNeverExpires = $true
        Path = "CN=Users,DC=marten,DC=com" # Muudetud Path, et olla täpsem
        DisplayName = "$firstName $lastName"
    }

    New-ADUser @userParams
    Write-Host "User '$username' has been successfully created in the domain 'marten.com'."
} catch {
    Write-Host "Error: Failed to create the user: $_"
    exit 1
}