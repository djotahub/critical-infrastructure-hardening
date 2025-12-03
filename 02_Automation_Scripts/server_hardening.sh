#!/bin/bash

# COLORES
VERDE='\033[0;32m'
RESET='\033[0m'

echo -e "${VERDE}[*] INICIANDO PROTOCOLO DE HARDENING${RESET}"

# 1. RBAC
echo -e "\n${VERDE}[+] Fase 1: Creando Grupos y Usuarios...${RESET}"

# Crear grupos 
groupadd -f sec_auditors
groupadd -f hce_admins

# Crear usuarios
# Auditor
if id "auditor_clinico" &>/dev/null; then
    echo "Usuario auditor_clinico ya existe."
else
    useradd -m -s /bin/bash -g sec_auditors auditor_clinico
    echo "auditor_clinico:AuditPass2025!" | chpasswd
    echo "Usuario creado: auditor_clinico"
fi

# Admin
if id "admin_hce" &>/dev/null; then
    echo "Usuario admin_hce ya existe."
else
    useradd -m -s /bin/bash -g hce_admins admin_hce
    echo "admin_hce:SaludSegura123!" | chpasswd
    echo "Usuario creado: admin_hce"
fi

# 2. SSH
echo -e "\n${VERDE}[+] Fase 2: Configurando SSH...${RESET}"
CONFIG_SSH="/etc/ssh/sshd_config"

if [ -f "$CONFIG_SSH" ]; then
    cp $CONFIG_SSH "$CONFIG_SSH.bak.$(date +%F)"
    sed -i 's/#PermitRootLogin.*/PermitRootLogin no/' $CONFIG_SSH
    sed -i 's/PermitRootLogin yes/PermitRootLogin no/' $CONFIG_SSH
    sed -i 's/#PermitEmptyPasswords.*/PermitEmptyPasswords no/' $CONFIG_SSH
    systemctl restart sshd
    echo "SSH Configurado y Reiniciado."
else
    echo "ERROR: No se encontró archivo de config SSH. ¿Instalaste openssh-server?"
fi

# 3. FIREWALL
echo -e "\n${VERDE}[+] Fase 3: Firewall UFW...${RESET}"
ufw --force reset > /dev/null
ufw default deny incoming
ufw default allow outgoing
ufw allow ssh
ufw allow 443/tcp
ufw --force enable > /dev/null

echo -e "\n${VERDE}[OK] HARDENING COMPLETADO.${RESET}"
ufw status numbered