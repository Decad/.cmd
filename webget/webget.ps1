#
# Author: Declan Cook
#
$uri = [System.Uri]$args[0]

$wc=new-object net.webclient
$wc.proxy.credentials=[system.net.credentialcache]::defaultnetworkcredentials

$out = $wc.DownloadString($uri.OriginalString)

$filename = $uri.segments[$uri.segments.length - 1]

IF ($filename -eq "/"){
    $filename = "index.html"
}

write $out | Out-File $filename