$Path = '.\Bin\NVIDIA-hsrminer6\hsrminer_neoscrypt_fork.exe'
$Uri = 'https://github.com/justaminer/hsrm-fork/raw/master/hsrminer_neoscrypt_fork.zip'

$Name = (Get-Item $script:MyInvocation.MyCommand.Path).BaseName

$Algorithms = [PSCustomObject]@{
    
    NeoScrypt = 'neoscrypt'
   
}

$Optimizations = [PSCustomObject]@{
    
    NeoScrypt = '-d $SplitSniffCC6'
    
}

$Algorithms | Get-Member -MemberType NoteProperty | Select -ExpandProperty Name | ForEach {
    [PSCustomObject]@{
        Type = 'NVIDIA6'
        Path = $Path
        Arguments = -Join ('-a ', $Algorithms.$_, ' -o stratum+tcp://$($Pools.', $_, '.Host):$($Pools.', $_, '.Port) -b 0.0.0.0:4074 -u $($Pools.', $_, '.User6) -p $($Pools.', $_, '.Pass6)', $Optimizations.$_)
        HashRates = [PSCustomObject]@{$_ = -Join ('$($Stats.', $Name, '_', $_, '_HashRate.Week)')}
        API = 'Ccminer'
        Port = 4074
        Wrap = $false
        URI = $Uri
        PrerequisitePath = "$env:SystemRoot\System32\msvcr120.dll"
        PrerequisiteURI = "http://download.microsoft.com/download/2/E/6/2E61CFA4-993B-4DD4-91DA-3737CD5CD6E3/vcredist_x64.exe"
    }
}
