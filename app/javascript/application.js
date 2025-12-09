import "avatar_dropdown";
import "controllers";
import "@hotwired/turbo-rails";

document.addEventListener("DOMContentLoaded", () => {
  const toggles = document.querySelectorAll(".toggle-password");

  const eyeOpen = `
    <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="currentColor" class="eye-icon" viewBox="0 0 16 16">
      <path d="M10.5 8a2.5 2.5 0 1 1-5 0 2.5 2.5 0 0 1 5 0"/>
      <path d="M0 8s3-5.5 8-5.5S16 8 16 8s-3 5.5-8 5.5S0 8 0 8m8 3.5a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7"/>
    </svg>
  `;

  const eyeSlash = `
    <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="currentColor" class="eye-icon" viewBox="0 0 16 16">
      <path d="m10.79 12.912-1.614-1.615a3.5 3.5 0 0 1-4.474-4.474l-2.06-2.06C.938 6.278 0 8 0 8s3 5.5 8 5.5a7 7 0 0 0 2.79-.588M5.21 3.088A7 7 0 0 1 8 2.5c5 0 8 5.5 8 5.5s-.939 1.721-2.641 3.238l-2.062-2.062a3.5 3.5 0 0 0-4.474-4.474z"/>
      <path d="M5.525 7.646a2.5 2.5 0 0 0 2.829 2.829zm4.95.708-2.829-2.83a2.5 2.5 0 0 1 2.829 2.829zm3.171 6-12-12 .708-.708 12 12z"/>
    </svg>
  `;

  toggles.forEach((toggle) => {
    toggle.addEventListener("click", () => {
      // busca el input dentro del mismo input-icon-container
      const input = toggle
        .closest(".input-icon-container")
        .querySelector("input");

      if (input.type === "password") {
        input.type = "text";
        toggle.innerHTML = eyeOpen; // ojo abierto = visible
      } else {
        input.type = "password";
        toggle.innerHTML = eyeSlash; // ojo tachado = oculto
      }
    });
  });
});

document.addEventListener("DOMContentLoaded", () => {
  const form = document.querySelector("form"); // tu formulario de registro
  if (!form) return;

  form.addEventListener("input", () => {
    const errorContainer = document.getElementById("error_explanation");
    if (errorContainer) {
      errorContainer.remove(); // elimina todos los errores al empezar a escribir
    }
  });
});
