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
        var url = "insertForm.option?pId=" + productId;
        var optionWindow = window.open(url, "_blank", "width=1000,height=400");
        optionWindow.focus();
    }
    
    
    
    
  // 등록 버튼 클릭 시
$(".insertbtn").click(function() {
    // 확인 대화상자 표시
    if (confirm("등록하시겠습니까?")) {
        // 입력 필드 유효성 검사
        var isValid = true;

        // 제품명 필드 유효성 검사
        isValid = validateField($("#p_Name"), "제품명을 입력해주세요.");
        if (!isValid) return false;

        // 제품가격 필드 유효성 검사
        isValid = validateField($("#p_Price"), "제품 가격을 입력하세요.", true);
        if (!isValid) return false;

        // 제품 종류 선택 여부 확인
        var productType = $("input[name='p_Type']:checked").val();
        if (!productType) {
            alert("제품 종류를 선택해주세요.");
            isValid = false;
            return false; // 함수 종료
        }

        // 옵션명 필드 유효성 검사
        var optionNameFields = $("input[name='o_Name[]']");
        isValid = validateOptions(optionNameFields, "옵션 명을 입력하세요.");
        if (!isValid) return false;

        // 옵션 수량 필드 유효성 검사
        var optionQtyFields = $("input[name='o_Qty[]']");
        isValid = validateOptions(optionQtyFields, "옵션 수량을 입력하세요.", true);
        if (!isValid) return false;

        // 모든 필드가 유효한 경우 제출
        $("#productForm").submit();
    }
});

// 필드 유효성 검사 함수
function validateField(field, errorMessage, isNumber = false) {
    var value = field.val();
    if (value === "") {
        alert(errorMessage);
        field.focus();
        return false;
    }
    if (isNumber && isNaN(value)) {
        alert("숫자를 입력해주세요.");
        field.focus();
        return false;
    }
    return true;
}

// 옵션 필드 유효성 검사 함수



function validateOptions(fields, errorMessage, isNumber = false) {
    var isValid = true;
    fields.each(function() {
        if ($(this).val() === "") {
            alert(errorMessage);
            $(this).focus();
            isValid = false;
            return false; // 반복문 탈출
        }
        if (isNumber && isNaN($(this).val())) {
            alert("숫자를 입력해주세요.");
            $(this).focus();
            isValid = false;
            return false; // 반복문 탈출
        }
    });
    return isValid;
}


//제품 상세정보 옵션정보페이지 유효성
var updateButtons = document.querySelectorAll('.updatebtn');
updateButtons.forEach(function(button) {
    button.addEventListener('click', function(event) {
        // 확인 대화상자 표시
        var confirmation = confirm("수정하시겠습니까?");
        if (!confirmation) {
            // 취소를 클릭한 경우 기본 이벤트 제거
            event.preventDefault();
        } else {
            // 확인을 클릭한 경우에만 서브밋 수행
            var form = this.closest('form');
            // 입력값이 모두 채워져 있는지 확인
            var inputs = form.querySelectorAll('input[type="text"], select');
            var isValid = true;
            inputs.forEach(function(input) {
                if (input.value.trim() === "") {
                    alert("모든 입력 필드를 채워주세요.");
                    isValid = false;
                    event.preventDefault();
                }
            });
            if (!isValid) return;

            // 재고 수량이 숫자인지 확인
            var qtyInput = form.querySelector('#option_Qty');
            var qtyValue = qtyInput.value.trim();
            if (isNaN(qtyValue) || parseInt(qtyValue) <= 0) {
                alert("재고 수량은 숫자로 입력해주세요.");
                qtyInput.focus();
                event.preventDefault();
                return;
            }

            // 모든 필드가 유효한 경우 서브밋 수행
            form.submit();
        }
    });
});


// 삭제 버튼 클릭 시 확인 대화상자 표시
function confirmDeleteOption(optionId, productId) {
    var result = confirm("정말로 삭제하시겠습니까?");
    if (result) {
        window.location.href = 'delete.option?oId=' + optionId + '&pId=' + productId;
    }
}

//삭제 버튼 클릭 시 확인 대화상자 표시
function confirmDeleteProduct(productId) {
    var result = confirm("정말로 삭제하시겠습니까?");
    if (result) {
        window.location.href = 'delete.product?pId=' + productId;
    }
}
