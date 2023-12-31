<div align="center">
  <img src="app/assets/images/logo_readme.png" alt="サイトのロゴ" width="200" height="200">
</div>

# ZooNavi

## サイト概要
### サイトテーマ
全国の動物園と動物の情報がまとめられたレビューサイト。

### テーマを選んだ理由
「ラッコが見たい」と思い近場の水族館に行った際、目当てのラッコは展示されておらず、後々ラッコは国内で限られた一部の水族館でしか展示されていないと知るという経験が過去にありました。<br>
今回のテーマ設定にあたって、動物園/水族館の公式サイトをいくつか確認してみましたが、展示されている動物の情報はほとんどなく、園内マップなどで大まかに把握することしかできない状況でした。<br>
そのため、どの動物園/水族館にどんな動物がいるのか詳しく知れるサービスがあれば、私と同じような水族館に行ったらラッコがいなかった……そんな悲しみを少しでも減らすことができると考え、このテーマにしました。

### ターゲットユーザ
- 国内の動物園についての情報を調べている人
- 動物についての情報を調べている人
- 目当ての動物がどの動物園で見ることができるか探している人
- 動物園についての感想を発信したい人
- 動物園の感想を調べている人

### 主な利用シーン
- 地方ごとの動物園を探す
- 目当ての動物がどの動物園で見ることができるか探す
- 向かう予定の動物園で見られる動物を調べる
- 動物園についてのレビューを投稿する
- 他の人が投稿した動物園についてのレビューを確認する

## 設計書
- [画面遷移図（管理者側）](https://drive.google.com/file/d/13G12lWfjmaGOjNf1bi3zpJN9vA1Aho0O/view)
- [画面遷移図（会員側）](https://drive.google.com/file/d/1E7vi5Ew5MMxkzaEFPLau7EtgMuYZUMwH/view)
- [ER図](https://drive.google.com/file/d/1ENfU2xu7Q296DtytCSI2pjWkk1wIniUl/view)
- [テーブル定義書](https://docs.google.com/spreadsheets/d/1VvlaudSOimDt_7UqeHGCk6fnD9oOPAl24JZSdaX6uNw/edit#gid=1415007222)
- [アプリケーション詳細設計書](https://docs.google.com/spreadsheets/d/1WIYzEcQDSfLYEcV4KKdxpZX7ktm-CRxMGYwiQuKU_ms/edit#gid=549108681)

## 開発環境
- OS：Linux(CentOS)
- 言語：HTML,CSS,JavaScript,Ruby,SQL
- フレームワーク：Ruby on Rails
- JSライブラリ：jQuery
- IDE：Cloud9

## 管理者ページのログイン方法について
下記の情報を入力することで管理者としてログインできます。
- メールアドレス：admin@example.com
- パスワード　　：password