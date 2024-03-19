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

/*  window.addEventListener('DOMContentLoaded', () => {
	  const thHeight = document.querySelector('th[rowspan="3"]').clientHeight;
	  const sContInput = document.getElementById('s_Cont');
	  sContInput.style.height = thHeight + 'px';
  }); */
