$Path = '.\Bin\NVIDIA-Alexis6\ccminer-alexis.exe'
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
    #X17 = 'x17'
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
    BlakeVanilla = ' -d $SplitSniffCC6'
    Lyra2RE2 = ' -i 24 -d $SplitSniffCC6'
    Skein = ' -i 28 -d $SplitSniffCC6'
    Qubit = ''
    NeoScrypt = ' -d $SplitSniffCC6'
    X11 = ' -d $SplitSniffCC6'
    MyriadGroestl = ' -d $SplitSniffCC6'
    Groestl = ''
    Keccak = ' -d $SplitSniffCC6'
    Scrypt = ' -d $SplitSniffCC6'
    Bitcore = ''
    Blake2s = ' -d $SplitSniffCC6'
    Sib = ' -i 21 -d $SplitSniffCC6'
    X17 = ' -i 21.5 -d $SplitSniffCC6'
    Quark = ''
    Hmq1725 = ''
    Veltor = ' -d $SplitSniffCC6'
    X11evo = ' -i 21 -d $SplitSniffCC6'
    Timetravel = ''
    Blakecoin = ' -d $SplitSniffCC6'
    Lbry = ' -i 28 -d $SplitSniffCC6'
    C11 = ' -i 20 -d $SplitSniffCC6'
    Nist5 = ' -i 25 -d $SplitSniffCC6'
    Hsr = ' -d $SplitSniffCC6'
}

$Algorithms | Get-Member -MemberType NoteProperty | Select -ExpandProperty Name | ForEach {
    [PSCustomObject]@{
        Type = 'NVIDIA6'
        Path = $Path
        Arguments = -Join ('-a ', $Algorithms.$_, ' -o stratum+tcp://$($Pools.', $_, '.Host):$($Pools.', $_, '.Port) -b 0.0.0.0:4074 -u $($Pools.', $_, '.User6) -p $($Pools.', $_, '.Pass6)', $Optimizations.$_, ' -R 10 -T 30')
        HashRates = [PSCustomObject]@{$_ = -Join ('$($Stats.', $Name, '_', $_, '_HashRate.Day)')}
        API = 'Ccminer'
        Port = 4074
        Wrap = $false
        URI = $Uri
    }
}
