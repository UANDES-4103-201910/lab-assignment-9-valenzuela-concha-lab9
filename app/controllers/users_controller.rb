class UsersController < ApplicationController
  #before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :is_user_logged_in?

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    #complete this method
    @user = User.new(user_params)
    if @user.save(user_params)
        flash[:success] = "Successfully created."
        redirect_to @user
      else
        flash.now[:error] = "Cannot create this user."
        render :new
      end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    #complete this method
    @user = User.find(params[:id])
    if @user.update(user_params)
        flash[:success] = "Successfully updated."
        redirect_to @user
      else
        flash[:error] = "Cannot update this user."
        render :edit
      end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    #complete this method
    @user = User.find(params[:id])
    @user.destroy
    if @user.destroy
        flash[:success] = "Successfully destroyed."
        redirect_to 'http://localhost:3000/'
      end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :last_name, :email, :password, :phone)
    end

      def correct_user
          @user = User.find(params[:id])
          redirect_to(root_url) unless @user == current_user
      end

end
