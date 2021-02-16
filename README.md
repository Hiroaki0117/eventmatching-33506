# **Event Matchingアプリケーション**
# アプリケーション概要
大人になり、あまり何かをして遊ぶ機会だったり人との出会いが減ってくると思うので、
その様な機会を作ることを目的としたアプリケーションです
# アプリケーションURL
https://eventmatching-33506.herokuapp.com/
# テスト用アカウント
## ID/Pass
・ID: hiroaki  
・Pass: 1234
## テスト用アカウント等
### 申込者用
・メールアドレス: matcing@com  
・パスワード: 111aaa
### 投稿者用
・メールアドレス: event@com  
・パスワード: aaa111
# アプリケーションの利用方法
・同時に複数の方がログインしている場合に、ログインできない可能性があります  
・テストアカウント(投稿者)でログイン→トップページからイベント投稿ボタン押下→イベント情報入力→イベント投稿  
・テストアカウント(投稿者)でログイン→トップページからイベント画像を押下→申し込みボタン押下→申し込みの確定ボタン押下  
・確認後、ログアウト処理をお願いします
# 目指した課題解決
・社会人になり、何か体を動かしたり、人と集まって遊ぶ機会が減ってしまいますが、休日や仕事後の時間を活用して大人になっても人との出会いや、趣味の場を大切にできたらと考え作成しました
# 要件定義
## ユーザー管理機能
・トップページの新規登録ボタンから新規登録の方法を選ぶページに遷移するボタンがあります  
・方法別ごとに登録ボタンを押すと会員情報入力ページに遷移します  
・必要項目を入力し会員登録ボタンを押すと、登録ができログインできます  
・ログイン時はトップページにあるログアウトボタンを押すことで、ログアウトすることができます  
・サインインするにはトップページにあるログインボタンからログインページに遷移します  
・必要項目を入力しログインボタンを押すことで、ログインできます  
・トップページにあるニックネームボタンを押すことで、ユーザーの投稿内容を見ることができます  
・ログイン時にユーザー投稿内容のページからユーザー登録内容のボタンを押すことで、登録内容のページに遷移します  
・ユーザー登録内容のページで登録内容の編集ボタンを押すことで、ユーザー編集のページに遷移できます  
・編集ページで必要項目を入力し会員内容編集ボタンを押すと会員情報を編集することができます
## イベント投稿機能
・ログイン時にトップページのイベント投稿ボタンを押すことで、イベント投稿のページに遷移します  
・イベント投稿ページで必要項目を入力して募集を開始するボタンを押すことで、イベントを投稿することができます  
・投稿されたイベントはトップページ投稿された順に表示されます  
・トップページの自身が投稿したイベントの画像やイベント名を押すことで、投稿したイベントの詳細ページに遷移します  
・イベント詳細ページからイベントの編集ボタンを押すことで、イベントの編集ページに遷移します  
・イベント編集ページで必要項目を入力して募集内容絵お変更するボタンを押すとイベントの編集ができます  
・イベント編集ページで変更しないボタンを押すと、前のページのイベント詳細画面に遷移します  
・イベント詳細ページでイベントの削除ボタンを押すことで押すことで、ポップアップで確認され、OKを押すことで、イベントを削除することができます  
## イベント申し込み機能 
・ログイン時にトップページにて投稿されているイベントの画像やイベント名を押すことで、イベントの詳細ページに遷移します  
・イベント詳細ページで自身が投稿していないイベントのページであれば、申し込みページボタンを押すことで、申し込みページに遷移します  
・申し込みページにて、内容を確認の上、お申し込みの確定ボタンを押すことで、イベントの申し込みをづることができます  
・イベント申し込み後にもう同じイベントの詳細ページに遷移するとイベントを申し込みするボタンがなくなっています  
# 実装した機能のGIF
# 実装予定の機能
・カテゴリーごとに目的のイベント情報に素早くたどり着くことができる機能を実装する予定です  
・イベント情報にお気に入りをする機能を実装する予定です  
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
| capacity           | string  | null: false               |
| area_id            | integer | null: false               |
| place              | string  | null: false               |

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


