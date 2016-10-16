class UserController < ApplicationController

  def create
    id_token = params[:id_token]
    user = User.find_by(id_token: id_token)
    if user.present?
      render json: user
      return
    end

    response = GoogleApi.new.verify_id_token(id_token)
    if response.code != 200
      Rails.logger.error("Could not verify id token: #{response.body}")
      render json: response.body, status: response.code
      return
    end

    user = User.find_or_create_by!(id_token: id_token) do |user|
      user.email = response.parsed_response['email']
      user.name = response.parsed_response['name']
    end
    render json: user
  rescue Exception => e
    Rails.logger.error("#{e.message}\n " + e.backtrace.join("\n "))
    respond_to do |format|
      format.json {render json: "Internal server error occured: #{e.message}", status: 500}
    end
  end
end