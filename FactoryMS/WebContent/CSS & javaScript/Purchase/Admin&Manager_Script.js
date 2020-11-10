
/* When the user clicks on the button, 
toggle between hiding and showing the dropdown content */
function myFunction() {
  document.getElementById("myDropdown").classList.toggle("show");
}

// Close the dropdown if the user clicks outside of it
window.onclick = function(event) {
  if (!event.target.matches('.dropbtn')) {
    var dropdowns = document.getElementsByClassName("dropdown-content");
    var i;
    for (i = 0; i < dropdowns.length; i++) {
      var openDropdown = dropdowns[i];
      if (openDropdown.classList.contains('show')) {
        openDropdown.classList.remove('show');
      }
    }
  }
}


 function calc() { // Calculating Value


        var quantity = document.getElementById("quantity").value;
        var quantity = parseInt(quantity, 10);
        var rate = document.getElementById("rate").value;
        var rate = parseInt(rate, 10);
        var total = quantity * rate;

        document.getElementById("total").value = total;
 }










