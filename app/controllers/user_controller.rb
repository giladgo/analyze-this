class UserController < ApplicationController

  def create
    id_token = params[:id_token]
    response = GoogleApi.new.verify_id_token(id_token)
    if response.code == 200
      email = response.body['email']
      user = User.find_or_create_by!(email: email) do |user|
        user.name = response.body['name']
      end

      respond_to do |format|
        format.json {render json: user}
      end
    else
      respond_to do |format|
        format.json {render json: response.body, status: response.code}
      end
    end
  rescue Exception => e
    Rails.logger.error("#{e.message}\n " + e.backtrace.join("\n "))
    respond_to do |format|
      format.json {render json: "Internal server error occured: #{e.message}", status: 500}
    end
  end
end