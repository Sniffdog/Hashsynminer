. .\Include.ps1

$Path = '.\Bin\NVIDIA-Enemy\ccminer.exe'
$Uri = 'https://mega.nz/#!JDAm3TJb!BMQPYJz5_nmkZEZB0UUwWicopIdgnHG82Ht5buWxZxo'

$Name = (Get-Item $script:MyInvocation.MyCommand.Path).BaseName

$Algorithms = [PSCustomObject]@{
    
    X17 = 'x17'
    X16r = 'x16r'
}

$Optimizations = [PSCustomObject]@{
   
    X17 = ' -d $SplitSniffCC0'
    X16r = ' -d $SplitSniffCC0'
    
}

$Algorithms | Get-Member -MemberType NoteProperty | Select -ExpandProperty Name | ForEach {
    [PSCustomObject]@{
        Type = 'NVIDIA'
        Path = $Path
        Arguments = -Join ('-a ', $Algorithms.$_, ' -o stratum+tcp://$($Pools.', $_, '.Host):$($Pools.', $_, '.Port) -u $($Pools.', $_, '.User) -p $($Pools.', $_, '.Pass)', $Optimizations.$_)
        HashRates = [PSCustomObject]@{$_ = -Join ('$($Stats.', $Name, '_', $_, '_HashRate.Week)')}
        API = 'Ccminer'
        Port = 4068
        Wrap = $false
        URI = $Uri
    }
}
