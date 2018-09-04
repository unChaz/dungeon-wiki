class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def ensure_json_request
    return if request.format == :json
    render :not_found => true, :status => 406
  end

  def ensure_current_user
    return if current_user.present?
    render :not_found, :status => 404
  end
end
