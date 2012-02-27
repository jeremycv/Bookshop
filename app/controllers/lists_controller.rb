class ListsController < ApplicationController
  
  def index
    @lists = List.find :all, :order => 'keyword'
  end
  
  def new
    @list = List.new
  end
  
  def create
    @list = List.create(params[:list])
    
    if @list.save
      redirect_to @list
    else
      render :action => :new
    end
  end
  
  def show
    
    @list = List.find(params[:id])
    
    respond_to do |format|
      format.html
    end
  end
  
  def edit
    
    @list = List.find(params[:id])
  end
  
  def update
    
    @list = List.find(params[:id])
    
    if @list.update_attributes(params[:list])
      redirect_to @list
    else
      render :action => :edit
    end
  end
        
  def destroy
    
    @list = List.find(params[:id])
    @list.destroy
      
    respond_to do |format|
      format.html { redirect_to(lists_path) }
    end
  end
  
  protected
  

end
