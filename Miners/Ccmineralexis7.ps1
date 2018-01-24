$Path = '.\Bin\NVIDIA-Alexis7\ccminer-alexis.exe'
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
    #Scrypt = 'scrypt'
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
    BlakeVanilla = ' -d $SplitSniffCC7'
    Lyra2RE2 = ' -i 25 -d $SplitSniffCC7'
    Skein = ' -i 28 -d $SplitSniffCC7'
    Qubit = ''
    NeoScrypt = ' -i 15 -d $SplitSniffCC7'
    X11 = ' -d $SplitSniffCC7'
    MyriadGroestl = ' -d $SplitSniffCC7'
    Groestl = ''
    Keccak = ' -d $SplitSniffCC7'
    Scrypt = ' -d $SplitSniffCC7'
    Bitcore = ''
    Blake2s = ' -d $SplitSniffCC7'
    Sib = ' -i 21 -d $SplitSniffCC7'
    X17 = ' -i 21.5 -d $SplitSniffCC7'
    Quark = ''
    Hmq1725 = ''
    Veltor = ' -d $SplitSniffCC7'
    X11evo = ' -d $SplitSniffCC7'
    Timetravel = ''
    Blakecoin = ' -d $SplitSniffCC7'
    Lbry = ' -i 28 -d $SplitSniffCC7'
    C11 = ' -i 20 -d $SplitSniffCC7'
    Nist5 = ' -i 25 -d $SplitSniffCC7'
    Hsr = ' -d $SplitSniffCC7'
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
