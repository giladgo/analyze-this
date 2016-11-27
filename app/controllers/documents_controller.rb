require 'google/apis/drive_v3'
require 'google/api_client/client_secrets'

Drive = Google::Apis::DriveV3

class DocumentsController < ApplicationController

  def create
    document_id = params[:document_id]
    document = current_user.documents.find_by(document_id: document_id)
    if document.present?
      Rails.logger.debug("Ignoring attempt to import an existing document: #{document_id}")
      return
    end

    file = params['multipart/form-data']
    io = StringIO.new(file[0])
    transactions = VisaCalDocumentParser.new.parse(io)

    document = current_user.documents.create!(document_id: document_id)
    TransactionsCreator.create_transactions(current_user, document, transactions)
  end

end