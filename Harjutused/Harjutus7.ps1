$groups = @("Red", "Green", "Yellow", "Blue")
$result = @()
$i = 1  # Algväärtus loendurile

while ($i -le 20) {
    $g = Get-Random -InputObject $groups
    $temp = [PSCustomObject]@{
        RollNumber = $i
        Group = $g
    }
    $result += $temp
    $i++  # Suurendame loendurit
}

$result