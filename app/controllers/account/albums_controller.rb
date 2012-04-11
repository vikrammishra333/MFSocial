class Account::AlbumsController < ApplicationController
  # GET /account/albums
  # GET /account/albums.json
  def index
    @account_albums = Account::Album.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @account_albums }
    end
  end

  # GET /account/albums/1
  # GET /account/albums/1.json
  def show
    @account_album = Account::Album.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @account_album }
    end
  end

  # GET /account/albums/new
  # GET /account/albums/new.json
  def new
    @account_album = Account::Album.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @account_album }
    end
  end

  # GET /account/albums/1/edit
  def edit
    @account_album = Account::Album.find(params[:id])
  end

  # POST /account/albums
  # POST /account/albums.json
  def create
    @account_album = Account::Album.new(params[:account_album])

    respond_to do |format|
      if @account_album.save
        format.html { redirect_to @account_album, notice: 'Album was successfully created.' }
        format.json { render json: @account_album, status: :created, location: @account_album }
      else
        format.html { render action: "new" }
        format.json { render json: @account_album.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /account/albums/1
  # PUT /account/albums/1.json
  def update
    @account_album = Account::Album.find(params[:id])

    respond_to do |format|
      if @account_album.update_attributes(params[:account_album])
        format.html { redirect_to @account_album, notice: 'Album was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @account_album.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /account/albums/1
  # DELETE /account/albums/1.json
  def destroy
    @account_album = Account::Album.find(params[:id])
    @account_album.destroy

    respond_to do |format|
      format.html { redirect_to account_albums_url }
      format.json { head :no_content }
    end
  end
end
