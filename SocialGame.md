# ソーシャルゲーム開発

## ディレクトリ構成
* root
  * api
  * realtime
  * multi
  * batch
  * admin
  * infra
  * document
  * ci
    * Jenkinsfiles

## DB構成
* User (Sharding)
* Game
* Log (Partition)
* Kpi

### 注意
* 対象範囲が漏れるので `23:59:59` や `BETWEEN` を使わない
  * 必ず `2018-01-01 00:00:00 <= x < 2018-01-02 00:00:00` で比較する

## クライアント
* 本番アプリのコードにデバッグ用コードは含めない `#if DEBUG`

## サーバー

## 要設計
* 例外・エラー
* バリデーション `check~` `validate~`
* ログ
* デバッグコマンド
  * サーバーはデプロイしない or ユーザー判定して弾く
  * クライアントはバイナリいじったら有効にできてしまうのでそもそもコード自体含めない方が良い
