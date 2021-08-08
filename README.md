# README

### 　Targetの概要

<img width="700" alt="スクリーンショット 2021-08-04 13 38 42" src="https://user-images.githubusercontent.com/80399352/128123787-03065ca5-1e92-4b24-8dcb-d20d0ec56fbe.png">

- 本アプリは、自分が抱えているtodoが部署のどの案件とリンクしているかを明確にできます。
- その他にも、会社、部署の月間目標及び年間目標の確認ができます。
- ログインユーザーには、**CompanyLogin（会社責任者）**、**DepartmentLogin（各部署責任者）**、**UserLogin（社員）** の３種類が用意されています。
- 各ユーザーが確認できる項目は、**CompanyTarget(会社目標)**、**DepartmentTarget(部署目標)**、**ToDoTarget(部署の案件)**、**ToDo**になります。
- ログインユーザーによって表示される画面が変わります。下は例になります。

####  ログインユーザーがCompanyの場合（Department Target閲覧時）

<img width="700" alt="スクリーンショット 2021-08-04 11 04 48" src="https://user-images.githubusercontent.com/80399352/128125139-2709cffb-241a-4ff5-95da-32487fc11e6d.png">

- 　Company（会社責任者）の場合、全ての部署の月間目標及び年間目標が表示されます。

####  ログインユーザーがDepartmentの場合(Department Target閲覧時)

<img width="700" alt="スクリーンショット 2021-08-03 19 30 33" src="https://user-images.githubusercontent.com/80399352/128126496-f78f7ff5-9d0d-4dd0-8803-e2fa122912ce.png">

-  Department（部署責任者)の場合、部署の月間目標及び年間目標が表示されます。

####  ログインユーザーがUserの場合(ToDo閲覧時)

<img width="700" alt="スクリーンショット 2021-08-03 19 30 13" src="https://user-images.githubusercontent.com/80399352/128127204-8f978183-e583-4bf1-82c9-e1c48bdc5f96.png">

-  User（社員）のToDoには所属部署のToDoTarget（部署の案件）が表示されているので、抱えているToDoが部署のどの案件とリンクしているか一目でわかります。

### 開発の背景

- 負担する業務量が多くなった時に、自分が抱えている仕事が部署のどの案件とリンクしているか明確になっていた方が仕事が捗りやすい。
- 部署が抱えている案件を把握できていれば、指示を待つことなく、できる範囲の仕事を積極的にできる。
- 目標が把握できれば、目標達成のためにどの位のペースで仕事すればいいか逆算しやすい

### 一体感のあるビジネスを！

- 会社や部署の目標は、社員にとって飾りになってしまいがちです。
- しっかり目標を把握していた方が何のための仕事なのかを意識しやすく、会社の目標達成にも繋がりやすいと考えました。

### 本アプリのメリット

- 社員が会社、部署の目標を身近に感じやすい！
- 仕事の目的が明確になるので、勘違いや思いこみによるミスが起こりにくい！
- 案件の進捗状況をToDoの完了度合いにより確認できる！
- 目標達成に向けて各部署のToDoTarget（案件）の完了度合いにより確認できる！

### 開発環境

- Ruby 2.7.2
- Rails 6.1.4
- Docker
- MySQL
- CircleCI(RSpec、Rubocop)

### 主要gem

- `Devise` : ユーザーの新規登録、ログイン、ログアウト、ゲストユーザー機能の実装
- `RSpec` : 単体テスト（model）、結合テスト（request spec）で使用
- `FactoryBot` : `RSpec`のテスト実装時、使用
- `Faker` : `RSpec`のテスト実装時、使用
- `RuboCop` : Rubyの静的コード解析
- `bootstrap` : フロントエンド実装

### ER図

<img width="1379" alt="スクリーンショット 2021-08-04 15 13 54" src="https://user-images.githubusercontent.com/80399352/128131114-54184251-59e9-48d2-9667-61c7384d783d.png">

### デプロイ

- Herokuサービスを使用

### Qiita記事

- 解説記事としてQiita記事を執筆した。

https://qiita.com/kobayashiryou/items/e2f65edeb6da53601711
