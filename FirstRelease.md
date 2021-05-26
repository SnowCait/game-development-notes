# 初回リリース

## 気をつけること
- dump など重い処理は slave へ
- cron が実行できるか数日前から確認しておく
- 日跨ぎ
- ログレベル
  - error にするのは緊急対応が必要なものだけにして、残りは warning か info にする
- 複数サーバーにまたがるログを1箇所に集約する
  - Kibana, CloudWatch
- インフラの暖機申請
  - [Elastic Load Balancing の暖気申請について | DevelopersIO](https://dev.classmethod.jp/articles/elastic-load-balancing-pre-warming/)
