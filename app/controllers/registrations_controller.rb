class RegistrationsController < Devise::RegistrationsController
  skip_before_filter :require_no_authentication, :only => [:create]

  def create
    if current_user
      @user = User.new(user_create_params)
      @user.pin = "0000"
      if @user.save
        redirect_to root_path, notice: "User created"
      else
        flash[:alert] = @user.errors.full_messages.to_sentence
        render "users/new"
      end
    else
      binding.pry
      super
    end
  end

  private 

  def user_create_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end