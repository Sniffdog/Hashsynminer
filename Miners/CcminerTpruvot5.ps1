$Path = '.\Bin\NVIDIA-TPruvot5\ccminer-x64.exe'
$Uri = 'https://github.com/MSFTserver/ccminer/releases/download/2.2.5-rvn/ccminer-x64-2.2.5-rvn-cuda9.7z'

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
    Qubit = 'qubit'
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
    Quark = 'quark'
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
    Lyra2z = ' -d $SplitSniffCC5'
    Equihash = ''
    Cryptonight = ' -d $SplitSniffCC5'
    Ethash = ''
    Sia = ''
    Yescrypt = ''
    BlakeVanilla = ''
    Lyra2RE2 = ' -d $SplitSniffCC5'
    Skein = ''
    Qubit = ' -d $SplitSniffCC5'
    NeoScrypt = ''
    X11 = ''
    MyriadGroestl = ''
    Groestl = ''
    Keccak = ' -d $SplitSniffCC5'
    Scrypt = ' -d $SplitSniffCC5'
    Bitcore = ' -d $SplitSniffCC5'
    Blake2s = ''
    Sib = ''
    X17 = ''
    Quark = ' -d $SplitSniffCC5'
    Hmq1725 = ' -d $SplitSniffCC5'
    Veltor = ''
    X11evo = ' -d $SplitSniffCC5'
    Timetravel = ' -d $SplitSniffCC5'
    Blakecoin = ''
    Lbry = ''
    Jha = ' -d $SplitSniffCC5'
    Skunk = ' -d $SplitSniffCC5'
    Tribus = ' -d $SplitSniffCC5'
    Phi = ' -i 23 -d $SplitSniffCC5'
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
