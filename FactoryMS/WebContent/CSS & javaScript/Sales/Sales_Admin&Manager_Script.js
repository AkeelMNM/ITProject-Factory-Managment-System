
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


function Calculate()
{
	var n1 = parseFloat(document.getElementById("num1").value);
	var n2 = parseFloat(document.getElementById("num2").value);
	var n3 = parseFloat(document.getElementById("num3").value);
	
	var result =n1+n2+n3 ;

	document.getElementById("TotalRevenue").innerHTML = result;
		
}