#!/bin/bash

Green="\e[92;1m"
RED="\033[31m"
YELLOW="\033[33m"
BLUE="\033[36m"
FONT="\033[0m"
GREENBG="\033[42;37m"
REDBG="\033[41;37m"
OK="${Green}  »${FONT}"
ERROR="${RED}[ERROR]${FONT}"
GRAY="\e[1;30m"
NC='\e[0m'
red='\e[1;31m'
green='\e[0;32m'

clear

# Banner
echo -e "${YELLOW}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${BLUE}   ______   __              __    ______   __                     ${NC}"
echo -e "${BLUE}  /      \\ |  \\            |  \\  /      \\ |  \\                    ${NC}"
echo -e "${BLUE} |  $$$$$$\\| $$  ______    | $$ |  $$$$$$\\| $$                    ${NC}"
echo -e "${BLUE} | $$__| $$| $$ /      \\   | $$ | $$___\\$$| $$____   ______  ______${NC}"
echo -e "${BLUE} | $$    $$| $$|  $$$$$$\\  | $$  \\$$    \\ | $$    \\ /      \\|      \\${NC}"
echo -e "${BLUE} | $$$$$$$$| $$| $$   \\$$  | $$  _\\$$$$$$\\| $$$$$$$|  $$$$$$\\ $$$$$$\\${NC}"
echo -e "${BLUE} | $$  | $$| $$| $$        | $$ |  \\__| $$| $$  | $$| $$  | $$| $$  | $$${NC}"
echo -e "${BLUE} | $$  | $$| $$| $$        | $$  \\$$    $$| $$  | $$| $$__/ $$| $$__/ $$${NC}"
echo -e "${BLUE}  \\$$   \\$$ \\$$ \\$$         \\$$   \\$$$$$$  \\$$   \\$$ \\$$    $$| $$    $$${NC}"
echo -e "${BLUE}                                                     \\$$$$$$  \\$$$$$$$${NC}"
echo -e "${YELLOW}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "  ${GREEN}AlrelShop AutoScript Updater v4.0${NC}"
echo -e "  ${YELLOW}» Script Update & Maintenance Tool ${NC}"
echo -e "  ${BLUE}» Support: Ubuntu 18-25, Debian 9-12 ${NC}"
echo -e "  ${GREEN}Developer: AlrelShop® ${NC}${YELLOW}(${NC} 2024 ${YELLOW})${NC}"
echo -e "${YELLOW}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""

# REPO    
REPO="https://raw.githubusercontent.com/alrel1408/NewAutoScript/main/"

function update_menu() {
    echo -e "${GREEN}Updating Menu Scripts...${NC}"
    rm -rf /usr/local/sbin/menu
    rm -rf /usr/local/sbin/*menu*
    wget ${REPO}menu/menu.zip -O /tmp/menu.zip
    unzip /tmp/menu.zip -d /tmp/
    chmod +x /tmp/menu/*
    mv /tmp/menu/* /usr/local/sbin/
    rm -rf /tmp/menu
    rm -rf /tmp/menu.zip
    echo -e "${GREEN}✓ Menu scripts updated successfully${NC}"
}

function update_config() {
    echo -e "${GREEN}Updating Configuration Files...${NC}"
    
    # Update Xray config
    wget -O /etc/xray/config.json "${REPO}config/config.json" >/dev/null 2>&1
    
    # Update nginx config
    wget -O /etc/nginx/conf.d/xray.conf "${REPO}config/xray.conf" >/dev/null 2>&1
    domain=$(cat /etc/xray/domain)
    sed -i "s/xxx/${domain}/g" /etc/nginx/conf.d/xray.conf
    
    # Update haproxy config
    wget -O /etc/haproxy/haproxy.cfg "${REPO}config/haproxy.cfg" >/dev/null 2>&1
    sed -i "s/xxx/${domain}/g" /etc/haproxy/haproxy.cfg
    
    echo -e "${GREEN}✓ Configuration files updated successfully${NC}"
}

function restart_services() {
    echo -e "${GREEN}Restarting Services...${NC}"
    systemctl restart nginx
    systemctl restart xray
    systemctl restart haproxy
    systemctl restart ssh
    systemctl restart dropbear
    systemctl restart openvpn
    echo -e "${GREEN}✓ All services restarted successfully${NC}"
}

function update_profile() {
    echo -e "${GREEN}Updating Profile for Auto Menu Entry...${NC}"
    cat >/root/.profile <<EOF
# ~/.profile: executed by Bourne-compatible login shells.
if [ "\$BASH" ]; then
    if [ -f ~/.bashrc ]; then
        . ~/.bashrc
    fi
fi
mesg n || true
clear
echo -e "\033[1;36m"
echo "  ╔══════════════════════════════════════════════════════════╗"
echo "  ║                 WELCOME TO ALRELSHOP VPS                 ║"
echo "  ║                    AutoScript v4.0                      ║"
echo "  ╚══════════════════════════════════════════════════════════╝"
echo -e "\033[0m"
sleep 2
menu
EOF
    chmod 644 /root/.profile
    echo -e "${GREEN}✓ Profile updated for auto menu entry${NC}"
}

# Main update process
echo -e "${YELLOW}Starting update process...${NC}"
echo ""

# Check if running as root
if [ "${EUID}" -ne 0 ]; then
    echo -e "${ERROR} Please run this script as root"
    exit 1
fi

sleep 2

# Update components
update_menu
sleep 1
update_config
sleep 1
update_profile
sleep 1
restart_services
sleep 1

echo ""
echo -e "${YELLOW}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "  ${GREEN}✓ AlrelShop AutoScript v4.0 Updated Successfully!${NC}"
echo -e "  ${BLUE}✓ All components have been updated to latest version${NC}"
echo -e "  ${YELLOW}✓ Auto Menu Entry is now active${NC}"
echo -e "  ${GREEN}Repository: alrel1408/NewAutoScript${NC}"
echo -e "${YELLOW}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""

# Clean up
history -c
rm -rf /root/*.sh >/dev/null 2>&1

echo -e "${GREEN}Update completed. You can now access the menu directly after login.${NC}"
echo ""