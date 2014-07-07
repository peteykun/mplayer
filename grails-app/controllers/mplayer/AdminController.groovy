package mplayer

class AdminController {

  def beforeInterceptor = [action:this.&checkAdmin, except: 'logout']
  
  def checkAdmin() {
    if(session.admin) {
      redirect(controller:'albumsAdmin',action:'index')
      return false
    }
  }

  def login = {
    if (session.admin) {
      redirect(controller:'albumsAdmin', action:'index')
    }
  }

  def handleLogin = {
    def registeredUser = Admin.findByEmail(params.email)
    
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

    session.admin = registeredUser
    redirect(controller:'albumsAdmin', action:'index')
  }

  def handleRegistration = {
    def registeredUser = new Admin(params)
    
    if (params.password != params.confirm) {
      flash.message = "The passwords you entered do not match."
      redirect(action:'register')
      return
    }

    registeredUser.password = params.password.encodeAsPassword()

    if (!registeredUser.save()) {
      flash.admin = registeredUser
      redirect(action:'register')

      System.out.println(params.password.encodeAsPassword())
      System.out.println(registeredUser.password)
      System.out.println(registeredUser.errors)

      return
    }

    redirect(controller:'albumsAdmin', action:'index')
  }

  def logout = {
    if (session.admin) {
      session.invalidate()
    }

    redirect(action:'login')
  }
}
