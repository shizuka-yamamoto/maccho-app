function timer (){
	if ( document.getElementById('memo-start')){
		'use strict';

		let timer = document.getElementById('memo-timer');
		let min = document.getElementById('memo-min');
		let sec = document.getElementById('memo-sec');
		let reset = document.getElementById('memo-reset');
		let start = document.getElementById('memo-start');

		let startTime;
		let timeLeft;
		let timeToCountDown = 0;
		let timerId;
		let isRunning = false;

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
					isRunning = false;
					start.textContent = 'Start';
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
			if (isRunning === false) {
				isRunning = true;
				start.textContent = 'Stop'
				startTime = Date.now();
				countDown();
			} else {
				isRunning = false;
				start.textContent = 'Start';
				timeToCountDown = timeLeft;
				clearTimeout(timerId);
			}
		});

		min.addEventListener('click', () => {
			if (isRunning === true) {
				return;
			}
			timeToCountDown += 60 * 1000;
			if (timeToCountDown >= 60 * 60 *1000) {
				timeToCountDown = 0;
			}
			updateTimer(timeToCountDown);
		});

		sec.addEventListener('click', () => {
			if (isRunning === true) {
				return;
			}
			timeToCountDown += 1000;
			if (timeToCountDown >= 60 * 60 *1000) {
				timeToCountDown = 0;
			}
			updateTimer(timeToCountDown);
		});

		reset.addEventListener('click', () => {
			timeToCountDown = 0;
			updateTimer(timeToCountDown);
		});

	};
};

window.addEventListener('load', timer);