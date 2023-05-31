!constant PROJECT_NAME "TAPP"
!constant DATABASE "Database"
!constant WEB_APP "Web app"
!constant PERSON "Person"
!constant BROSWER "Broswer"
!constant FLUTTER "Flutter"
!constant INCLUDED "Included"

workspace {


    model {
        user_athlete = person "Athlete" {
        	tags PERSON ROLE PLANNED
        }
        user_coach = person "Coach" {
        	tags PERSON ROLE
        }
        
        emailSystem = softwareSystem "E-Mail System" {
			tags PLANNED
        	description "Send mails to users"
        	
        	this -> user_athlete "Sends e-mail to"
        	this -> user_coach "Sends e-mail to"
        }
        
        softwareSystem = softwareSystem "${PROJECT_NAME}" {
        	description "Allows users to manage skills of a group of athletes for training planning"
        	tags INCLUEDED
        
        	web_app = container "Web App" {
        		tags WEB_APP BROSWER INCLUDED
        		technology "Flutter"
        		description "Provides all the functionality over the web broswer"
        		
        		user_athlete -> this "Uses"
        		user_coach -> this "Uses"

        		view_component  = component "View" {
					tags INCLUDED
					technology "Flutter Widget"
        			description "Contains the views"
        		}

        		controller_component = component "Controller" {
					tags INCLUDED
					technology "Flutter Getx Widget"
        			description "Handles the data and events from a view"
        		}

				feature_component = component "Feature" {
					tags INCLUDED
					technology "Flutter Getx Service"
        			description "Handdels the data loading, chaching and storing"
        		}

        		service_component = component "Service" {
					tags INCLUDED
					technology "Flutter Getx Service"
        			description "Handdels the data loading, chaching and storing"
        		}

        		api_provider_component = component "GApiProvider" {
					tags INCLUDED
					technology "Flutter GetConnect"
        			description "Provides interfaces to the backend"
        		}

        		local_storage_provider_component = component "LocalStorageProvider" {
					tags INCLUDED
					technology "Flutter"
        			description "Provides interfaces to store data locally"
        		}

        		local_storage_component = component "Local Storage" {
        		    tags DATABASE INCLUDED
					technology "SharedPreferences"
        			description "Contains the views"
        		}

        		view_component -> controller_component "Sends user actions and listens for updates"
				controller_component -> service_component "Loads data"
				controller_component -> feature_component "Performs changens on models"
				feature_component -> service_component "Updates the current data"
				feature_component -> api_provider_component "Load and update data from the backend"
				feature_component -> local_storage_provider_component "Load and update data from the local storage"
				local_storage_provider_component -> local_storage_component "Load and store data in the local storage"

        		user_athlete -> view_component "Uses"
        		user_coach -> view_component "Uses"
        	}
        	
        	api = container "API" {
        		tags WEB_APP INCLUDED
        		technology "Java and Spring Boot"
        		description "Provides a REST API"

				backend_controller_component  = component "Controller" {
					tags INCLUDED
					technology "SpringController"
        			description "Contains the REST Api Endpoints"
        		}

        		repository_component = component "Repository" {
					tags INCLUDED
					technology "SpringRepository"
        			description "Sql Representation to query the database "
        		}

				model_component = component "Model" {
					tags INCLUDED
					technology "SpringModel"
        			description "Sql representation of the database"
        		}

				api_provider_component -> backend_controller_component "Uses" "HTTPS"
        		this -> emailSystem "Sends e-mails using"

				backend_controller_component -> repository_component
				repository_component -> model_component
        	}
        	
        	database = container "Database" {
        		tags DATABASE INCLUDED
        		technology "PostgreSQL"
        		description "Stores all informations"
        		
        		model_component -> this "Reads from and writes to" "SQL/TCP"
        	}
        	
        }
       

        
    }

    views {
        systemContext softwareSystem "Diagram1" {
            include *
        }
        
        container softwareSystem "Containers_All" {
            include *
        }

		component web_app "Components" {
			include *
		}

		component api "Api" {
			include *
		}
        
        styles {
		element PERSON {
		        shape Person
		    }
		    
		element DATABASE {
			shape cylinder
		}
		
		element BROSWER {
			shape WebBrowser
		}
		
		element INCLUDED {
			color #ffffff
			background #33aaff 
		}
		
		element ROLE {
			color #ffffff
			background #0011bb
		}

		element PLANNED {
		    background red
			color white
		}

        }
        
    }

}
