class GadgetsController < ApplicationController
  before_action :require_signin

  def new
    @gadget = current_user.gadgets.build
  end

  def show
    @gadget = current_user.gadgets.find params[:id], include: :images
  end

  def index
    if (@query = params[:query]).present?
      @gadgets = current_user.gadgets.where('search LIKE ?', "%#{@query.downcase}%") \
      .all include: :images
    else
      @gadgets = current_user.gadgets.all include: :images
    end
  end

  def create
    @gadget = current_user.gadgets.build gadget_params

    if @gadget.save
      redirect_to @gadget
    else
      render 'new'
    end
  end

  def edit
    @gadget = current_user.gadgets.find params[:id]
  end

  def update
    @gadget = current_user.gadgets.find params[:id]

    if @gadget.update gadget_params
      redirect_to @gadget
    else
      render 'edit'
    end
  end

  def view_as_table
    session[:view] = 'table'
    redirect_to root_path
  end

  def view_as_thumbnails
    session[:view] = 'thumbnails'
    redirect_to root_path

  end

  def destroy
    @gadget = current_user.gadgets.find params[:id]
    @gadget.destroy

    redirect_to :back
  end

  private
    def gadget_params
      params.require(:gadget).permit(:name, :description)
    end
end