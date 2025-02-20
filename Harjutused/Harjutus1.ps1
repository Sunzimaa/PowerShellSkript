# Create Array1 and Array2
$array1 = @(1, 2, 3)
$array2 = @(4, 5, 6)

# Initialize Array3
$array3 = @()

# Loop to sum corresponding elements
for ($i = 0; $i -lt $array1.Length; $i++) {
    $sum = $array1[$i] + $array2[$i]
    $array3 += $sum
}

# Display the result
Write-Output "Array1`tArray2`tArray3"
for ($i = 0; $i -lt $array1.Length; $i++) {
    Write-Output "$($array1[$i])`t$($array2[$i])`t$($array3[$i])"
}
