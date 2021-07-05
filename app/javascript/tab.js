function tabMenu() {
	
	const menuItems = document.querySelectorAll('.tab-menu li a');
  const contents = document.querySelectorAll('.tab-content');

  menuItems.forEach(clickedItem => {
    clickedItem.addEventListener('click', e => {
      e.preventDefault();

      menuItems.forEach(item => {
        item.classList.remove('active');
      });
      clickedItem.classList.add('active');

      contents.forEach(content => {
        content.classList.remove('active');
      });
      document.getElementById(clickedItem.dataset.id).classList.add('active');
    });
  });
}




window.addEventListener('load', tabMenu)