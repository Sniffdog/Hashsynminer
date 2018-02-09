$Path = '.\Bin\NVIDIAHsrminer\hsrminer_neoscrypt_fork_hp.exe'
$Uri = 'https://github.com/justaminer/hsrm-fork/raw/master/hsrminer_neoscrypt_fork_hp.zip'

$Name = (Get-Item $script:MyInvocation.MyCommand.Path).BaseName

$Algorithms = [PSCustomObject]@{
    
    NeoScrypt = 'neoscrypt'
    
}

$Optimizations = [PSCustomObject]@{
   
    NeoScrypt = ' -d $SplitSniffCC1'
    
}

$Algorithms | Get-Member -MemberType NoteProperty | Select -ExpandProperty Name | ForEach {
    [PSCustomObject]@{
        Type = 'NVIDIA1'
        Path = $Path
        Arguments = -Join ('-a ', $Algorithms.$_, ' -o stratum+tcp://$($Pools.', $_, '.Host):$($Pools.', $_, '.Port) -b 0.0.0.0:4069 -u $($Pools.', $_, '.User1) -p $($Pools.', $_, '.Pass1)', $Optimizations.$_)
        HashRates = [PSCustomObject]@{$_ = -Join ('$($Stats.', $Name, '_', $_, '_HashRate.Week)')}
        API = 'Ccminer'
        Port = 4069
        Wrap = $false
        URI = $Uri
        PrerequisitePath = "$env:SystemRoot\System32\msvcr120.dll"
        PrerequisiteURI = "http://download.microsoft.com/download/2/E/6/2E61CFA4-993B-4DD4-91DA-3737CD5CD6E3/vcredist_x64.exe"
    }
}
