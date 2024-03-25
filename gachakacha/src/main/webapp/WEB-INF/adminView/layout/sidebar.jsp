<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

            <div style="margin: 2rem 0;">
                <a class="sidebar-brand d-flex align-items-center justify-content-center" href="adminPage.do">
                    <img style="width: 100%" src="${pageContext.request.contextPath}/img/finallogo.png">
                </a>
            </div>
            <!-- Divider -->
            <hr class="sidebar-divider my-0">

            <!-- Nav Item - Dashboard -->
            <li class="nav-item active">
                <a class="nav-link" href="adminPage.do">
                    <i class="fas fa-chart-area"></i>&nbsp;
                    <span>대 시 보 드</span></a>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider my-0">



            <li class="nav-item">
                <a class="nav-link" href="list.user">
                    <i class="fa-solid fa-id-card"></i>&nbsp;
                    <span>회 원 관 리</span></a>
            </li>
            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo"
                    aria-expanded="true" aria-controls="collapseTwo">
                    <i class="fa-solid fa-boxes-stacked"></i>&nbsp;
                    <span>상 품 관 리</span>
                </a>
                <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded" id="submenu">
                        <h6 class="collapse-header">상 품 관 리 </h6>
                        <a class="collapse-item" href="insertForm.product">재 고 등 록</a>
                        <a class="collapse-item" href="list.product">재 고 조 회</a>
                        <!-- <a class="collapse-item" href="#">판 매 등 록</a> -->
                        <a class="collapse-item" href="list.sale">판 매 상 품 조 회</a>
                    </div>
                </div>
            </li>

                <li class="nav-item">
                <a class="nav-link" href="list.order">
                    <i class="fa-solid fa-store"></i>&nbsp;
                    <span>주 문 관 리</span></a>
            	</li>            	

            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages"
                    aria-expanded="true" aria-controls="collapsePages">
                    <i class="fas fa-table"></i>&nbsp;&nbsp;
                    <span>게 시 판 관 리</span>
                </a>
                <div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded" id="submenu">
                        <h6 class="collapse-header">게 시 판 관 리</h6>
                        <a class="collapse-item" href="list.board?bcat=info">공 지 사 항</a>
                        <a class="collapse-item" href="list.board?bcat=QnA">Q & A</a>
                        <a class="collapse-item" href="list.board?bcat=reivew">리 뷰</a>
                        <a class="collapse-item" href="list.board?bcat=secondHand">중 고 장 터</a>
                    </div>
                </div>
            </li>


            <!-- Divider -->
            <hr class="sidebar-divider my-0">

            <!-- Nav Item - Tables -->
            <li class="nav-item">
                <a class="nav-link" href="index.jsp">
                    <i class="fa-solid fa-store"></i>&nbsp;
                    <span>쇼 핑 몰 메 인</span></a>
            </li>



            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Sidebar Toggler (Sidebar) -->
            <div class="text-center d-none d-md-inline">
                <button class="rounded-circle border-0" id="sidebarToggle"></button>
            </div>

           

        </ul>
        