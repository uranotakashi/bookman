class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :book

  validates :content, presence: { message: "コメントを入力してください" }, 
                      length: { maximum: 1000, message: "は1000文字以内で入力してください" }
end