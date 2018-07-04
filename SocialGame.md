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
    ** Jenkinsfiles

## DB構成
* User (Sharding)
* Game
* Log (Partition)
* Kpi

## 要設計
* 例外・エラー
* ログ
* デバッグコマンド
  * サーバーはデプロイしない or ユーザー判定して弾く
  * クライアントはバイナリいじったら有効にできてしまうのでそもそもコード自体含めない方が良い
