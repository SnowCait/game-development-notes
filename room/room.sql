use `matching`;

CREATE TABLE `rooms` (
  `id` BIGINT UNSIGNED AUTO_INCREMENT NOT NULL,
  `number` SMALLINT(7) UNSIGNED ZEROFILL NOT NULL COMMENT 'プレイヤー入力用',
  `host_player_id` INT UNSIGNED NOT NULL,
  `guest_player_ids` JSON NOT NULL,
  `quest_id` INT UNSIGNED NOT NULL COMMENT '検索用',
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
);

# ホストがルーム作成
INSERT INTO `rooms` (`number`, `host_player_id`) VALUES (?, ?);

# ゲストが検索
SELECT `id` FROM `rooms` WHERE `number` = ?; # number がユニークでない場合は複数引っかかる
SELECT `id`, `number`, `host_player_id` FROM `rooms` WHERE `quest_id` = ?; # ランダム抽出したい、件数絞りたい
SELECT `id` FROM `rooms`; # アプリケーション側でランダムに決めて WHERE IN で詳細を取得
SELECT `number`, `host_player_id` FROM `rooms` WHERE `id` IN (?);

# ゲストが入室
SELECT * FROM `rooms` WHERE `id` = ? FOR UPDATE;
UPDATE `rooms` SET `guest_player_ids` = "[?]"
