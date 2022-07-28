<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="GrailsCore.User" %>
<html>
<head>
    <title>Login</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
<style>
    #body{
        width: 70%;
        margin-top: 40px;
        margin-left: 200px;
    }

#myForm {
    border-radius: 5px;
    background-color: #f2f2f2;
    padding: 20px;
}

.formFields {
    width: 100%;
    padding: 12px 20px;
    margin: 8px 0;
    border: 2px solid #000000;
    box-sizing: border-box;
}

.formButton {
    margin-left: 10px;
    width: 45%;
    background-color: white;
    color: black;
    border: 2px solid #04AA6D;
    padding: 10px 20px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
}

.formButton:hover {
    background-color: #04AA6D;
    color: white;
}

#header {
    text-align: center;
    background: #1abc9c;
    color: white;
    font-size: 30px;
}

</style>
<body>
<div id="body">
<div id="header">
    <h1><g:message code="default.heading.label" default="Grails CRUD" /></h1>
</div>
    <h2><g:message code="default.login.label" default="User Login" /></h2>
    <div class="modal fade" id="registerUserPopup" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title"><g:message code="default.register.label" default="User Registration"/></h4>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="form">
                <g:form url="[controller:'user', action:'saveUser']" >
                <div class="modal-body">
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-success"><g:message code="default.button.create.label" default="Create" /></button>
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                </div>
                </g:form>
                </div>
            </div>
        </div>
    </div>
<div id="myForm">
<g:form name="loginForm" action="validateUser">
    <label>
        <g:message code="default.email.label" default="Email-ID" /> :
    </label>
    <g:textField class="formFields" name="email" required=""/><br/>
    <label>
        <g:message code="default.password.label" default="Password"/> :
    </label>
    <g:passwordField class="formFields" name="password" required=""/><br/>
    <g:submitButton class="btn btn-outline-success" name="login" value="Login" />
    <button type="button" id="registerUser" class="btn btn-outline-primary"><g:message code="default.signup.label" default="Signup"/></button>
</g:form>
</div>
</div>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
<script>
    $(document).on('click','#registerUser',function (){
        $.ajax({
            url: "http://localhost:8080/GrailsCore/user/registerUser",
            dataType: 'json',
            success: function (response){
                $('.modal-body').html(response.form);
                $('#registerUserPopup').modal('show');
            }
        });
    });

</script>
</html>