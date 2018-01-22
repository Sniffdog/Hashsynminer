$Path = '.\Bin\NVIDIA-Alexis0\ccminer.exe'
$Uri = 'http://ccminer.org/preview/ccminer-hsr-alexis-x86-cuda8.7z'

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
    Skein = 'skein'
    #Qubit = 'qubit'
    #NeoScrypt = 'neoscrypt'
    X11 = 'x11'
    MyriadGroestl = 'myr-gr'
    #Groestl = 'groestl'
    Keccak = 'keccak'
    Scrypt = 'scrypt'
    #Bitcore = 'bitcore'
    Blake2s = 'blake2s'
    Sib = 'sib'
    X17 = 'x17'
    #Quark = 'quark'
    #Hmq1725 = 'hmq1725'
    Veltor = 'veltor'
    X11evo = 'x11evo'
    #Timetravel = 'timetravel'
    Blakecoin = 'blakecoin'
    Lbry = 'lbry'
    C11 = 'c11'
    Nist5 = 'nist5'
    Hsr = 'hsr'
}

$Optimizations = [PSCustomObject]@{
    Lyra2z = ''
    Equihash = ''
    Cryptonight = ''
    Ethash = ''
    Sia = ''
    Yescrypt = ''
    BlakeVanilla = ''
    Lyra2RE2 = ' -i 24 -d $SplitSniffCC0'
    Skein = ' -i 28 -d $SplitSniffCC0'
    Qubit = ''
    NeoScrypt = ' -i 15 -d $SplitSniffCC0'
    X11 = ' -d $SplitSniffCC0'
    MyriadGroestl = ' -d $SplitSniffCC0'
    Groestl = ''
    Keccak = ' -d $SplitSniffCC0'
    Scrypt = ' -d $SplitSniffCC0'
    Bitcore = ''
    Blake2s = ' -d $SplitSniffCC0'
    Sib = ' -i 21 -d $SplitSniffCC0'
    X17 = ' -i 21.5 -d $SplitSniffCC0'
    Quark = ''
    Hmq1725 = ''
    Veltor = ' -d $SplitSniffCC0'
    X11evo = ' -i 21 -d $SplitSniffCC0'
    Timetravel = ' -i 25 -d $SplitSniffCC0'
    Blakecoin = ' -d $SplitSniffCC0'
    Lbry = ' -i 28 -d $SplitSniffCC0'
    C11 = ' -d $SplitSniffCC0'
    Nist5 = ' -i 25 -d $SplitSniffCC0'
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
