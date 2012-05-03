class Account::PhotosController < ApplicationController
  # GET /account/photos
  # GET /account/photos.json
  def index
    @photos = Photo.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @photos }
    end
  end

  # GET /account/photos/1
  # GET /account/photos/1.json
  def show
    @photo = Photo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @photo }
    end
  end

  # GET /account/photos/new
  # GET /account/photos/new.json
  def new
    @photo = Photo.new

    respond_to do |format|
      format.html{ render layout: false} # new.html.erb
      format.json { render json: @photo }
    end
  end

  # GET /account/photos/1/edit
  def edit
    @photo = Account::Photo.find(params[:id])
  end

  # POST /account/photos
  # POST /account/photos.json
  def create
    @photo = Photo.new(params[:photo])

    respond_to do |format|
      if @photo.save
        update_user @photo
        format.html { redirect_to root_url, notice: 'Photo was successfully created.' }
        format.json { render json: @photo, status: :created, location: @photo }
      else
        format.html { render action: "new" }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /account/photos/1
  # PUT /account/photos/1.json
  def update
    @photo = Photo.find(params[:id])

    respond_to do |format|
      if @photo.update_attributes(params[:account_photo])
        format.html { redirect_to @photo, notice: 'Photo was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /account/photos/1
  # DELETE /account/photos/1.json
  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy

    respond_to do |format|
      format.html { redirect_to account_photos_url }
      format.json { head :no_content }
    end
  end

  private

  def update_user photo
    @user = current_user
    @user.profile_photo_id = photo.id
    @user.save!
  end
end
