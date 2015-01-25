class UsersController < ApplicationController



  # layout 'application'

  # #before_action :confirm_logged_in

  # def index
  #   @users = User.all
  # end

  # def show
  #   @user = User.find(params[:id])
  # end

  # def new
  #   @user = User.new
  # end

  # def create
  #   @user = User.new(user_params)
  #   if @user.save
  #     flash[:notice] = "User #{@user.username} created successfully."
  #     redirect_to(action: 'show', id: @user.id)
  #   else
  #     render('new')
  #   end
  # end

  # def edit
  #   @user = User.find(params[:id])
  # end

  # def update
  #   @user = User.find(params[:id])
  #   if @user.update_attributes(user_params)
  #     flash[:notice] = "User #{@user.username} updated successfully."
  #     redirect_to(action: 'show', id: @user.id)
  #   else
  #     render('edit')
  #   end
  # end

  # def delete
  #   @user = User.find(params[:id])
  # end

  # def destroy
  #   user = User.find(params[:id]).destroy
  #   flash[:notice] = "user #{user.username} is destroyed."
  #   redirect_to(action: 'index')
  # end


  # private
  
  # def user_params
  #   params.require(:user).permit(:first_name, :last_name, :email, :username, :password, :password_confirmation)
  # end
end
