class BooksController < ApplicationController
  
  def favourites
    
    favourites = List.find(:all, :conditions => {:keyword => 'Favourites'}).collect {| c | c.value }.to_s
    
    @books = Book.find_with_search(favourites, params[:title])
    # render :template => "books/index"
  end
  
  def index
	
	 # @box = Box.find(params[:box_id])
	 # @books = @box.books
	 @books = Book.find_with_search(params[:author], params[:title])
	 
	 respond_to do | format |
	   format.html
	   format.js
	   format.xml { render :xml => @books }
   end
   
  end
  
  def new
  	
	  @box = Box.find(params[:box_id])
	  @book = @box.books.build
  end
  
  def create
    
	  @box = Box.find(params[:box_id])
	  @book = @box.books.build(params[:book])
	  
	  if @book.save
		  #redirect_to box_book_url(@box, @book)
		  redirect_to box_url(@box)
	  else
		  render :action => "new"
	  end
	  
	end
  
  def show
    @book = Book.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
    # @box = Box.find(params[:box_id])
	  # @book = @box.books.find(params[:id])
  end
  
  def edit
    
    # @box = Box.find(params[:box_id])
    # @book = @box.books.find(params[:id])
	  
    @book = Book.find(params[:id])
  end
   
  def update
    
    #@box = Box.find(params[:box_id])
    @book = Book.find(params[:id])
    	  
    if @book.update_attributes(params[:book])
      redirect_to book_url(@book)
    else
      render :action => "edit"
    end
  end
   
  def destroy
     
  
    @book = Book.find(params[:id])
 	  @box = @book.box
 	  
    @book.destroy

     respond_to do |format|
       format.html { redirect_to box_path(@box) }
     end
 	    
   end
end
