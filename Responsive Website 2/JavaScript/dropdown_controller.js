// Projects Page - Dropdown Menu Controller

/* When the user clicks on the button,
toggle between hiding and showing the dropdown content */

document.getElementById("dropbtn").addEventListener('click', function(){displayMenu()}, false);

function displayMenu() {
	
  document.getElementById("dropdownList").classList.toggle("show");
	
}

// Close the dropdown menu if the user clicks outside of it

window.onclick = function(event) {
	
  if (!event.target.matches('#dropbtn')) {
	  
    var dropdowns = document.getElementsByClassName("dropdown-content");
	  
    var i;
	  
    for (i = 0; i < dropdowns.length; i++) {
		
      var openDropdown = dropdowns[i];
		
      if (openDropdown.classList.contains('show')) {
		  
        openDropdown.classList.remove('show');
		  
      }
		
    }
	  
  }
	
}