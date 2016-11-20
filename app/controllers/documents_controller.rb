class DocumentsController < ApplicationController
  before_action :set_document, only: [:show, :edit, :update, :destroy]

  def index
    @quip_docs = Document.where(source: 'quip')
    @google_docs = Document.where(source: 'google_drive')
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
    if params[:document_id].present?
      # thread = api call to get specific thread
      # Document.create_or_update_from_quip_thread(thread)
    else
      if params[:provider] == 'quip'
        threads = QuipService.get_all_documents(current_user)
        threads.each do |thread|
          Document.create_or_update_from_quip(thread)
        end
      elsif params[:provider] == 'google'
        files = GoogleDriveService.get_all_documents(current_user)
        files.each do |file|
          Document.create_or_update_from_google_drive(file)
        end
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
