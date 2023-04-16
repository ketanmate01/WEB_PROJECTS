<%-- 
    Document   : slider
    Created on : 21 Oct, 2018, 10:55:41 PM
    Author     : ketan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Slider</title>
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    </head>
    <style>
        *, *:before, *:after {
  box-sizing: border-box;
  margin: 0;
  padding: 0;
}
body {
  background: #1f1f1f;
  font-family: 'Open Sans', Helvetica, Arial, sans-serif;
}
.cont {
  position: relative;
  overflow: hidden;
  height: 100vh;
  padding: 80px 70px;
}
.cont__inner {
  position: relative;
  height: 100%;
}
.cont__inner:hover .el__bg:after {
  opacity: 1;
}
.el {
  position: absolute;
  left: 0;
  top: 0;
  width: 33.33%;
  height: 100%;
  background: #252525;
  transition: transform 0.6s 0.7s, width 0.7s, opacity 0.6s 0.7s, z-index 0s 1.3s;
  will-change: transform, width, opacity;
}
.el:not(.s--active) {
  cursor: pointer;
}
.el__overflow {
  overflow: hidden;
  position: relative;
  height: 100%;
}
.el__inner {
  overflow: hidden;
  position: relative;
  height: 100%;
  transition: transform 1s;
}
.cont.s--inactive .el__inner {
  transform: translate3d(0, 100%, 0);
}
.el__bg {
  position: relative;
  width: calc(100vw - 140px);
  height: 100%;
  transition: transform 0.6s 0.7s;
  will-change: transform;
  background: rgb(0,0,0,0.5);
}
.el__bg:before {
  content: "";
  position: absolute;
  left: 0;
  top: -5%;
  width: 100%;
  height: 110%;
  background-size: cover;
  background-position: center center;
  transition: transform 1s;
  transform: translate3d(0, 0, 0) scale(1);
  background: rgb(0,0,0,0.5);
}
.cont.s--inactive .el__bg:before {
  transform: translate3d(0, -100%, 0) scale(1.2);
}
.el.s--active .el__bg:before {
  transition: transform 0.8s;
}
.el__bg:after {
  content: "";
  z-index: 1;
  position: absolute;
  left: 0;
  top: 0;
  width: 100%;
  height: 100%;
  background: rgb(0, 0, 0, 0.3);
  opacity: 0;
  transition: opacity 0.5s;
}
.cont.s--el-active .el__bg:after {
  transition: opacity 0.5s 1.4s;
  opacity: 1 !important;
}
.el__preview-cont {
  z-index: 2;
  display: flex;
  justify-content: center;
  align-items: center;
  position: absolute;
  left: 0;
  top: 0;
  width: 100%;
  height: 100%;
  transition: all 0.3s 1.2s;
}
.cont.s--inactive .el__preview-cont {
  opacity: 0;
  transform: translateY(10px);
}
.cont.s--el-active .el__preview-cont {
  opacity: 0;
  transform: translateY(30px);
  transition: all 0.5s;
}
.el__heading {
  color: #fff;
  text-transform: uppercase;
  font-size: 40px;
  background:rgb(0,0,0,0.5);
  
}
.el__content {
  z-index: -1;
  position: absolute;
  left: 0;
  top: 0;
  width: 100%;
  height: 100%;
  padding: 30px;
  opacity: 0;
  pointer-events: none;
  transition: all 0.1s;
}
.el.s--active .el__content {
  z-index: 2;
  opacity: 1;
  pointer-events: auto;
  transition: all 0.5s 1.4s;
}
.el__text {
  text-transform: uppercase;
  font-size: 60px;
  color: #fff;
}
.el__close-btn {
  z-index: -1;
  position: absolute;
  right: 10px;
  top: 10px;
  width: 60px;
  height: 60px;
  opacity: 0;
  pointer-events: none;
  transition: all 0s 0.45s;
  cursor: pointer;
}
.el.s--active .el__close-btn {
  z-index: 5;
  opacity: 1;
  pointer-events: auto;
  transition: all 0s 1.4s;
}
.el__close-btn:before, .el__close-btn:after {
  content: "";
  position: absolute;
  left: 0;
  top: 50%;
  width: 100%;
  height: 8px;
  margin-top: -4px;
  background: #fff;
  opacity: 0;
  transition: opacity 0s;
}
.el.s--active .el__close-btn:before, .el.s--active .el__close-btn:after {
  opacity: 1;
}
.el__close-btn:before {
  transform: rotate(45deg) translateX(100%);
}
.el.s--active .el__close-btn:before {
  transition: all 0.3s 1.4s cubic-bezier(0.72, 0.09, 0.32, 1.57);
  transform: rotate(45deg) translateX(0);
}
.el__close-btn:after {
  transform: rotate(-45deg) translateX(100%);
}
.el.s--active .el__close-btn:after {
  transition: all 0.3s 1.55s cubic-bezier(0.72, 0.09, 0.32, 1.57);
  transform: rotate(-45deg) translateX(0);
}
.el__index {
  overflow: hidden;
  position: absolute;
  left: 0;
  bottom: -80px;
  width: 100%;
  height: 100%;
  min-height: 250px;
  text-align: center;
  font-size: 20vw;
  line-height: 0.85;
  font-weight: bold;
  transition: transform 0.5s, opacity 0.3s 1.4s;
  transform: translate3d(0, 1vw, 0);
}
.el:hover .el__index {
  transform: translate3d(0, 0, 0);
}
.cont.s--el-active .el__index {
  transition: transform 0.5s, opacity 0.3s;
  opacity: 0;
}
.el__index-back, .el__index-front {
  position: absolute;
  left: 0;
  bottom: 0;
  width: 100%;
}
.el__index-back {
  color: #2f3840;
  opacity: 0;
  transition: opacity 0.25s 0.25s;
}
.el:hover .el__index-back {
  transition: opacity 0.25s;
  opacity: 1;
}
.el__index-overlay {
  overflow: hidden;
  position: relative;
  transform: translate3d(0, 100%, 0);
  transition: transform 0.5s 0.1s;
  color: transparent;
}
.el__index-overlay:before {
  content: attr(data-index);
  position: absolute;
  left: 0;
  bottom: 0;
  width: 100%;
  height: 100%;
  color: #fff;
  transform: translate3d(0, -100%, 0);
  transition: transform 0.5s 0.1s;
}
.el:hover .el__index-overlay {
  transform: translate3d(0, 0, 0);
}
.el:hover .el__index-overlay:before {
  transform: translate3d(0, 0, 0);
}
.el:nth-child(1) {
  transform: translate3d(0%, 0, 0);
  transform-origin: 50% 50%;
}
.cont.s--el-active .el:nth-child(1):not(.s--active) {
  transform: scale(0.5) translate3d(0%, 0, 0);
  opacity: 0;
  transition: transform 0.95s, opacity 0.95s;
}
.el:nth-child(1) .el__inner {
  transition-delay: 0s;
}
.el:nth-child(1) .el__bg {
  transform: translate3d(0%, 0, 0);
 
}
.el:nth-child(1) .el__bg:before {
  transition-delay: 0s;
  background: rgb(0,0,0,0.2);
  background-image: url("student.jpg");
  background-position: center;
  background-repeat: no-repeat;
  background-size: cover;
}
.el:nth-child(2) {
  transform: translate3d(105.20833%, 0, 0);
  transform-origin: 155.20833% 50%;
}
.cont.s--el-active .el:nth-child(2):not(.s--active) {
  transform: scale(0.5) translate3d(105.20833%, 0, 0);
  opacity: 0;
  transition: transform 0.95s, opacity 0.95s;
}
.el:nth-child(2) .el__inner {
  transition-delay: 0.1s;
}
.el:nth-child(2) .el__bg {
  transform: translate3d(-19.2%, 0, 0);
}
.el:nth-child(2) .el__bg:before {
  transition-delay: 0.1s;
  background-image: url("company.jpg");
  background-position: center;
  background-repeat: no-repeat;
  background-size: cover;
}
.el:nth-child(3) {
  transform: translate3d(210.41667%, 0, 0);
  transform-origin: 260.41667% 50%;
}
.cont.s--el-active .el:nth-child(3):not(.s--active) {
  transform: scale(0.5) translate3d(210.41667%, 0, 0);
  opacity: 0;
  transition: transform 0.95s, opacity 0.95s;
}
.el:nth-child(3) .el__inner {
  transition-delay: 0.2s;
}
.el:nth-child(3) .el__bg {
  transform: translate3d(-38.4%, 0, 0);
}
.el:nth-child(3) .el__bg:before {
  transition-delay: 0.2s;
  background-image: url("admin.jpg");
  background-position: center;
  background-repeat: no-repeat;
  background-size: cover;
}
.el:nth-child(4) {
  transform: translate3d(315.625%, 0, 0);
  transform-origin: 365.625% 50%;
}
.cont.s--el-active .el:nth-child(4):not(.s--active) {
  transform: scale(0.5) translate3d(315.625%, 0, 0);
  opacity: 0;
  transition: transform 0.95s, opacity 0.95s;
}
.el:nth-child(4) .el__inner {
  transition-delay: 0.3s;
}
.el:nth-child(4) .el__bg {
  transform: translate3d(-57.6%, 0, 0);
}
.el:nth-child(4) .el__bg:before {
  transition-delay: 0.3s;
  background-image: url("https://s3-us-west-2.amazonaws.com/s.cdpn.io/142996/onepgscr-6.jpg");
}
.el:nth-child(5) {
  transform: translate3d(420.83333%, 0, 0);
  transform-origin: 470.83333% 50%;
}
.cont.s--el-active .el:nth-child(5):not(.s--active) {
  transform: scale(0.5) translate3d(420.83333%, 0, 0);
  opacity: 0;
  transition: transform 0.95s, opacity 0.95s;
}
.el:nth-child(5) .el__inner {
  transition-delay: 0.4s;
}
.el:nth-child(5) .el__bg {
  transform: translate3d(-76.8%, 0, 0);
}
.el:nth-child(5) .el__bg:before {
  transition-delay: 0.4s;
  background-image: url("https://s3-us-west-2.amazonaws.com/s.cdpn.io/142996/onepgscr-7.jpg");
}
.el:hover .el__bg:after {
  opacity: 0;
}
.el.s--active {
  z-index: 1;
  width: 100%;
  transform: translate3d(0, 0, 0);
  transition: transform 0.6s, width 0.7s 0.7s, z-index 0s;
}
.el.s--active .el__bg {
  transform: translate3d(0, 0, 0);
  transition: transform 0.6s;
}
.el.s--active .el__bg:before {
  transition-delay: 0.6s;
  transform: scale(1.1);
}
.w3-container a{
    width:240px;
    padding-top: 20px;
    padding-bottom: 20px;
    border-radius: 50px;
    text-align: center;
    margin-left: 550px;
    margin-bottom: -400px;
    font-size: 30px;
   
    
}
.el__text{
    margin-left: 10px;
    margin-top: 100px;
    background: rgb(0,0,0,0.3);
    text-align: center;
    color: white;
    
        
}
    </style>
    <body>
        <div class="cont s--inactive">
  <!-- cont inner start -->
  <div class="cont__inner">
    <!-- el start -->
    <div class="el">
      <div class="el__overflow">
        <div class="el__inner">
          <div class="el__bg"></div>
          <div class="el__preview-cont">
            <h2 class="el__heading">Student Login</h2>
          </div>
          <div class="el__content">
            <div class="el__text">Student Login</div>
            <div class="w3-container" id="1"> <a href="student_login.jsp" class="w3-button w3-black">Login</a></div>

            <div class="el__close-btn"></div>
          </div>
        </div>
      </div>
      <div class="el__index">
        <div class="el__index-back">1</div>
        <div class="el__index-front">
          <div class="el__index-overlay" data-index="1">1</div>
        </div>
      </div>
    </div>
    <!-- el end -->
    <!-- el start -->
    <div class="el">
      <div class="el__overflow">
        <div class="el__inner">
          <div class="el__bg"></div>
          <div class="el__preview-cont">
            <h2 class="el__heading">Company Login</h2>
          </div>
          <div class="el__content">
            <div class="el__text">Company Login</div>
            <div class="w3-container"> <a href="company_login.jsp" class="w3-button w3-black">Login</a></div>
            <div class="el__close-btn"></div>
          </div>
        </div>
      </div>
      <div class="el__index">
        <div class="el__index-back">2</div>
        <div class="el__index-front">
          <div class="el__index-overlay" data-index="2">2</div>
        </div>
      </div>
    </div>
    <!-- el end -->
    <!-- el start -->
     <!-- el start -->
    <div class="el">
      <div class="el__overflow">
        <div class="el__inner">
          <div class="el__bg"></div>
          <div class="el__preview-cont">
            <h2 class="el__heading">Admin Login</h2>
          </div>
          <div class="el__content">
            <div class="el__text">Admin Login</div>
            <div class="w3-container"> <a href="admin.jsp" class="w3-button w3-black">Login</a></div>
            <div class="el__close-btn"></div>
          </div>
        </div>
      </div>
      <div class="el__index">
        <div class="el__index-back">3</div>
        <div class="el__index-front">
          <div class="el__index-overlay" data-index="3">3</div>
        </div>
      </div>
    </div>
    <!-- el end -->
  </div>
  <!-- cont inner end -->
</div>

  
        
        <script>
            var $cont = document.querySelector('.cont');
var $elsArr = [].slice.call(document.querySelectorAll('.el'));
var $closeBtnsArr = [].slice.call(document.querySelectorAll('.el__close-btn'));

setTimeout(function() {
  $cont.classList.remove('s--inactive');
}, 200);

$elsArr.forEach(function($el) {
  $el.addEventListener('click', function() {
    if (this.classList.contains('s--active')) return;
    $cont.classList.add('s--el-active');
    this.classList.add('s--active');
  });
});

$closeBtnsArr.forEach(function($btn) {
  $btn.addEventListener('click', function(e) {
    e.stopPropagation();
    $cont.classList.remove('s--el-active');
    document.querySelector('.el.s--active').classList.remove('s--active');
  });
});


        </script>
    </body>
</html>
