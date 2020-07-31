# テスト

- [テストの種類と技法](https://qiita.com/ktarow/items/8c3d94d6c21a0c86b799)
- [技術的負債とならないテストコードを書くために考えること - Qiita](https://qiita.com/wasimaru/items/7e778493341999c12bac)

## 始めに
- 実施するテストを決める
- 実行タイミングを決める
  - 単体テストなど頻繁に行った方が良いものは CI に含める
  - 負荷テストなど時間のかかるものは定期的に実施する
- 使用するフレームワークを決める（ PHPUnit など）

## テストの種類
### 単体テスト (Unit Test)
モデルのメソッド単位のテストなど。

### 機能テスト (Feature Test)
API 単位のテストなど。

### リグレッションテスト

### 負荷テスト

## ワークフロー
### 既存のコードにテストを追加する
- バグが発生した箇所に都度再現テストを追加していく

## Framework
- [Quick/Nimble: A Matcher Framework for Swift and Objective-C](https://github.com/Quick/Nimble)
