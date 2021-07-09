# 🏋🏽‍♀️BUILDME💪
1日はじめに目標を立て、1日のおわりに振り返りを行う。<br>
日々自分自身を鍛えるためのサービスです。

# 🌐App URL
https://maccho-app.herokuapp.com/

  * ID/Pass
    * ID: macho
    * Pass: 5555

# 🏋🏽‍♀️BUILDMEについて
### 登場人物
* 目標を達成したいと望む人
* やってみたいことはあるが行動につながらない人

### ユーザーが抱える課題
* やってみたい・成し遂げたいことがあるが継続できなかったり行動することができない

### 解決方法
* 目標を言葉にすること
* 目標に対して振り返りを実施し、日々改善していくこと

### 望む未来
* 目標を立て、振り返りを行ない、改善できるようになること
* 成し遂げたいことを見いだし、達成に向けて挑戦すること

### サービスをつくった背景
「ダイエットしたいんだけどなかなか続かなくて・・」「スキルをとりたいんだけどなにをしたらいいのか・・」と、なにかをやりたいけれど、実際に行動に移せていない友人が身近に多くいます。<br>
行動につながらないそもそもの原因はなんだろう・・と考えたところ、なにかを達成するために「なにをするか？」という日々の目標を言語化していないことに原因があると感じました。
自分で目標を立てて、自分で振り返る、さらにはそのためのサポートツール付き。そんなアプリがあったらいいなあ！と。<br>
それをカタチにしたのが「BUILDME」です。

### 機能構成
機能はざっくりと2つに分けられます。
* メイン機能
  * 1日の目標を投稿する
  * 目標に対して振り返った内容を投稿する
* サポート機能：ユーザーがメイン機能を効果的・継続的に使えるようにサポートする
  * ユーザー管理機能（新規登録・ログイン・マイページ)
  * コメント機能
  * 瞑想タイマー
  * メモ書き

# DEMO

### トップページ（投稿した目標の一覧を表示）
<p align="left">
  <img src="https://i.gyazo.com/d1883c12a4f624b7288873cceae8192d.gif" width=50%>  
</p>　

### 新規登録画面
<p align="left">
  <img src="https://i.gyazo.com/66a35d21fc5239074d5054cab00a1450.png" width=50%>  
</p>　

### 目標を投稿するページ
<p align="left">
  <img src="https://i.gyazo.com/bd696d51b948d22e25ab9022e0d4cff5.gif" width=50%>  
</p>　

### 目標の振り返りを投稿するページ
<p align="left">
  <img src="https://i.gyazo.com/1baad4a587cc4334f3678b6c2021cce6.gif" width=50%>  
</p>　

### 詳細表示画面
<p align="left">
  <img src="https://i.gyazo.com/6b920aa2282f9fae1d966595b77b635f.png" width=50%>  
</p>　

### マイページ画面　
<p align="left">
  <img src="https://i.gyazo.com/6c26121cd314f77db5d8a4223a35b96c.gif" width=50%>  
</p>　

### メモ書きページ　
<p align="left">
  <img src="https://i.gyazo.com/65bddf979e82e58b4d825e3afb198610.gif" width=50%>  
</p>　

# 工夫したポイント
* シンプル＆ストレスフリー
  * 見た目をシンプルでわかりやすいデザインにした
  * JavaScriptを使い画面遷移をスムーズにすることでストレスを軽減する仕様にした

* 機能の役割を明確に定義することで、どのような目的のサービスか明確にした
  * メインの機能の役割は、ユーザーが「目標を立てる・振り返りをする」このサイクル実行し自分自身を日々高める
  * サポート機能の役割は、ユーザーがメイン機能を効果的・継続的に使えるようにサポートする

# 🔧使用技術
* Ruby 2.6.5
* Rails 6.0.3
* JavaScript
* MYSQL
* RSpec
* AWS
  * S3
* Heroku
* GitHub
* GitHubDesktop

# 課題や今後実装したい機能
  * サポート機能を増やしていきたい(でもサポートしすぎないように・・・)

# ER図
<p align="left">
  <img src="https://i.gyazo.com/a0562daa0d90cebfd91f96480f5ddce4.png" width=70%>  
</p>　
