
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

function check() { // checking password match
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

function calc() { // Calculating EPF and ETF for the job
    var txtFirstNumberValue = document.getElementById('bs').value;

    var sal = parseInt(txtFirstNumberValue);
    var etf= 0.03 * sal;
    var epf= 0.08 * sal;
    
        document.getElementById('fetf').value = etf;
        document.getElementById('fepf').value = epf;

}

