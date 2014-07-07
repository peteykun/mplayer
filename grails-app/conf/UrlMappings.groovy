class UrlMappings {

	static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "/admin/$adminController/$action?/$id?(.$format)?"{
            controller = { "${params.adminController}Admin" }
        }

        "/login"(controller:"registeredUser",action:"login")
        "/register"(controller:"registeredUser",action:"register")
        "/logout"(controller:"registeredUser",action:"logout")

        "/admin"(controller:"admin",action:"login")

        "/"(controller:"registeredUser",action:"login")
        "500"(view:'/error')
	}
}
