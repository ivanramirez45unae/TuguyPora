document.addEventListener("DOMContentLoaded", () => {
  const avatar = document.getElementById("avatarDropdownToggle");
  const dropdown = document.getElementById("avatarDropdown");

  if (!avatar || !dropdown) return;

  avatar.addEventListener("click", () => {
    dropdown.classList.toggle("show");
    avatar.classList.toggle("open"); // ← ESTA ES LA LÍNEA QUE TE FALTABA
  });

  // Cerrar si clickea fuera
  document.addEventListener("click", (event) => {
    if (!avatar.contains(event.target) && !dropdown.contains(event.target)) {
      dropdown.classList.remove("show");
      avatar.classList.remove("open"); // ← y eliminar clase si se cierra
    }
  });
});
