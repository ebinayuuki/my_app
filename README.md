# アプリケーション名
my_hospital

# アプリケーション概要
かかりたい病院の混雑状況が見られ、予約がきでる  

# URL  
実装次第記述

# テスト用アカウント  
実装次第記述
# 利用方法
・ユーザアカウントがdoctorとuserの２種類  
・doctorが病院を登録し、それに対しuserから予約ができる  

# 目指した課題解決
・患者の診察待ち時間の解消  
・院内感染の軽減  

# 洗い出した要件

## ユーザアカウント登録機能
  * 目的
    * サービスの利用者を登録・管理するため
  * 詳細
    * devise GEMを用い、doctorアカウントとuserアカウントが登録できるよう実装する
  * ユースケース
    *登録するアカウントはdoctor、userの２種類とする

## 投稿機能
  * 目的
    * 本サービスで扱うコンテンツを投稿するため
  * 詳細
    * 必須事項を全て記入後、登録ボタンを押下すると投稿ができる
  * ユースケース
    * ログイン済のdoctorアカウントのみ投稿可能
    * 必須項目を全て記入しないと投稿不可

## 投稿削除機能
  * 目的
    * 投稿されたコンテンツを削除するため
  * 詳細
    * 削除ボタンを押下すると投稿されたコンテンツが削除される
  * ユースケース
    * doctorアカウントのみ削除可能
    * 投稿したアカウントのみ削除可能

## トップページ
  * 目的
    * トップページを作成するため
  * 詳細
    * 一覧表示ページ、アカウント登録へ遷移する
  * ユースケース
    * 一覧表示ページ、アカウント登録を押下すると各ページへ遷移する

## 予約機能
  * 目的
    * 投稿されたコンテンツに対し、予約ができる
  * 詳細
    * doctorアカウントによって投稿されたコンテンツに対し、userアカウントが予約をできる
  * ユースケース
    * １つのコンテンツに対し、同一のuserアカウントでは予約できない

## 予約解除機能
  * 目的
    * 予約を取り消す
  * 詳細
    * 予約解除ボタンを押下すると予約が解除できる
  * ユースケース
    * userアカウトのみ解除可能
    * 予約したアカウントのみ解除可能

## 詳細ページ機能
  * 目的
    * 投稿されたコンテンツの詳細ページを表示
  * 詳細
    * 投稿されたコンテンツの詳細を閲覧できる
  * ユースケース
    * 投稿時の項目が全て表示される
    * userアカウントのみ予約ボタンを押下することにより予約ができる
    * 予約したuserアカウントのみ予約解除ボタンを押下することにより予約がとり消せる

## 一覧表示機能
  * 目的
    * 投稿された全コンテンツの表示
  * 詳細
    * 投稿されたコンテンツの全てが表示される
  * ユースケース
    * userアカウントのみ予約ボタンを押下するとコンテンツに対して予約ができる
    * 予約したuserアカウントのみ予約解除ボタンを押下すると予約が取り消せる
    *投稿された各コンテンツの診察待ち人数、予想待ち時間、診療科目、郵便番号、所在地、受付時間が表示される

# 実装した機能についてのGIFと説明
* 予約管理機能
  * 予約ボタンを押下する事により、userが病院に対して予約ができる。
* 診察待ち状況の可視化
  * 各病院の診察待ち状況が数字で見える。

# 実装予定の機能
* ソート機能
  * 予約待ち数、病院への距離の近い順、病院の登録順等
* お知らせ機能
  * 予約後診察時間が近くなったら、LINE等のアプリと連携してお知らせをする
* Google Mapの導入
  * APIを用い登録された病院の地図の表示
* UIの強化
  * 使いやすい、使いたいと思われる構成にする

# テーブル設計

## doctors テーブル

| Column              | Type    | Options                   |
| ------------------- | --------| ------------------------- |
| email               | string  | null: false               |
| encrypted_password  | string  | null: false               |
| name                | string  | null: false               |
| age                 | integer | null: false               |
| gender              | string  | null: false               |
| postal              | integer | null: false               |
| ken_id              | integer | null: false               |
| phone               | integer | null: false               |
| specialty           | string  | null: false               |
| license             | integer | null: false               |
| info                | text    |                           |

### Association

- has_many :hospitals


## users テーブル

| Column              | Type    | Options                   |
| ------------------- | --------| ------------------------- |
| email               | string  | null: false               |
| encrypted_password  | string  | null: false               |
| name                | string  | null: false               |
| age                 | integer | null: false               |
| gender              | string  | null: false               |
| postal              | integer | null: false               |
| ken_id              | integer | null: false               |
| phone               | integer | null: false               |
| info                | text    |                           |

### Association

- has_many :reservations


## hospitals テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| name        | string     | null: false                    |
| department  | string     | null: false                    |
| postal      | integer    | null: false                    |
| ken_id      | integer    | null: false                    |
| info        | text       | null: false                    |
| time        | string     | null: false                    |
| doctor      | references | null: false, foreign_key: true |


### Association

- belongs_to :doctor
- has_many :reservations


## reservations テーブル


| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user               | string     | null: false, foreign_key: true |
| hospital           | integer    | null: false, foreign_key: true |


### Association

- belongs_to : hospitals
- belongs_to : users

# ローカルでの動作方法
・コピー後、ターミナルで本ファイルに移動後「rails s」を実行  
・ruby 2.6.5  
・Rails 6.0.3.5
