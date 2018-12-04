// Confirm post delete
$(document).ready(function() {
    $("#i-del").click(function() {
        return confirm('Are you sure you want to delete this image?');
    });
});

/*
// --------------------------- Modal image --------------------------------
// Get the modal
var modal = document.getElementById('modalImg');

// Get the image and insert it inside the modal - use its "alt" text as a caption
var img = document.getElementById('imgO');
var modalImg = document.getElementById("imgMd");
var captionText = document.getElementById("caption");

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];

img.onclick = function(){
    modal.style.display = "block";
    modalImg.src = this.src;
    captionText.innerHTML = this.alt;
}

// When the user clicks on <span> (x), close the modal
span.onclick = function() {
    modal.style.display = "none";
}

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}
/* ------------------------------
$(document).ready(function() {
    // Get the modal
    var modal = $('#modalImg');

    var img = $('#imgO');
    var modalImg = $("#imgMd");
    var captionText = $("#caption");

    // Get the <span> element that closes the modal
    var span = $("#close")[0];

    img.click(function() {

    });
});
*/
