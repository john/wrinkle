class GoogleDriveService
  require 'google/apis/drive_v3'
  require 'google/api_client/client_secrets.rb'


  # TODO: at some point this will have to be getting content
  # by a variety of user id's, or from a shared location in quip
  # that all contributors are adding to.

  def self.get_document(document_id)
  end

  # at the moment this is actually getting all desktop threads. same thing as all threads?
  def self.get_all_documents( user )
    secrets = Google::APIClient::ClientSecrets.new( user.google_secrets )
    drive = Google::Apis::DriveV3::DriveService.new
    drive.authorization = secrets.to_authorization
    drive.authorization.refresh!
    drive.list_files.files
  end

end