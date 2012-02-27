class BoxesController < ApplicationController
  

  def index
     @boxes = Box.find_with_search(params[:barcode], params[:status])
  end
  
  def show
    @box = Box.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end
  
  def edit
    @box = Box.find(params[:id])
  end
  
  def create
    @box = Box.create(params[:box])
    
    @box.barcode = @box.barcode.upcase
     if @box.save
       redirect_to @box
     else
       render :action => :new
     end
  end
  
  def new
    @box = Box.new
  end
  
  def update
    @box = Box.find(params[:id])
    
    if @box.update_attributes(params[:box])
       redirect_to @box
    else
      render :action => :edit
    end
  end
  
  def destroy
    @box = Box.find(params[:id])
    @box.destroy

    respond_to do |format|
      format.html { redirect_to(boxes_path) }
    end
  end
  
end