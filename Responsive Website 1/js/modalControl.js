document.addEventListener("DOMContentLoaded", attachEvents);

function attachEvents() {

    // Initial Trigger

    const settingsButton = document.getElementById("openSettings");
    const closeSettingsButton = document.getElementById("closeSettings");
    const projectButton = document.getElementById("dropdownButton");
    const closeButton = document.getElementById("close");
    const submitButton = document.getElementById("submitButton");
    const returnButton = document.getElementById("return");

    settingsButton.addEventListener("click", openSettingsModal, false);
    closeSettingsButton.addEventListener("click", closeSettingsModal, false);
    projectButton.addEventListener("click", initiateSelectionModal, false);
    closeButton.addEventListener("click", closeModal, false);
    submitButton.addEventListener("click", prepareProjectDisplay, false);
    returnButton.addEventListener("click", returnToSelection, false);

    function openSettingsModal() {

        const settingsModal = document.getElementById("settingsModal");
        settingsModal.style.display = "block";
        
        let js_opacity = 0;
        let pos_y = 100;

        let id = setInterval(function() {

            if (js_opacity >= 0.99) {

                clearInterval(id);
                id = null;

            }

            else {

                js_opacity += 0.1;
                pos_y -= 10;
                settingsModal.style.opacity = js_opacity;
                settingsModal.style.bottom = pos_y + "%";

            }

        }, 10);

    }

    function closeSettingsModal() {

        const settingsModal = document.getElementById("settingsModal");
        
        let js_opacity = 1;
        let pos_y = 0;

        let id = setInterval(function() {

            if (js_opacity <= 0) {

                clearInterval(id);
                id = null;
                settingsModal.style.display = "none";

            }

            else {

                js_opacity -= 0.1;
                pos_y += 10;
                settingsModal.style.opacity = js_opacity;
                settingsModal.style.bottom = pos_y + "%";

            }

        }, 10);

    }

    function initiateSelectionModal() {

        let selectionModal = document.getElementById("selectionModal");
        let overlay = document.getElementById("overlayEffect");

        selectionModal.style.display = "block";
        overlay.style.display = "block";

        let js_opacity = 0;
        let id = setInterval(function() {

            if (js_opacity >= 1) {

                clearInterval(id);
                id = null;

            }

            else {

                js_opacity += 0.1;
                selectionModal.style.opacity = js_opacity;
                overlay.style.opacity = js_opacity;

            }

        }, 10);

    }

    function closeModal() {

        let selectionModal = document.getElementById("selectionModal");
        let overlay = document.getElementById("overlayEffect");

        let js_opacity = 1;
        let id = setInterval(function() {

            if (js_opacity <= 0) {

                clearInterval(id);
                id = null;
                selectionModal.style.display = "none";
                overlay.style.display = "none";

            }

            else {

                js_opacity = js_opacity - 0.1;
                selectionModal.style.opacity = js_opacity;
                overlay.style.opacity = js_opacity;

            }

        }, 10);

    }

    function prepareProjectDisplay(event) {

        event.preventDefault();

        // Collect and Send the Required Data to a PHP Script

        let keyword = document.getElementById("projectSelectionBox").value;

        if (keyword == "2019_2dgame" || keyword == "2022_app") {

            const data = {pass:keyword};
            const dataJSON = JSON.stringify(data);

            // Create a Fetch, and Send Required Data to PHP File

            async function retrieveData(id) {

                let responseData = await fetch("php/retrieveData.php", {

                    method: "POST",

                    headers: {

                        "Content-Type": "application/json",

                    },

                    body:id,

                });

                let returnedJSON = await responseData.json();
                let stringifiedJSON = JSON.stringify(returnedJSON);
                let jsArray = JSON.parse(stringifiedJSON);
                let jsObject = jsArray[0];
                return jsObject;
                //displayInformation(jsObject);
            
            }

            retrieveData(dataJSON).then(

                function(returnedData) {

                    hideSelection();
                    displayInformation(returnedData);

                },

                function(error) {

                    console.log(error.message);
                    alert(error.message + "\n\nPlease contact the developer.");

                }

            )

            // Hide the Selection
            function hideSelection() {

                let selectionModal = document.getElementById("selectionModal");

                let js_opacity = 1;
                let id = setInterval(function() {

                if (js_opacity <= 0) {

                    clearInterval(id);
                    id = null;
                    selectionModal.style.display = "none";

                }

                else {

                    js_opacity = js_opacity - 0.1;
                    selectionModal.style.opacity = js_opacity;

                }

            }, 10);

            }

            // Display the Modal
            function displayInformation(projectData) {

                let informationModal = document.getElementById("projectInformationModal");
                let projectTitle = document.getElementById("projectTitle");
                let synopsisText = document.getElementById("synopsisText");
                let languages = document.getElementById("languagesUsed");
                let timeTaken = document.getElementById("timeTaken");
                let reasonDev = document.getElementById("reasonDev");

                informationModal.style.display = "block";
                projectTitle.innerHTML = projectData.ProjectName;
                synopsisText.innerHTML = projectData.ProjectSynopsis;
                languages.innerHTML = projectData.ProjectLanguages;
                timeTaken.innerHTML = projectData.ProjectTime;
                reasonDev.innerHTML = projectData.ProjectReason;

                js_opacity = 0;
                id = setInterval(function() {

                    if (js_opacity >= 1) {

                        clearInterval(id);
                        id = null;

                    }

                    else {

                        js_opacity = js_opacity + 0.1;
                        informationModal.style.opacity = js_opacity;

                    }

                }, 10);

            }

        }

        else {

            alert("Unable to communicate with database.\n\nPlease contact the developer.");

        }

    }

    function returnToSelection() {

        let informationModal = document.getElementById("projectInformationModal");

        let js_opacity = 1;
        let id = setInterval(function() {

            if (js_opacity < 0) {

                clearInterval(id);
                id = null;
                informationModal.style.display = "none";
                openSelectionModal();

            }

            else {

                js_opacity = js_opacity - 0.1;
                informationModal.style.opacity = js_opacity;

            }

        }, 10);

    }

    function openSelectionModal() {

        let selectionModal = document.getElementById("selectionModal");

        selectionModal.style.display = "block";

        let js_opacity = 0;
        let id = setInterval(function() {

            if (js_opacity >= 1) {

                clearInterval(id);
                id = null;

            }

            else {

                js_opacity += 0.1;
                selectionModal.style.opacity = js_opacity;

            }

        }, 10);

    }

}