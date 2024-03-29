package mplayer



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ArtistsAdminController {
  
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
        respond Artist.list(params), model:[artistInstanceCount: Artist.count()]
    }

    def show(Artist artistInstance) {
        respond artistInstance
    }

    def create() {
        respond new Artist(params)
    }

    @Transactional
    def save(Artist artistInstance) {
        if (artistInstance == null) {
            notFound()
            return
        }

        if (artistInstance.hasErrors()) {
            respond artistInstance.errors, view:'create'
            return
        }

        artistInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'artist.label', default: 'Artist'), artistInstance.id])
                redirect(controller: "artistsAdmin", action: "show", id: artistInstance.id)
            }
            '*' { respond artistInstance, [status: CREATED] }
        }
    }

    def edit(Artist artistInstance) {
        respond artistInstance
    }

    @Transactional
    def update(Artist artistInstance) {
        if (artistInstance == null) {
            notFound()
            return
        }

        if (artistInstance.hasErrors()) {
            respond artistInstance.errors, view:'edit'
            return
        }

        artistInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Artist.label', default: 'Artist'), artistInstance.id])
                redirect(controller: "artistsAdmin", action: "show", id: artistInstance.id)
            }
            '*'{ respond artistInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Artist artistInstance) {

        if (artistInstance == null) {
            notFound()
            return
        }

        artistInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Artist.label', default: 'Artist'), artistInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'artist.label', default: 'Artist'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
