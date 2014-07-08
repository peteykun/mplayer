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

      <g:form action="handleLogin" method="post">

      <input id="email" type='text' name='email' value='${admins?.email}' placeholder="john.smith@gmail.com" /><br>
      
      <input id="password" type='password' name='password' placeholder="Password" /><br>

      <input class="left" type="submit" value="Login">
      <g:link controller="registeredUser" action="register" class="button right">New here?</g:link>
      </g:form>
    </div>
  </body>
</html>