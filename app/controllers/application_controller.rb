class ApplicationController < ActionController::Base
  # TODO: Why is this needed?
  skip_before_action :verify_authenticity_token
end
