# Matriz de Cumplimiento: ISO/IEC 27001:2022

**Proyecto:** Critical Health Infrastructure Hardening
**Alcance:** Servidores de Aplicación HCE (Historia Clínica Electrónica)
**Norma Base:** ISO/IEC 27001:2022 - Annex A (Information Security Controls)

## 1. Objetivo
Documentar la trazabilidad entre los controles técnicos implementados en el script de hardening automatizado y los requisitos de seguridad de la información de la norma ISO/IEC 27001 en su versión vigente (2022).

## 2. Mapeo de Controles (2022)

La automatización cubre controles de los temas **5 (Organizacional)** y **8 (Tecnológico)**:

| ID Control (2022) | Nombre del Control | Implementación Técnica (Script) | Estado |
| :--- | :--- | :--- | :--- |
| **A.5.15** | **Control de Acceso** | El script establece reglas de acceso basadas en roles (RBAC) mediante grupos de sistema (`sec_auditors`, `hce_admins`), restringiendo el acceso a la información y recursos. |  CUMPLIDO |
| **A.5.16** | **Gestión de Identidad** | Se automatiza el ciclo de vida de las cuentas de usuario, asignando identificadores únicos (UIDs) y asegurando que no existan cuentas huérfanas o compartidas. |  CUMPLIDO |
| **A.5.17** | **Información de Autenticación** | Se fuerza la seguridad en la autenticación SSH bloqueando contraseñas vacías (`PermitEmptyPasswords no`) y preparando el entorno para llaves SSH. |  CUMPLIDO |
| **A.8.2** | **Derechos de Acceso Privilegiado** | El uso de la cuenta `root` está técnicamente restringido (`PermitRootLogin no`). La elevación de privilegios se gestiona estrictamente vía `sudo` para usuarios nominales. |  CUMPLIDO |
| **A.8.9** | **Gestión de la Configuración** | Se define y aplica una configuración base segura (Baseline) inmutable a través del script, evitando desviaciones manuales (Configuration Drift). |  CUMPLIDO |
| **A.8.20** | **Seguridad de Redes** | Se implementa segmentación lógica y filtrado de tráfico a nivel de host mediante UFW, permitiendo únicamente puertos de negocio (443) y gestión (22). |  CUMPLIDO |
| **A.8.22** | **Segregación de Redes** | El principio de "Default Deny" en el firewall asegura que el servidor esté aislado de tráficos no autorizados provenientes de otros segmentos de red. |  CUMPLIDO |

## 3. Conclusión de Auditoría Técnica
La configuración desplegada cumple con los requisitos de endurecimiento técnico exigidos por los controles tecnológicos de la ISO 27001:2022, garantizando la protección de la infraestructura crítica contra accesos no autorizados y configuraciones inseguras.

---
*Revisado por: Oficial de Seguridad de la Información (CISO)*
