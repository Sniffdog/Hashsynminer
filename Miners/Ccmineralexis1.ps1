$Path = '.\Bin\NVIDIA-Alexis1\ccminer.exe'
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
    BlakeVanilla = ' -d $SplitSniffCC1'
    Lyra2RE2 = ' -i 24 -d $SplitSniffCC1'
    Skein = ' -i 28 -d $SplitSniffCC1'
    Qubit = ''
    NeoScrypt = ' -i 15 $SplitSniffCC1'
    X11 = ' -d $SplitSniffCC1'
    MyriadGroestl = ' -d $SplitSniffCC1'
    Groestl = ''
    Keccak = ' -d $SplitSniffCC1'
    Scrypt = ' -d $SplitSniffCC1'
    Bitcore = ''
    Blake2s = ' -d $SplitSniffCC1'
    Sib = ' -i 21 -d $SplitSniffCC1'
    X17 = ' -i 21.5 -d $SplitSniffCC1'
    Quark = ''
    Hmq1725 = ''
    Veltor = ' -d $SplitSniffCC1'
    X11evo = ' -i 21 -d $SplitSniffCC1'
    Timetravel = ' -i 25 -d $SplitSniffCC1'
    Blakecoin = ' -d $SplitSniffCC1'
    Lbry = ' -i 28 -d $SplitSniffCC1'
    C11 = ' -d $SplitSniffCC1'
    Nist5 = ' -i 25 -d $SplitSniffCC1'
    Hsr = ' -d $SplitSniffCC1'
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
    }
}
