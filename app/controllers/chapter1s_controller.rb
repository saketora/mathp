class Chapter1sController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]

  def create
     @pbar = current_user.chapter1s.build(chapter1_params)
    if @pbar.save
      flash[:success] = "Micropost created!"
      redirect_to root_url
    else
      flash[:success] = "ばーか！！！"
      redirect_to root_url
    end
  end

  def destroy
  end
  
   private

   def chapter1_params
      params.require(:chapter1).permit(:course_id, :chapter_id, :section_id)
   end
end