class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :destroy]
  def new 
    @user = User.new
  end

  # GET /temp_users/1/edit
  def edit
  end

  # PATCH/PUT /temp_users/1
  # PATCH/PUT /temp_users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        Event.pin_changed(@user)
        Message.create(command: Command.find_by(code: "USR"), user: @user)
        format.html { redirect_to root_path, notice: 'Pin successfully updated' }
        format.json { render :show, status: :ok, location: @user }
      else
        flash[:alert] =  @user.errors.full_messages.to_sentence
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /temp_users/1
  # DELETE /temp_users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Temp user was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def set_user
    @user = User.find(params[:id])
  end


    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:pin, :name)
    end

    def user_create_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end
  end
