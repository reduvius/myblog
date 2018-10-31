// Validate login form
function validateForm() {
    var x = document.forms["login"]["email"].value;
    var y = document.forms["login"]["password"].value;
    if (x == "") {
        alert("Email must be filled out");
        return false;
    }
    if (y == "") {
        alert("Password must be filled out");
        return false;
    }
}
