<%@ page contentType="text/html;charset=UTF-8" %>
<div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel"><g:message code="default.add.Book.label" default="Add Book"/></h5>
                 <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
<g:form url="[controller:'book', action:'saveBook']" >
<div class="modal-body">

            <label for="bookName">
                <g:message code="default.book.name.label" default="Book Name"/>
            </label>
            <g:textField class="formFields" name="bookName" maxlength="50" required="" value="${book?.bookName}" /><br/>

            <label for="authorName">
                <g:message code="default.book.author.label" default="Author Name" />
            </label>
            <g:textField class="formFields" name="authorName" maxlength="50" required="" value="${book?.authorName}" /><br/>

            <label for="language">
                <g:message code="default.book.language.label" default="Language" />
            </label>
            <g:textField class="formFields" name="language" maxlength="15" required="" value="${book?.language}"/><br/>

            <g:hiddenField name="user.id" value="${id}" />
    </div>
    <div class="modal-footer">
        <button type="submit" class="btn btn-success"><g:message code="default.add.Book.label" default="Add Book"/></button>
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
    </div>
</g:form>