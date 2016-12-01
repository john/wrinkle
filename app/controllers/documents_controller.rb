class DocumentsController < ApplicationController
  before_action :set_document, only: [:show, :edit, :update, :destroy]

  def index
    # TODO: make this part of generalization too
    @quip_docs = Document.where(source: 'quip')
    @google_docs = Document.where(source: 'google_drive')
    @wordpress_docs = Document.where(source: 'wordpress')
  end

  def show
  end

  def new
    @document = Document.new
  end

  def edit
  end

  def create
    @document = Document.new(document_params)

    if @document.save
      redirect_to @document, notice: 'Document was successfully created.'
    else
      render :new
    end
  end

  def update
    if @document.update(document_params)
      redirect_to @document, notice: 'Document was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @document.destroy
    redirect_to documents_url, notice: 'Document was successfully destroyed.'
  end

  def retrieve

    # TODO: refactor, too many conditions

    if params[:document_id].present?
      if params[:provider] == 'quip'
        # thread = api call to get specific thread
        # Document.create_or_update_from_quip_thread(thread)
      elsif params[:provider] == 'google_drive'
        file = GoogleDriveService.get_document(current_user, params[:document_id])
        Document.create_or_update_from_google_drive(file)
      end

    else
      if params[:provider] == 'quip'
        threads = QuipService.get_all_documents(current_user)
        threads.each do |thread|
          Document.create_or_update_from_quip(thread)
        end

      elsif params[:provider] == 'google_drive'
        files = GoogleDriveService.get_all_documents(current_user)
        files.each do |file|
          Document.create_or_update_from_google_drive(file)
        end
      elsif params[:provider] == 'wordpress'
        posts = WordpressService.get_posts(current_user)
        logger.debug "-------------> posts: #{posts.inspect}"
        posts.each do |post|
          Document.create_or_update_from_wordpress(post)
        end
      end
    end
    redirect_back(fallback_location: root_path)
  end

  # exports _to_ :provider
  def export
    if params[:document_id].present? && params[:provider].present?
      document = Document.find(params[:document_id])

      # Check some kind of audit table to see if this has already been exported. use public_activity
      "#{params[:provider].titleize}Service".constantize.create_document(current_user, document)\


      flash[:notice] = "Document successfully exported to #{params[:provider].titleize}"
    end
    redirect_back(fallback_location: root_path)
  end

  def get_body
    if params[:document_id].present?
      if params[:provider] == 'google_drive'
        file = GoogleDriveService.get_body(current_user, params[:document_id])
        Document.update_from_google_drive(params[:document_id], file)
      end
    end
    redirect_back(fallback_location: root_path)
  end


  private

    def set_document
      @document = Document.find(params[:id])
    end

    def document_params
      params.require(:document).permit(:source, :source_id, :source_created_at, :source_updated_at, :source_link, :kind, :mime_type, :author, :dateline, :title, :subtitle, :body_html)
    end

end
