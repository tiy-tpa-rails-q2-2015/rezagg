class BookmarksController < ApplicationController
  before_action :set_bookmark, only: [:edit, :update, :destroy]

  before_action :require_authenticated_user, :except => [:index, :show]

  # GET /bookmarks
  def index
    if params[:mine]
      @bookmarks = current_user.try(:bookmarks)
    else
      @bookmarks = Bookmark.all
    end
  end

  # GET /bookmarks/1
  def show
    @bookmark = Bookmark.find(params[:id])
  end

  # GET /bookmarks/new
  def new
    @bookmark = current_user.bookmarks.new
  end

  # GET /bookmarks/1/edit
  def edit
  end

  # POST /bookmarks
  def create
    @bookmark = current_user.bookmarks.new(bookmark_params)

    if @bookmark.save
      redirect_to @bookmark, notice: 'Bookmark was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /bookmarks/1
  def update
    if @bookmark.update(bookmark_params)
      redirect_to @bookmark, notice: 'Bookmark was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /bookmarks/1
  def destroy
    @bookmark.destroy
    redirect_to bookmarks_url, notice: 'Bookmark was successfully destroyed.'
  end

  # PUT /bookmarks/1/favorite
  def favorite
    @bookmark = Bookmark.find(params[:id])
    current_user.favorite_bookmarks << @bookmark
    redirect_to bookmarks_url, notice: 'Favorite was successfully created.'
  end

  # DELETE /bookmarks/1/favorite
  def unfavorite
    @bookmark = Bookmark.find(params[:id])
    current_user.favorite_bookmarks.delete(@bookmark)
    redirect_to bookmarks_url, notice: 'Favorite was successfully removed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bookmark
      @bookmark = current_user.bookmarks.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def bookmark_params
      params.require(:bookmark).permit(:user_id, :url, :title, :description)
    end
end
