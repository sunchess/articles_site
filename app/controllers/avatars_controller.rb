class AvatarsController < ApplicationController

  def edit
    @user = current_user   
  end

  def update
    @user = current_user   
    if @user.update_attributes(params[:user])
      redirect_to :back, :notice => t("users.success.update")
    else
      render :action => :edit
    end
  end
end
