class BooksController < ApplicationController
 before_action :ensure_correct_user,only:[:edit,:update]
  def create
    @book = Book.new(book_params)
    @book.user_id =current_user.id
   if @book.save
     flash[:notice] = "You have created book successfully"
    redirect_to book_path(@book)
   else
    @user =current_user
    @books =Book.all
    render :index
   end
  end

  def index
    @books = Book.all
    @book = Book.new
    @user = current_user
  end

  def show
    @book =Book.find(params[:id])
    @user =@book.user
    @book_new =Book.new
  end
  
  
  def edit
    @book = Book.find(params[:id])
  end
  
  def update
    @book = Book.find(params[:id])
   if @book.update(book_params)
     flash[:notice] = "You have updated book successfully"
    redirect_to book_path(@book.id)
   else
    render :edit
   end
  end
  
  def destroy
    book = Book.find(params[:id])
    book.destroy
    flash[:notice] = "You have dastroyed book successfully"
    redirect_to books_path
  end
  
  # 投稿データのストロングパラメータ
  private
 def ensure_correct_user
      book = Book.find(params[:id])
    unless book.user.id == current_user.id
      redirect_to books_path
    end
 end
  def book_params
   params.require(:book).permit(:title, :body, :image)
  end
end
