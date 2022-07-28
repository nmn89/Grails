<div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">User Profile</h5>
                 <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <g:form  url="[resource:user, action:'updateUser']" method="PUT" >
<div class="modal-body">
    <label for="name">
        <g:message code="default.user.name.label" default="Name"/>
    </label>
    <g:textField class="formFields" name="name" maxlength="25" required="" value="${user?.name}" /><br/>

    <label for="age">
        <g:message code="default.user.age.label" default="Age"/>
    </label>
    <g:field class="formFields" name="age" type="number" min="18" required="" value="${user?.age}"/><br/>

    <label for="email">
        <g:message code="default.email.label" default="Email" />
    </label>
    <g:field class="formFields" type="email" name="email" required="" value="${user?.email}"/><br/>

    <label for="password">
        <g:message code="default.password.label" default="Password" />
    </label>
    <g:passwordField class="formFields" name="password" maxlength="30" required="" value="${user?.password}"/><br/>
    </div>
    <div class="modal-footer">
    <button type="submit" class="btn btn-success"><g:message code="default.button.update.label" default="Update" /></button>
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
      </div>
</g:form>
