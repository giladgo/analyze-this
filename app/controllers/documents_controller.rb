require 'google/apis/drive_v3'
require 'google/api_client/client_secrets'

Drive = Google::Apis::DriveV3

class DocumentsController < ApplicationController

  def import_google_drive_resource
    drive_id = params[:drive_id]
    Rails.logger.debug("Importing google drive resource with id: #{drive_id}")

    client_secrets = Google::APIClient::ClientSecrets.load('config/client_secrets.json')
    auth_client = client_secrets.to_authorization
    auth_client.access_token = current_user.access_token
    auth_client.refresh_token = current_user.refresh_token
    auth_client.refresh!

    drive = Drive::DriveService.new
    drive.authorization = auth_client
    drive.client_options.application_name = "Analyze This - Dev"

    Google::Apis.logger.level = Logger::DEBUG
    content = drive.get_file(drive_id, download_dest: StringIO.new)
    VisaCalDocumentParser.new(content.string)
  end

end