class AddReviewToBooks < ActiveRecord::Migration[7.0]
  def change
    add_column :books, :review, :text, null: false
  end
end