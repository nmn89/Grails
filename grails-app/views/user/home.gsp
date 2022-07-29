<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="GrailsCore.User" %>
<html>
<head>
    <title>User List</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/bs5/dt-1.12.1/datatables.min.css"/>

    <script type="text/javascript" src="https://cdn.datatables.net/v/bs5/dt-1.12.1/datatables.min.js"></script>
</head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
<style>
    /*#bookTable {*/
    /*    font-family: Arial, Helvetica, sans-serif;*/
    /*    border-collapse: collapse;*/
    /*    width: 100%;*/
    /*}*/

    /*#bookTable td, #userTable th {*/
    /*    border: 1px solid #ddd;*/
    /*    padding: 8px;*/
    /*}*/

    /*#bookTable tr:nth-child(even){background-color: #f2f2f2;}*/

    /*#bookTable th {*/
    /*    padding-top: 12px;*/
    /*    padding-bottom: 12px;*/
    /*    text-align: left;*/
    /*    background-color: #04AA6D;*/
    /*    color: white;*/
    /*}*/

    .editButton {
        background-color: white;
        color: black;
        border: 2px solid #04AA6D;
        padding: 10px 20px;
        text-align: center;
        text-decoration: none;
        display: inline-block;
    }

    .editButton:hover {
        background-color: #04AA6D;
        color: white;
    }
    .formFields {
        width: 100%;
        padding: 12px 20px;
        margin: 8px 0;
        border: 2px solid #000000;
        box-sizing: border-box;
    }

    .homeButton {
        font-size: 1.3em;
        color: white;
        text-decoration: none;
        margin-right: 5px;
        cursor: pointer;
    }

    #errorMessage {
        text-align: center;
        color: red;
    }

    #header {
        margin-top: 20px;
        padding: 2px 3px 4px 5px;
        text-align: center;
        font-size: 30px;
    }
</style>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
<body>
    <nav class="navbar navbar-expand-lg navbar-light bg-Secondary">
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav me-auto mb-2 mt-2 mb-lg-0">
            <li><h1>Grails CRUD</h1></li>
            <li class="nav-item"><a class="homeButton" id="addBook" style="margin-left: 630px;margin-right: 60px;"><g:message code="default.add.Book.label" default="Add Book"/></a></li>
            <li class="nav-item"><a class="homeButton" id="editUserAccount" style="margin-right: 60px;"><g:message code="default.edit.User.label" default="Edit Account"/></a></li>
            <li class="nav-item"><a class="homeButton" href="<g:createLink controller="user" action="login" />">Logout</a></li>
        </ul>
    </div>
</nav>
<div id="header">
<h1><g:message code="default.book.label" default="Books" /></h1>
</div>
<div class="modal fade" id="addPopup" role="dialog">
</div>
<div>
    <h4 id="errorMessage"><em>${msg}</em></h4>
</div>
    <div id="list-user" class="content scaffold-list" role="main">
            <g:render template="showBook"/>
</div>
</body>
<script>
    $(document).on('click','#addBook',function (){
        $.ajax({
            url: "http://localhost:8080/GrailsCore/book/addBook",
            data:{
                id: ${userId}
            },
            dataType: 'json',
            success: function (response){
                $('#addPopup').html(response.form);
                $('#addPopup').modal('show');
            }
        });
    });

    $(document).on('click','#editUserAccount',function (){
        $.ajax({
            url: "http://localhost:8080/GrailsCore/user/editUser",
            data:{
                id: ${userId}
            },
            dataType: 'json',
            success: function (response){
                $('#addPopup').html(response.form);
                $('#addPopup').modal('show');
            }
        });
    });

    $(document).ready(function (){
        $(document).on('click','#updateBook',function (){
            var bookId = $(this).attr('value');
            $.ajax({
                url: "http://localhost:8080/GrailsCore/book/editBook",
                data:{
                    bookId: bookId
                },
                dataType: 'json',
                success: function (response){
                    $('#addPopup').html(response.form);
                    $('#addPopup').modal('show');
                }
            });
        });
    });
</script>
</html>