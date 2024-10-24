class LinksController < ApplicationController
  before_action :authorize, except: [:goto]
  before_action :authorize_ownership, only: [
    :show,
    :new,
    :create,
    :edit,
    :update,
    :destroy,
  ]
  def index
    @links = current_user.links
  end

  def show
    update_current_link
  end

  def goto
    update_current_link
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
      render :new, status: :unprocessable_content
    end
  end

  def edit
    update_current_link
  end

  def update
    update_current_link
    if @link.update(link_params)
      redirect_to @link
    else
      render :edit, status: :unprocessable_content
    end
  end

  def destroy
    update_current_link
    @link.destroy

    redirect_to root_path, status: :see_other
  end

  # only use when there is already a link,
  # like for show, but not new
  private def update_current_link
    @link = Link.find_by_slug!(params[:slug] || params[:id])
  end

  private def link_params
    params.require(:link).permit(:slug, :destination).merge(creator_id: current_user.id)
  end

  private def authorize_ownership
    update_current_link
    if @link.creator_id != current_user.id
      raise ForbiddenAccessError
    end
  end

  class ForbiddenAccessError < StandardError
  end

  rescue_from ForbiddenAccessError do
    render inline: "Forbidden", status: :forbidden
  end
end
