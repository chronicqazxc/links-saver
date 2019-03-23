class CatalogsController < ApplicationController
  def index
    @pageTitle = 'Links Saver'
    @pageDescription = 'Add the links that you like.'

    filter_ids = params[:catalog_ids]
    term = params[:term]
    @term = term
    @isSearch = false

    if params.except(:controller, :action).empty?
      @catalogs = Catalog.all.order("position")
    elsif term.present? && filter_ids.nil? # Search
      # @catalogs = Catalog.includes(:links).where(:links => { title: term } ).all
      # @catalogs = Catalog.joins(:links).all.where("links.title LIKE ?" , "%#{term}%")
      # @catalogs = Catalog.includes(:links).where(:links => { title: "#{term}" })

      if term.empty?
        @catalogs = Catalog.all.order("position")
      else

        @search_catalogs = {}
        Catalog.all.order("position").each do |catalog|
          @search_catalogs[catalog.id] = catalog.links.select do |link|
            link.title.downcase.include? term.downcase
          end
        end
        @isSearch = true

        @search_catalogs = @search_catalogs.select { |key, value| value.present? }
        @catalogs = Catalog.where(id: @search_catalogs.keys)

      end

    elsif term.nil? && filter_ids.present? # Filter
      @catalogs = Catalog.where(id: filter_ids)
    else
      if term.empty?
        @catalogs = Catalog.all.order("position")
      else
        @catalogs = []
      end
    end

  end

  def show
    @pageTitle = 'Links Saver'
    @pageDescription = 'Add the links that you like.'

    @catalog = Catalog.find(params[:id])
    respond_to do |format|
      format.html
      format.js
    end
  end

  def new
    @catalog = Catalog.new
  end

  def edit
    @catalog = Catalog.find(params[:id])
  end

  def create
    @catalog = Catalog.new(catalog_params)

    if @catalog.save
      redirect_to @catalog
    else
      render 'new'
    end
  end

  def update
    @catalog = Catalog.find(params[:id])
    if @catalog.update(catalog_params)
      @catalogs = Catalog.all
      # redirect_to @catalog
      render 'index'
    else
      # render 'edit'
    end
  end

  def destroy
    @catalog = Catalog.find(params[:id])
    @catalog.destroy

    redirect_to catalogs_path
  end

  def modal
    @catalog = Catalog.find(params[:catalog_id])
    @link = @catalog.links.find(params[:id])

    respond_to do |format|
      format.html
      format.js
    end
  end

  def sort
    params[:catalog].each_with_index do |id, index|
      Catalog.where(id: id).update_all(position: index+1)
    end
    render nothing: true
  end

  def x_frame_options
    @catalog = Catalog.find(params[:catalog_id])
    @link = @catalog.links.find(params[:id])

    if @link.typeString == "URL"
      link = @link.content
      response = RestClient.get(link)
      @x_frame_options = response.headers[:x_frame_options]
    else
      @x_frame_options = "HTML"
    end

    render partial: "x_frame_options"
  end

  private
  def catalog_params
    params.require(:catalog).permit(:title, :description)
  end
end
