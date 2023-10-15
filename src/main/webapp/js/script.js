let isNavbarHidden = true;

window.addEventListener('scroll', function() {
	var navbar = document.querySelector('.sticky-navbar');
	if (window.pageYOffset > window.innerHeight) {
		if (isNavbarHidden) {
			navbar.classList.remove('hidden');
			isNavbarHidden = false;
		}
	} else {
		if (!isNavbarHidden) {
			navbar.classList.add('hidden');
			isNavbarHidden = true;
		}
	}
});

document.addEventListener('DOMContentLoaded', function() {
	var navbar = document.querySelector('.sticky-navbar');
	navbar.classList.add('hidden');
});




