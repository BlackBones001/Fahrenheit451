#user:
us3r=$(whoami)
#Scan:
scan=1
scan_opt1=1
scan_opt2=2
scan_opt3=3
scan_dev1=1
scan_dev2=2
dev="/24"
#Passwd:
passwd=2
passwd_opt1=1
passwd_opt2=2
passwd_opt3=3
passwd_b_opt1=1
passwd_b_opt2=2
#Data:
data=3
data_sql=1
#Ghost on net:
ghost=4
ghost_nordvpn=1 
ghost_mac=2
ghost_torghostng=3
#Install:
install=0 
#Exit:
exit=99


while true; do
    clear 
    cat banner.txt

    printf " Author: "; printf "\e[1;104m Black_Bones001 \e[0m\n";
    cat menu.txt 
    printf "\e[1;34m Montag@~#: \e[0m"; read input
    ########################################################SCAN
    if [ $input == $scan ]; then
        clear 
        cat scan/scan.txt 
        printf "\e[1;34m Montag_Scan@~#: \e[0m"; read input
        if [ $input == $scan_opt1 ]; then 
            printf "\e[1;34m WEB/IP: \e[0m"; read WEB_IP
            printf "\e[1;34m Scaning: \e[0m \e[1;77m $WEB_IP \e[0m\n"
            echo $WEB_IP > scan/web.txt;
            sudo nmap -p 1-65535 -A -T4 -iL scan/web.txt > scan/r.txt 
            cat scan/r.txt 
            printf "\n";
            printf "Press any key to exit ...  "; read key 
        elif [ $input == $scan_opt2 ]; then 
            printf "\e[1;34m WEB/IP: \e[0m"; read IP
            printf "\e[1;34m Scaning: \e[0m \e[1;77m $IP \e[0m\n";
            echo $IP > scan/web.txt 
            sudo nmap  -O  -iL scan/web.txt > scan/r.txt 
            cat scan/r.txt 
            printf "\n";
            printf "Press any key to exit ...  "; read key 
        elif [ $input == $scan_opt3 ]; then 
            
            printf "\e[1;34m Ooptions:\n1) Nmap\n2) Arp-Scan\n \e[0m"; 
            printf "\e[1;34m Montag-Scan_tool@~#: \e[0m"; read input
            if [ $input == $scan_dev1 ]; then 
                clear 
                ifconfig -a
                printf "\e[1;34m Put your IP/Address: \e[0m"; read INET 
                inet=$INET$dev;
                sudo nmap -O $inet;
                printf "\n";
                printf "Press any key to exit ...  "; read key 
            elif [ $input == $scan_dev2 ]; then 
                clear 
                ifconfig
                printf "\n";
                printf "\e[1;34m Put your interface: \e[0m"; read INTERFACE 
                sudo arp-scan --interface=$INTERFACE --localnet ;
                printf "\n";
                printf "########## IF NOTHING APPEARS, TRY AGAIN ...";
                printf "\n";
                printf "Press any key to exit ...  "; read key
            fi 
        fi 
    ######################################################### PASSWORD
    elif [ $input == $passwd ]; then 
        clear
        cat passwd/passwd.txt 
        printf "\e[1;34m Montag_passwd@~#: \e[0m"; read input
        if [ $input == $passwd_opt1 ]; then 
            python3 passwd/makepasswd.py ;
            printf "\n";
            printf "Press any key to exit ...  "; read key
        elif [ $input == $passwd_opt2 ]; then 
            printf "\e[1;34m Path of the hash file: \e[0m"; read HASH 
            printf "\e[1;34m Use a passwd list[Yes[y] or No[n]]: \e[0m"; read input  
            if [ $input == "y" ]; then 
                printf "\e[1;34m Path of the list: \e[0m"; read LIST 
                sudo john   --wordlist=$LIST $HASH ;
                printf "\n";
                printf "Press any key to exit ...  "; read key
            elif [ $input == "n" ]; then 
                sudo john $HASH
                printf "\n";
                printf "Press any key to exit ...  "; read key
            fi 
        elif [ $input == $passwd_opt3 ]; then
            clear
            cat passwd/brute/banner.txt
            printf "\e[1;34m Montag_passwd@~#: \e[0m"; read input
            if [ $input == $passwd_b_opt1 ]; then
                printf "\e[1;34m Put the HOST: \e[0m"; read HOST
                echo $HOST > passwd/brute/host.txt 
                printf "\e[1;34m Path of the USER-LIST: \e[0m"; read USER
                echo $USER > passwd/brute/user.txt 
                printf "\e[1;34m Path of the PASSWD-LIST: \e[0m"; read PASSWD
                echo $PASSWD > passwd/brute/user.txt 
                printf "\e[1;34m Put the port: \e[0m"; read PORT 
                sudo hydra -s $PORT -L $USER -P $PASSWD ssh://$HOST 
                printf "\n";
                printf "Press any key to exit ...  "; read key
            elif [ $input == $passwd_b_opt2 ]; then
                printf "\e[1;34m Put the HOST: \e[0m"; read HOST
                echo $HOST > passwd/brute/host.txt 
                printf "\e[1;34m Path of the USER-LIST: \e[0m"; read USER
                echo $USER > passwd/brute/user.txt 
                printf "\e[1;34m Path of the PASSWD-LIST: \e[0m"; read PASSWD
                echo $PASSWD > passwd/brute/user.txt 
                printf "\e[1;34m Put the port: \e[0m"; read PORT 
                sudo hydra -s $PORT -L $USER -P $PASSWD ftp://$HOST 
                printf "\n";
                printf "Press any key to exit ...  "; read key
            fi 

        fi 
    #########################################################DATA
    elif [ $input == $data ]; then 
        clear 
        cat data/banner.txt 
        printf "\e[1;34m Montag_data@~#: \e[0m"; read input
        if [ $input == $data_sql ]; then
            printf "\e[1;34m URL: \e[0m"; read URL 
            sudo sqlmap -u $URL --forms --crawl=2; 
            printf "\n";
            printf "Press any key to exit ...  "; read key
        fi 
    #########################################################GHOST
    elif [ $input == $ghost ]; then 
        clear 
        cat ghost/ghost.txt 
        printf "\n"; 
        printf "\e[1;34m Montag_ghost@~#: \e[0m"; read input
        if [ $input == $ghost_nordvpn ]; then 
            printf "\e[1;34m Connect[c] or Disconnect[d]: \e[0m"; read input
            if [ $input == "c" ]; then 
                nordvpn c  
                printf "\n";
                printf "Press any key to exit ...  "; read key
            elif [ $input == "d" ]; then 
                nordvpn d 
                printf "\n";
                printf "Press any key to exit ...  "; read key
            fi
        elif [ $input == $ghost_mac ]; then 
                clear 
                ifconfig
                printf "\n";
                printf "\e[1;34m Put your interface: \e[0m"; read INTERFACE 
                ifconfig $INTERFACE down; macchanger -r $INTERFACE;
                ifconfig $INTERFACE up;
                printf "\n";
                printf "Press any key to exit ...  "; read key
        elif [ $input == $ghost_torghostng ]; then
                printf "\e[1;34m Connect[c] or Disconnect[d]: \e[0m"; read input
                if [ $input == "c" ]; then
                    sudo torghostng -s;
                elif [ $input == "d" ]; then 
                    sudo torghostng -x;
                fi                 
                printf "\n";
                printf "Press any key to exit ...  "; read key
        fi 
    #########################################################INSTALL
    elif [ $input == $install ]; then 
        sudo apt-get install nmap arp-scan hydra john sqlmap wget macchanger;
        sudo wget -qnc https://repo.nordvpn.com/deb/nordvpn/debian/pool/main/nordvpn-release_1.0.0_all.deb;
        sudo dpkg -i *.deb ;
        sudo apt update;
        sudo apt install nordvpn;
        git clone https://github.com/GitHackTools/TorghostNG.git ghost/TorghostNG;
        cd ghost/TorghostNG
        sudo python3 install.py
        cd ../..;
        clear;
    
    elif [ $input == $exit ]; then
        break
    fi
done
printf "\nSee you ...\n";
