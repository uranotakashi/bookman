## Usersテーブル（ユーザー情報）


| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| username   | string     | null: false,                   |
| email      | string     | null: false,                   |
| password   | string     | null: false,                   |


### Association
- has_many :books
- has_many :comments

## Booksテーブル（書籍情報）


| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| user_id     | references | null: false, foreign_key: true |
| title       | string     | null: false,                   |
| author      | string     | null: false,                   |
| publisher   | string     | null: false,                   |
| review      | text       | null: false,                   |

### Association
- belongs_to :user
- has_many :comments


## Commentsテーブル（コメント情報）


| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| user_id     | references | null: false, foreign_key: true |
| book_id     | references | null: false, foreign_key: true |
| content     | text       | null: false,                   |


### Association
- belongs_to :user
- belongs_to :book