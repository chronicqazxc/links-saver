class LinksController < ApplicationController

  def show
    @catalog = Catalog.find(params[:catalog_id])
    @link = @catalog.links.find(params[:id])

    @pageTitle = @link.title
    @pageDescription = @link.content

    respond_to do |format|
      format.html
      format.js
    end

  end

  def edit
    @catalog = Catalog.find(params[:catalog_id])
    @link = @catalog.links.find(params[:id])

    respond_to do |format|
      format.html
      format.js
    end

  end

  def create
    @catalog = Catalog.find(params[:catalog_id])
    @link = @catalog.links.create(link_params)

    if @link.errors.count > 0
      errorMessage = ''
      @link.errors.full_messages.each do |msg|
        errorMessage << msg
      end
      flash.now[:alert] = errorMessage

      # TODO: https://stackoverflow.com/a/7534996
    end

    redirect_to catalog_path(@catalog)
  end

  def update
    @catalog = Catalog.find(params[:catalog_id])
    @link = @catalog.links.find(params[:id])
    if @link.update(link_params)
      redirect_to catalogs_path
    else
      render 'edit'
    end
  end

  def destroy
    @catalog = Catalog.find(params[:catalog_id])
    @link = @catalog.links.find(params[:id])
    @link.destroy
    redirect_to catalog_path(@catalog)

    # respond_to do |format|
    #   format.html { redirect_to catalog_path(@catalog) }
    #   format.xml  { head :ok }
    # end
  end

  def sort
  params[:link].each_with_index do |id, index|
    Link.where(id: id).update_all(position: index+1)
  end
  render nothing: true
end

  private
  def link_params
    params.require(:link).permit(:link_type, :content, :title, :catalog_id)
  end
end
