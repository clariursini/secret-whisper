class BarsController < ApplicationController
  def index
    @bars = Bar.all
    @barsito = Bar.new
  end

  def new
    @barsito = Bar.new
  end

  def create
    @barsito = Bar.new(bar_params)
    if @barsito.save
      redirect_to bars_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @bar = Bar.find(params[:id])
    @bar.destroy
  end

  def show
    @bar = Bar.find(current_user.bar_code)
    @users = User.where(bar_code: current_user.bar_code)
    @conversation = Conversation.new
    @beer = Beer.new
    @beers = Beer.all
  end

  def barcode
    @user = User.find(current_user.id)
    @user.bar_code = params[:id]
    @user.save
    redirect_to bar_path(@user.bar_code)
  end

  private

  def bar_params
    params.require(:bar).permit(:name)
  end
end
