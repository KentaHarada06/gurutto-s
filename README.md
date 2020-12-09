# アプリケーション概要
アプリケーション「ぐるっとS」は会社やサークルなど、特定のグループ内で情報の発信や共有を行うことが出来るWebアプリケーションです。
# アプリケーション情報
## アプリケーションURL
- https://
## テスト用アカウント
- E-mail:
- Password:
## GitHubリポジトリ
- https://github.com/KentaHarada06/gurutto-s
## 使用技術
- Ruby/Ruby on Rails/MySQL/JavaScript/Github/AWS/Visual Studio Code
## 制作期間
- 制作時期：2020年11月01日〜
- 制作時間：約80時間
# 課題解決
本アプリケーションを制作した理由としては、前職の現場で働く社員の方達はパソコンやアプリケーションを利用して作業を行っていましたが、ITに対しての知識に乏しく、また分からないことをインターネット等を活用して調べるといった習慣付けも無いために以下のような課題が浮き彫りになっていました。

- 同じ内容を繰り返し質問してしまう
- 調べる癖ができていないために知識の定着がしにくい
- 非効率的なやり方を続けてしまう  

そこで「ぐるっとS」では特定のグループ内でよく使われる技術やノウハウを記事として投稿しておき、その知識を必要とするユーザーがいつでも情報を得ることが出来るサービスを考えました。また、自身が持つノウハウを投稿することでアウトプットを行う習慣を身に付けると共に知識の定着を行うことが期待出来ます。
# 利用方法
# 機能一覧
## ユーザー管理機能
- 新規登録
- ログイン
- ログアウト
## ルーム管理機能
- ルームの作成
- ルームの参加/退出
- ルームの削除
- ルームの検索
## ポスト管理機能
- ポストの投稿
- ポストの詳細表示
- ポストの編集
- ポストの削除
- ポストの検索
## コメント機能
- コメントの投稿
- コメントの削除
## お気に入り機能
- お気に入りの登録/解除
# 機能説明
# データベース設計
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
- belongs_to :users
- belongs_to :rooms
- has_many :posts


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
| room                     | references | null: false, foreign_key: true |
| post                     | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :room
- belongs_to :post
# 開発環境
- ruby 2.6.5
- rails 6.0.0