class LinksController < ApplicationController
  
  before_action :set_link, only: [:edit, :update, :destroy, :like, :dislike]
  
  before_action :set_auth#, except: [:index]

  def index
    links = Link.all
    @hash = Link.make_hash_by_date links
  end

  def show
  end

  def new
    @link = current_user.links.build
  end

  def edit
  end

  def create
    @link = current_user.links.build(link_params)

    if @link.save
      redirect_to root_path, flash: {success: 'Link was successfully created.' }
    else
      redirect_to :back, flash: { error: @link.errors}
    end
    
  end

  def update
    respond_to do |format|
      if @link.update(link_params)
        format.html { redirect_to root_path, flash: {success: 'Link was successfully updated.' } }
      else
        format.html { redirect_to :back, flash: { error: @link.errors} }
      end
    end
  end

  def destroy
    @link.destroy
    respond_to do |format|
      format.html { redirect_to links_url, notice: 'Link was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def like
    @link.upvote_from current_user
    respond_to do |format|
      format.html { redirect_to :back }
      format.js { render layout: false }
    end
  end

  def dislike
    @link.downvote_from current_user
    respond_to do |format|
      format.html { redirect_to :back }
      format.js { render layout: false }
    end
  end

  private
    def set_link
      @link = Link.find(params[:id]) || @link
    end

    def link_params
      params.require(:link).permit(:title, :url)
    end

    def set_auth
      @auth = session[:omniauth] if session[:omniauth]
    end

end
