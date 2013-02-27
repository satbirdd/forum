class Post < ActiveRecord::Base
  attr_accessible :title, :body

  belongs_to :user
  belongs_to :section
  has_many :comments, dependent: :destroy
end