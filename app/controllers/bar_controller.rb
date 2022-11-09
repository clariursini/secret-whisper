class BarController < ApplicationController
  def show
    @bar = Bar.find(current_user.bar_code)
    @users = User.where(bar_code: current_user.bar_code)
  end
end
