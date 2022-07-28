<%@ page contentType="text/html;charset=UTF-8" %>
<div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Add Book</h5>
                 <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
<g:form url="[controller:'book', action:'saveBook']" >
<div class="modal-body">

            <label for="bookName">
                Book Name
            </label>
            <g:textField class="formFields" name="bookName" maxlength="50" required="" value="${book?.bookName}" /><br/>

            <label for="authorName">
                Author Name
            </label>
            <g:textField class="formFields" name="authorName" maxlength="50" required="" value="${book?.authorName}" /><br/>

            <label for="language">
                Language
            </label>
            <g:textField class="formFields" name="language" maxlength="15" required="" value="${book?.language}"/><br/>

            <g:hiddenField name="user.id" value="${id}" />
    </div>
    <div class="modal-footer">
        <button type="submit" class="btn btn-success">Add Book</button>
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
    </div>
</g:form>