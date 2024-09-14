#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;37m'
CYAN='\033[0;36m'
NC='\033[0m'


echo -e "${CYAN}----------------------------------------------------${NC}"
echo -e "${GREEN}Docker Compose Status for Project:${NC} ${BLUE}$NAME${NC}"
echo -e "${CYAN}----------------------------------------------------${NC}"

echo -e "${CYAN}Services Status:${NC}"

STATUS=$(docker-compose -f "$C_DIR" -p "$NAME" ps --services --filter "status=running" 2>/dev/null)

if [ -z "$STATUS" ]; then
  echo -e "${YELLOW}No services are running.${NC}"
else
  echo -e "${GREEN}Running Services:${NC}"
  echo -e "${CYAN}----------------------------------------------------${NC}"

  docker-compose -f "$C_DIR" -p "$NAME" ps | while read -r line; do
    if [[ $line == *"Up"* ]]; then
      echo -e "${BLUE}$line${NC}"
    elif [[ $line == *"Exit"* ]]; then
      echo -e "${RED}$line${NC}"
    else
      echo -e "${YELLOW}$line${NC}"
    fi
  done
fi

echo -e "${CYAN}----------------------------------------------------${NC}"

echo -e "${CYAN}Images Used by the Services:${NC}"
docker-compose -f "$C_DIR" -p "$NAME" images | while read -r line; do
  if [[ $line == *"Image"* ]]; then
    echo -e "${YELLOW}$line${NC}"
  else
    echo -e "${BLUE}$line${NC}"
  fi
done

echo -e "${CYAN}----------------------------------------------------${NC}"