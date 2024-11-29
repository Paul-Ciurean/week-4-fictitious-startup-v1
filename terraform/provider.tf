terraform { 
  cloud { 
    
    organization = "Cloud-Talents-Org" 

    workspaces { 
      name = "Backend-week4" 
    } 
  } 
}

terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "5.73.0"
    }
  }
}