// Validate registration form
function validateForm() {
    var a = document.forms["reg"]["name"].value;
    var b = document.forms["reg"]["email"].value;
    var c = document.forms["reg"]["password"].value;
    var d = document.forms["reg"]["password_confirm"].value;
    if (a == "") {
        alert("Name must be filled out");
        return false;
    }
    if (b == "") {
        alert("Email must be filled out");
        return false;
    }
    if (c == "") {
        alert("Password must be filled out");
        return false;
    }
    if (c.length < 6) {
        alert("Password must be at least 6 characters long");
        return false;
    }
    if (d == "") {
        alert("Password confirmation must be filled out");
        return false;
    }
    if (c != d) {
        alert("Passwords do not match!");
        return false;
    }
}
