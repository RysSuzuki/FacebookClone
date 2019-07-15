class ProfilesController < ApplicationController
  def edit
   @profile = Profile.where(user_id:params[:id]).first
  end

  def create
    @profile =Profile.new(user_id:current_user.id)
    @profile.save
    redirect_to user_path(current_user.id)
  end

  def update
    @profile = Profile.where(user_id:params[:id]).first
    if @profile.update(profile_params)
     redirect_to user_path(current_user.id), notice: "profileを編集しました！"
    else
     render 'edit'
    end
  end

   private

   def profile_params
     params.require(:profile).permit(:image,:image_cache,:profile)
   end
end
