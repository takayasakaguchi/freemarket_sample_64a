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

# メルカリ DB設計
## usersテーブル
|Column       |Type    |Options                  |
|-------------|--------|-------------------------|
|nickname     |sting   |null: false              |
|email        |sting   |null: false, unique: true|
|password     |string  |null: false              |
|first_name   |string  |null: false              |
|last_name    |string  |null: false              |
|first_name_f |string  |null: false              |
|last_name_f  |string  |null: false              |
|birthday     |date    |null: false              |
### Association
- has_many :products
- has_many :comments
- has_many :likes
- has_many :liked_products,  through:  :likes
- has_one  :credit_card
- has_one  :Adress