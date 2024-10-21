class LinksController < ApplicationController
  def index
    @links = Link.all
  end

  def show
    @link = Link.find_by_slug(params[:id])
  end

  def goto
    @link = Link.find_by_slug(params[:slug])
    redirect_to @link.destination, allow_other_host: true
  end

  def new
    @link = Link.new
  end

  def create
    @link = Link.new(link_params)

    if @link.save
      redirect_to action: "index"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private def link_params
    params.require(:link).permit(:slug, :destination)
  end
end
