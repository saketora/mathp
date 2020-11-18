class UsersController < ApplicationController
   before_action :logged_in_user, only: [:index, :edit, :update, :users ,:destroy]
   before_action :correct_user,   only: [:edit, :update]
    before_action :admin_user,     only: [:destroy, :index]
    
   def index
       @users = User.paginate(page: params[:page])
  end
  
  def show
       @userc = User.find(params[:id]).class_name
       @classmates = User.where(class_name: @userc)
    @user = User.find(params[:id])
    @userch = @user.chapter1s
    @nchapter1 = @userch.where(course_id: 1, chapter_id: 1).count
    @nchapter2 = @userch.where(course_id: 1, chapter_id: 2).count
    @nchapter3 = @userch.where(course_id: 1, chapter_id: 3).count
    @nchapter4 = @userch.where(course_id: 1, chapter_id: 4).count
    @nchapter5 = @userch.where(course_id: 2, chapter_id: 1).count
    @nchapter6 = @userch.where(course_id: 2, chapter_id: 2).count
    @nchapter7 = @userch.where(course_id: 2, chapter_id: 3).count
    @nchapter8 = @userch.where(course_id: 2, chapter_id: 4).count
    @nchapter9 = @userch.where(course_id: 2, chapter_id: 5).count
    @nchapter10 = @userch.where(course_id: 2, chapter_id: 6).count
    @nchapter11 = @userch.where(course_id: 3, chapter_id: 1).count
    @nchapter12 = @userch.where(course_id: 3, chapter_id: 2).count
    @nchapter13 = @userch.where(course_id: 3, chapter_id: 3).count
    @nchapter14 = @userch.where(course_id: 3, chapter_id: 4).count
    @nchapter15 = @userch.where(course_id: 3, chapter_id: 5).count
    @nchapter16 = @userch.where(course_id: 3, chapter_id: 6).count
    @nchapter17 = @userch.where(course_id: 3, chapter_id: 7).count
    @nchapter18 = @userch.where(course_id: 3, chapter_id: 8).count
    @nchapter19 = @userch.where(course_id: 4, chapter_id: 1).count
    @nchapter20 = @userch.where(course_id: 4, chapter_id: 2).count
    @nchapter21 = @userch.where(course_id: 4, chapter_id: 3).count
    @nchapter22 = @userch.where(course_id: 5, chapter_id: 1).count
    @nchapter23 = @userch.where(course_id: 5, chapter_id: 2).count
    @nchapter24 = @userch.where(course_id: 5, chapter_id: 3).count
    @nchapter25 = @userch.where(course_id: 5, chapter_id: 4).count
    @ratech1 = @nchapter1 * 100 / 4
    @ratech2 = @nchapter2 * 100 / 2
    @ratech3 = @nchapter3 * 100 / 2
    @ratech4 = @nchapter4 * 100 / 2
    @ratech5 = @nchapter5 * 100 / 2
    @ratech6 = @nchapter6 * 100 / 2
    @ratech7 = @nchapter7 * 100 / 3
    @ratech8 = @nchapter8 * 100 / 2
    @ratech9 = @nchapter9 * 100 / 2
    @ratech10 = @nchapter10 * 100 / 3
    @ratech11 = @nchapter11 * 100 / 2
    @ratech12 = @nchapter12 * 100 / 2
    @ratech13 = @nchapter13 * 100 / 2
    @ratech14 = @nchapter14 * 100 / 2
    @ratech15 = @nchapter15 * 100 / 2
    @ratech16 = @nchapter16 * 100 / 3
    @ratech17 = @nchapter17 * 100 / 2
    @ratech18 = @nchapter18 * 100 / 3
    @ratech19 = @nchapter19 * 100 / 2
    @ratech20 = @nchapter20 * 100 / 2
    @ratech21 = @nchapter21 * 100 / 3
    @ratech22 = @nchapter22 * 100 / 2
    @ratech23 = @nchapter23 * 100 / 2
    @ratech24 = @nchapter24 * 100 / 2
    @ratech25 = @nchapter25 * 100 / 2
      end
  
  def new
     @user = User.new
  end
  
  def create
     @user = User.new(user_params)   
    if @user.save
        log_in @user
       flash[:success] = "登録に成功しました！"
       redirect_to root_path
    else
      render 'new'
    end
  end
  
   def edit
    @user = User.find(params[:id])
  end

def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "プロフィールは更新されました"
      redirect_to @user
    else
      render 'edit'
    end
  end
  
   def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end
 
  
   private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation , :class_name)
    end
    
     # beforeアクション

    # ログイン済みユーザーかどうか確認
    def logged_in_user
      unless logged_in?
           store_location
        flash[:danger] = "ログインしてください"
        redirect_to login_url
      end
    end
    
     # 正しいユーザーかどうか確認
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless @user == current_user
    end

# 管理者かどうか確認
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end
