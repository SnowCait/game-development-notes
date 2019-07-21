use `player`;  # sharding by player_id

# ウィークリーミッション
CREATE TABLE `player`.`weekly_missions` (
	`player_id` INT UNSIGNED NOT NULL,
	`mission_id` INT UNSIGNED NOT NULL,
	`value` INT UNSIGNED NOT NULL DEFAULT 0,
	`updated_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	PRIMARY KEY (`player_id`, `mission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# 受け取り済みミッション報酬
CREATE TABLE `payer`.`weekly_mission_rewards` (
	`player_id` INT UNSIGNED NOT NULL,
	`mission_id` INT UNSIGNED NOT NULL,
	`mission_step` TINYINT UNSIGNED NOT NULL,
	`created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY (`player_id`, `mission_id`, `mission_step`, `created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# weekly_missions ログ
CREATE TABLE `log`.`log_weekly_missions` (
	`player_id` INT UNSIGNED NOT NULL,
	`mission_id` INT UNSIGNED NOT NULL,
	`value` INT UNSIGNED NOT NULL,
	`created_at` DATETIME NOT NULL,
	PRIMARY KEY (`player_id`, `mission_id`, `value`, `created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8
PARTITION BY RANGE COLUMNS (`created_at`) (
	PARTITION p201901 VALUES LESS THAN ('2019-02-01 00:00:00'),
	PARTITION p201902 VALUES LESS THAN ('2019-03-01 00:00:00')
);

# weekly_mission_rewards ログ
CREATE TABLE `log`.`log_mission_rewards` (
	`player_id` INT UNSIGNED NOT NULL,
	`mission_id` INT UNSIGNED NOT NULL,
	`mission_step` TINYINT UNSIGNED NOT NULL,
	`created_at` DATETIME NOT NULL,
	PRIMARY KEY (`player_id`, `mission_id`, `mission_step`, `created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8
PARTITION BY RANGE COLUMNS (`created_at`) (
	PARTITION p201901 VALUES LESS THAN ('2019-02-01 00:00:00'),
	PARTITION p201902 VALUES LESS THAN ('2019-03-01 00:00:00')
);

# 回数、個数
INSERT INTO `weekly_missions` (`player_id`, `mission_id`, `value`) VALUES (?, ?, ?)
  ON DUPLICATE KEY UPDATE `value` = IF(`updated_at` < '?'/* week start at */, VALUES(`value`), `value` + VALUES(`value`));
-- always: 2 rows affected

# 最大値
INSERT INTO `weekly_missions` (`player_id`, `mission_id`, `value`) VALUES (?, ?, ?)
  ON DUPLICATE KEY UPDATE `value` = IF(`updated_at` < '?'/* week start at */, VALUES(`value`), IF(VALUES(`value`) > `value`, VALUES(`value`), `value`));
-- updated: 2 rows affected
-- nothing: 0 rows affected
