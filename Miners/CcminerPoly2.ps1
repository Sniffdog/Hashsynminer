$Path = '.\Bin\NVIDIA-Poly2\ccminer.exe'
$Uri = 'https://github.com/punxsutawneyphil/ccminer/releases/download/polytimosv2/ccminer-polytimos_v2.zip'
 


$Name = (Get-Item $script:MyInvocation.MyCommand.Path).BaseName

$Algorithms = [PSCustomObject]@{
    #Lyra2z = 'lyra2z'
    #Equihash = 'equihash' #not supported
    #Cryptonight = 'cryptonight'
    #Ethash = 'ethash' #not supported
    #Sia = 'sia'
    #Yescrypt = 'yescrypt'
    #BlakeVanilla = 'vanilla'
    #Lyra2RE2 = 'lyra2v2'
    #Skein = 'skein'
    #Qubit = 'qubit'
    #NeoScrypt = 'neoscrypt'
    #X11 = 'x11'
    #MyriadGroestl = 'myr-gr'
    #Groestl = 'groestl'
    #Keccak = 'keccak'
    #Scrypt = 'scrypt'
    #Bitcore = 'bitcore'
    #Blake2s = 'blake2s'
    #Sib = 'sib'
    #X17 = 'x17'
    #Quark = 'quark'
    #Hmq1725 = 'hmq1725'
    #Veltor = 'veltor'
    #X11evo = 'x11evo'
    #Timetravel = 'timetravel'
    #Blakecoin = 'blakecoin'
    #Lbry = 'lbry'
    #Jha = 'jha'
    #Skunk = 'skunk'
    #Tribus = 'tribus'
    #Phi = 'phi'
    #Hsr = 'hsr'
    Polytimos = 'poly'
}

$Optimizations = [PSCustomObject]@{
    Lyra2z = ' -d $SplitSniffCC2'
    Equihash = ''
    Cryptonight = ' -d $SplitSniffCC2'
    Ethash = ''
    Sia = ''
    Yescrypt = ''
    BlakeVanilla = ''
    Lyra2RE2 = ''
    Skein = ''
    Qubit = ''
    NeoScrypt = ''
    X11 = ''
    MyriadGroestl = ''
    Groestl = ''
    Keccak = ''
    Scrypt = ''
    Bitcore = ' -d $SplitSniffCC2'
    Blake2s = ''
    Sib = ''
    X17 = ''
    Quark = ''
    Hmq1725 = ' -d $SplitSniffCC2'
    Veltor = ''
    X11evo = ''
    Timetravel = ' -d $SplitSniffCC2'
    Blakecoin = ''
    Lbry = ''
    Jha = ' -d $SplitSniffCC2'
    Skunk = ' -d $SplitSniffCC2'
    Tribus = ' -d $SplitSniffCC2'
    Phi = ' -d $SplitSniffCC2'
    Hsr = ' -d $SplitSniffCC2'
    Polytimos = ' -d $SplitSniffCC2'
    
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
