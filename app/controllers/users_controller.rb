class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update]
    def new
      @user = User.new
    end

    def create
        #@user = User.new(username: params[:username], email: params[:email], password: params[:password])
			@user = User.new(user_params)
        if @user.save
          redirect_to new_user_path
        else
          render :new
        end
      end
      
      def edit

      end
      
      def update
        respond_to do |format|
          if @user.update(user_params)
            format.html { redirect_to new_user_path, notice: 'User was successfully updated.' }
            format.json { render :new, status: :ok, location: @user }
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
