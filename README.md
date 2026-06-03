# PlataformaDonacionSangre

Prototipo de plataforma web para la gestión centralizada de pedidos de donación de sangre en el departamento de Itapúa - 2025

Aplicación web hecha en **Ruby on Rails** con arquitectura **MVC**, para gestionar solicitudes, aportes y dnonantes de sangre.

---

## Tecnologías

- Ruby on Rails  
- HTML, CSS, JavaScript  
- SQLite3 (modo desarrollo)

---

## Funcionalidades

- Registro e inicio de sesión de usuarios.
- Publicación y gestión de solicitudes de donación de sangre.
- Postulación a donar.
- Consulta de información sobre requisitos y condiciones para la donación.
- Visualización del estado de las solicitudes de sangre.
- Historial de donaciones realizadas por los usuarios.

---

## Usuarios de prueba (EMAIL Y CONTRASEÑA)

- **Admin:**  
  `admin@tuapp.com` / `admin12345`  
- **Centro de salud:**  
  `ips@ejemplo.com` / `123456`  
- **Donante:**  
  `juan@gmail.com` / `juan2025`

---

## Cómo ejecutar

```bash
git clone https://github.com/usuario/repositorio.git
cd repositorio
bundle install
rails db:create db:migrate
rails server

