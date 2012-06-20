class AvatarsController < ApplicationController
  before_filter :the_photo
  
  def index
    @avatars = Avatar.where("photo_id = ?", the_photo)
  end
  
  def new
    @avatar = Avatar.new
  end
  
  def show
    @avatar = Avatar.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @avatar }
    end    
  end
  
  def create
    #@photo = Photo.find(params["photo_id"])            
    params[:avatar][:avatar_file].original_filename = "#{File.basename(@photo.photo_file.url)}"
    @avatar = @photo.avatars.new(params[:avatar])
    
    if @avatar.save
      redirect_to "#{HOST_URL}/galleries/#{@photo.gallery_id}/photos/#{@photo.id}/avatars"
      #redirect_to @avatar  
      #Note: @avatar works with the jQuery mass uploader, but not the conventional solo upload form,
      #because @photo_id goes missing
    else
      render :json => { "errors" => @avatar.errors } 
    end     
  end

  def update
    @avatar = Avatar.find(params[:id])

    respond_to do |format|
      if @avatar.update_attributes(params[:avatar])
        format.html { render action: 'show' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @avatar.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def destroy
    @avatar = Avatar.find(params[:id])
    @avatar.destroy

    respond_to do |format|
      format.html { redirect_to "#{HOST_URL}/galleries/#{@photo.gallery_id}/photos/#{@photo.id}/avatars/new" }
      #redirect_to new_gallery_photo_avatar_path(@photo) mixed up id's again
      format.json { head :no_content }      
    end
  end  
end

private 

def the_photo
  @photo = Photo.find(params["photo_id"])
end