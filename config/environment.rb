# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Ivity::Application.initialize!

# Render diffrent view for devise
  Devise::SessionsController.layout "devise"
  Devise::RegistrationsController.layout proc{ |controller| user_signed_in? ? "application" : "devise" }
  Devise::ConfirmationsController.layout "devise"
  Devise::UnlocksController.layout "devise"            
  Devise::PasswordsController.layout "devise"        
