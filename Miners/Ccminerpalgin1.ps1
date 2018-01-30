. .\Include.ps1

$Path = ".\Bin\NVIDIA-krnlx1\ccminer_x86.exe"
$Uri = "https://github.com/Sniffdog/ccminer-xevan/releases/download/1.0/Ccminer_x86_krnlx.zip"

$Commands = [PSCustomObject]@{
    #"bitcore" = "" #Bitcore
    #"blake2s" = "" #Blake2s
    #"blakecoin" = "" #Blakecoin
    #"vanilla" = "" #BlakeVanilla
    #"cryptonight" = "" #Cryptonight
    #"decred" = "" #Decred
    #"equihash" = "" #Equihash
    #"ethash" = "" #Ethash
    #"groestl" = "" #Groestl
    #"hmq1725" = "" #hmq1725
    #"keccak" = "" #Keccak
    #"lbry" = "" #Lbry
    #"lyra2v2" = " -d $SplitSniffCC1" #Lyra2RE2
    #"lyra2z" = "" #Lyra2z
    #"myr-gr" = "" #MyriadGroestl
    #"neoscrypt" = "" #NeoScrypt
    #"nist5" = "" #Nist5
    #"pascal" = "" #Pascal
    #"qubit" = "" #Qubit
    #"scrypt" = "" #Scrypt
    #"sia" = "" #Sia
    #"sib" = "" #Sib
    #"skein" = "" #Skein
    #"timetravel" = "" #Timetravel
    #"x11" = "" #X11
    #"veltor" = "" #Veltor
    #"x11evo" = " -d $SplitSniffCC1" #X11evo
    #"x17" = "" #X17
    #"yescrypt" = "" #Yescrypt
    #"quark" = "" #Quark
    #"skunk" = "" #skunk
    #"c11" = "" #C11
    "xevan" = " -d $SplitSniffCC1" #Xevan
}

$Name = (Get-Item $script:MyInvocation.MyCommand.Path).BaseName

$Commands | Get-Member -MemberType NoteProperty | Select -ExpandProperty Name | ForEach {
    [PSCustomObject]@{
        Type = "NVIDIA1"
        Path = $Path
        Arguments = "-a $_ -o stratum+tcp://$($Pools.(Get-Algorithm($_)).Host):$($Pools.(Get-Algorithm($_)).Port) -b 0.0.0.0:4069 -u $($Pools.(Get-Algorithm($_)).User1) -p $($Pools.(Get-Algorithm($_)).Pass1)$($Commands.$_)"
        HashRates = [PSCustomObject]@{(Get-Algorithm($_)) = $Stats."$($Name)_$(Get-Algorithm($_))_HashRate".Week}
        API = "Ccminer"
        Port = 4069
        Wrap = $false
        URI = $Uri
    }
}
