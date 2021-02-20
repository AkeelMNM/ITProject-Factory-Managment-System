
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

function check() {
	  if (document.getElementById('pwd').value ==
	  document.getElementById('confirm_pwd').value)
	  {
		document.getElementById('Pwd_msg').style.color = 'blue';
		document.getElementById('Pwd_msg').innerHTML = 'Password matching';
	  }
	  else {
		document.getElementById('Pwd_msg').style.color = 'red';
		document.getElementById('Pwd_msg').innerHTML = 'Password not matching';
	  }
}

function Reset() {

	$("name").empty()
}