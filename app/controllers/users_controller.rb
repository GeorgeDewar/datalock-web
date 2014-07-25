class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :destroy]


  # GET /temp_users/1/edit
  def edit
  end


  # PATCH/PUT /temp_users/1
  # PATCH/PUT /temp_users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
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
  end
