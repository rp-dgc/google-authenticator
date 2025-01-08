module GoogleAuthenticatorRails
  class Railtie < Rails::Railtie
    rake_tasks do
      load "tasks/google_authenticator.rake"
    end

    initializer "google-authenticator-rails" do
      ActiveSupport.on_load(:action_controller) do
        if name == "ActionController::Base"
          include GoogleAuthenticatorRails::ActionController::Integration
        end
      end
    end
  end
end
