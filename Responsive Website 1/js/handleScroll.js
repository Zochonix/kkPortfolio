document.addEventListener("DOMContentLoaded", attachEvents);

function attachEvents() {

    const mainButton = document.getElementById("skipToStoryButton");
    const profileButton = document.getElementById("skipToProfileButton");
    const returnButton = document.getElementById("returnButton");

    mainButton.addEventListener("click", initiateScroll, false);
    profileButton.addEventListener("click", initiateScroll, false);
    returnButton.addEventListener("click", initiateScroll, false);

    /* Prototype Programming :) */

    mainButton.targetElement = "main";
    profileButton.targetElement = "footer";
    returnButton.targetElement = "header";

    function initiateScroll(event) {

        var newView = document.getElementsByTagName(event.currentTarget.targetElement);
        newView[0].scrollIntoView({behavior: "smooth"});

    }

}