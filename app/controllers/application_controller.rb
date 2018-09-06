class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def ensure_json_request
    return if request.format == :json
    render :index
  end

  def ensure_current_user
    return if current_user.present?
    redirect_to '/404.html'
  end
end
