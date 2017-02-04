class PhotosController < ApplicationController
  def index
    @list_of_photos = Photo.all
  end

  def show
    @id = params[:id]
    @detail = Photo.find(@id)
    render("show.html.erb")
  end

  def new_form
    render("new_form.html.erb")
  end

  def create_row
    # Parameters: {"the_caption"=>"", "the_source"=>""}
    the_caption = params[:the_caption]
    the_source = params[:the_source]
    r = Photo.new
    r.source = the_source
    r.caption = the_caption
    r.save
    render("create_row.html.erb")
  end

  def destroy
    r = Photo.find(params[:id])
    r.destroy
    redirect_to("/photos")
  end

  def edit_form
    @id = Photo.find(params["id"])
    render("edit_form.html.erb")
  end

  def update_row
    n = Photo.find(params[:id])
    n.caption = params[:the_caption]
    n.source = params[:the_source]
    n.save
    render("update_photo.html.erb")
  end

end
