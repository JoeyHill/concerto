class User < ActiveRecord::Base
  has_many :contents
  has_many :submissions, :foreign_key => "moderator_id"
  has_many :memberships, :dependent => :destroy
  has_many :groups, :through => :memberships

  
  #Validations
  validates :username, :presence => true, :uniqueness => true
  validates :email, :presence => true, :uniqueness => true
  
  def to_param
    username
  end

  def name
    first_name + " " + last_name
  end
end
