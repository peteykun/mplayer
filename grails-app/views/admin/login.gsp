<div id="login_box">

  <g:if test="${flash.message}">
    <div class="alert alert-error" style="display: block">${flash.message}</div>
  </g:if>

  <g:form action="handleLogin" method="post">

  Email: <br><input id="email" type='text' name='email' value='${admins?.email}' placeholder="admin@example.com" autofocus /><br>
  Password: <br><input id="password" type='password' name='password' placeholder="password" /><br>

  <input type="submit">
  </g:form>

</div>