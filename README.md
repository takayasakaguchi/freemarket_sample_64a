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

# freemarket_sample_64a DB設計
## usersテーブル
|Column             |Type    |Options    |
|-------------------|--------|-----------|
|nickname           |sting   |null: false|
|email              |sting   |null: false|
|password           |string  |null: false|
|first_name         |string  |null: false|
|last_name          |string  |null: false|
|first_name_reading |string  |null: false|
|last_name_reading  |string  |null: false|
|birthday           |date    |null: false|
### Association
- has_many :products
- has_many :comments
- has_many :likes
- has_many :purchases
- has_one  :credit_card
- has_one  :address


## credit_cardテーブル
|Column         |Type    |Options                       |
|---------------|--------|------------------------------|
|card_number    |integer |null: false                   |
|due_year       |integer |null: false                   |
|due_month      |integer |null: false                   |
|security_code  |integer |null: false                   |
|user_id        |integer |null: false, foreign_key: true|
### Association
- belongs_to :user


## addressテーブル
|Column                 |Type    |Options                       |
|-----------------------|--------|------------------------------|
|first_name             |string  |null: false                   |
|last_name              |string  |null: false                   |
|first_name_reading     |string  |null: false                   |
|last_name_reading      |string  |null: false                   |
|postal_code            |integer |null: false                   |
|prefecture_id          |integer |null: false                   |
|city                   |string  |null: false                   |
|house_number           |string  |null: false                   |
|building_name          |string  |                              |
|phone_number           |string  |                              |
|user_id                |integer |null: false, foreign_key: true|
### Association
- belongs_to :user


## productsテーブル
|Column       |Type    |Options                       |
|-------------|--------|------------------------------|
|name         |sting   |null: false                   |
|description  |text    |null: false                   |
|brand        |string  |                              |
|status       |string  |null: false                   |
|postage      |string  |null: false                   |
|destination  |string  |null: false                   |
|lead_time    |integer |null: false                   |
|price        |integer |null: false                   | 
|size         |string  |                              |
|user_id      |integer |null: false, foreign_key: true|
|category_id  |integer |null: false, foreign_key: true|
### Association 
- belongs_to :user  
- belongs_to :category
- has_many   :images
- has_many   :likes
- has_many   :purchases
- has_many   :comments


## imagesテーブル
|Column       |Type           |Options                       |
|-------------|---------------|------------------------------|
|image        |sting          |null: false                   |
|product_id   |integer        |null: false, foreign_key: true|
### Association
- belongs_to :product   


## categoriesテーブル
|Column       |Type           |Options                       |
|-------------|---------------|------------------------------|
|name         |sting          |null: false                   |
|ancestry     |varchar(255)   |                              |
### Association
- has_many :product   


## commentsテーブル
|Column       |Type    |Options                       |
|-------------|--------|------------------------------|
|text         |text    |null: false                   |
|user_id      |integer |null: false, foreign_key: true|
|product_id   |integer |null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :product


## likesテーブル
|Column       |Type    |Options                       |
|-------------|--------|------------------------------|
|product_id   |integer |null: false, foreign_key: true|
|user_id      |integer |null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :product


## purchaseテーブル
|Column       |Type    |Options                       |
|-------------|--------|------------------------------|
|product_id   |integer |null: false, foreign_key: true|
|user_id      |integer |null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :product