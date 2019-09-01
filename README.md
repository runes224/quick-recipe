## 目次

- 概要
- 環境
- 主な機能
- 設計

## 概要

マクロ栄養素の算出が可能なレシピアプリ。ホーム画面から1クリックでレシピを表示可能。

## URL

[https://quick-recipe.herokuapp.com](https://quick-recipe.herokuapp.com/)

## 環境

- Docker 19.03.1
- Ruby 2.6.3
- Rails 5.2.3
- PostgreSQL 11.3

## 主な機能

- レシピの一覧表示
![home](https://user-images.githubusercontent.com/49732811/64015296-2be0df80-cb5f-11e9-9c2e-fe34dedd8c54.png)
    - ページネーション(kaminari)
- レシピの検索機能(ransack)
- レシピの詳細表示
![show](https://user-images.githubusercontent.com/49732811/64015379-5c287e00-cb5f-11e9-9967-6c3b02d0d745.png)
- レシピの投稿・編集・削除
![post](https://user-images.githubusercontent.com/49732811/64015404-6d718a80-cb5f-11e9-854d-3e34dcb69854.png)
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
- レスポンシブ対応(Bootstrap4)
- テスト(Rspec)
    - システムテスト
    - モデルのテスト
- 日本語対応(i18n)
## 設計

### DB一覧
|  **DB名** | **概要** |
| :---: | :---: |
|  Recipes | レシピテーブル |
|  Users | ユーザテーブル |
|  Directions | 手順テーブル |
|  Ingredients | 材料テーブル |
|  MyRecipes | レシピテーブルとユーザテーブルの中間テーブル |
|  IngredientRelations | レシピテーブルと材料テーブルの中間テーブル |

### ER図

![Untitled Diagram (4) (1)](https://user-images.githubusercontent.com/49732811/64012861-7a8b7b00-cb59-11e9-8575-570ea0133ec2.jpg)

### 設計書
[https://quip.com/YUUBAE8F3bhk/QuickRecipe](https://quip.com/YUUBAE8F3bhk/QuickRecipe)
