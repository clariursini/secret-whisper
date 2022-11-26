class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [ :name, :description, :age, :photo, :remember_me, :gender, :interests ])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [ :name, :description, :age, :photo, :remember_me, :gender, :interests ])
  end

  def after_sign_in_path_for(*)
    new_post_path
  end

  def user_root_path
    bar_path(current_user.bar_code)
  end
end
