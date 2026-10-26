const toggle = document.querySelector('.nav__toggle');
const links = document.getElementById('nav-links');

toggle.addEventListener('click', () => {
  const open = links.dataset.open === 'true';
  links.dataset.open = String(!open);
  toggle.setAttribute('aria-expanded', String(!open));
  toggle.textContent = open ? 'Menu' : 'Close';
});
