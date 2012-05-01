class LikesController < ApplicationController
  
  include LikesHelper
  # GET /likes
  # GET /likes.json
  def index
    @likes = Like.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @likes }
    end
  end

  # GET /likes/1
  # GET /likes/1.json
  def show
    @like = Like.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @like }
    end
  end

  # GET /likes/new
  # GET /likes/new.json
  def new
    @like = Like.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @like }
    end
  end

  # GET /likes/1/edit
  def edit
    @like = Like.find(params[:id])
  end

  # POST /likes
  # POST /likes.json
  def create
    @like = Like.new(params[:like])
    @like_type = []
    @like_type << params["like_type"]
    respond_to do |format|
      if @like.save
        if params["like_type"] == "comment"
          @likes = Like.find_all_by_comment_id(params[:like][:comment_id])
          @like_type << params[:like][:comment_id].to_s
        else
          @likes = Like.find_all_by_post_id(params[:like][:post_id])
          @like_type << params[:like][:post_id].to_s
        end
        
        #format.html { redirect_to @like, notice: 'Like was successfully created.' }
        format.js{@like_type}
        format.json { render json: @like, status: :created, location: @like }
      else
        format.html { render action: "new" }
        format.json { render json: @like.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /likes/1
  # PUT /likes/1.json
  def update
    @like = Like.find(params[:id])

    respond_to do |format|
      if @like.update_attributes(params[:like])
        format.html { redirect_to @like, notice: 'Like was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @like.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /likes/1
  # DELETE /likes/1.json
  def destroy_like
    @like_type = []
    @like_type << params["like_type"]
    
    if params["like_type"] == "comment"
      @like = Like.find_by_user_id_and_comment_id(params[:like][:user_id], params[:like][:comment_id])
      @like.destroy
      @like_type << params[:like][:comment_id].to_s
      @likes = Like.find_all_by_comment_id(params[:like][:comment_id])
    else
      @like = Like.find_by_post_id_and_user_id(params[:like][:post_id], params[:like][:user_id])
      @like.destroy
      @like_type << params[:like][:post_id].to_s
      @likes = Like.find_all_by_post_id(params[:like][:post_id])
    end

    respond_to do |format|
      #format.html { redirect_to likes_url }
      format.js{@like_type}
      format.json { head :no_content }
    end
  end
end
