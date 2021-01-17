# アプリケーション概要
アプリケーション「ぐるっとS」は会社やサークルなど、特定のグループ内で情報の発信や共有を行うことが出来るWebアプリケーションです。

![7d2210d16d846fe347513a517af8093b](https://user-images.githubusercontent.com/72850080/104840159-ffbb2f80-5908-11eb-87fa-1b83b09f3724.jpg)

# アプリケーション情報
## アプリケーションURL
- http://ec2-13-115-125-1.ap-northeast-1.compute.amazonaws.com/
## テスト用アカウント
- E-mail:testuser@gmail.com
- Password:testuser
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
# 機能一覧
## ユーザー管理機能
- 新規登録
- ログイン
- ログアウト
- ユーザーの詳細表示
- ユーザーの編集
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
- お気に入りの一覧表示
# 主要機能紹介
## ルーム作成
![ルーム作成サンプル](https://user-images.githubusercontent.com/72850080/104837691-a3044880-58f9-11eb-9b14-5407ca89cfea.gif)

- ルーム作成機能ではルーム名とルームについての説明文を入力してルームを作成します。
- 作成したルームは一覧に表示され、左側の参加ルーム一覧に自動的に追加されます。
- 作成されたルームには、自身が未参加のルームについては参加ボタンが表示され、参加済みのルームには退出のボタンが表示されます。ボタンをクリックすることで参加と退出を切り替えることが出来ます。
- 自身が作成したルームについては、削除ボタンが表示されています。こちらをクリックすると確認のダイアログが表示され、OKをクリックすることでルームの削除が行えます。

## ユーザー詳細表示
<img width="1440" alt="ユーザー詳細表示サンプル" src="https://user-images.githubusercontent.com/72850080/104837820-6f75ee00-58fa-11eb-805f-d88801f3cc2a.png">

- ユーザー詳細表示では各ユーザーの情報を確認することが出来ます。
- ログインしているユーザーが自身のユーザー詳細ページを閲覧する場合には、自身が参加しているルーム・自身の投稿リスト・お気に入りした投稿リストを確認することが出来ます。

## ユーザー編集
![ユーザー編集サンプル](https://user-images.githubusercontent.com/72850080/104837779-17d78280-58fa-11eb-9522-421a0a588e1a.gif)

- ログインしているユーザーの詳細表示画面にはプロフィールを変更するボタンも表示され、こちらをクリックすることでユーザー情報並びにユーザーアイコンの変更を行うことができます。

## 投稿一覧表示
<img width="1440" alt="投稿一覧サンプル" src="https://user-images.githubusercontent.com/72850080/104837847-a6e49a80-58fa-11eb-945d-a790eee74a76.png">

- 投稿一覧表示画面では、そのルーム内で作成された投稿を一覧で見ることが出来ます。
- また、左側のメニューバーから新しい投稿を作成したり、投稿メニューより自身がお気に入りに登録した投稿の一覧を見ることも出来ます。

## 投稿詳細表示
<img width="1440" alt="投稿詳細表示サンプル" src="https://user-images.githubusercontent.com/72850080/104837864-ce3b6780-58fa-11eb-9b21-ff5044f162c8.png">

- 投稿詳細表示画面では投稿内容を確認することが出来ます。
- 投稿された記事はMarkdown記法に対応しており、指定の記号と組み合わせて文章をスタイリングすることが出来ます。
- 投稿内容の下部にはコメント入力フォームが用意されており、こちらにコメントを入力して送信することで投稿に対してコメントをすることが出来ます。

## 投稿検索機能
![投稿検索](https://user-images.githubusercontent.com/72850080/104838089-0d1ded00-58fc-11eb-98a3-ab77b0fbb433.gif)

- 投稿一覧表示画面の右上に検索フォームがあり、こちらに検索したいキーワードを入力して検索ボタンをクリックすることで、キーワードに該当する投稿のみを一覧表示します。
- 本検索機能は投稿タイトルもしくは投稿内容にそのキーワードが含まれていた場合にヒットします。

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