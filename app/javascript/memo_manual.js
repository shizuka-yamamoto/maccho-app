'use strict';

function manual (){
	if ( document.getElementById('memo-open')){

		const open = document.getElementById('memo-open')
		const close = document.getElementById('memo-close')
		const modal = document.getElementById('memo-modal')
		const mask = document.getElementById('memo-mask')
		
		open.addEventListener('click', () => {
			modal.classList.remove('hidden');
			mask.classList.remove('hidden');
		});
		close.addEventListener('click', () => {
			modal.classList.add('hidden');
			mask.classList.add('hidden');
		});
		mask.addEventListener('click', () => {
			modal.classList.add('hidden');
			mask.classList.add('hidden');
		});
	};
};

window.addEventListener('load', manual);