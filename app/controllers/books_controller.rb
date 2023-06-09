class BooksController < ApplicationController

  def index
    @books = Book.all
    @user = current_user
    @book = Book.new
  end

  def create
   @user = current_user
   @book = Book.new(book_params)
   @book.user_id = current_user.id
     if @book.save
      flash[:success] = "You have created book successfully."
      redirect_to book_path(@book.id)
     else
      @books = Book.all
      render :index
     end
  end

  def show
   @book = Book.new
   @book2 = Book.find(params[:id])
   @user = @book2.user
  end

  def edit
   @book = Book.find(params[:id])
   @user = @book.user
   unless @user.id == current_user.id
    redirect_to books_path
   end
  end

   def update
      @book = Book.find(params[:id])
     if @book.update(book_params)
      flash[:success] = "You have updated book successfully."
      redirect_to book_path(@book.id)
     else
      render :edit
     end
   end

   def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
   end

  private
   def book_params
     params.require(:book).permit(:title, :body)
   end

end
