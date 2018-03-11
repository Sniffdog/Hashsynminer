. .\Include.ps1

$Path = '.\Bin\NVIDIA-Enemy2\ccminer.exe'
$Uri = 'https://mega.nz/#!JDAm3TJb!BMQPYJz5_nmkZEZB0UUwWicopIdgnHG82Ht5buWxZxo'

$Name = (Get-Item $script:MyInvocation.MyCommand.Path).BaseName

$Algorithms = [PSCustomObject]@{
    
    X17 = 'x17'
    X16r = 'x16r'
}

$Optimizations = [PSCustomObject]@{
   
    X17 = ' -d $SplitSniffCC2'
    X16r = ' -d $SplitSniffCC2'
    
}

$Algorithms | Get-Member -MemberType NoteProperty | Select -ExpandProperty Name | ForEach {
    [PSCustomObject]@{
        Type = 'NVIDIA2'
        Path = $Path
        Arguments = -Join ('-a ', $Algorithms.$_, ' -o stratum+tcp://$($Pools.', $_, '.Host):$($Pools.', $_, '.Port) -b 0.0.0.0:4070 -u $($Pools.', $_, '.User2) -p $($Pools.', $_, '.Pass2)', $Optimizations.$_)
        HashRates = [PSCustomObject]@{$_ = -Join ('$($Stats.', $Name, '_', $_, '_HashRate.Week)')}
        API = 'Ccminer'
        Port = 4070
        Wrap = $false
        URI = $Uri
    }
}
