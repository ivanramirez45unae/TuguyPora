document.addEventListener("turbo:load", () => {
  const avatar = document.getElementById("avatarDropdownToggle");
  const dropdown = document.getElementById("avatarDropdown");
  if (!avatar || !dropdown) return;

  // remover posibles listeners previos
  const newAvatar = avatar.cloneNode(true);
  avatar.replaceWith(newAvatar);

  newAvatar.addEventListener("click", (e) => {
    e.preventDefault();
    e.stopPropagation();
    dropdown.classList.toggle("show");
    newAvatar.classList.toggle("open");
  });

  dropdown.addEventListener("click", (e) => e.stopPropagation());

  document.addEventListener("click", () => {
    dropdown.classList.remove("show");
    newAvatar.classList.remove("open");
  });
});
