favourites(){
    echo -n "unixporn\nhackernews\ngithub\nreddit\n> "
    read t
    case $t in
        1)
            surf 'reddit.com/r/unixporn'
            ;;
        2)
            surf 'news.ycombinator.com'
            ;;
        3)
            surf 'github.com'
            ;;
        4)
            surf 'reddit.com'
            ;;
        *)
            search "$t"
            ;;
    esac

}

pycd(){
    cd $1 && source bin/activate
}
paste(){
    curl -F 'clbin=<-' https://clbin.com
}
isvenv(){
    return $(python -c "import sys; exit(not ((hasattr(sys, 'real_prefix') or (hasattr(sys, 'base_prefix') and sys.base_prefix != sys.prefix))))")
}

weeb(){
termpix ~/Pictures/Anime-Girls-Holding-Programming-Books/C/Murakami_Shiina_Holding_Computer_C_Programming_Language.png --height $((( $(tput lines) - 1 ))) --true-color > ~/wallsish
cat ~/wallsish
}
swapLock(){
    mv ~/bin/ellielaunch ~/bin/tmp && mv ~/bin/other ~/bin/ellielaunch && mv ~/bin/tmp ~/bin/other
}
lk(){
i3lock-fancy
}
motd(){ toilet -t -f future "Every Ending is a new
Beginning

your lucky number is none

Your lucky color is dead

Motto:
Like father like son
"
}
myname(){ while [ 1 -gt 0  ]; do for font in isometric{1..4} ; do clear; toilet -w $2 -f $font $1; sleep .8; done;        
done }

pirate(){
setprevwifi
connecttopirate || return 3
if [ "$1" = "-s" ]; then
    echo "Look here you lazy fuck, the 
Internet sucks balls for no reason. So here's a fucking shell. ssh yourself, cunt"
    urxvt 2>>/dev/null
else
    surf pirate.lan 2>>/dev/null
fi
reconnecttointernet && echo "Reconnected to $t"|| return 5
}
setprevwifi(){         
t=$(nmcli -t -f active,ssid dev wifi | egrep '^yes' | cut -d\' -f2)
t=${t:4}                                                           
}
connecttopirate(){
    nmcli device wifi connect PirateBox\ -\ Share\ Freely && echo "Connected to PirateBox" || return 2
}
reconnecttointernet(){
    nmcli device wifi list >> /dev/null
    nmcli device wifi connect "$t" >> /dev/null || return 4
}
setcolors(){
                source ~/.cache/wal/colors.sh
                berryc focus_color ${color2:1}
                berryc unfocus_color ${color5:1}
                berryc inner_focus_color ${color0:1}
                berryc inner_unfocus_color ${color5:1}
            }
ellieThemer(){
    oldDir="$(pwd)"
    dir="/home/ellie/lnxpcsThemes/"
    cd $dir
    file=$(ls ~/lnxpcsThemes | shuf -n 1)
    echo $dir$file
    case "$file" in 
        "hello-linux-1280x800.png")
            wal -i $dir$file -l
            ;;
        "crossline-dots.png")
            wal -i $dir$file && feh --bg-tile $dir$file
            ;;
        *)
            wal -i $dir$file
            ;;
    esac
    cd $oldDir
}
search(){
    url='https://google.com/search?q=%s'
    if [ "${1:0:1}" = "-" ]; then
        case $1 in
            "-y")
                url='https://www.youtube.com/results?q=%s'
                shift
                ;;
        esac
    fi
    echo "$*" > searchy
    surf "$(printf "$url" "$(sed -e 's/ /+/g' searchy)")" 2>/dev/null &!
}
opendirSearch(){
    echo "$*" > searchy
    searchoptions='+intitle%3A%22index+of%22+-inurl%3A%28jsp%7Cpl%7Cphp%7Chtml%7Caspx%7Chtm%7Ccf%7Cshtml%29+-inurl%3A%28hypem%7Cunknownsecret%7Csirens%7Cwriteups%7Ctrimediacentral%7Carticlescentral%7Clisten77%7Cmp3raid%7Cmp3toss%7Cmp3drug%7Ctheindexof%7Cindex_of%7Cwallywashis%7Cindexofmp3%29'
    surf "$(printf 'https://www.google.com/search?q=%s' "$(sed -e 's/ /+/g' searchy)")$searchoptions" 2>/dev/null &
}
