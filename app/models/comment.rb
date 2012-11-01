class Comment < ActiveRecord::Base
  attr_accessible :content

  belongs_to :post


  validates :content, :presence => true
  validates :post_id, :presence => true

  def writer
    return "Anonymus" if user_id.nil?
    user = User.find(user_id)
    return user.name
  end

  default_scope :order => 'comments.created_at DESC'
end
