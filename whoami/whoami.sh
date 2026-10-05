#!/bin/bash

GREEN='\033[0;32m'
RED='\033[0;31m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m' 

username=$(whoami)
if [ "$EUID" -eq 0 ]; then
    user_display="Welcome , ${RED}( $username ) ⚠️${NC}"
else
    user_display="Welcome , ${GREEN}$username! 👋${NC}"
fi
os=$(grep "^NAME=" /etc/os-release | cut -d'"' -f2)
shell=$SHELL
uptime_info=$(uptime -p | sed 's/up //')
my_date=$(date "+%Y-%m-%d | %I:%M:%S %p")

local_ip=$(ip -o -4 addr show scope global | awk '{print $4}' | head -n1)
loob_ip=$(ip -o -4 a show lo | awk '{print $4}')
public_ip=$(curl -s -m 2 ifconfig.me || echo "Offline")

ram_usage=$(free -m | awk '/Mem:/ {printf "%.1f%%", $3/$2*100}')
open_ports=$(ss -tulpn | grep LISTEN | wc -l)

disk_percent=$(df -h / | awk 'NR==2 {print $5}' | sed 's/%//')
if [ "$disk_percent" -gt 90 ]; then
    disk_usage="${RED}${disk_percent}% (Warning: Disk Almost Full!)${NC}"
else
    disk_usage="${GREEN}${disk_percent}%${NC}"
fi

echo -e "${CYAN}--------------------------------------------------${NC}"
echo -e "                 ${user_display}"
echo -e "${CYAN}--------------------------------------------------${NC}"

echo -e "${BLUE}[+] System Info:${NC}"
echo -e "  - OS:         $os"
echo -e "  - Shell:      $shell"
echo -e "  - Uptime:     ${CYAN}${uptime_info}${NC}"
echo -e "  - Date:       ${GREEN}${my_date}${NC}"

echo -e "\n${BLUE}[+] Resources Profile:${NC}"
echo -e "  - RAM Usage:  ${RED}$ram_usage${NC}"
echo -e "  - Disk Used:  $disk_usage"
echo -e "  - Open Ports: $open_ports"

echo -e "\n${BLUE}[+] Network Profile:${NC}"
echo -e "  - Local IP:   ${GREEN}$local_ip${NC}"
echo -e "  - Loopback:   $loob_ip"
echo -e "  - Public IP:  ${GREEN}$public_ip${NC}"
echo -e "${CYAN}--------------------------------------------------${NC}"

