const personaldetailsBtn = document.getElementById("personaldetailsBtn");
const securityBtn = document.getElementById("securityBtn");


const personaldetailsContent = document.getElementById("personaldetailsContent");
const securityContent = document.getElementById("securityContent");

personaldetailsContent.style.display = "block";
securityContent.style.display = "none";

personaldetailsBtn.addEventListener("click", () => {
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
});
