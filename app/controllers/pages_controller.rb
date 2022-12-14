class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def new_post
    @user = current_user
  end

  def update_post
    @user = User.find(current_user.id)
    # if params[:user][:photo] == nil
    #   puts "There is no photo"
    #   flash.notice = "Please upload a picture"
    #   render :new_post, status: :unprocessable_entity
    # else
      if @user.update!(post_params)
        redirect_to bar_path(current_user.bar_code)
      else
        render :new_post, status: :unprocessable_entity
      end
    # end
  end

  private

  def post_params
    params.require(:user).permit(:photo, :description)
  end
end
