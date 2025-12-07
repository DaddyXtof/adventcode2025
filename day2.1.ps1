$answer = 0
function validate-id() {
    param([string]$start)
    if ($start.Length%2 -ne 0) {
        return 0
    } else {
        $len = $start.Length
        $firstpart  = $start.Substring(0, $len/2) -as [int64]
        $secondpart = $start.Substring($len/2,$len/2) -as [int64]
        if ($firstpart -eq $secondpart) {
            write-host "Invalid ID:" $Start
            return $start -as [int64]
        }
        return 0
    }
}

function validate-range() {
    param([int64]$Start,[int64]$End)
    write-host "Validating Range:" $Start "to" $End
    while ($Start -le $End) {
        $answer+=(validate-id $Start -as [string])
        $Start++
    }
    return $answer
}

(get-content "day2.txt").Split(",") | % {
    $answer += validate-range $_.Split("-")[0] -as [int64] $_.Split("-")[1] -as [int64]
}
write-host "Final Answer:" $answer

