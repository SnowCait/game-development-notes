use `matching`;

# state を持つ場合
CREATE TABLE `rooms` (
  `id` BIGINT UNSIGNED AUTO_INCREMENT NOT NULL,
  `number` SMALLINT(7) UNSIGNED ZEROFILL NOT NULL COMMENT 'プレイヤー入力用',
  `state` TINYINT UNSIGNED NOT NULL DEFAULT 1 COMMENT '1: waiting, 2: ready/start',
  `host_player_id` INT UNSIGNED NOT NULL,
  `guest_player_ids` JSON NOT NULL,
  `quest_id` INT UNSIGNED NOT NULL COMMENT '検索用',
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY (`number`),
  KEY (`state`, `quest_id`)
);

# state を持たない場合
CREATE TABLE `waiting_rooms` (
  `id` BIGINT UNSIGNED AUTO_INCREMENT NOT NULL,
  `number` SMALLINT(7) UNSIGNED ZEROFILL NOT NULL COMMENT 'プレイヤー入力用',
  `host_player_id` INT UNSIGNED NOT NULL,
  `guest_player_ids` JSON NOT NULL,
  `quest_id` INT UNSIGNED NOT NULL COMMENT '検索用',
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY (`number`),
  KEY (`state`, `quest_id`)
);

# ホストがルーム作成
INSERT INTO `rooms` (`number`, `host_player_id`) VALUES (?, ?);

# ゲストが検索
SELECT `id` FROM `rooms` WHERE `number` = ?; # number がユニークでない場合は複数引っかかる
SELECT `id`, `number`, `host_player_id` FROM `rooms` WHERE `quest_id` = ? AND `state` = 1; # ランダム抽出したい、件数絞りたい
SELECT `id` FROM `rooms` WHERE `state` = 1; # アプリケーション側でランダムに決めて WHERE IN で詳細を取得
SELECT `number`, `host_player_id` FROM `rooms` WHERE `id` IN (?);

# ゲストが入室、退室
SELECT * FROM `rooms` WHERE `id` = ? FOR UPDATE;
UPDATE `rooms` SET `guest_player_ids` = "[?]"

# 出発、解散
UPDATE `rooms` SET `state` = 2 WHERE `id` = ? AND `state` = 1; # affected rows 1 になるのを確認する
DELETE FROM `waiting_rooms` WHERE `id` = ?;

# 時間経過による強制解散
DELETE FROM `rooms` WHERE `created_at` <= ?;

