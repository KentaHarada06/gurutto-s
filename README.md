## users

|Column               |Type    |Options                   |
| ------------------- | ------ | -----------------------  |
| email               | string | null: false unique: true |
| encrypted_password  | string | null: false              |
| nickname            | string | null: false              |

### Association
- has_many :room_users
- has_many :rooms, through: room_users
- has_many :comments
- has_many :favorites
- has_many :posts, through: favorites


## rooms

| Column                    | Type       | Options                        |
| ------------------------- | ---------- | ------------------------------ |
| room_name                 | string     | null: false                    |
| room_description          | text       | null: false                    |
| user                      | references | null: false, foreign_key: true |

### Association
- has_many :room_users
- has_many :users, through: room_users
- has_many :posts
- belongs_to :user


## room_users

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| room    | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :room


## posts

| Column                   | Type       | Options                        |
| ------------------------ | ---------- | ------------------------------ |
| title                    | string     | null: false                    |
| content                  | text       | null: false                    |
| ref_url                  | string     |                                |
| user                     | references | null: false, foreign_key: true |
| room                     | references | null: false, foreign_key: true |

### Association
- has_many :comments
- belongs_to :user
- belongs_to :room
- has_many :favorites
- has_many :users, through: favorites


## comments

| Column                   | Type       | Options                        |
| ------------------------ | ---------- | ------------------------------ |
| message                  | text       | null: false                    |
| post                     | references | null: false, foreign_key: true |
| user                     | references | null: false, foreign_key: true |

### Association
- belongs_to :post
- belongs_to :user

## favorites

| Column                   | Type       | Options                        |
| ------------------------ | ---------- | ------------------------------ |
| user                     | references | null: false, foreign_key: true |
| post                     | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :post