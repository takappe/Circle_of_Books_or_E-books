# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# アプリ名
Circle of Books or E-books

# 概要
書籍や電子書籍で学んだ事をアウトプットします
アウトプットした内容を自身の行動に反映する様にコミットします
コミットした内容に対してどう変化があったのかアウトプットします
さらにどうしていくかを改めてコミットします
その内容をたくさんの人と共有します

# 本番環境
https://hidden-waters-06372.herokuapp.com/
テストユーザー
email:test@test.co.jp
password:asdfgh

# 制作背景
書籍や電子書籍を読んでも知識として蓄えるのではなく、
アウトプットをし行動を変えていく事が重要と考え、
アウトプットを気軽に出来る場所が必要だと考えました。
また、実践する中でそれに対し共感し合える人たちが必要だと考えました。

# DEMO

TOP画面になります。
「ゲストユーザー（閲覧用）」をクリックして頂ければ、新規登録をせずにblogを投稿する事ができます。
<img width="1440" alt="スクリーンショット 2020-09-17 21 59 24" src="https://user-images.githubusercontent.com/68013970/93473555-1b99cf00-f931-11ea-8d67-d0d79a69180f.png">

ログインをすると、投稿一覧ページに遷移します。
画面右上の「投稿する」をクリックしますと、投稿画面に遷移します。
<img width="1436" alt="スクリーンショット 2020-09-15 16 36 32" src="https://user-images.githubusercontent.com/68013970/93180589-573a6a80-f772-11ea-8fc2-7075620a6ef0.png">

titleに読んだ本のタイトル、textareaには読んで学んだ事をアウトプットします。
入力をしたら、画面中央下にある「SEND」をクリックしますと投稿ができます。
<img width="1440" alt="スクリーンショット 2020-09-15 16 36 53" src="https://user-images.githubusercontent.com/68013970/93180670-789b5680-f772-11ea-9290-85539b0bf9ae.png">

投稿をすると投稿一覧ページに戻ります。
<img width="1440" alt="スクリーンショット 2020-09-15 16 37 09" src="https://user-images.githubusercontent.com/68013970/93180688-7fc26480-f772-11ea-8a5f-e888eb724874.png">


# 実装予定の内容
マイページの実装
コメント機能の実装
画像投稿の実装

# GitHubのURL
https://github.com/takappe/Circle_of_Books_or_E-books

# DB設計

## usersテーブル

|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false, unique: true|
|email|string|null: false|
|password|string|null: false|

### Association
- has_many :blogs

## blogsテーブル

|Column|Type|Options|
|------|----|-------|
|title|string||
|blog|text||
|user_id|references|foreign_key: true|

### Association
- belongs_to :user
- has_many :images
- has_many :comments

## commentsテーブル

|Column|Type|Options|
|------|----|-------|
|comment|string||
|blog_id|references|foreign_key: true|
|user_id|references|foreign_key: true|

### Association
- belongs_to :user
- belongs_to :blog

## imagesテーブル

|Column|Type|Options|
|------|----|-------|
|image|string||
|blog_id|references|foreign_key: true|

### Association
- belongs_to :blog

#作者
takappe