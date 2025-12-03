# POLÍTICA DE CONTROL DE ACCESO E INTEGRIDAD DE SISTEMAS

**Referencia:** NIST SP 800-53 (Revision 5) / HIPAA Security Rule
**Alcance:** Servidores de Producción - HCE (Historia Clínica Electrónica)
**Clasificación:** USO INTERNO

## 1. Propósito
Establecer los lineamientos técnicos mandatorios para el control de acceso lógico y el aseguramiento de la configuración en servidores que procesan, almacenan o transmiten información sensible de salud.

## 2. Matriz de Controles y Cumplimiento

La siguiente tabla detalla la alineación entre los controles de seguridad implementados mediante automatización y los requisitos normativos aplicables.

| ID Control (NIST) | Familia | Requisito | Implementación Técnica |
| :--- | :--- | :--- | :--- |
| **AC-2** | Account Management | El sistema debe gestionar cuentas de usuario, incluyendo creación, modificación y roles. | Provisionamiento automatizado de usuarios (`useradd`) asignados a grupos específicos (`sec_auditors`, `hce_admins`). |
| **AC-6** | Least Privilege | Los usuarios deben tener solo los privilegios necesarios para realizar sus funciones. | Restricción de `sudo` a administradores. Los desarrolladores y auditores poseen permisos limitados a nivel de sistema de archivos. |
| **AC-3** | Access Enforcement | El sistema debe hacer cumplir las autorizaciones asignadas para el acceso lógico. | Implementación de permisos a nivel de sistema operativo (DAC) y bloqueo de acceso root directo. |
| **SC-7** | Boundary Protection | El sistema debe monitorear y controlar las comunicaciones en los límites externos. | Configuración de UFW con política `Default Deny Incoming`. Whitelisting estricto de puertos 443 (Servicio) y 22 (Gestión). |
| **IA-2** | Identification and Authentication | El sistema debe identificar y autenticar usuarios organizacionales. | Endurecimiento de SSH: Deshabilitación de logins vacíos y restricción de métodos de autenticación heredados. |

## 3. Especificaciones de Configuración (Baseline)

### 3.1 Gestión de Identidad (RBAC)
Se definen los siguientes roles de sistema para la operación del servidor:

* **Security Admin (`sec_admin`):** Responsable de la configuración de seguridad y mantenimiento. Acceso total (sudo).
* **Application Admin (`hce_admins`):** Responsable del despliegue y mantenimiento de la aplicación HCE. Acceso restringido a directorios de aplicación.
* **Auditor (`sec_auditors`):** Rol de solo lectura para revisión de logs y cumplimiento.

### 3.2 Seguridad de Red
* Todo tráfico entrante no explícitamente autorizado será descartado por el kernel.
* El tráfico de gestión (SSH) debe originarse desde segmentos de red de gestión autorizados.
* El tráfico de aplicación (HTTPS) es el único servicio público permitido.

### 3.3 Integridad del Sistema
* El acceso directo mediante la cuenta `root` queda deshabilitado para garantizar la no repudio de las acciones administrativas.
* Se requiere el reinicio de servicios críticos (sshd) tras cualquier cambio de configuración para garantizar la aplicación de las políticas.

---
**Aprobado por:** Oficina de Seguridad de la Información
**Estado:** VIGENTE