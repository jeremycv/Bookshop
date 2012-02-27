class List < ActiveRecord::Base
  
  validates_presence_of   :keyword, :message => "- specify the keyword"
  validates_presence_of   :value, :message => "- specify the corresponding keyword value"  
  validates_uniqueness_of :keyword
  
  before_save :input_translation
  
  def self.find_keyword(keyword = nil)

     return eval("List.find_all_by_keyword '#{keyword}'")
  end

  private
  
  def input_translation
  
    # use this to cleanse the data like trimming etc. - Callbacks
    #self.value = value.gsub(/\r\n/, "~")
    self.keyword = keyword.capitalize.gsub(" ", "")
  end
  
end
