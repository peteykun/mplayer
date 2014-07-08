package mplayer

class RegisteredUserController {
  
  def beforeInterceptor = [action:this.&checkUser, except: 'logout']
  
  def checkUser() {
    if(session.registeredUser) {
      redirect(controller:'player',action:'index')
      return false
    }
  }

  def login = {
    if (session.registeredUser) {
      redirect(controller:'player', action:'index')
    }
  }

  def handleLogin = {
    def registeredUser = RegisteredUser.findByEmail(params.email)
    
    if (!registeredUser) {
      flash.message = "User not found for email ${params.email}"
      redirect(action:'login')
      return
    }

    if (registeredUser.password != params.password.encodeAsPassword()) {
      flash.message = "Incorrect password for ${params.email} (expected " + registeredUser.password + ", got" + params.password.encodeAsPassword() + ")"
      redirect(action:'login')
      return
    }

    session.registeredUser = registeredUser
    redirect(controller:'player', action:'index')
  }

  def register = {}

  def handleRegistration = {
    def registeredUser = new RegisteredUser(params)
    
    if (params.password != params.confirm) {
      flash.message = "The passwords you entered do not match."
      redirect(action:'register')
      return
    }

    registeredUser.password = params.password.encodeAsPassword()

    if (!registeredUser.save()) {
      flash.registeredUser = registeredUser
      redirect(action:'register')

      System.out.println(params.password.encodeAsPassword())
      System.out.println(registeredUser.password)
      System.out.println(registeredUser.errors)

      return
    }

    redirect(controller:'player', action:'index')
  }

  def logout = {
    if (session.registeredUser) {
      session.registeredUser = null
    }

    redirect(action:'login')
  }
}