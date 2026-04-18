/* ── Navbar scroll effect ───────────────────────── */
window.addEventListener('scroll', function () {
    const navbar = document.getElementById('navbar');
    if (window.scrollY > 50) navbar.classList.add('scrolled');
    else navbar.classList.remove('scrolled');
});

/* ── Reveal on scroll (Intersection Observer) ───── */
const revealObserver = new IntersectionObserver((entries) => {
    entries.forEach(entry => {
        if (entry.isIntersecting) {
            entry.target.classList.add('is-visible');
            revealObserver.unobserve(entry.target);
        }
    });
}, { threshold: 0.12, rootMargin: '0px 0px -60px 0px' });

document.querySelectorAll('.reveal').forEach(el => revealObserver.observe(el));

/* ── FAQ accordion ──────────────────────────────── */
document.querySelectorAll('.faq-question').forEach(item => {
    item.addEventListener('click', () => {
        const parent = item.parentElement;
        const isOpen = parent.classList.contains('active');
        document.querySelectorAll('.faq-item').forEach(c => c.classList.remove('active'));
        if (!isOpen) parent.classList.add('active');
    });
});

/* ── Hero fade-in stagger ───────────────────────── */
document.addEventListener('DOMContentLoaded', () => {
    document.querySelectorAll('#hero .fade-in').forEach((el, i) => {
        el.style.animationDelay = `${i * 0.2}s`;
    });
});
/* ── Mobile Menu toggle ──────────────────────────── */
const menuToggle = document.querySelector('.menu-toggle');
const navLinks = document.querySelector('.nav-links');

if (menuToggle) {
    menuToggle.addEventListener('click', () => {
        navLinks.classList.toggle('active');
        menuToggle.classList.toggle('open');
    });

    // Close menu when clicking a link
    document.querySelectorAll('.nav-links a').forEach(link => {
        link.addEventListener('click', () => {
            navLinks.classList.remove('active');
            menuToggle.classList.remove('open');
        });
    });
}

/* ── Privacy Modal ──────────────────────────────── */
const privacyModal = document.getElementById('privacy-modal');
const openPrivacy = document.getElementById('open-privacy');
const closeModal = document.querySelector('.close-modal');

if (openPrivacy && privacyModal) {
    openPrivacy.addEventListener('click', (e) => {
        e.preventDefault();
        privacyModal.style.display = 'block';
        document.body.style.overflow = 'hidden'; // Lock scroll
    });

    closeModal.addEventListener('click', () => {
        privacyModal.style.display = 'none';
        document.body.style.overflow = 'auto'; // Unlock scroll
    });

    window.addEventListener('click', (event) => {
        if (event.target == privacyModal) {
            privacyModal.style.display = 'none';
            document.body.style.overflow = 'auto';
        }
    });
}
