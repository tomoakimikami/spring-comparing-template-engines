# Comparing Template engines for Spring MVC

fork元とは既にまったく別のものになっています。
各ブランチにて、それぞれ同じ仕様でView層だけを差し替えた実装を行っています。

## 検証アプリ仕様
1. DB、セッション、セキュリティは使わない最小限なステートレスwebアプリ
    * Controllerのみ。なにもDIしない
    * ループ表示用のListは、static final等であらかじめメモリに持っておく
2. 設定は本番向け設定
    * JSPのプレコンパイルは行わない
    * Thymeleafのキャッシュは有効にする
3. Viewレイヤーは、よく使われる要素を1画面に盛り込む
    * 100件のループアイテム表示処理
        * Thymeleaf: th:each
        * JSP: JSTLの[c:forEach](http://struts.wasureppoi.com/jstl/02_foreach.html)
    * 列アイテムに4つぐらいプロパティを持つJavaBeanを使う
    * ループ処理の中にIF判定を入れる
    * レイアウト処理
        * Thymeleaf: [thymeleaf-layout-dialect](https://github.com/ultraq/thymeleaf-layout-dialect)
        * JSP: [Apache Tiles](https://tiles.apache.org/)
    * ヘッダー/コンテンツボディ/フッターの3要素で構成
4. javax.servlet.Filterで時間計測する
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

## ブランチ一覧

|ブランチ|概要|
|-------|------|
|jsp|JSPおよびJSTLを使用|
|jsp-tiles3|JSPおよびApache Tiles3を使用|
|thymeleaf-2|Thymeleaf2およびThymeleaf Layout Dialectを使用|
|thymeleaf-3|Thymeleaf3およびThymeleaf Layout Dialectを使用|
|thymeleaf-3-fragment|Thymeleaf3およびFragment Expressionsを使用|

##  チェックアウトと起動

### チェックアウト

```bash
% git clone https://github.com/tomoakimikami/spring-comparing-template-engines.git
% cd spring-comparing-template-engines
```

動かしたいViewのブランチに切り替える

```bash
git checkout jsp
git checkout jsp-tiles3
git checkout thymeleaf-2
git checkout thymeleaf-3
git checkout thymeleaf-3-fragment
```

### 起動

```bash
mvn tomcat7:run
```

## 実行結果

コンソール上にログが出ます。変更する場合は、log4j.propertiesを変更して下さい。

ログ内容
    diff:%d ms, uri:%s

* diff
    - 処理の開始〜終了までの時間。
    - controllerからjsp/テンプレートエンジンの処理終了までの時間
* uri
    - リクエストされたuri
