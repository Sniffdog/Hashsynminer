$Path = '.\Bin\NVIDIA-Alexis5\ccminer.exe'
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
    #X11evo = 'x11evo'
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
    BlakeVanilla = ' -d $SplitSniffCC5'
    Lyra2RE2 = ' -i 24 -d $SplitSniffCC5'
    Skein = ' -i 28 -d $SplitSniffCC5'
    Qubit = ''
    NeoScrypt = ' -i 15 -d $SplitSniffCC5'
    X11 = ' -d $SplitSniffCC5'
    MyriadGroestl = ' -d $SplitSniffCC5'
    Groestl = ''
    Keccak = ' -d $SplitSniffCC5'
    Scrypt = ' -d $SplitSniffCC5'
    Bitcore = ''
    Blake2s = ' -d $SplitSniffCC5'
    Sib = ' -i 21 -d $SplitSniffCC5'
    X17 = ' -i 21.5 -d $SplitSniffCC5'
    Quark = ''
    Hmq1725 = ''
    Veltor = ' -d $SplitSniffCC5'
    X11evo = ' -i 21 -d $SplitSniffCC5'
    Timetravel = ''
    Blakecoin = ' -d $SplitSniffCC5'
    Lbry = ' -i 28 -d $SplitSniffCC5'
    C11 = ' -d $SplitSniffCC5'
    Nist5 = ' -i 25 -d $SplitSniffCC5'
    Hsr = ' -d $SplitSniffCC5'
}

$Algorithms | Get-Member -MemberType NoteProperty | Select -ExpandProperty Name | ForEach {
    [PSCustomObject]@{
        Type = 'NVIDIA5'
        Path = $Path
        Arguments = -Join ('-a ', $Algorithms.$_, ' -o stratum+tcp://$($Pools.', $_, '.Host):$($Pools.', $_, '.Port) -b 0.0.0.0:4073 -u $($Pools.', $_, '.User5) -p $($Pools.', $_, '.Pass5)', $Optimizations.$_)
        HashRates = [PSCustomObject]@{$_ = -Join ('$($Stats.', $Name, '_', $_, '_HashRate.Week)')}
        API = 'Ccminer'
        Port = 4073
        Wrap = $false
        URI = $Uri
    }
}
