class GoogleDriveService
  require 'google/apis/drive_v3'
  require 'google/api_client/client_secrets.rb'

  # https://developers.google.com/drive/v3/reference/

  # TODO: at some point this will have to be getting content
  # by a variety of user id's, or from a shared location in quip
  # that all contributors are adding to.


  # GET https://www.googleapis.com/drive/v3/files/fileId
  def self.get_document(user, id)
    client = get_authorized_client(user)
    client.get_file(id, fields:'createdTime,description,fileExtension,modifiedTime,name,originalFilename,owners,webContentLink')
  end

  # GET https://www.googleapis.com/drive/v3/files
  def self.get_all_documents(user)
    client = get_authorized_client(user)
    client.list_files(fields: 'files(id,name,created_time,modified_time,kind,mime_type,web_view_link)').files
  end

  def self.export(user, id, format='text/html')
    client = get_authorized_client(user)
    file = client.export_file(id, format)
  end


  private

  # see first comment here: http://www.thegreatcodeadventure.com/using-the-google-api-ruby-client-with-google-calendar-api/
  def self.get_authorized_client(user)
    secrets = Google::APIClient::ClientSecrets.new( user.google_secrets )
    client = Google::Apis::DriveV3::DriveService.new
    client.authorization = secrets.to_authorization
    client.authorization.refresh!
    client
  end

end