$Path = '.\Bin\NVIDIA-Poly6\ccminer.exe'
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
    Lyra2z = ' -d $SplitSniffCC6'
    Equihash = ''
    Cryptonight = ' -d $SplitSniffCC6'
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
    Bitcore = ' -d $SplitSniffCC6'
    Blake2s = ''
    Sib = ''
    X17 = ''
    Quark = ''
    Hmq1725 = ' -d $SplitSniffCC6'
    Veltor = ''
    X11evo = ''
    Timetravel = ' -d $SplitSniffCC6'
    Blakecoin = ''
    Lbry = ''
    Jha = ' -d $SplitSniffCC6'
    Skunk = ' -d $SplitSniffCC6'
    Tribus = ' -d $SplitSniffCC6'
    Phi = ' -d $SplitSniffCC6'
    Hsr = ' -d $SplitSniffCC6'
    Polytimos = ' -d $SplitSniffCC6'
    
}

$Algorithms | Get-Member -MemberType NoteProperty | Select -ExpandProperty Name | ForEach {
    [PSCustomObject]@{
        Type = 'NVIDIA6'
        Path = $Path
        Arguments = -Join ('-a ', $Algorithms.$_, ' -o stratum+tcp://$($Pools.', $_, '.Host):$($Pools.', $_, '.Port) -b 0.0.0.0:4074 -u $($Pools.', $_, '.User6) -p $($Pools.', $_, '.Pass6)', $Optimizations.$_)
        HashRates = [PSCustomObject]@{$_ = -Join ('$($Stats.', $Name, '_', $_, '_HashRate.Week)')}
        API = 'Ccminer'
        Port = 4074
        Wrap = $false
        URI = $Uri
    }
}
