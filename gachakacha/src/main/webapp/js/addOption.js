function copyOptionTable() {
	var originalTable = document.querySelector(".table.optionTable");
	var cloneTable = originalTable.cloneNode(true);
	cloneTable.querySelector(".type-delete").style.display = "inline-block";
	cloneTable.querySelector(".type-delete").setAttribute("onclick", "deleteOptionTable(this);");

	var inputs = cloneTable.querySelectorAll('input[type="text"]');
	inputs.forEach(function(input) {
		input.value = '';
	});

	document.querySelector(".option").appendChild(cloneTable);
}

function deleteOptionTable(button) {
	var row = button.closest('table');
	row.parentNode.removeChild(row);
}

function openOptionPage(productId) {
        var url = "optionInserForm.admin?pId=" + productId;
        var optionWindow = window.open(url, "_blank", "width=1000,height=400");
        optionWindow.focus();
    }