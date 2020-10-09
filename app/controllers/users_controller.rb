class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
  end
  
  def new
     @user = User.new
  end
  
  def create
     @user = User.new(user_params)   # 実装は終わっていないことに注意!
    if @user.save
       flash[:success] = "登録に成功しました！"
       redirect_to root_path
    else
      render 'new'
    end
  end
  
   private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation , :class_name)
    end
end
