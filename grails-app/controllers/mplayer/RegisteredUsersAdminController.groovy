package mplayer



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class RegisteredUsersAdminController {
  
    def beforeInterceptor = [action:this.&checkAdmin]

    def checkAdmin() {
      if(!session.admin) {
        redirect(controller:'admin',action:'login')
        return false
      }
    }

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond RegisteredUser.list(params), model:[registeredUserInstanceCount: RegisteredUser.count()]
    }

    def show(RegisteredUser registeredUserInstance) {
        respond registeredUserInstance
    }

    def create() {
        respond new RegisteredUser(params)
    }

    @Transactional
    def save(RegisteredUser registeredUserInstance) {
        if (registeredUserInstance == null) {
            notFound()
            return
        }

        if (registeredUserInstance.hasErrors()) {
            respond registeredUserInstance.errors, view:'create'
            return
        }

        registeredUserInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'registeredUser.label', default: 'RegisteredUser'), registeredUserInstance.id])
                redirect(controller: "registeredUsersAdmin", action: "show", id: registeredUserInstance.id)
            }
            '*' { respond registeredUserInstance, [status: CREATED] }
        }
    }

    def edit(RegisteredUser registeredUserInstance) {
        respond registeredUserInstance
    }

    @Transactional
    def update(RegisteredUser registeredUserInstance) {
        if (registeredUserInstance == null) {
            notFound()
            return
        }

        if (registeredUserInstance.hasErrors()) {
            respond registeredUserInstance.errors, view:'edit'
            return
        }

        registeredUserInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'RegisteredUser.label', default: 'RegisteredUser'), registeredUserInstance.id])
                redirect(controller: "registeredUsersAdmin", action: "show", id: registeredUserInstance.id)
            }
            '*'{ respond registeredUserInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(RegisteredUser registeredUserInstance) {

        if (registeredUserInstance == null) {
            notFound()
            return
        }

        registeredUserInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'RegisteredUser.label', default: 'RegisteredUser'), registeredUserInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'registeredUser.label', default: 'RegisteredUser'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
