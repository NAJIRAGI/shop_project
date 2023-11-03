<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ include file="../layout/header.jsp"%>
<style>
body {
    background: #eee
}

#regForm {
    background-color: #ffffff;
    margin: 0px auto;
    font-family: Raleway;
    padding: 40px;
    border-radius: 10px
}

#register{

  color: #6A1B9A;
}

h1 {
    text-align: center
}

input {
    padding: 10px;
    width: 100%;
    font-size: 17px;
    font-family: Raleway;
    border: 1px solid #aaaaaa;
    border-radius: 10px;
    -webkit-appearance: none;
}



.tab input:focus{

  border:1px solid #6a1b9a !important;
  outline: none;
}

input.invalid {
 
    border:1px solid #e03a0666;
}

.tab {
    display: none
}

button {
    background-color: #6A1B9A;
    color: #ffffff;
    border: none;
    border-radius: 50%;
    padding: 10px 20px;
    font-size: 17px;
    font-family: Raleway;
    cursor: pointer
}

button:hover {
    opacity: 0.8
}

button:focus{

  outline: none !important;
}

#prevBtn {
    background-color: #bbbbbb
}


.all-steps{
      text-align: center;
    margin-top: 30px;
    margin-bottom: 30px;
    width: 100%;
    display: inline-flex;
    justify-content: center;
}

.step {
       height: 40px;
    width: 40px;
    margin: 0 2px;
    background-color: #bbbbbb;
    border: none;
    border-radius: 50%;
    display: flex;
    justify-content: center;
    align-items: center;
    font-size: 15px;
    color: #6a1b9a;
    opacity: 0.5;
}

.step.active {
    opacity: 1
}


.step.finish {
   color: #fff;
   background: #6a1b9a;
   opacity: 1;

}



.all-steps {
    text-align: center;
    margin-top: 30px;
    margin-bottom: 30px
}

.thanks-message {
    display: none
}
</style>
<div class="container mt-5">
    <div class="row d-flex justify-content-center align-items-center">
        <div class="col-md-8">
            <form id="regForm">
                <h1 id="register">회원 가입</h1>
                <div class="all-steps" id="all-steps"> 
                  <span class="step"><i class="fa fa-user"></i></span> 
                  <span class="step"><i class="fa fa-key"></i></span>
                  <span class="step"><i class="fa fa-signature"></i></span>
                  <span class="step"><i class="fa fa-phone"></i></span>
                  <span class="step"><i class="fa fa-envelope"></i></span>
                  <span class="step"><i class="fa fa-location-dot"></i></span>
                </div>

                <div class="tab">
                  <h6>ID</h6>
                    <p>
                      <input placeholder="ID..." oninput="this.className = ''" id="username" name="fname"></p>
                    
                </div>
                <div class="tab">
                  <h6>Password</h6>
                    <p><input placeholder="Password..." oninput="this.className = ''" id="password" name="dd"></p>
                    
                </div>
                <div class="tab">
                    <h6>Name</h6>
                    <p><input placeholder="Name..." oninput="this.className = ''" id="name" name="email"></p>
                 
                </div>
                <div class="tab">
                    <h6>Phone Number</h6>
                    <p><input placeholder="Number" oninput="this.className = ''" id="tel" name="uname"></p>
                </div>

                <div class="tab">
                    <h6>Email</h6>
                    <p><input placeholder="Email..." oninput="this.className = ''" id="email" name="uname"></p>
                </div>


                <div class="tab">
                    <h6>Address</h6>
                    <p><input placeholder="Address" oninput="this.className = ''" id="address" name="uname"></p>
                </div>
                <div class="thanks-message text-center" id="text-message"> <button id="btn-save"><img src="https://i.imgur.com/O18mJ1K.png" width="100" class="mb-4"></button>
                    <h3>회원 가입을 축하드립니다!</h3> <span>최상의 서비스로 보답드리겠습니다! 완료하시려면 이미지를 클릭해주세요!</span>
                </div>
                <div style="overflow:auto;" id="nextprevious">
                    <div style="float:right;">
                      <button type="button" id="prevBtn" onclick="nextPrev(-1)"><i class="fa fa-angle-double-left"></i></button> 
                      <button type="button" id="nextBtn" onclick="nextPrev(1)"><i class="fa fa-angle-double-right"></i></button> </div>
                </div>
            </form>
        </div>
    </div>
</div>
<script src="/js/user.js"></script>
<br/>
<%@ include file="../layout/footer.jsp"%>