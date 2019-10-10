class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :show]
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
        #@user = User.new(username: params[:username], email: params[:email], password: params[:password])
  	@user = User.new(user_params)
      if @user.save
        flash[:success]="User created"
        redirect_to @user
      else
        render :new
      end
    end
      
    def edit

    end

    def show
      @user = User.find(params[:id])
    end
      
    def update
      respond_to do |format|
        if @user.update(user_params)
          format.html { redirect_to @user, notice: 'User was successfully updated.' }
          format.json { render @user, status: :ok, location: @user }
        else
          format.html { render :edit }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    end

    private
    
		def user_params
			params.require(:user).permit(:username,:email,:password)
    end
      
    def set_user
      @user = User.find(params[:id])
    end
end
