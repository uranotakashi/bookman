class Book < ApplicationRecord
  belongs_to :user
  has_many :comments

  def self.search(query)
    joins(:user).where('title LIKE :query OR author LIKE :query OR publisher LIKE :query OR users.username LIKE :query', query: "%#{query}%")
  end
  
end