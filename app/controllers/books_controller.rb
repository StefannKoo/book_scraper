class BooksController<ApplicationController

  before_action :set_book, only: [:edit,:update,:show]

  def index
    if params[:publisher_id]
      @books=Book.where(publisher_id:params[:publisher_id])
    else
      @books=Book.includes(:publisher).all
    end
  end

  def new
    @book=Book.new
    @publisher_id=params[:publisher_id]
  end

  def show 
    
  end

  def create
      @publisher=Publisher.find(params[:publisher_id])   
      @book=Book.new(book_params.merge(publisher_id:params[:publisher_id]))
    
      if @book.save && @book.valid?      
        flash[:notice]="The book was sucessfully added to publisher"
        @publisher.platforms.each do |p|
          @platform_book= PlatformBook.new(platform_id:p.id,book_id:@book.id)
          #Ovdje dodati prices u tabelu prices za platform_book i koliko ?
          @platform_book.save
          price=Price.new(amount:7.99,variant:"e_book",platform_book_id:@platform_book.id)
          price.save!
          price=Price.new(amount:32.99,variant:"hardcover",platform_book_id:@platform_book.id)
          price.save!
          price=Price.new(amount:34.99,variant:"paperback",platform_book_id:@platform_book.id)
          price.save!
          price=Price.new(amount:18.95,variant:"large_print",platform_book_id:@platform_book.id)
          price.save!
          price=Price.new(amount:11.95,variant:"audio_cd",platform_book_id:@platform_book.id)
          price.save!
          PlatformBookLokatorWorker.perform_async(@platform_book.id,params[:book][:name])
        end
      else
        flash[:notice]="Unsucess !! There is some errors"
      end
      redirect_to publisher_path(params[:publisher_id])
  end

  def edit   
  end

  def update
   if @book.update(book_params.merge(publisher_id:params[:publisher][:publisher_id]))
    flash[:notice]="The book was edited !"
      redirect_to books_path
   else
      flash[:notice]="There is some errors with update !"
      redirect_to edit_book_path(params[:id])
   end
  end

  def destroy
    @book=Book.find(params[:id])
    if @book.destroy
      flash[:notice]="Book was deleted !!"
    else
      flash[:notice]="There is some problems"
      puts "PROBLLLLEEEMMMSSS"
    end

    redirect_to publisher_path(params[:publisher_id])
  end

  private

  def book_params
    params.require(:book).permit(:name,:date,:ebook,:image)
  end

  def set_book
    @book=Book.find(params[:id])
  end
end