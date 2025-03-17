# Küsi kasutajalt kahte arvu (kasutades [double], et toetada komakohaga arve)
$number1 = [double](Read-Host "Enter the first number")
$number2 = [double](Read-Host "Enter the second number")

# Kuvame menüü
Write-Host "`nSelect an operation:"
Write-Host "1. Addition (+)"
Write-Host "2. Subtraction (-)"
Write-Host "3. Multiplication (*)"
Write-Host "4. Division (/)"
Write-Host "5. Modulus (%)"
$choice = Read-Host "Enter your choice (1-5)"

# Teeme arvutused vastavalt valikule
switch ($choice) {
    "1" { $result = $number1 + $number2; Write-Host "Result: $number1 + $number2 = $result" }
    "2" { $result = $number1 - $number2; Write-Host "Result: $number1 - $number2 = $result" }
    "3" { $result = $number1 * $number2; Write-Host "Result: $number1 * $number2 = $result" }
    "4" { 
        if ($number2 -eq 0) { 
            Write-Host "Error: Division by zero is not allowed!" -ForegroundColor Red 
        } else {
            $result = $number1 / $number2
            Write-Host "Result: $number1 / $number2 = $result"
        }
    }
    "5" { 
        if ($number2 -eq 0) { 
            Write-Host "Error: Modulus by zero is not allowed!" -ForegroundColor Red 
        } else {
            $result = $number1 % $number2
            Write-Host "Result: $number1 % $number2 = $result"
        }
    }
    default { Write-Host "Invalid choice! Please enter a number between 1-5." -ForegroundColor Yellow }
}
