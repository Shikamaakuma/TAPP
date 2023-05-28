!constant PROJECT_NAME "TAPP"
!constant DATABASE "Database"
!constant WEB_APP "Web app"
!constant PERSON "Person"
!constant BROSWER "Broswer"
!constant FLUTTER "Flutter"
!constant INCLUDED "Included"

workspace {

    !identifiers hierarchical

    model {
        user_athlete = person "Athele" {
        	tags PERSON ROLE PLANNED
        }
        user_coach = person "Coach" {
        	tags PERSON ROLE
        }
        
        emailSystem = softwareSystem "E-Mail System" {
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

        		}

        		controller_component = component "Controller" {

        		}

        		

        		user_athlete -> view_component "Uses"
        		user_coach -> view_component "Uses"
        	}
        	
        	api = container "API" {
        		tags WEB_APP INCLUDED
        		technology "Java and Spring Boot"
        		description "Provides a REST API"
        		
        		web_app -> this "Uses"
        		this -> emailSystem "Sends e-mails using"
        	}
        	
        	database = container "Database" {
        		tags DATABASE INCLUDED
        		technology "To be defined"
        		description "Stores all informations"
        		
        		api -> this "Reads from and writes to" "SQL/TCP"
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
		    color red
		}

        }
        
    }

}
