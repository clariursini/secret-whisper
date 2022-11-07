class BarController < ApplicationController
  def show
    @bar = Bar.find(current_user.bar_id)
    @users = User.where(bar_id: current_user.bar_id)
  end
end
