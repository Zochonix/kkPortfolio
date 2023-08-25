// Projects Page - Slideshow Controller

var slideIndex = 0;
showSlides();

function showSlides() {
	
  var i;
  var slides = document.getElementsByClassName("slideshowSlide");
  var dots = document.getElementsByClassName("dot");
	
  for (i = 0; i < slides.length; i++) {
	  
    slides[i].style.display = "none";  
	  
  }
	
  slideIndex++;
	
  if (slideIndex > slides.length) {
	  
	  slideIndex = 1;
  
  }    
	
  for (i = 0; i < dots.length; i++) {
	  
    dots[i].style.backgroundColor = "#bbb";
	  
  }
	
  slides[slideIndex - 1].style.display = "block";  
  dots[slideIndex - 1].style.backgroundColor = "#717171";
	
  setTimeout(showSlides, 7500); // Change image every 2 seconds
	
}