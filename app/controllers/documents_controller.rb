class DocumentsController < ApplicationController
  before_action :set_document, only: [:show, :edit, :update, :destroy]

  def index
    @quip_docs = Document.where(source: 'quip')
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

  private

    def set_document
      @document = Document.find(params[:id])
    end

    def document_params
      params.require(:document).permit(:source, :source_id, :source_created_at, :source_updated_at, :source_link, :author, :dateline, :title, :subtitle, :body_html)
    end

end
