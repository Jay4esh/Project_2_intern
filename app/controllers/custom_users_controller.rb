class CustomUsersController < ApplicationController
    before_action :authenticate_user!
  
    def new_user
      @user = User.new
    end
  
    def create_user
      @user = User.new(user_params)
  
      if @user.save(validate: false)
        redirect_to users_path, notice: 'User was successfully created.'
      else
        render :new_user
      end
    end

    private
    def user_params
        params.require(:user).permit(:name, :position, :company_id)
      end
    end
  