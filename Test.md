# テスト

- [テストの種類と技法](https://qiita.com/ktarow/items/8c3d94d6c21a0c86b799)
- [技術的負債とならないテストコードを書くために考えること - Qiita](https://qiita.com/wasimaru/items/7e778493341999c12bac)
- [Flaky Testとの戦い - Cybozu Inside Out | サイボウズエンジニアのブログ](https://blog.cybozu.io/entry/2020/12/23/100000#fn:1)
- [これからのテストの話をしよう〜Goにおけるテストノウハウ〜 - Qiita](https://qiita.com/mtskhs/items/c9f69b036f0ab47b617e)
- [テスト工程を理解する！テストの種類や役割、技法について解説します！ ｜ 案件評判](https://anken-hyouban.com/blog/2019/11/21/test-all/)
- [どうして統合テストは重要なんだろう？](https://zenn.dev/ignorant_kenji/articles/6f740feabf6f30)

<img src="https://user-images.githubusercontent.com/1297512/178142095-f59cdabb-97eb-4b1b-bea4-577863a4f877.png" alt="https://anken-hyouban.com/blog/2019/11/21/test-all/ より" width="50%">


## 始めに
- 実施するテストを決める
- 実行タイミングを決める
  - 単体テストなど頻繁に行った方が良いものは CI に含める
  - 負荷テストなど時間のかかるものは定期的に実施する
- 使用するフレームワークを決める（ PHPUnit など）

## テストの種類
### 単体テスト (Unit Test)
モデルのメソッド単位のテストなど。

### 機能テスト (Feature Test)、統合テスト (Integration Test)
API 単位のテストなど。

### E2E テスト
- Selenium
- Cypress

### リグレッションテスト

### 負荷テスト

## DB のテスト
レコードの追加や削除が発生するため遅くなりがち。

### 解決方法 1 : 全体にトランザクションを張ってロールバックする

メリット
- I/O が発生しないため速い

デメリット
- トランザクションのテストができない
  - 割と致命的なので適用する場合はトランザクションのテストが必要ない範囲に限定した方が良い

## ワークフロー
### 既存のコードにテストを追加する
- バグが発生した箇所に都度再現テストを追加していく

## Framework
- [Quick/Nimble: A Matcher Framework for Swift and Objective-C](https://github.com/Quick/Nimble)
