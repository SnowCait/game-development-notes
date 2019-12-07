# 管理画面

## 用途

- お知らせや補填などの運用
- CS 対応
- 調査

## 機能

- アカウントは個人毎に発行する
  - 退職したら無効化
- 管理画面ユーザーの更新系操作ログを残しておく
  - account_id, role, action
- INSERT / UPDATE / DELETE は master, 他は slave へ接続する
