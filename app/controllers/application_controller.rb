class ApplicationController < ActionController::Base
  include Pagy::Backend

  before_action :authenticate_user!

  include ErrorHandling

  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.html { redirect_to root_url, alert: exception.message }
      format.js { head :forbiddens }
      format.json { head :forbidden }
    end
  end
end
