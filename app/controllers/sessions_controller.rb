class SessionsController < Devise::SessionsController
  protected
    def after_sign_in_path_for(resource)
      flash[:notice] = "Welcome #{resource.username}"
      super
    end
end
