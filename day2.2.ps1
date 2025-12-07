$answer = 0
function validate-id() {
    param([string]$id)
    $s_size = 1
    $index = 0
    $found = $false
    for ($s_size=1;$s_size -le [math]::Floor($id.Length/2);$s_size++) {
        if ($id.Length % $s_size -eq 0) {
            $pattern = $id.Substring(0,$s_size)
            $isRepeating = $true
            for ($i = $s_size; $i -lt $id.Length; $i += $s_size) {
                if ($id.Substring($i, $s_size) -ne $pattern) {
                    $isRepeating = $false
                    break
                }
            }
            if ($isRepeating) {
                write-host "Invalid ID (repeating pattern '$pattern'):" $id
                return $id -as [int64]
            }
        }
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

