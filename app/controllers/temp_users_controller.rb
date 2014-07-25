class TempUsersController < ApplicationController
  before_action :set_temp_user, only: [:show, :edit, :update, :destroy]

  # GET /temp_users
  # GET /temp_users.json
  def index
    @temp_users = TempUser.all
  end

  # GET /temp_users/1
  # GET /temp_users/1.json
  def show
  end

  # GET /temp_users/new
  def new
    @temp_user = TempUser.new
  end

  # GET /temp_users/1/edit
  def edit
  end

  # POST /temp_users
  # POST /temp_users.json
  def create
    @temp_user = TempUser.new(temp_user_params)

    respond_to do |format|
      if @temp_user.save
        format.html { redirect_to @temp_user, notice: 'Temp user was successfully created.' }
        format.json { render :show, status: :created, location: @temp_user }
      else
        format.html { render :new }
        format.json { render json: @temp_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /temp_users/1
  # PATCH/PUT /temp_users/1.json
  def update
    respond_to do |format|
      if @temp_user.update(temp_user_params)
        format.html { redirect_to @temp_user, notice: 'Temp user was successfully updated.' }
        format.json { render :show, status: :ok, location: @temp_user }
      else
        format.html { render :edit }
        format.json { render json: @temp_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /temp_users/1
  # DELETE /temp_users/1.json
  def destroy
    @temp_user.destroy
    respond_to do |format|
      format.html { redirect_to temp_users_url, notice: 'Temp user was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_temp_user
      @temp_user = TempUser.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def temp_user_params
      params.require(:temp_user).permit(:namee, :pin, :expiry_at)
    end
end
