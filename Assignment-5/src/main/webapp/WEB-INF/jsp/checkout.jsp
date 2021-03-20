<%@ taglib prefix="xlink" uri="http://www.springframework.org/tags/form" %>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<!-- Created By CodingNepal -->
<html lang="en" dir="ltr">
<head>
    <meta charset="utf-8">
    <!-- Somehow I got an error, so I comment the title, just uncomment to show -->
    <!-- <title>Multi Step Form | CodingNepal</title> -->
    <link rel="stylesheet" href="style.css">
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
</head>
<%--<style>
    @import url('https://fonts.googleapis.com/css?family=Poppins:400,500,600,700&display=swap');
    *{
        margin: 0;
        padding: 0;
        outline: none;
        font-family: 'Poppins', sans-serif;
    }
    body{
        display: flex;
        align-items: center;
        justify-content: center;
        min-height: 100vh;
        overflow: hidden;
        background: url("bg.png"), -webkit-linear-gradient(bottom, #0250c5, #d43f8d);
    }
    ::selection{
        color: #fff;
        background: #d43f8d;
    }
    .container{
        width: 330px;
        background: #fff;
        text-align: center;
        border-radius: 5px;
        padding: 50px 35px 10px 35px;
    }
    .container header{
        font-size: 35px;
        font-weight: 600;
        margin: 0 0 30px 0;
    }
    .container .form-outer{
        width: 100%;
        overflow: hidden;
    }
    .container .form-outer form{
        display: flex;
        width: 400%;
    }
    .form-outer form .page{
        width: 25%;
        transition: margin-left 0.3s ease-in-out;
    }
    .form-outer form .page .title{
        text-align: left;
        font-size: 25px;
        font-weight: 500;
    }
    .form-outer form .page .field{
        width: 330px;
        height: 45px;
        margin: 45px 0;
        display: flex;
        position: relative;
    }
    form .page .field .label{
        position: absolute;
        top: -30px;
        font-weight: 500;
    }
    form .page .field input{
        height: 100%;
        width: 100%;
        border: 1px solid lightgrey;
        border-radius: 5px;
        padding-left: 15px;
        font-size: 18px;
    }
    form .page .field select{
        width: 100%;
        padding-left: 10px;
        font-size: 17px;
        font-weight: 500;
    }
    form .page .field button{
        width: 100%;
        height: calc(100% + 5px);
        border: none;
        background: #d33f8d;
        margin-top: -20px;
        border-radius: 5px;
        color: #fff;
        cursor: pointer;
        font-size: 18px;
        font-weight: 500;
        letter-spacing: 1px;
        text-transform: uppercase;
        transition: 0.5s ease;
    }
    form .page .field button:hover{
        background: #000;
    }
    form .page .btns button{
        margin-top: -20px!important;
    }
    form .page .btns button.prev{
        margin-right: 3px;
        font-size: 17px;
    }
    form .page .btns button.next{
        margin-left: 3px;
    }
    .container .progress-bar{
        display: flex;
        margin: 40px 0;
        user-select: none;
    }
    .container .progress-bar .step{
        text-align: center;
        width: 100%;
        position: relative;
    }
    .container .progress-bar .step p{
        font-weight: 500;
        font-size: 18px;
        color: #000;
        margin-bottom: 8px;
    }
    .progress-bar .step .bullet{
        height: 25px;
        width: 25px;
        border: 2px solid #000;
        display: inline-block;
        border-radius: 50%;
        position: relative;
        transition: 0.2s;
        font-weight: 500;
        font-size: 17px;
        line-height: 25px;
    }
    .progress-bar .step .bullet.active{
        border-color: #d43f8d;
        background: #d43f8d;
    }
    .progress-bar .step .bullet span{
        position: absolute;
        left: 50%;
        transform: translateX(-50%);
    }
    .progress-bar .step .bullet.active span{
        display: none;
    }
    .progress-bar .step .bullet:before,
    .progress-bar .step .bullet:after{
        position: absolute;
        content: '';
        bottom: 11px;
        right: -51px;
        height: 3px;
        width: 44px;
        background: #262626;
    }
    .progress-bar .step .bullet.active:after{
        background: #d43f8d;
        transform: scaleX(0);
        transform-origin: left;
        animation: animate 0.3s linear forwards;
    }
    @keyframes animate {
        100%{
            transform: scaleX(1);
        }
    }
    .progress-bar .step:last-child .bullet:before,
    .progress-bar .step:last-child .bullet:after{
        display: none;
    }
    .progress-bar .step p.active{
        color: #d43f8d;
        transition: 0.2s linear;
    }
    .progress-bar .step .check{
        position: absolute;
        left: 50%;
        top: 70%;
        font-size: 15px;
        transform: translate(-50%, -50%);
        display: none;
    }
    .progress-bar .step .check.active{
        display: block;
        color: #fff;
    }

</style>--%>
<body>
<div class="container">
    <header>TRANSACTION</header>
    <div class="form-outer">
        <form:form method="GET" action="${pageContext.request.contextPath}/Orders" modelAttribute="orders">
            <div class="page slide-page">
                <div class="title">
                    Basic Info:</div>
                <div class="field">
                    <div class="label">
                        Full Name</div>
                    <form:input path="customername"  />
                </div>
                <div class="field">
                    <div class="label">
                        Full Date</div>
                    <form:input path="orderdate"  />
                </div>
                <div class="field">
                    <div class="label">
                        Address</div>
                    <form:input path="customeraddress"  />
                </div>
            </div>
            <div class="page">
                <div class="field btns">
                    <button class="prev-3 prev">Previous</button>
                    <button class="submit">Submit</button>
                </div>
            </div>
        </form:form>

    </div>
</div>


</body>
<script>
    <!-- Created By CodingNepal -->
    const slidePage = document.querySelector(".slide-page");
    const nextBtnFirst = document.querySelector(".firstNext");
    const prevBtnSec = document.querySelector(".prev-1");
    const nextBtnSec = document.querySelector(".next-1");
    const prevBtnThird = document.querySelector(".prev-2");
    const nextBtnThird = document.querySelector(".next-2");
    const prevBtnFourth = document.querySelector(".prev-3");
    const submitBtn = document.querySelector(".submit");
    const progressText = document.querySelectorAll(".step p");
    const progressCheck = document.querySelectorAll(".step .check");
    const bullet = document.querySelectorAll(".step .bullet");
    let current = 1;

    nextBtnFirst.addEventListener("click", function(event){
        event.preventDefault();
        slidePage.style.marginLeft = "-25%";
        bullet[current - 1].classList.add("active");
        progressCheck[current - 1].classList.add("active");
        progressText[current - 1].classList.add("active");
        current += 1;
    });
    nextBtnSec.addEventListener("click", function(event){
        event.preventDefault();
        slidePage.style.marginLeft = "-50%";
        bullet[current - 1].classList.add("active");
        progressCheck[current - 1].classList.add("active");
        progressText[current - 1].classList.add("active");
        current += 1;
    });
    nextBtnThird.addEventListener("click", function(event){
        event.preventDefault();
        slidePage.style.marginLeft = "-75%";
        bullet[current - 1].classList.add("active");
        progressCheck[current - 1].classList.add("active");
        progressText[current - 1].classList.add("active");
        current += 1;
    });
    submitBtn.addEventListener("click", function(){
        bullet[current - 1].classList.add("active");
        progressCheck[current - 1].classList.add("active");
        progressText[current - 1].classList.add("active");
        current += 1;
        setTimeout(function(){
            alert("Your Form Successfully Signed up");
            location.reload();
        },800);
    });

    prevBtnSec.addEventListener("click", function(event){
        event.preventDefault();
        slidePage.style.marginLeft = "0%";
        bullet[current - 2].classList.remove("active");
        progressCheck[current - 2].classList.remove("active");
        progressText[current - 2].classList.remove("active");
        current -= 1;
    });
    prevBtnThird.addEventListener("click", function(event){
        event.preventDefault();
        slidePage.style.marginLeft = "-25%";
        bullet[current - 2].classList.remove("active");
        progressCheck[current - 2].classList.remove("active");
        progressText[current - 2].classList.remove("active");
        current -= 1;
    });
    prevBtnFourth.addEventListener("click", function(event){
        event.preventDefault();
        slidePage.style.marginLeft = "-50%";
        bullet[current - 2].classList.remove("active");
        progressCheck[current - 2].classList.remove("active");
        progressText[current - 2].classList.remove("active");
        current -= 1;
    });
</script>
</html>
