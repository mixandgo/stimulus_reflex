class RegistrationsController < Devise::RegistrationsController

  protected

    def after_sign_up_path_for(resource)
      flash[:notice] = "Welcome #{resource.username}"
      super
    end
end
