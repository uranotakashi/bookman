class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :books
  has_many :comments

  validates :username, presence: { message: "ユーザー名を入力してください" },
                       uniqueness: { case_sensitive: false, message: "そのユーザー名はすでに使われています" },
                       length: { minimum: 6, maximum: 20, message: "ユーザー名は6文字以上、20文字以内で入力してください" }

  validates :password, format: { with: /\A(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}\z/, message: "パスワードは少なくとも1つの大文字、1つの小文字、1つの数字を含む必要があります" },
                       if: :password_required?
  validates :password_confirmation, presence: { message: "パスワード確認を入力してください" }, if: :password_required?
  validates_confirmation_of :password, if: :password_required?

  private

  def password_required?
    !persisted? || !password.nil? || !password_confirmation.nil?
  end
end