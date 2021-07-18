function showPSW() {
    var x = document.getElementById("mypsw");
    if (x.type === "password") {
        x.type = "text";
    } else {
        x.type = "password";
    }
}