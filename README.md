# **Event Matchingアプリケーション**
# アプリケーション概要
大人になり、あまり何かをして遊ぶ機会だったり人との出会いが減ってくると思うので、
その様な機会を作ることを目的としたアプリケーションです
# アプリケーションURL
https://eventmatching-33506.herokuapp.com/
# 使用技術
- Ruby 2.6.5  
- Ruby on Rails 6.0.3.4  
- MySQL 5.6  
- RSpec
# テスト用アカウント
## ID/Pass
- ID: hiroaki  
- Pass: 1234
## テスト用アカウント等
### 申込者用
- メールアドレス: matcing@com  
- パスワード: 111aaa
### 投稿者用
- メールアドレス: event@com  
- パスワード: aaa111
# アプリケーションの利用方法
- 同時に複数の方がログインしている場合に、ログインできない可能性があります  
- テストアカウント(投稿者)でログイン→トップページからイベント投稿ボタン押下→イベント情報入力→イベント投稿  
- テストアカウント(投稿者)でログイン→トップページからイベント画像を押下→申し込みボタン押下→申し込みの確定ボタン押下  
- 確認後、ログアウト処理をお願いします
# 目指した課題解決
- 社会人になり、何か体を動かしたり、人と集まって遊ぶ機会が減ってしまいますが、休日や仕事後の時間を活用して大人になっても人との出会いや、趣味の場を大切にできたらと考え作成しました
# 機能一覧
- ユーザー登録、ログイン機能(devise)  
- 投稿機能  
  - 画像投稿(S3)  
- いいね機能  
- ページネーション機能(kaminari)  
- 検索機能(ransack)  
- SNS認証機能
# 実装予定の機能
・カテゴリーごとに目的のイベント情報に素早くたどり着くことができる機能を実装する予定です  
・イベント情報にお気に入りをする機能を非同期で実装する予定です  
・申し込んだイベント内容を自身の詳細ページで確認できる様に実装する予定です  
# テーブル設計

## users テーブル

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| nickname           | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| family_name        | string  | null: false               |
| first_name         | string  | null: false               |
| kana_family_name   | string  | null: false               |
| kana_first_name    | string  | null: false               |
| birth_day          | date    | null: false               |
| area_id            | integer | null: false               |
| phone_number       | string  | null: false               |
| introduction       | string  |                           |

### Association
- has_many :events
- has_many :entries
- has_many :sns_credentials
- belongs_to :area


## events テーブル
| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| name               | string  | null: false               |
| explanation        | text    | null: false               |
| genre_id           | string  | null: false               |
| day                | date    | null: false               |
| start_time_id      | integer | null: false               |
| end_time_id        | integer | null: false               |
| latitude           | float   |                           |
| longitude          | float   |                           |
| capacity           | string  | null: false               |
| area_id            | integer | null: false               |
| address            | string  | null: false               |

### Association
- belongs_to :user
- has_many :entries
- belongs_to :genre
- belongs_to :area
- belongs_to :start_time
- belongs_to :end_time

## entries テーブル
| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| event         | references | null: false, foreign_key: true |
| user          | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :event

## sns_credential テーブル
| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| provider      | string     |                                |
| uid           | string     |                                |
| user          | references | foreign_key: true              |

### Association
- belongs_to :user

## likes テーブル
| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| event         | references | null: false, foreign_key: true |
| user          | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :event

# ローカルでの動作方法
1. $ git clone https://github.com/Hiroaki0117/eventmatching-33506.git
2. $ cd eventmatching-33506
3. $ bundle install
4. $ rails db:create
5. $ rails db:migrate
6. $ rails s


