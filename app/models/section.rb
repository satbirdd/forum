class Section < ActiveRecord::Base
  attr_accessible :name

  has_many :posts

  def say
  	1008
  end
end
