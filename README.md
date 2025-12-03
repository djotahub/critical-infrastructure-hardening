# Critical Health Infrastructure: Linux Server Hardening

![Security Rating](https://img.shields.io/badge/Security_Rating-A+-green?style=flat-square)
![Compliance](https://img.shields.io/badge/Compliance-HIPAA%20%2F%20NIST-blue?style=flat-square)
![Platform](https://img.shields.io/badge/Platform-Ubuntu%20LTS-lightgrey?style=flat-square)

## 1. Project Overview

Este repositorio contiene los scripts de automatización, políticas de seguridad y evidencia de auditoría correspondientes al proceso de endurecimiento (hardening) de servidores Linux destinados al alojamiento de Historias Clínicas Electrónicas (HCE).

El objetivo del proyecto es establecer una **Línea Base de Seguridad (Security Baseline)** que garantice la confidencialidad e integridad de la Información de Salud Protegida (PHI), cumpliendo con los controles técnicos exigidos por HIPAA y NIST SP 800-53.

## 2. Alcance Técnico

La automatización implementa controles en las siguientes capas de seguridad:

* **Identity & Access Management (IAM):** Implementación de RBAC (Role-Based Access Control) para segregar privilegios entre administradores, auditores y operadores.
* **Network Security:** Configuración de firewall de host (Netfilter/UFW) bajo política de denegación por defecto (Default Deny).
* **System Hardening:** Reconfiguración del servicio SSH para mitigar vectores de fuerza bruta y acceso no autorizado.

## 3. Estructura del Repositorio

La organización del proyecto sigue una arquitectura de cumplimiento documental y técnica:

* `01_Policies_&_Compliance/`: Documentación normativa y definiciones de políticas de acceso alineadas a estándares internacionales.
* `02_Automation_Scripts/`: Scripts en Bash para el aprovisionamiento y configuración automatizada de los controles de seguridad.
* `03_Audit_Evidence/`: Artefactos de validación post-despliegue (Capturas de estado de servicios, configuraciones y logs).

## 4. Instrucciones de Despliegue

El script principal ha sido diseñado para ejecutarse en entornos tipo Unix (Debian/Ubuntu) con privilegios elevados.

### Prerrequisitos
* Sistema Operativo: Ubuntu 22.04 LTS o superior.
* Privilegios: Acceso root o sudo.

### Ejecución
1.  Clonar el repositorio en el servidor destino.
2.  Otorgar permisos de ejecución al script de aprovisionamiento:
    ```bash
    chmod +x 02_Automation_Scripts/hardening_script.sh
    ```
3.  Iniciar el proceso de hardening:
    ```bash
    sudo ./02_Automation_Scripts/hardening_script.sh
    ```

## 5. Verificación de Controles

Tras la ejecución, se debe validar el estado del sistema mediante los siguientes comandos de auditoría:

* **Firewall:** `sudo ufw status verbose` (Debe mostrar política 'deny (incoming)' y puertos 22/443 permitidos).
* **Usuarios:** `getent group sec_auditors` (Debe confirmar la creación de grupos y asignación de usuarios).
* **SSH:** `sshd -T | grep permitrootlogin` (Debe retornar 'no').

---

**Especialidad:** Hardening de Infraestructura & DevSecOps
