<html>
  <head>
    <title>MPlayer</title>
    <asset:stylesheet src="flagship.css"/>
    <asset:stylesheet src="font-awesome.css"/>
  </head>

  <body>
    <div class="panel">
      <g:if test="${flash.message}">
        <div class="alert alert-error" style="display: block">${flash.message}</div>
      </g:if>

      <g:form action="handleRegistration" method="post">

      <input id="email" type='text' name='email' value='${admins?.email}' placeholder="john.smith@gmail.com" /><br>

      <input id="password" type='password' name='password' placeholder="Password" /><br>

      <input id="confirm" type='password' name='confirm' placeholder="Confirm Password" /><br>

      <input class="left" type="submit" value="Register">
      <g:link controller="registeredUser" action="login" class="button right">Returning?</g:link>
      </g:form>
    </div>
  </body>
</html>