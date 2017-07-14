#!/bin/sh


ACTION=`zenity --width=320 --height=300 --list --radiolist --text="Select option" --title="Welcome to Wall selector" --column "Choose" --column "Directory" TRUE About FALSE Setup FALSE Set_Wallpaper`

if [ -n "${ACTION}" ];then
  case $ACTION in
  About)
  zenity --info --text="Wall selector v.0.2 Copyright (C) 2015 JJ Posti from techtimejourney.net
This program comes with ABSOLUTELY NO WARRANTY; for details see: 
http://www.gnu.org/copyleft/gpl.html
This is free software, and you are welcome to redistribute it
under GPL Version 3, 29 June 2007."
sh '/usr/share/wallselector.sh' 

;;
  Setup)
    zenity --info --text "The Initial-setup creates a hidden .wall placeholder folder to user's home. Finally, an entry will be added to ~/.xinitrc in order to enable autostarting." 
    mkdir /home/$USER/.wall
    echo "\n $(cat ~/.xinitrc)"  > ~/.xinitrc
    echo "sh /home/$USER/.wall/wall.sh & $(cat ~/.xinitrc)" > ~/.xinitrc
    sh '/usr/share/wallselector.sh' 
;;
  
Set_Wallpaper)
zenity --info --text "PostX wallpapers are located under /usr/share/postx-wallpapers." 

selection=$(zenity --file-selection --title="Select a wallpaper")
selectionret=$?
echo "$selection"
rm -rf  /home/$USER/.wall/wall.sh
touch /home/$USER/.wall/wall.sh
echo "feh --bg-scale  $selection" >> /home/$USER/.wall/wall.sh
sh /home/$USER/.wall/wall.sh
sh '/usr/share/wallselector.sh' 
    ;;
  esac
fi




