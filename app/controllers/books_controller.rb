class BooksController < ApplicationController

  def show
    @book = Book.find(params[:id])
    @booknew = Book.new
    @book_comment = BookComment.new
    @book_tags = @book.tags #そのクリックした投稿に紐付けられているタグの取得。  
    @user = @book.user
    @tag_list = Tag.all
  end

  def index
    @books = Book.all
    @book = Book.new
    @tag_list = Tag.all
  end

  def create
    @book = Book.new(book_params) #ビューで投稿一覧を表示するために全取得。
    tag_list = params[:book][:tag_name].split(nil) #ビューでタグ一覧を表示するために全取得。
    @book.user_id = current_user.id
    if @book.save
       @book.save_tag(tag_list)
      redirect_to book_path(@book), notice: "You have created book successfully."
    else
      @books = Book.all
      @tag_list = Tag.all
      render 'index'
    end
  end

  def edit
    @book = Book.find(params[:id])
  if @book.user == current_user
    render "edit"
  else
    redirect_to books_path
  end

  end



  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book), notice: "You have updated book successfully."
    else
      render "edit"
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end
  
  def search
    #@search_books = Book.all
    if params[:title].present?
      @books = Book.where('title LIKE ?', "%#{params[:title]}%")
    else
      @books = Book.none
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)#, :tag_name)
  end

end
