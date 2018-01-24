$Path = '.\Bin\NVIDIA-TPruvot0\ccminer.exe'
$Uri = 'https://github.com/tpruvot/ccminer/releases/download/2.2.4-tpruvot/ccminer-x86-2.2.4-cuda9.7z'

$Name = (Get-Item $script:MyInvocation.MyCommand.Path).BaseName

$Algorithms = [PSCustomObject]@{
    Lyra2z = 'lyra2z'
    #Equihash = 'equihash' #not supported
    Cryptonight = 'cryptonight'
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
    Scrypt = 'scrypt'
    Bitcore = 'bitcore'
    #Blake2s = 'blake2s'
    #Sib = 'sib'
    #X17 = 'x17'
    #Quark = 'quark'
    Hmq1725 = 'hmq1725'
    #Veltor = 'veltor'
    #X11evo = 'x11evo'
    Timetravel = 'timetravel'
    #Blakecoin = 'blakecoin'
    #Lbry = 'lbry'
    Jha = 'jha'
    Skunk = 'skunk'
    Tribus = 'tribus'
    Phi = 'phi'
    #Hsr = 'hsr'
}

$Optimizations = [PSCustomObject]@{
    Lyra2z = ' -d $SplitSniffCC0'
    Equihash = ''
    Cryptonight = ' -d $SplitSniffCC0'
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
    Keccak = ' -d $SplitSniffCC0'
    Scrypt = ' -d $SplitSniffCC0'
    Bitcore = ' -d $SplitSniffCC0'
    Blake2s = ''
    Sib = ''
    X17 = ''
    Quark = ''
    Hmq1725 = ' -d $SplitSniffCC0'
    Veltor = ''
    X11evo = ' -d $SplitSniffCC0'
    Timetravel = ' -d $SplitSniffCC0'
    Blakecoin = ''
    Lbry = ''
    Jha = ' -d $SplitSniffCC0'
    Skunk = ' -d $SplitSniffCC0'
    Tribus = ' -d $SplitSniffCC0'
    Phi = ' -i 23 -d $SplitSniffCC0'
    Hsr = ' -d $SplitSniffCC0'
    
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
