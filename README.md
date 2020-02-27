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
- has_one  :adress


# credit_cardテーブル
|Column         |Type    |Options                       |
|---------------|--------|------------------------------|
|card_num       |integer |null: false                   |
|due_year       |integer |null: false                   |
|due_month      |integer |null: false                   |
|security_code  |integer |null: false                   |
|user_id        |integer |null: false, foreign_key: true|
### Association
- belongs_to :user


# adressテーブル
|Column           |Type    |Options                       |
|-----------------|--------|------------------------------|
|first_name       |string  |null: false                   |
|last_name        |string  |null: false                   |
|first_name_f     |string  |null: false                   |
|last_name_f      |string  |null: false                   |
|post_mun         |integer |null: false                   |
|prefecture       |string  |null: false                   |
|city             |string  |null: false                   |
|house_num        |string  |null: false                   |
|building_name    |string  |                              |
|phone_num        |string  |                              |
|user_id          |integer |null: false, foreign_key: true|
### Association
- belongs_to :user

## productsテーブル
|Column       |Type    |Options                       |
|-------------|--------|------------------------------|
|image        |sting   |null: false                   |
|name         |sting   |null: false                   |
|description  |text    |null: false                   |
|bland        |string  |                              |
|status       |string  |null: false                   |
|postage      |string  |null: false                   |
|destination  |string  |null: false                   |
|lead_time    |integer |null: false                   |
|price        |integer |null: false                   | 
|size         |string  |                              |
|user_id      |integer |null: false, foreign_key: true|
### Association
- belongs_to :user  
- has_many   :products_categories
- has_many   :categories,  through:  :products_categories
- has_many   :likes
- has_many   :liked_users, through: :likes

## categoriesテーブル
|Column       |Type    |Options    |
|-------------|--------|-----------|
|major        |sting   |null: false|
|middle       |sting   |null: false|
|minor        |sting   |null: false|
### Association
- has_many :messages
- has_many :groups_users
- has_many :users,  through:  :groups_users

# products_categoriesテーブル
|Column       |Type    |Options                       |
|-------------|--------|------------------------------|
|product_id   |integer |null: false, foreign_key: true|
|category_id  |integer |null: false, foreign_key: true|
### Association
- belongs_to :product
- belongs_to :category

# commentsテーブル
|Column       |Type    |Options                       |
|-------------|--------|------------------------------|
|text         |text    |null: false                   |
|user_id      |integer |null: false, foreign_key: true|
|product_id   |integer |null: false, foreign_key: true|
### Association
- belongs_to :user