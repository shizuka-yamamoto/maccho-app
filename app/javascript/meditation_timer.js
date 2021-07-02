function timer (){
	if ( document.getElementById('start')){
		'use strict';

		let timer = document.getElementById('timer');
		let min = document.getElementById('min');
		let sec = document.getElementById('sec');
		let start = document.getElementById('start');

		let startTime;
		let timeLeft;
		let timeToCountDown = 3 * 100000
		let timerId;

		function updateTimer(t) {
			let d = new Date(t);
			let m = d.getMinutes();
			let s = d.getSeconds();
			let ms = d.getMilliseconds();
			m = ('0' + m).slice(-2);
			s = ('0' + s).slice(-2);
			ms = ('00' + ms).slice(-3);
			timer.textContent = m + ':' + s + '.' + ms;
		}

		function countDown() {
			timerId = setTimeout(function() {
				timeLeft = timeToCountDown - (Date.now() - startTime);
				if (timeLeft < 0) {
					clearTimeout(timerId);
					timeLeft = 0;
					timeToCountDown = 0;
					updateTimer(timeLeft);
					return;
				}
				updateTimer(timeLeft);
				countDown();
			}, 10);
		}

		start.addEventListener('click', () => {
			startTime = Date.now();
			countDown();
		});
	};
};

window.addEventListener('load', timer);