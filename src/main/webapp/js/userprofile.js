const personaldetailsBtn = document.getElementById("personaldetailsBtn");
const securityBtn = document.getElementById("securityBtn");

<<<<<<< HEAD

const personaldetailsContent = document.getElementById("personaldetailsContent");
const securityContent = document.getElementById("securityContent");

=======
const personaldetailsContent = document.getElementById("personaldetailsContent");
const securityContent = document.getElementById("securityContent");

function removeActiveStyling() {
    personaldetailsBtn.style.backgroundColor = "";
    personaldetailsBtn.style.color = "";
    securityBtn.style.backgroundColor = "";
    securityBtn.style.color = "";
}

>>>>>>> aade3f7614f18ed40f03f5341433b28ffd1b792d
personaldetailsContent.style.display = "block";
securityContent.style.display = "none";

personaldetailsBtn.addEventListener("click", () => {
<<<<<<< HEAD
=======
    removeActiveStyling(); 
    personaldetailsBtn.style.backgroundColor = "#0089f7";
    personaldetailsBtn.style.color = "white"; 
>>>>>>> aade3f7614f18ed40f03f5341433b28ffd1b792d
    personaldetailsContent.style.display = "block";
    securityContent.style.display = "none";
});

securityBtn.addEventListener("click", () => {
<<<<<<< HEAD
    personaldetailsContent.style.display = "none";
    securityContent.style.display = "block";
});

helpBtn.addEventListener("click", () => {
    personaldetailsContent.style.display = "none";
    securityContent.style.display = "none";
});
=======
    removeActiveStyling(); 
    securityBtn.style.backgroundColor = "#0089f7"; 
    securityBtn.style.color = "white"; 
    personaldetailsContent.style.display = "none";
    securityContent.style.display = "block";
});
>>>>>>> aade3f7614f18ed40f03f5341433b28ffd1b792d
