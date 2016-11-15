# Comparing Template engines for Spring MVC

fork元とは既にまったく別のものになっています。
各ブランチにて、それぞれ同じ仕様でView層だけを差し替えた実装を行っています。

## 検証アプリ仕様
1. DB、セキュリティは使わない最小限なwebアプリ
    * Controllerのみ。なにもDIしない
2. 画面は複数用意し、JMeterなどで順番にアクセスする想定
    * 一覧画面
        * 100件のループアイテム表示処理
            * Thymeleaf: [th:each](http://www.thymeleaf.org/doc/tutorials/3.0/usingthymeleaf_ja.html#繰り返し処理)
            * JSP: JSTLの[c:forEach](http://struts.wasureppoi.com/jstl/02_foreach.html)
        * 列アイテムに4つぐらいプロパティを持つJavaBeanを使う
        * ループ処理の中にIF判定を入れる
            * Thymeleaf: [th:if](http://www.thymeleaf.org/doc/tutorials/3.0/usingthymeleaf_ja.html#単純な条件-if-と-unless)
            * JSP:JSTLの[c:if](http://struts.wasureppoi.com/jstl/02_if.html)
        * ループ表示用のListは、static final等であらかじめメモリに持っておく
    * 入力フォーム画面
        * ThymeLeaf/JSTLそれぞれのフォームタグ部品を使う。
        * フォーム情報を入力画面から確認画面へ持ち回るため、セッション情報は持つ。
    * 入力確認画面
        * 入力画面から引き継いだ情報を表示する。
3. 設定は本番向け設定
    * JSPの[プレコンパイル](http://www.confrage.com/tomcat/jsp/jsp_precompile/jsp_precompile.html)は行わない
    * Thymeleafの[キャッシュ](http://www.thymeleaf.org/doc/tutorials/3.0/usingthymeleaf_ja.html#テンプレートキャッシュ)は有効にする
4. Viewレイヤーは、よく使われる要素を1画面に盛り込む
    * レイアウト処理
        * JSP: [Apache Tiles](https://tiles.apache.org/)
        * Thymeleaf: [thymeleaf-layout-dialect](https://github.com/ultraq/thymeleaf-layout-dialect)
        * Thymeleaf: [flagment expressions](http://enterprisegeeks.hatenablog.com/entry/2016/05/25/152437)
    * ヘッダー/コンテンツボディ/フッターの3要素で構成
5. javax.servlet.Filterで時間計測する
    * ブラウザ側だと通信時間がノイズになるため
    * Controller部分は誤差の範囲内だと思うので問題なし
    * ミリ秒で良いと思う。ナノ秒までの正確さは不要かと。
    * コード的にはこんな感じ

```java
final long begin = System.currentTimeMillis();
try {
  chain.doFilter(request, response);
} finally {
  log.info("diff:{}", System.currentTimeMillis()-begin);
}
```

### 画面一覧

|URL|概要|
|-------|------|
|http://localhost:8080/showList|一覧画面|
|http://localhost:8080/showForm|入力フォーム画面|
|http://localhost:8080/showConfirm|入力確認画面|

##  チェックアウトと起動

### チェックアウト

```bash
% git clone https://github.com/tomoakimikami/spring-comparing-template-engines.git
% cd spring-comparing-template-engines
```

### ブランチ一覧

|ブランチ|概要|
|-------|------|
|jsp|JSP2.2およびJSTL1.2を使用|
|jsp-tiles3|JSP2.2およびApache Tiles3を使用|
|thymeleaf-2|Thymeleaf2およびThymeleaf Layout Dialectを使用|
|thymeleaf-3|Thymeleaf3およびThymeleaf Layout Dialectを使用|
|thymeleaf-3-fragment|Thymeleaf3およびFragment Expressionsを使用|

動かしたいViewのブランチに切り替える

```bash
% git checkout jsp
% git checkout jsp-tiles3
% git checkout thymeleaf-2
% git checkout thymeleaf-3
% git checkout thymeleaf-3-fragment
```

### 起動

```bash
% mvn tomcat7:run
```

### 確認

一覧画面 -> 入力フォーム画面 -> 入力確認画面

という順番にアクセスする想定になっています。

## 実行結果

コンソール上にログが出ます。変更する場合は、log4j.propertiesを変更して下さい。

ログ内容
    diff:%d ms, uri:%s

* diff
    - 処理の開始〜終了までの時間。
    - controllerからjsp/テンプレートエンジンの処理終了までの時間
* uri
    - リクエストされたuri
