#!/bin/bash
opkg update && opkg upgrade
   opkg install p7zip
   opkg install wget 
   opkg install curl  
   opkg install python3-lxml 
   opkg install python3-requests  
   opkg install python3-beautifulsoup4   
   opkg install python3-cfscrape 
   opkg install livestreamersrv 
   opkg install python3-six 
   opkg install python3-sqlite3 
   opkg install python3-pycrypto 
   opkg install f4mdump python3-image  
   opkg install python3-imaging  
   opkg install python3-argparse 
   opkg install python3-multiprocessing
   opkg install python3-mmap 
   opkg install python3-ndg-httpsclient  
   opkg install python3-pydoc 
   opkg install python3-xmlrpc
   opkg install python3-certifi 
   opkg install python3-urllib3 
   opkg install python3-chardet
   opkg install python3-pysocks 
   opkg install python3-js2py 
   opkg install python3-pillow
   opkg update
   opkg install enigma2-plugin-systemplugins-serviceapp
   opkg install ffmpeg
   opkg install exteplayer3
   opkg install gstplayer
   opkg update
   opkg install gstreamer1.0-plugins-good
   opkg install gstreamer1.0-plugins-ugly
   opkg install gstreamer1.0-plugins-base
   opkg install gstreamer1.0-plugins-bad
wait
FEED="/etc/opkg/eliesat-feed.conf"
FEED="/etc/opkg/user-feed.conf"
left=">>>>"
right="<<<<"
LINE1="---------------------------------------------------------"
LINE2="-------------------------------------------------------------------------------------"

echo "$LINE1"
echo "> Installing dependencies be patient ...
> it takes 2 to 15 minutes please wait..."
echo "$LINE1"
sleep 5s

echo "> start of process ..."
sleep 3s

# Check python
pyVersion=$(python -c"from sys import version_info; print(version_info[0])")

deps=("wget" "alsa-plugins" "alsa-utils" "alsa-utils-aplay" "astra-sm" "bzip2" "curl" "duktape" "dvbsnoop" "enigma2" "exteplayer3" "ffmpeg" "gstplayer" "perl-module-io-zlib" "libasound2" "libavcodec60" "libavformat60" "libusb-1.0-0" "libxml2" "libxslt" "libc6" "libgcc1" "libpython3.12-1.0" "libstdc++6" "openvpn" "p7zip" "rtmpdump" "enigma2-plugin-systemplugins-serviceapp" "enigma2-plugin-extensions-opkg-tools" "unrar" "zip" "xz" "zstd")

if [ "$pyVersion" = 3 ]; then
  deps+=( "livestreamersrv" "python3-backports-lzma" "python3-beautifulsoup4" "python3-certifi" "python3-chardet" "python3-cfscrape" "python3-codecs" "python3-core" "python3-compression" "python3-cryptography" "python3-dateutil" "python3-difflib" "python3-fuzzywuzzy" "python3-future" "python3-futures3" "python3-html" "python3-image" "python3-imaging" "python3-js2py" "python3-json" "python3-levenshtein" "python3-lxml" "python3-mmap" "python3-misc" "python3-mechanize" "python3-multiprocessing" "python3-ndg-httpsclient" "python3-netclient" "python3-netserver" "python3-pillow" "python3-pkgutil" "python3-pycurl" "python3-pycrypto" "python3-pydoc" "python3-pyexecjs" "python3-pyopenssl" "python3-rarfile" "python3-pysocks" "python3-requests" "python3-shell" "python3-sqlite3" "python3-six" "python3-treq" "python3-twisted-web" "python3-unixadmin" "python3-urllib3" "python3-xmlrpc" "python3-zoneinfo" )
else
  
deps+=( "f4mdump" "hlsdl" "kodi-addon-pvr-iptvsimple" "python-lzma" "python-argparse" "python-beautifulsoup4" "python-certifi" "python-chardet" "python-codecs" "python-compression" "python-core" "python-pycurl" "python-cryptography" "python-difflib" "python-futures" "python-html" "python-image" "python-imaging" "python-json" "python-js2py" "python-lxml" "python-lzma" "python-mechanize" "python-multiprocessing" "python-misc" "python-mmap" "python-ndg-httpsclient" "python-netclient" "python-pycrypto" "python-pyexecjs" "python-pydoc" "python-pyopenssl" "python-requests" "python-robotparser" "python-six" "python-shell" "python-sqlite3" "python-pysocks" "python-subprocess" "python-twisted-web" "python-unixadmin" "python-urllib3" "python-xmlrpc" )
fi

if [ -f /etc/opkg/opkg.conf ]; then
  STATUS='/var/lib/opkg/status'
  OSTYPE='Opensource'
  OPKG='opkg update'
  OPKGINSTAL='opkg install'
elif [ -f /etc/apt/apt.conf ]; then
  STATUS='/var/lib/dpkg/status'
  OSTYPE='DreamOS'
  OPKG='apt-get update'
  OPKGINSTAL='apt-get install -y'
fi

install() {
  if ! grep -qs "Package: $1" "$STATUS"; then
    $OPKG >/dev/null 2>&1
    rm -rf /run/opkg.lock
    echo -e "> Need to install ${left} $1 ${right} please wait..."
    echo "$LINE2"
    sleep 0.8
    echo
    if [ "$OSTYPE" = "Opensource" ]; then
      $OPKGINSTAL "$1"
      sleep 1
      clear
    elif [ "$OSTYPE" = "DreamOS" ]; then
      $OPKGINSTAL "$1" -y
      sleep 1
      clear
    fi
  fi
}

for i in "${deps[@]}"; do
  install "$i"
done

rm -rf /var/cache/opkg/*
rm -rf /var/lib/opkg/lists/*
rm -rf /run/opkg.lock
echo "> cache is cleaned...
updating feeds please wait..."
sleep 3s

opkg update
wait
#!/bin/sh
#

wget -O /tmp/multistalker-mips-1.2.tar.gz "https://raw.githubusercontent.com/tarekzoka/multistalker-pro/main/multistalker-mips-1.2.tar.gz"

tar -xzf /tmp/multistalker-mips-1.2.tar.gz -C /

wait

rm -f /tmp/multistalker-mips-1.2.tar.gz
echo "   UPLOADED BY  >>>>   TAREK_TT "   
sleep 4;                                                                                                                  
echo ". >>>>         RESTARING     <<<<"
"**********************************************************************************"
wait
killall -9 enigma2
exit 0



echo "> end of process...
> your device will reboot now...please wait..."
sleep 3s 

reboot
