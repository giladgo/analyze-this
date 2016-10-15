class ApplicationController < ActionController::API
  include ActionController::MimeResponds
  include ActionController::Serialization

  def current_user
    user_id = request.headers["X-User-Id"]
    User.find(user_id) if user_id.present?
  end
end
