 #!/bin/bash
echo "
[0;1;34;94m┌───────────────[0;34m────────────────[0;37m────────────────[0;1;30;90m────────────────[0;1;34;94m────────────┐[0m
[0;1;34;94m│▌[0m [0;1;34;94m▌▞▀▖▌[0m [0;34m▌▀▛▘▌[0m [0;34m▌▛▀▖▛▀▘[0m     [0;37m▌[0m [0;37m▌▜▘▛▀▖▛▀▘▞▀[0;1;30;90m▖[0m     [0;1;30;90m▛▀▖▞▀▖▌[0m [0;1;30;90m▌▙[0m [0;1;34;94m▌▌[0m  [0;1;34;94m▞▀▖▞▀▖▛▀▖▛▀[0;34m▘▛▀▖│[0m
[0;34m│▝▞[0m [0;34m▌[0m [0;34m▌▌[0m [0;34m▌[0m [0;34m▌[0m [0;34m▌[0m [0;34m▌[0;37m▙▄▘▙▄[0m  [0;37m▄▄▖[0m [0;37m▚▗▘▐[0m [0;1;30;90m▌[0m [0;1;30;90m▌▙▄[0m [0;1;30;90m▌[0m [0;1;30;90m▌[0m [0;1;30;90m▄▄▖[0m [0;1;30;90m▌[0m [0;1;34;94m▌▌[0m [0;1;34;94m▌▌▖▌▌▌▌▌[0m  [0;1;34;94m▌[0m [0;1;34;94m▌[0;34m▙▄▌▌[0m [0;34m▌▙▄[0m [0;34m▙▄▘│[0m
[0;34m│[0m [0;34m▌[0m [0;34m▌[0m [0;34m▌▌[0m [0;37m▌[0m [0;37m▌[0m [0;37m▌[0m [0;37m▌▌[0m [0;37m▌▌[0m       [0;1;30;90m▝▞[0m [0;1;30;90m▐[0m [0;1;30;90m▌[0m [0;1;30;90m▌▌[0m  [0;1;30;90m▌[0m [0;1;34;94m▌[0m     [0;1;34;94m▌[0m [0;1;34;94m▌▌[0m [0;1;34;94m▌▙▚▌▌[0;34m▝▌▌[0m  [0;34m▌[0m [0;34m▌▌[0m [0;34m▌▌[0m [0;34m▌▌[0m  [0;37m▌▚[0m [0;37m│[0m
[0;37m│[0m [0;37m▘[0m [0;37m▝▀[0m [0;37m▝▀[0m  [0;37m▘[0m [0;37m▝▀[0m [0;1;30;90m▀▀[0m [0;1;30;90m▀▀▘[0m      [0;1;30;90m▘[0m [0;1;30;90m▀▘[0;1;34;94m▀▀[0m [0;1;34;94m▀▀▘▝▀[0m      [0;1;34;94m▀▀[0m [0;34m▝▀[0m [0;34m▘[0m [0;34m▘▘[0m [0;34m▘▀▀▘▝▀[0m [0;37m▘[0m [0;37m▘▀▀[0m [0;37m▀▀▘▘[0m [0;37m▘│[0m
[0;37m└───────[0;1;30;90m────────────────[0;1;34;94m────────────────[0;34m────────────────[0;37m────────────────[0;1;30;90m────┘[0m
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
      sudo ln -s /usr/bin/python3 /usr/bin/python
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