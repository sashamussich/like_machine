class LinksController < ApplicationController
  
  before_action :set_link, only: [:show, :edit, :update, :destroy]
  
  before_action :set_auth#, except: [:index]

  def index
    links = Link.all.order "created_at DESC"
    # raise
    @hash = links.group_by{|x| x.created_at.strftime("%Y-%m-%d")}
  end

  def show
  end

  def new
    @link = current_user.links.build
  end

  def edit
  end


  # POST /links
  # POST /links.json
  def create
    @link = current_user.links.build(link_params)

    respond_to do |format|
      if @link.save
        format.html { redirect_to root_path, notice: 'Link was successfully created.' }
      else
        format.html { render :new }
        format.json { render json: @link.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /links/1
  # PATCH/PUT /links/1.json
  def update
    respond_to do |format|
      if @link.update(link_params)
        format.html { redirect_to @link, notice: 'Link was successfully updated.' }
        format.json { render :show, status: :ok, location: @link }
      else
        format.html { render :edit }
        format.json { render json: @link.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /links/1
  # DELETE /links/1.json
  def destroy
    @link.destroy
    respond_to do |format|
      format.html { redirect_to links_url, notice: 'Link was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def upvote
    @link = Link.find(params[:id])
    @link.upvote_by current_user
    redirect_to :back
  end

  def downvote
    @link = Link.find(params[:id])
    @link.downvote_by current_user
    redirect_to :back
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_link
      @link = Link.find(params[:id]) || @link
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def link_params
      params.require(:link).permit(:title, :url)
    end

    def set_auth
      @auth = session[:omniauth] if session[:omniauth]
    end

end
