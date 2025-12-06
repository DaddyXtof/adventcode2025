$array=@(0..99)
$zero_cout=0
$pos=50
Get-Content "day1.txt" | ForEach-Object {
    $rot_amount = $_.Substring(1) -as [int]
    write-host $pos "rotated by" $_
    switch ($_[0]) {
        "L" {
            $pos = (($pos - $rot_amount) % 100 + 100) % 100
            }
        "R" {
            $pos = (($pos + $rot_amount) % 100 + 100) % 100
            }
    }
    if ($pos -eq 0) {
        $zero_cout++
        write-host "Zero hit!-----------------------------"
    }
    write-host $pos
}
write-host $zero_cout
