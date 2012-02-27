class Box < ActiveRecord::Base
  
  VALID_STATUSES = %w(Instore Transit Warehouse)
  
  validates_presence_of   :barcode, :message => "- Hey dude, can you please scan the barcode on the side of the box?"
  validates_uniqueness_of :barcode, :message => "- There is already a box with that barcode. Please re-check the barcode or talk to Mickey Mouse (from the Toy store)"
  
  validates_presence_of   :description, :message => "- can you briefly describe the contents of the box?"
  
  validates_presence_of   :location, :message => " - specify the location of the box."
  validates_length_of     :location, :minimum => 2, :message => " - The location needs to be at least 2 characters long."
  
  has_many                :books, :order => "description", :dependent => :destroy

  
  def self.find_with_search(barcode = nil, status = nil)

    eval(Box.return_barcode_search(barcode, status))
  end
  
  def self.return_barcode_search(barcode, status)
    if barcode =~ /./
      if status =~ /./
         return "Box.find :all, :conditions => {:barcode => '#{barcode}', :status => '#{status}'}, :order => 'barcode'"
       else
         return "Box.find :all, :conditions => \"barcode = '#{barcode}'\", :order => 'barcode'"
      end
    else
      if status =~ /./
        return "Box.find :all, :conditions => \"status = '#{status}'\", :order => 'barcode'"
      else
        return "Box.find :all, :order => 'barcode'"
      end
    end
  end
  
end
