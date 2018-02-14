window.onload = function(){
	// Buttons
	var quickAddBtn = document.getElementById('QuickAdd');
	var quickAddFormDiv = document.querySelector('.quickaddForm');
	var cancelBtn = document.getElementById('Cancel');
	var AddBtn = document.getElementById('Add');
	// Form Fields
	var navn = document.getElementById('navn');
	var telefon = document.getElementById('telefon');
	var email = document.getElementById('email');
	// Divs etc.
	var addBookDiv = document.querySelector('.addbook');

	quickAddBtn.addEventListener("click", function(){
		// display the form div
		quickAddFormDiv.style.display = "block";
	});

	cancelBtn.addEventListener("click", function(){
		quickAddFormDiv.style.display = "none";
	});

	AddBtn.addEventListener("click", addToBook);

	addBookDiv.addEventListener("click", removeEntry);

	addBookDiv.addEventListener("click", modifyEntry);

    addBookDiv.addEventListener("click", link);










    // Storage Array
	var addressBook = [ ];

	localStorage['addbook'] = '[{"navn":"Signe Egeland","email":"signeegeland@gmail.com","telefon":"93458292"},' +
		'{"navn":"Jens Egeland","email":"Jens434@hotmail.com","telefon":"93828292"}' +
		' ,{"navn":"Eric Tare","email":"Ericfhdjfhd@outlook.com","telefon":"93828292"}]'
	;

    function Bruker(navn,telefon,email){


		this.navn = navn;
		this.telefon = telefon;
		this.email = email;
	}

	function addToBook(){
    	if(telefon.value==='' && email.value===''){
    		alert("Telefon eller email må være utfylt!")
			exit;
		}
		if(navn.value === ""){
    		alert("navn må være utfylt!")
			exit;
		}
		if(checkEmail(email.value) === false){
            alert("You have entered an invalid email address!")
    		exit;
		}


		var isNull = navn.value!='' && (telefon.value!='' || email.value!='');
    	if(isNull){
                // format the input into a valid JSON structure
                var obj = new Bruker(navn.value,telefon.value,email.value);
                addressBook.push(obj);
                localStorage['addbook'] = JSON.stringify(addressBook);
                quickAddFormDiv.style.display = "none";
                clearForm();
                showAddressBook();
    	}


	}

	function modifyEntry(e){
        if(e.target.classList.contains('modbutton')){
            var remID = e.target.getAttribute('data-id');
            quickAddFormDiv.style.display = "block";

           	document.getElementById("navn").value = "Edit name";
            document.getElementById("telefon").value = "new value";

            document.getElementById("email").value = "Edit email";
                addressBook.splice(remID,1);
                localStorage['addbook'] = JSON.stringify(addressBook);
                showAddressBook();



		}

	}

	function removeEntry(e){
            // Remove an entry from the addressbook
            if(e.target.classList.contains('delbutton')){
                if(confirm("Are you sure you want to delete this entry?") === true){
                    var remID = e.target.getAttribute('data-id');
                    addressBook.splice(remID,1);
                    localStorage['addbook'] = JSON.stringify(addressBook);
                    showAddressBook();
				}

            }


	}

    function link(e){
        // Remove an entry from the addressbook
        if(e.target.classList.contains('mailbutton')){
        	var test = document.getElementById("email");
            window.location.href = "mailto:" + test;

        }


    }

	function clearForm(){
		var formFields = document.querySelectorAll('.formFields');
		for(var i in formFields){
			formFields[i].value = '';
		}
	}

	function showAddressBook(){
		if(localStorage['addbook'] === undefined){
			localStorage['addbook'] = '';
		} else {
			addressBook = JSON.parse(localStorage['addbook']);
			// Loop over the array addressBook and insert into the page
			addBookDiv.innerHTML = '';
			for(var n in addressBook){
				var str = '<div class="entry">';
					str += '<div class="navn"><p>' + addressBook[n].navn + '</p></div>';
					str += '<div class="email"><a href=# class="mailbutton">' + addressBook[n].email + '</a></div>';
					str += '<div class="telefon"><p>' + addressBook[n].telefon + '</p></div>';
					str += '<div class="del"><a href="#" class="delbutton" ' + 'data-id="' + n + '">Delete</a></div>';
                	str += '<div class="mod"><a href="#" class="modbutton" ' + 'data-id="' + n + '">Modify</a></div>';

					str += '</div>';
				addBookDiv.innerHTML += str;
			}
		}
	}

    function filter() {
        var input, filter, table, tr, td, i;
        input = document.getElementById("myInput");
        filter = input.value.toUpperCase();
        table = document.getElementById("addbook");
        tr = table.getElementsByTagName("tr");
        for (i = 0; i < tr.length; i++) {
            td = tr[i].getElementsByTagName("td")[0];
            if (td) {
                if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
                    tr[i].style.display = "";
                } else {
                    tr[i].style.display = "none";
                }
            }
        }
    }


    function checkEmail(email) {
        var reg = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
        if (!reg.test(email)) return false;
        return true;
    }


	showAddressBook();

}