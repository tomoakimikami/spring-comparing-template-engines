# Java Template Engine比較

## 検証アプリ
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

5. アプリは3本作る
    * 基本ロジック同じで、ブランチで切り替える
        * Thymeleaf2系
        * Thymeleaf3系
        * JSP

## 性能計測
1. アプリ稼働サーバーと計測PCは別マシンにする
2. apache-abとかで負荷かける
3. 観点と方法が妥当かどうかを性能Tに見てもらう
    * PV/secはどれぐらいが必要とか
    * 高負荷サイトの値を使う
4. 計測内容
    * 処理速度
        * ログから取れそう
    * CPU
        * vmstatかな
    * メモリ
        * vmstat
