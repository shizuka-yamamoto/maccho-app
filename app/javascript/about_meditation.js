function about() {
	const open = document.getElementById('medi-open');
	const close = document.getElementById('medi-close');
	const modal = document.getElementById('medi-modal');
	const mask = document.getElementById('medi-mask');

	open.addEventListener('click', () => {
		modal.classList.remove('hidden');
		mask.classList.remove('hidden');
	});

	close.addEventListener('click', () => {
		modal.classList.add('hidden');
		mask.classList.add('hidden');
	});

	mask.addEventListener('click', () => {
		close.click();
	});
};


window.addEventListener('load', about)