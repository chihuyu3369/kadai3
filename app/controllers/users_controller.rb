class UsersController < ApplicationController

    def index
      @user = current_user
      @users = User.all
      @book = Book.new
    end

    def show
      @user = User.find(params[:id])
      @books = @user.books
      @book = Book.new
    end

    def edit
      @user = User.find(params[:id])
      unless @user.id == current_user.id
       redirect_to user_path(current_user.id)
      end
    end

    def update
      @user = current_user
     if @user.update(user_params)
      flash[:success] = "You have updated user successfully."
      redirect_to user_path(current_user.id)
     else
      render :edit
     end
    end

     private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
end
