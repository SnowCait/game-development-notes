use `player`;  # sharding by player_id

# クライアントに持たせてもいいかもしれない

# 汎用性を持たせる
CREATE TABLE `parties` (
  `player_id` INT UNSIGNED NOT NULL,
  `number` TINYINT UNSIGNED NOT NULL,
  `data` JSON NOT NULL,
  PRIMARY KEY (`player_id`, `number`)
);

# 各ゲーム固有（ドラガリ）
CREATE TABLE `parties` (
  `player_id` INT UNSIGNED NOT NULL,
  `number` TINYINT UNSIGNED NOT NULL,
  `member_1.character_id` INT UNSIGNED NOT NULL,
  `member_1.weapon_id` INT UNSIGNED NOT NULL,
  `member_1.wyrinprint_id_1` INT UNSIGNED NOT NULL,
  `member_1.wyrinprint_id_2` INT UNSIGNED NOT NULL,
  `member_1.dragon_id` INT UNSIGNED NOT NULL,
  `member_2.character_id` INT UNSIGNED NOT NULL,
  `member_2.weapon_id` INT UNSIGNED NOT NULL,
  `member_2.wyrinprint_id_1` INT UNSIGNED NOT NULL,
  `member_2.wyrinprint_id_2` INT UNSIGNED NOT NULL,
  `member_2.dragon_id` INT UNSIGNED NOT NULL,
  `member_3.character_id` INT UNSIGNED NOT NULL,
  `member_3.weapon_id` INT UNSIGNED NOT NULL,
  `member_3.wyrinprint_id_1` INT UNSIGNED NOT NULL,
  `member_3.wyrinprint_id_2` INT UNSIGNED NOT NULL,
  `member_3.dragon_id` INT UNSIGNED NOT NULL,
  `member_4.character_id` INT UNSIGNED NOT NULL,
  `member_4.weapon_id` INT UNSIGNED NOT NULL,
  `member_4.wyrinprint_id_1` INT UNSIGNED NOT NULL,
  `member_4.wyrinprint_id_2` INT UNSIGNED NOT NULL,
  `member_4.dragon_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`player_id`, `number`)
);

# クエストクリア時のパーティ
CREATE TABLE `quest_cleared_parties` (
  `player_id` INT UNSIGNED NOT NULL,
  `quest_id` INT UNSIGNED NOT NULL,
  `data` JSON NOT NULL,
  PRIMARY KEY (`player_id`, `quest_id`)
);
