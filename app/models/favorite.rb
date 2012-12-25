class Favorite < ActiveRecord::Base
  attr_accessible :user_id, :happening_id

  # before_save :associate_user

  belongs_to :happening
  belongs_to :user

  # Validations
  validates :user_id, :presence => true
  validates :happening_id, :presence => true
  # TODO: validates the uniqueness of the favorite. A user can only favorite a happening once. 

  def has_favorite? product
    favorites.find_by_happening_id happening.id
  end
  # Callbacks
  # protected

  # def associate_user
  #   unless self.user_id
  #     return self.user_id = session[:user_id] if session[:user_id]
  #     return false
  #   end
  # end

 end
