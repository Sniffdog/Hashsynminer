. .\Include.ps1

$Path = '.\Bin\NVIDIA-Enemy7\ccminer.exe'
$Uri = 'https://mega.nz/#!JDAm3TJb!BMQPYJz5_nmkZEZB0UUwWicopIdgnHG82Ht5buWxZxo'

$Name = (Get-Item $script:MyInvocation.MyCommand.Path).BaseName

$Algorithms = [PSCustomObject]@{
    
    X17 = 'x17'
    X16r = 'x16r'
}

$Optimizations = [PSCustomObject]@{
   
    X17 = ' -d $SplitSniffCC7'
    X16r = ' -d $SplitSniffCC7'
    
}

$Algorithms | Get-Member -MemberType NoteProperty | Select -ExpandProperty Name | ForEach {
    [PSCustomObject]@{
        Type = 'NVIDIA7'
        Path = $Path
        Arguments = -Join ('-a ', $Algorithms.$_, ' -o stratum+tcp://$($Pools.', $_, '.Host):$($Pools.', $_, '.Port) -b 0.0.0.0:4075 -u $($Pools.', $_, '.User7) -p $($Pools.', $_, '.Pass7)', $Optimizations.$_)
        HashRates = [PSCustomObject]@{$_ = -Join ('$($Stats.', $Name, '_', $_, '_HashRate.Week)')}
        API = 'Ccminer'
        Port = 4075
        Wrap = $false
        URI = $Uri
    }
}
