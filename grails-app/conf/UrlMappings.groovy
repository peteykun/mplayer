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

        "/"(view:"/index")
        "500"(view:'/error')
	}
}
