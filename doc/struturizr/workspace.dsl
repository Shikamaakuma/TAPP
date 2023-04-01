!constant PROJECT_NAME "TAPP"
!constant DATABASE "Database"
!constant WEB_APP "Web app"
!constant PERSON "Person"
!constant BROSWER "Broswer"
!constant FLUTTER "Flutter"
!constant INTERNAL "Internal"

workspace {

    !identifiers hierarchical

    model {
        user_athlete = person "Athele" {
        	tags PERSON
        }
        user_coach = person "Coach" {
        	tags PERSON
        }
        
        softwareSystem = softwareSystem "${PROJECT_NAME}" {
        	web_app = container "Web App" {
        		tags WEB_APP BROSWER
        		technology "Flutter"
        		description "Provides all the functionality over the web broswer"
        		
        		user_athlete -> this "Uses"
        		user_coach -> this "Uses"
        	}
        	
        	api = container "API" {
        		tags "${WEB_APP}"
        		technology "Java and Spring Boot"
        		description "Provides a REST API"
        		
        		web_app -> this "Uses"
        	}
        	
        	database = container "Database" {
        		tags "DATABASE" 
        		
        		api -> this "Uses"
        	}
        	
        }

        
    }

    views {
        systemContext softwareSystem "Diagram1" {
            include *
            autoLayout
        }
        
        container softwareSystem "Containers_All" {
            include *
            autolayout
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
        }
        
    }

}
