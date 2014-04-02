class UsersController < ApplicationController
  
  def show
    @user=User.find(params[:id])
    redirect_to root_url
  end
  
  def new
    @user=User.new
  end
  
  def create
    @user=User.new(user_params)# Not the final implementation!
    if @user.save
      flash[:success] = "WELLCOME TO THE HELLO CENTER !"
      redirect_to @user
    else
      render 'new'
    end
  end
  
  private

    def user_params
      params.require(:user).permit(:name, :username, :email, :birthday, :password,
                                   :password_confirmation)
    end
   
end
