class RegistrationsController < Devise::RegistrationsController
  skip_before_filter :require_no_authentication, :only => [:create]

  def create
    if current_user
      @user = User.new(user_create_params)
      @user.pin = "0000"
      if @user.save
        Message.create(command: Command.find_by(code: "USR"), user: @user, user_type: "user")
        redirect_to root_path, notice: "User created"
      else
        flash[:alert] = @user.errors.full_messages.to_sentence
        render "users/new"
      end
    else
      super
    end
  end

  private 

  def user_create_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end