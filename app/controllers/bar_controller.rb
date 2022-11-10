class BarController < ApplicationController
  def show
    @bar = Bar.find(current_user.bar_code)
    @users = User.where(bar_code: current_user.bar_code)
  end

  def barcode
    @user = User.find(current_user.id)
    @user.bar_code = params[:id]
    @user.save
    redirect_to bar_path
  end
end
