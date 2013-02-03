class Happening < ActiveRecord::Base
  attr_accessible :content, :user_id, :address, :tag_list, :title, :time_of, :website

  acts_as_taggable
  acts_as_gmappable 

  validates :website, :allow_blank => true, :format => /(^$)|(^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/.*)?$)/ix 

  validates :content, :presence => true,
  					   :length => { :minimum => 2, :maximum => 140 }

  validates :user_id, :presence => true

  validates :title, :presence => true,
                    :length => { :minimum => 2, :maximum => 20 }
                    
  belongs_to :user
  has_many   :favorites
  has_many   :favorited, :through => :favorites, :source => :user    

  def gmaps4rails_address
  	self.address 
  end

  def website= url_str
  unless url_str.blank?
    unless url_str.split(':')[0] == 'http' || url_str.split(':')[0] == 'https'
        url_str = "http://" + url_str
    end
  end  
  write_attribute :website, url_str
end

end
