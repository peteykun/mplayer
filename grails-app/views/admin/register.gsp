<g:if test="${flash.message}">
  <div class="alert alert-error" style="display: block">${flash.message}</div>
</g:if>

<g:form action="handleRegistration" method="post">

Email: <br><input id="email" type='text' name='email' value='${admins?.email}' /><br>
Password: <br><input id="password" type='password' name='password' /><br>
Confirm: <br><input id="confirm" type='password' name='confirm' /><br>

<input type="submit">
</g:form>