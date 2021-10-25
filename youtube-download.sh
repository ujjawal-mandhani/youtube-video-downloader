 #!/bin/bash
echo "                                      
__   _____  _   _ _____ _   _ ____  _____   __     _____ ____  _____ ___         ____   _____        ___   _ _     ___    _    ____  _____ ____  
\ \ / / _ \| | | |_   _| | | | __ )| ____|  \ \   / /_ _|  _ \| ____/ _ \       |  _ \ / _ \ \      / / \ | | |   / _ \  / \  |  _ \| ____|  _ \ 
 \ V / | | | | | | | | | | | |  _ \|  _| ____\ \ / / | || | | |  _|| | | | _____| | | | | | \ \ /\ / /|  \| | |  | | | |/ _ \ | | | |  _| | |_) |
  | || |_| | |_| | | | | |_| | |_) | |__|_____\ V /  | || |_| | |__| |_| ||_____| |_| | |_| |\ V  V / | |\  | |__| |_| / ___ \| |_| | |___|  _ < 
  |_| \___/ \___/  |_|  \___/|____/|_____|     \_/  |___|____/|_____\___/       |____/ \___/  \_/\_/  |_| \_|_____\___/_/   \_\____/|_____|_| \_\
   
"
echo "Finding dependencies"
 if youtube-dl --version >/dev/null 2>&1 ; then
    echo "All dependencies are installed"

 else
    echo "Yotube-dl is not installed please install youtube-dl"
    echo "Do you want to install dependencies [y/n]"
    read choice

    if [ ${choice} == 'y' ] || [ ${choice} == 'yes' ] || [ ${choice} == 'Y' ] || [ ${choice} == 'Yes' ]
    then
      sudo curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl
      sudo chmod a+rx /usr/local/bin/youtube-dl
    fi
    if [ ${choice} == 'n' ] || [ ${choice} == 'no' ] || [ ${choice} == 'N' ] || [ ${choice} == 'No' ]
    then
      exit 1
    fi
 fi

 if [ $1 ] && [ $1 == '-h' ]
 then
   echo "This is youtube video downloader"
   exit 1
 fi

  if [ $1 ] && [ $1 == '--help' ]
 then
   echo "This is youtube video downloader"
   exit 1
 fi

 if [ !$1 ]
 then
    echo "please enter url"
    read url
    youtube-dl -F ${url}
    echo "Enter the number to download"
    read num
    youtube-dl -f ${num} ${url}
    exit 1
 fi


youtube-dl -F $1
echo "Enter the number to download"
read num
youtube-dl -f ${num} $1