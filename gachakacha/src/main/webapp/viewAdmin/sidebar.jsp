
		<!-- <li><a href="/toyProject4/Index?action=index">메인으로 </a></li>
		<li><a href="/toyProject4/Index?action=productList">제품 목록 보기</a></li>
		<li><a href="/toyProject4/Index?action=productForm">제품 등록하기</a></li> -->

		
		

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>사이드바 메뉴</title>
    <style>
        /* CSS 스타일링 */
        /* 해당 CSS 스타일은 여러분이 이미 가지고 계시므로 변경하지 않았습니다. */
    </style>
</head>
<body>
    <aside>
        <div class="logo" onclick="window.location.href = 'index.jsp'"></div>
        <nav>
            <ul>
            
            <li class="menu-item">
                    <a href="main.do"><i class="fa-solid fa-house"></i>&nbsp;&nbsp; 
                    쇼핑몰메인</a>
                </li>
                
                
                <li class="menu-item">
                    <a href=""><i class="fa-solid fa-chart-line"></i>&nbsp;&nbsp; 
                    대시보드</a>
                </li>
                <li class="menu-item">
                    <a href="userList.admin"><i class="fa-solid fa-id-card"></i>&nbsp;&nbsp;
                    회원관리</a>
                </li>
               
                
                <li class="menu-item parent">
                <i class="fa-solid fa-box-open"></i>&nbsp;&nbsp;
                    재고관리
                    <ul class="sub-menu">
                        <li><a href="pInsertPage.admin">재고등록</a></li>
                        <li><a href="getPList.admin">재고리스트</a></li>
                        <li><a href="#">판매등록</a></li>
                        <li><a href="#">판매리스트</a></li>
                    </ul>
                </li>
                <li class="menu-item parent">
                <i class="fa-solid fa-cart-shopping"></i>&nbsp;&nbsp;
                    주문/출고관리
                    <ul class="sub-menu">
                        <li><a>주문관리</a></li>
                        <li><a>출고관리</a></li>
                    </ul>
                </li>
                <!-- 나머지 메뉴들 추가 -->
                <li class="menu-item parent"style="padding-left:3px;">
                <i class="fa-solid fa-pen-to-square"></i></i>&nbsp;&nbsp;
                    게시판관리
                    <ul class="sub-menu">
                        <li><a>공지사항</a></li>
                        <li><a>Q & A</a></li>
                        <li><a>리뷰</a></li>
                        <li><a>중고거래</a></li>
                    </ul>
                </li>
                
            </ul>
        </nav>
    </aside>

    <script>
    // JavaScript로 메뉴 동작 설정
    window.addEventListener('DOMContentLoaded', () => {
        const menuItems = document.querySelectorAll('.menu-item.parent');

        menuItems.forEach(item => {
            item.addEventListener('click', () => {
                // 클릭한 메뉴의 서브 메뉴 요소 가져오기
                const subMenu = item.querySelector('.sub-menu');
                
                // 서브 메뉴가 현재 보이는지 여부 확인
                const isActive = subMenu.classList.contains('active');

                // 모든 메뉴에서 active 클래스 제거
                document.querySelectorAll('.sub-menu').forEach(menu => {
                    menu.classList.remove('active');
                });

                // 클릭한 메뉴의 서브 메뉴에 active 클래스를 토글하여 보이거나 숨기기
                subMenu.classList.toggle('active', !isActive);
            });
        });

        // 다른 부분을 클릭하면 활성화된 서브 메뉴를 숨깁니다.
        document.addEventListener('click', (event) => {
            if (!event.target.closest('.menu-item')) {
                document.querySelectorAll('.sub-menu').forEach(menu => {
                    menu.classList.remove('active');
                });
            }
        });
    });
</script>
</body>
</html>
