class Favorite < ActiveRecord::Base
  attr_accessible :user_id, :happening_id

  before_save :associate_user

  belongs_to :happening
  belongs_to :user

  # Validations
  validates :user_id, :presence => true, :uniqueness => { :scope => :happening_id }
  validates :happening_id, :presence => true

  def has_favorite? product
    favorites.find_by_happening_id happening.id
  end
  # Callbacks
  protected

  def associate_user
    unless self.user_id
      return self.user_id = current_user.user_id if current_user.user_id
      return false
    end
  end

 end
