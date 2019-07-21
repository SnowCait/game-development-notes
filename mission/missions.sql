use `player`;  # sharding by player_id

# 無期限ミッション
CREATE TABLE `player`.`missions` (
	`player_id` INT UNSIGNED NOT NULL,
	`mission_id` INT UNSIGNED NOT NULL,
	`value` INT UNSIGNED NOT NULL DEFAULT 0,
	PRIMARY KEY (`player_id`, `mission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# 受け取り済みミッション報酬
CREATE TABLE `payer`.`mission_rewards` (
	`player_id` INT UNSIGNED NOT NULL,
	`mission_id` INT UNSIGNED NOT NULL,
	`mission_step` TINYINT UNSIGNED NOT NULL,
	PRIMARY KEY (`player_id`, `mission_id`, `mission_step`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# missions ログ
CREATE TABLE `log`.`log_missions` (
	`player_id` INT UNSIGNED NOT NULL,
	`mission_id` INT UNSIGNED NOT NULL,
	`value` INT UNSIGNED NOT NULL DEFAULT 0,
	`created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY (`player_id`, `mission_id`, `value`, `created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8
PARTITION BY RANGE COLUMNS (`created_at`) (
	PARTITION p201901 VALUES LESS THAN ('2019-02-01 00:00:00'),
	PARTITION p201902 VALUES LESS THAN ('2019-03-01 00:00:00')
);

# mission_rewards ログ（ mission_rewards に created_at を追加しても代用できるが weekly mission を考慮して分けておく）
CREATE TABLE `log`.`log_mission_rewards` (
	`player_id` INT UNSIGNED NOT NULL,
	`mission_id` INT UNSIGNED NOT NULL,
	`mission_step` TINYINT UNSIGNED NOT NULL,
	`created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY (`player_id`, `mission_id`, `mission_step`, `created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8
PARTITION BY RANGE COLUMNS (`created_at`) (
	PARTITION p201901 VALUES LESS THAN ('2019-02-01 00:00:00'),
	PARTITION p201902 VALUES LESS THAN ('2019-03-01 00:00:00')
);

# 回数、個数
INSERT INTO `missions` (`player_id`, `mission_id`, `value`) VALUES (?, ?, ?)
  ON DUPLICATE KEY UPDATE `value` = `value` + VALUES(`value`);
-- always: 2 rows affected

# 最大値
INSERT INTO `missions` (`player_id`, `mission_id`, `value`) VALUES (?, ?, ?)
  ON DUPLICATE KEY UPDATE `value` = IF(VALUES(`value`) > `value`, VALUES(`value`), `value`);
-- updated: 2 rows affected
-- nothing: 0 rows affected

# 更新されたら（回数のときは常に、最大値のときは affected_rows > 0 のとき）ミッション報酬が受け取れるか判定する
SELECT `step` FROM `master`.`mission_steps` WHERE `id` = ? AND `value` <= ?;
SELECT MAX(`mission_step`) FROM `mission_rewards` WHERE `player_id` = ? AND `mission_id` = ?;
INSERT INTO `log`.`log_missions` (`player_id`, `mission_id`, `value`) VALUES (?, ?, ?);

# 報酬受け取り
INSERT INTO `mission_rewards` (`player_id`, `mission_id`, `mission_step`) VALUES (?, ?, ?);

# 一覧
SELECT * FROM `master`.`mission_steps`;
SELECT * FROM `missions` WHERE `player_id` = ?;
SELECT `player_id`, `mission_id`, MAX(`mission_step`) FROM `mission_rewards` WHERE `player_id` = ? GROUP BY `mission_id`;

# MissionType
#   Count: 回数
#   Max: 最大値, 1回限り

# missions.csv
# id, type, description
# 1, Count, quest clear times
# 2, Max, character max lv

# mission_steps.csv
# id, step, value, description
# 1, 1, 1, quest clear 1 time
# 1, 2, 5, quest clear 5 times
# 2, 1, 10, character Lv10
# 2, 2, 20, character Lv20
