# Matriz de Cumplimiento: ISO/IEC 27001:2013

**Proyecto:** Critical Health Infrastructure Hardening
**Alcance:** Servidores de Aplicación HCE (Historia Clínica Electrónica)

## 1. Objetivo
Documentar la trazabilidad entre los controles técnicos implementados en el script de hardening y los requisitos del Anexo A de la norma ISO 27001 para la Seguridad de la Información.

## 2. Controles Implementados

| Dominio ISO 27001 | Control (Anexo A) | Descripción del Requisito | Implementación Técnica (Script) | Estado |
| :--- | :--- | :--- | :--- | :--- |
| **A.9 Control de Acceso** | **A.9.1.2** | Acceso a redes y servicios de red | El acceso está restringido por defecto mediante Firewall (UFW). Solo se permiten puertos de negocio (443) y gestión (22). |  CUMPLIDO |
| **A.9 Control de Acceso** | **A.9.2.1** | Registro y cancelación de usuarios | El script automatiza el alta de usuarios con roles predefinidos (`sec_auditors`, `hce_admins`), garantizando un proceso formal. |  CUMPLIDO |
| **A.9 Control de Acceso** | **A.9.2.3** | Gestión de derechos de acceso privilegiado | El uso de la cuenta `root` está restringido. Los privilegios se otorgan vía grupos (`sudo`), no usuarios directos. |  CUMPLIDO |
| **A.9 Control de Acceso** | **A.9.4.3** | Gestión de sistemas de contraseñas | Se bloquea el uso de contraseñas vacías en SSH (`PermitEmptyPasswords no`). |  CUMPLIDO |
| **A.12 Seg. Operaciones** | **A.12.6.1** | Gestión de vulnerabilidades técnicas | Se reduce la superficie de ataque cerrando puertos innecesarios, mitigando la explotación de servicios no utilizados. |  CUMPLIDO |
| **A.13 Comunicaciones** | **A.13.1.1** | Controles de redes | La segmentación de tráfico se aplica a nivel de host mediante reglas de filtrado de paquetes (Netfilter/UFW). | ✅ CUMPLIDO |

## 3. Conclusión de Auditoría
La configuración base del servidor ("Golden Image") cumple con los requisitos fundamentales de control de acceso y seguridad de redes exigidos por la norma para el manejo de información sensible.

---
*Revisado por: Oficial de Seguridad de la Información (CISO)*