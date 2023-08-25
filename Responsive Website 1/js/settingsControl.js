document.addEventListener("DOMContentLoaded", attachEvents);

function attachEvents() {

    const enable_scrollToTopBtn = document.getElementById("enableScrollButton");
    const disable_scrollToTopBtn = document.getElementById("disableScrollButton");

    enable_scrollToTopBtn.addEventListener("click", handleStickyScrollButton, false);
    disable_scrollToTopBtn.addEventListener("click", handleStickyScrollButton, false);

    enable_scrollToTopBtn.action = "enableButton"
    disable_scrollToTopBtn.action = "disableButton"

    function handleStickyScrollButton(event) {

        if (event.currentTarget.action == "enableButton") {

            const button = document.getElementById("returnButton");
            button.style.display = "flex";

            event.currentTarget.disabled = true;
            event.currentTarget.style.backgroundColor = "darkgray";

            const disable_scrollToTopBtn = document.getElementById("disableScrollButton");
            disable_scrollToTopBtn.style.backgroundColor = "transparent";
            disable_scrollToTopBtn.disabled = false;

        }

        if (event.currentTarget.action == "disableButton") {

            const button = document.getElementById("returnButton");
            button.style.display = "none";

            event.currentTarget.disabled = true;
            event.currentTarget.style.backgroundColor = "darkgray";

            const enable_scrollToTopBtn = document.getElementById("enableScrollButton");
            enable_scrollToTopBtn.style.backgroundColor = "transparent";
            enable_scrollToTopBtn.disabled = false;

        }

    }

}