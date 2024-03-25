document.addEventListener('DOMContentLoaded', function() {
    var updateForm = document.querySelector('form[action="update.order"]');
    var updateButton = updateForm.querySelector('.updatebtn');

    updateButton.addEventListener('click', function(event) {
        // 확인 대화상자 표시
        var confirmation = confirm("수정하시겠습니까?");
        if (!confirmation) {
            // 취소를 클릭한 경우 폼 전송을 막음
            event.preventDefault();
        }
    });
});

//삭제 버튼 클릭 시 확인 대화상자 표시
function confirmDeleteOrder(orderId) {
    var result = confirm("정말로 삭제하시겠습니까?");
    if (result) {
        window.location.href = 'delete.order?odId=' + orderId;
    }
}