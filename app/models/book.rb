class Book < ApplicationRecord
  belongs_to :user
  has_many :comments

  validates :title, presence: { message: "著書名を入力してください" }, length: { maximum: 255, message: "タイトルは255文字以内で入力してください" }
  validates :author, presence: { message: "著者名を入力してください" }, length: { maximum: 255, message: "著者名は255文字以内で入力してください" }
  validates :publisher, presence: { message: "出版社を入力してください" }, length: { maximum: 255, message: "出版社は255文字以内で入力してください" }
  validates :review, presence: { message: "書評を入力してください" }, length: { maximum: 1000, message: "レビューは1000文字以内で入力してください" }


  def self.search(query)
    joins(:user).where('title LIKE :query OR author LIKE :query OR publisher LIKE :query OR users.username LIKE :query', query: "%#{query}%")
  end
  
end