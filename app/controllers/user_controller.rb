require 'google/api_client/client_secrets'

class UserController < ApplicationController

  def create
    id_token = params[:id_token]
    auth_code = params[:auth_code]
    refresh_tokens = params[:refresh_tokens] == 'true'

    response = GoogleApi.new.verify_id_token(id_token)
    if response.code != 200
      Rails.logger.error("Could not verify id token: #{response.body}")
      render json: response.body, status: response.code
      return
    end

    email = response.parsed_response['email']
    user = User.find_or_create_by!(email: email) do |user|
      user.email = email
      user.name = response.parsed_response['name']
    end

    if refresh_tokens
      client_secrets = Google::APIClient::ClientSecrets.load('config/client_secrets.json')
      auth_client = client_secrets.to_authorization
      auth_client.grant_type = 'authorization_code'
      auth_client.code = auth_code
      auth_client.fetch_access_token!
      user.update!(refresh_token: auth_client.refresh_token, access_token: auth_client.access_token)
    end

    render json: user
  rescue Exception => e
    Rails.logger.error("#{e.message}\n " + e.backtrace.join("\n "))
    respond_to do |format|
      format.json {render json: "Internal server error occured: #{e.message}", status: 500}
    end
  end
end
