require 'google/api_client/client_secrets'

class AuthenticationController < ApplicationController

  def google
    id_token = params[:id_token]

    response = GoogleApi.new.verify_id_token(id_token)
    if response.code != 200
      Rails.logger.error("Could not verify id token: #{response.body}")
      render json: response.body, status: response.code
      return
    end

    account_id = response.parsed_response['sub']
    user = User.find_or_create_by!(account_id: account_id) do |user|
      user.name = response.parsed_response['name']
      user.email = response.parsed_response['email']
    end

    render json: user
  rescue Exception => e
    Rails.logger.error("#{e.message}\n " + e.backtrace.join("\n "))
    respond_to do |format|
      format.json {render json: "Internal server error occured: #{e.message}", status: 500}
    end
  end

end
