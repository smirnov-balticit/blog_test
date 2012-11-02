class Post < ActiveRecord::Base

  attr_accessible :content, :ptitle  , :tag_list

 acts_as_taggable

 belongs_to :user

 has_many :comments, :dependent => :destroy

 validates :ptitle, :presence => true
 validates :content, :presence => true
 validates :user_id, :presence => true
  
 default_scope :order => 'posts.created_at DESC'

  def writer
    @user = User.find(user_id)
    return @user
  end

end
