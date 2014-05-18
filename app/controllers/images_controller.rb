class ImagesController < ApplicationController
  before_action :require_signin

  def create
    @gadget = current_user.gadgets.find params[:gadget_id]
    @image = @gadget.images.create(image_params)
    redirect_to :back
  end

  def destroy
    @gadget = current_user.gadgets.find params[:gadget_id]
    @image = @gadget.images.find params[:id]
    @image.destroy
    redirect_to :back
  end

  private
    def image_params
      params.require(:image).permit(:image)
    end
end
