// JavaScript 코드
const regPriceInput = document.getElementById('s_RegPrice');
const priceInput = document.getElementById('s_Price');
const discountRateInput = document.getElementById('s_DiscontRate');

const updateDiscountRateColor = () => {
	const discountRate = parseFloat(discountRateInput.value);
	if (discountRate >= 10 && discountRate <= 20) {
		discountRateInput.style.color = 'orange';
	} else if (discountRate > 20 && discountRate <= 100) {
		discountRateInput.style.color = 'red';
	} else {
		discountRateInput.style.color = 'black';
	}
};

priceInput.addEventListener('input', () => {
	const regPrice = parseFloat(regPriceInput.value);
	const price = parseFloat(priceInput.value);
	const discountRate = ((regPrice - price) / regPrice) * 100;
	if (!isNaN(discountRate)) {
		discountRateInput.value = Math.round(discountRate);
		updateDiscountRateColor();
	}
	if (price > regPrice) {
		alert('판매가는 정가보다 높을 수 없습니다!');
		priceInput.value = '';
		discountRateInput.value = '';
	}
});

discountRateInput.addEventListener('input', () => {
	const regPrice = parseFloat(regPriceInput.value);
	const discountRate = parseFloat(discountRateInput.value);
	const price = regPrice - (regPrice * (discountRate / 100));
	if (!isNaN(price)) {
		priceInput.value = Math.round(price);
	}
	updateDiscountRateColor();
});

// 등록 버튼 클릭 시
$(".updatebtn").click(function() {
	// 확인 대화상자 표시
	if (confirm("등록하시겠습니까?")) {
		// 입력 필드 유효성 검사
		var isValid = true;

		// 정가 필드 유효성 검사
		isValid = validatePriceField($("#s_RegPrice"), "정가를 입력해주세요.");
		if (!isValid) return false;

		// 판매가 필드 유효성 검사
		isValid = validatePriceField($("#s_Price"), "판매가를 입력해주세요.");
		if (!isValid) return false;

		// 할인율 필드 유효성 검사
		isValid = validateDiscountField($("#s_DiscontRate"), "할인율을 입력해주세요.");
		if (!isValid) return false;

		// 모든 필드가 유효한 경우 제출
		$("#saleinsertForm").submit();
	} else {
		return false; // 취소 시 제출 취소
	}
});

// 가격 필드 유효성 검사 함수
function validatePriceField(field, errorMessage) {
	var value = field.val();
	if (value === "") {
		alert(errorMessage);
		field.focus();
		return false;
	}
	if (isNaN(value)) {
		alert("숫자를 입력해주세요.");
		field.focus();
		return false;
	}
	return true;
}

// 할인율 필드 유효성 검사 함수
function validateDiscountField(field, errorMessage) {
	var value = field.val();
	if (value === "") {
		alert(errorMessage);
		field.focus();
		return false;
	}
	if (isNaN(value) || parseFloat(value) < 0 || parseFloat(value) > 100) {
		alert("0에서 100 사이의 숫자를 입력해주세요.");
		field.focus();
		return false;
	}
	return true;
}



//삭제 버튼 클릭 시 확인 대화상자 표시
function confirmDeleteSale(saleId) {
    var result = confirm("정말로 삭제하시겠습니까?");
    if (result) {
        window.location.href = 'delete.sale?sId=' + saleId;
    }
}