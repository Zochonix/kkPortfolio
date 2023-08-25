// Projects Page - Modal Controller

// Get the Required Elements

var modal = document.getElementById("projectModal");
var closeButton = document.getElementById("exitButton");
var list = document.getElementsByClassName("dropdownItems");

closeButton.addEventListener('click', closeModal, false);

for (var i = 0; i < list.length; i++) {
	
	var title = list[i].innerHTML;
	list[i].addEventListener('click', function(){openModal(title)}, false);
	
}

// When the user clicks on the a, open the modal

function openModal(projectTitle) {
	
	setInformation(projectTitle);
	modal.style.display = "block";
	
}

function closeModal() {
	
	modal.style.display = "none";
	
}

// Set the Information in the Modal

function setInformation(projectTitle) {
	
	var modalTitle = document.getElementById("projectTitle");
	var languageInfo = document.getElementById("languageInfo");
	var softwareInfo = document.getElementById("softwareInfo");
	var date = document.getElementById("yearMade");
	var img1 = document.getElementById("image1");
	var img2 = document.getElementById("image2");
	var img3 = document.getElementById("image3");
	//var c_q = document.getElementById("creationQuestion");
	var c_a = document.getElementById("creationAnswer");
	//var s_q = document.getElementById("storyQuestion");
	var	s_a = document.getElementById("storyAnswer");
	
	if (projectTitle == "Xenalysio") {
		
		modalTitle.innerHTML = "Xenalysio";
		languageInfo.innerHTML = "Languages Used: Java (Processing).";
		softwareInfo.innerHTML = "Software Used: Photoshop, Processing.";
		date.innerHTML = "Year Created: 2019";
		img1.src = "Images/xenalysio_1.jpg";
		img2.src = "Images/xenalysio_4.jpg";
		img3.src = "Images/xenalysio_2.jpg";
		c_a.innerHTML = "Xenalysio is a 2D game which was created for my 1st year programming project at university. The project received 95/100 marks and I'm very happy with how it turned out despite not featuring all of my ideas, which I intend to include in a future rework of the project.";
		s_a.innerHTML = "The project allows you to take control of a submarine (SSBN Triphoria) and explore the depths of the ocean as mutations from an unknown source have created some of the most ferocious creatures known to man and it's your task to stop them from purging the oceans. The game itself was created using both Processing, an IDE which lets you use a simplified version of Java, and Photoshop.";
		
	}
	
}