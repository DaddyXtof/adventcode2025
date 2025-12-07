function find_largest_number(){
    param([string]$inputString)
    $max=0
    for ($i=0; $i -lt $inputString.Length; $i++) {
        for ($j=$i+1; $j -lt $inputString.Length; $j++) {
            $new_num=[int]($inputString[$i]+$inputString[$j])
            if ($new_num -gt $max) {
                $max=$new_num
                }
            }
        }
    write-host $inputString
    write-host $max
    return $max
}
$answer=0
Get-Content "day3.txt"  | % {
    $answer+=find_largest_number $_
}
write-host "Current total: $answer"
