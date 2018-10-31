// NEW FORM VALIDATION
function validateForm() {
    var x = document.forms["new-form"]["title"].value;
    var y = document.forms["new-form"]["content"].value;
    if (x == "") {
        alert("Title cannot be empty.");
        return false;
    }
    if (y == "") {
        alert("Content cannot be empty.");
        return false;
    }
}
