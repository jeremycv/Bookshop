class Book < ActiveRecord::Base
  
  belongs_to  :box
  
  validates_presence_of   :description, :message => "- How would you describe this book?"
  validates_presence_of   :title, :message => "- Every book has a title. So give it to me straight."
  validates_presence_of   :author, :message => "- How about the book author? Should'nt we give him some credit?"
  
  
  def self.find_with_search(author = nil, title = nil)

    eval(Book.return_book_search(author, title))
  end
  
  def self.return_book_search(author, title)
    if author =~ /./
      if title =~ /./
         return "Book.find :all, :conditions => {:author => '#{author}', :title => '#{title}'}, :order => 'title'"
       else
         return "Book.find :all, :conditions => \"author = '#{author}'\", :order => 'author'"
      end
    else
      if title =~ /./
        return "Book.find :all, :conditions => \"title = '#{title}'\", :order => 'title'"
      else
        return "Book.find :all, :order => 'title'"
      end
    end
    
  end
end
