class Admin::ImagesController < Admin::BaseController

  def index
    @images = Image.all
  end

  def new
    @image = Image.new
  end

  def create
    @image = Image.new(image_params)
    if @image.save
      flash[:success] = "Image added!"
      redirect_to admin_images_path
    else
      flash.now[:danger] = @image.errors.full_messages.first
      render :new
    end
  end

  def destroy
    @image = Image.find(params[:id])
    @image.destroy
    flash[:warning] = "Image removed."
    redirect_to admin_images_path
  end

  private

  def image_params
    params.require(:image).permit(:description, :url)
  end
end