const personaldetailsBtn = document.getElementById("personaldetailsBtn");
const securityBtn = document.getElementById("securityBtn");

const personaldetailsContent = document.getElementById("personaldetailsContent");
const securityContent = document.getElementById("securityContent");

function removeActiveStyling() {
    personaldetailsBtn.style.backgroundColor = "";
    personaldetailsBtn.style.color = "";
    securityBtn.style.backgroundColor = "";
    securityBtn.style.color = "";
}

personaldetailsContent.style.display = "block";
securityContent.style.display = "none";

personaldetailsBtn.addEventListener("click", () => {
    removeActiveStyling(); 
    personaldetailsBtn.style.backgroundColor = "#0089f7";
    personaldetailsBtn.style.color = "white"; 
    personaldetailsContent.style.display = "block";
    securityContent.style.display = "none";
});

securityBtn.addEventListener("click", () => {
    personaldetailsContent.style.display = "none";
    securityContent.style.display = "block";
});

helpBtn.addEventListener("click", () => {
    personaldetailsContent.style.display = "none";
    securityContent.style.display = "none";
    removeActiveStyling(); 
    securityBtn.style.backgroundColor = "#0089f7"; 
    securityBtn.style.color = "white"; 
    personaldetailsContent.style.display = "none";
    securityContent.style.display = "block";
});
