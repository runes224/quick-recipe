## 目次

- 概要
- 使い方orデモ
- 環境
- 他サービスとの比較

## 概要

マクロ栄養素の算出が可能なレシピアプリ。ホーム画面から1クリックでレシピを表示可能。

## URL

[https://quick-recipe.herokuapp.com](https://quick-recipe.herokuapp.com/)

## デモ

## 環境

- Docker 19.03.1
- Ruby 2.6.3
- Rails 5.2.3
- PostgreSQL 11.3

## 主な機能
### 機能要件

- レシピの一覧表示
    - ページネーション(kaminari)
- レシピの検索機能(ransack)
- レシピの詳細表示
- レシピの投稿・編集・削除
    - 複数モデルの同時投稿・編集（cocoon）
    - 検索文字列に紐づくDBのデータを一覧表示(Ajax)
    - 画像ファイルのアップロード(CarrieWave)
    - 料理手順をドラッグ&ドロップで並び替え(sortable)
- マイレシピ機能
    - マイレシピに追加したレシピを一覧で表示
- ユーザの登録・編集・削除(devise)
- ユーザ詳細
    - プロフィール画像(Gravatar)
    - ユーザが作成したレシピを一覧表示

### 非機能要件

- テスト(Rspec)
    - システムテスト
    - モデルのテスト
- 日本語対応(i18n)
## 設計書

### DB一覧

[Untitled](https://www.notion.so/535dfb3b353e44a6a745c8ab7d35d28e)

### ER図

[](https://www.notion.so/23f7e8533bee4d03928c5784f2e22096#7e7689c2a9d64b7c99f0cf55f9693282)

[https://quip.com/YUUBAE8F3bhk/QuickRecipe](https://quip.com/YUUBAE8F3bhk/QuickRecipe)
