#!/bin/bash

# ==============================================================================
# PROYECTO: Auditoría Automatizada de Cumplimiento
# DESCRIPCIÓN: Verifica si el servidor cumple con la política de hardening definida.
# AUTOR: [Tu Nombre]
# ==============================================================================

RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'

echo "--- INICIANDO AUDITORÍA DE CUMPLIMIENTO ---"

# 1. VERIFICAR USUARIOS
echo -n "[TEST] Verificando usuario 'auditor_clinico'... "
if id "auditor_clinico" &>/dev/null; then
    echo -e "${GREEN}PASS${NC}"
else
    echo -e "${RED}FAIL (Usuario no encontrado)${NC}"
fi

echo -n "[TEST] Verificando usuario 'admin_hce'... "
if id "admin_hce" &>/dev/null; then
    echo -e "${GREEN}PASS${NC}"
else
    echo -e "${RED}FAIL (Usuario no encontrado)${NC}"
fi

# 2. VERIFICAR SSH (ROOT LOGIN)
echo -n "[TEST] Verificando bloqueo de Root en SSH... "
if grep -q "^PermitRootLogin no" /etc/ssh/sshd_config; then
    echo -e "${GREEN}PASS${NC}"
else
    echo -e "${RED}FAIL (PermitRootLogin no está configurado como 'no')${NC}"
fi

# 3. VERIFICAR FIREWALL
echo -n "[TEST] Verificando estado del Firewall UFW... "
if sudo ufw status | grep -q "Status: active"; then
    echo -e "${GREEN}PASS${NC}"
else
    echo -e "${RED}FAIL (Firewall inactivo)${NC}"
fi

echo -n "[TEST] Verificando puerto HTTPS (443)... "
if sudo ufw status | grep -q "443/tcp.*ALLOW"; then
    echo -e "${GREEN}PASS${NC}"
else
    echo -e "${RED}FAIL (Puerto 443 no permitido)${NC}"
fi

echo "--- AUDITORÍA FINALIZADA ---"