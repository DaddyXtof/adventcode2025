$array         = @(0..99)
$zero_count    = 0
$pos           = 50
Get-Content "day1.txt" | ForEach-Object {
    $rot_amount = $_.Substring(1) -as [int]
    write-host $pos "rotated by" $_
    $prev_pos = $pos
    switch ($_[0]) {
        "L" {
            if ($pos -eq 0 -and $pos-$rot_amount -lt 0) {
                $pos += 100
            }
            $pos = ($pos - $rot_amount)
        }
        "R" {
            if ($pos -eq 0 -and $pos+$rot_amount -lt 0) {
                $pos += 100
            }
            $pos = ($pos + $rot_amount)
        }
    }
    while ($pos -lt 0) {
        $pos += 100
        $zero_count++
        Write-Host "Crossed zero going negative"
    }
    if ($pos -eq 0) {
        $zero_count++
        write-host "Landed on zero"
    }
    while ($pos -gt 99) {
        $pos -= 100
        $zero_count++
        Write-Host "Crossed zero going above 99"
    }
    write-host $pos
}
write-host "Solution:" $zero_count
