#!/usr/bin/env bash

GREEN='\033[0;32m'
NC='\033[0m'

echo -e "${GREEN}Creating role 'breakfast_bot'${NC}"
psql -U postgres -h localhost -d postgres -p 5432 -c "CREATE ROLE henry WITH SUPERUSER LOGIN ENCRYPTED PASSWORD 'henry';"
echo -e "${GREEN}Done!${NC}"
