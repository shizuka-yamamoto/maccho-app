function pullDown() {
	
	const trainingButton = document.getElementById("training")
	const pullDownParents = document.getElementById("pull--down")

	trainingButton.addEventListener('click', function(){
		if (pullDownParents.getAttribute("style") == "display:block;") {
			pullDownParents.removeAttribute("style", "display:block;")
		} else {
			pullDownParents.setAttribute("style", "display:block;")
		}
	});
}

window.addEventListener('load', pullDown)