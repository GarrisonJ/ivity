class Happening < ActiveRecord::Base
  attr_accessible :content, :user_id, :address, :tag_list, :title, :time_of
  belongs_to :user
  acts_as_taggable

  acts_as_gmappable 
  validates :content, :presence => true,
  					   :length => { :minimum => 2, :maximum => 140 }

  validates :user_id, :presence => true

  validates :title, :presence => true,
                    :length => { :minimum => 2, :maximum => 20 }
  def gmaps4rails_address
  	self.address 
  end

end
