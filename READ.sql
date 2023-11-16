DROP DATABASE IF EXISTS umc_db; -- 만약 umc_db가 존재하면 우선 삭제한다.
CREATE DATABASE umc_db;

USE umc_db;

CREATE TABLE umc_db.store (
	`id`	bigint	NOT NULL,
	`region_id`	bigint	NOT NULL,
	`name`	varchar(50)	NOT NULL,
	`address`	varchar(50)	NULL,
	`score`	float	NULL,
	`created_at`	datetime(6)	NULL,
	`update_at`	datetime(6)	NULL
);

CREATE TABLE `review` (
	`id`	bigint	NOT NULL,
	`member_id`	bigint	NOT NULL,
	`store_id`	bigint	NOT NULL,
	`body`	text	NULL,
	`score`	float	NULL
);

CREATE TABLE `member_prefer` (
	`id`	bigint	NOT NULL,
	`category_id`	bigint	NOT NULL,
	`member_id`	bigint	NOT NULL,
	`created_at`	datetime(6)	NULL,
	`update_at`	datetime(6)	NULL
);

CREATE TABLE `food_category` (
	`id`	bigint	NOT NULL,
	`name`	varchar(15)	NULL,
	`created_at`	datetime(6)	NOT NULL,
	`update_at`	datetime(6)	NOT NULL
);

CREATE TABLE `member` (
	`id`	bigint	NOT NULL,
	`name`	varchar(20)	NOT NULL	COMMENT '유저 이름',
	`gender`	varchar(10)	NOT NULL,
	`age`	int	NULL,
	`address`	varchar(40)	NOT NULL,
	`spec_address`	varchar(40)	NOT NULL,
	`created_at`	datetime(6)	NOT NULL,
	`update_at`	datetime(6)	NOT NULL,
	`status`	varchar(15)	NOT NULL,
	`inactive_date`	datetime	NOT NULL,
	`email`	varchar(50)	NULL,
	`point`	int	NOT NULL,
	`social_type`	varchar(10)	NULL,
	`number`	bigint	NULL
);

CREATE TABLE `review_image` (
	`id`	bigint	NOT NULL,
	`review_id`	bigint	NOT NULL,
	`image_url`	text	NULL,
	`created_at`	datetime(6)	NOT NULL,
	`update_at`	datetime(6)	NOT NULL
);

CREATE TABLE `region` (
	`id`	bigint	NOT NULL,
	`name`	varchar(20)	NOT NULL,
	`created_at`	datetime(6)	NOT NULL,
	`update_at`	datetime(6)	NOT NULL
);

CREATE TABLE `member_agree` (
	`id`	bigint	NOT NULL,
	`terms_id`	bigint	NOT NULL,
	`member_id`	bigint	NOT NULL,
	`created_at`	datetime(6)	NOT NULL,
	`update_at`	datetime(6)	NOT NULL
);

CREATE TABLE `terms` (
	`id`	bigint	NOT NULL,
	`title`	varchar(20)	NOT NULL,
	`body`	text	NOT NULL,
	`optional`	boolean	NOT NULL,
	`created_at`	datetime(6)	NOT NULL,
	`update_at`	datetime(6)	NOT NULL
);

CREATE TABLE `member_mission` (
	`id`	bigint	NOT NULL,
	`mission_id`	bigint	NOT NULL,
	`member_id`	bigint	NOT NULL,
	`status`	varchar(15)	NOT NULL,
	`created_at`	datetime(6)	NOT NULL,
	`update_at`	datetime(6)	NOT NULL
);

CREATE TABLE `mission` (
	`id`	bigint	NOT NULL,
	`store_id`	bigint	NOT NULL,
	`reward`	int	NOT NULL,
	`deadline`	datetime	NOT NULL,
	`mission_spec`	text	NOT NULL,
	`created_at`	datetime(6)	NOT NULL,
	`update_at`	datetime(6)	NOT NULL
);

ALTER TABLE `store` ADD CONSTRAINT `PK_STORE` PRIMARY KEY (
	`id`,
	`region_id`
);

ALTER TABLE `review` ADD CONSTRAINT `PK_REVIEW` PRIMARY KEY (
	`id`,
	`member_id`,
	`store_id`
);

ALTER TABLE `member_prefer` ADD CONSTRAINT `PK_MEMBER_PREFER` PRIMARY KEY (
	`id`,
	`category_id`,
	`member_id`
);

ALTER TABLE `food_category` ADD CONSTRAINT `PK_FOOD_CATEGORY` PRIMARY KEY (
	`id`
);

ALTER TABLE `member` ADD CONSTRAINT `PK_MEMBER` PRIMARY KEY (
	`id`
);

ALTER TABLE `review_image` ADD CONSTRAINT `PK_REVIEW_IMAGE` PRIMARY KEY (
	`id`,
	`review_id`
);

ALTER TABLE `region` ADD CONSTRAINT `PK_REGION` PRIMARY KEY (
	`id`
);

ALTER TABLE `member_agree` ADD CONSTRAINT `PK_MEMBER_AGREE` PRIMARY KEY (
	`id`,
	`terms_id`,
	`member_id`
);

ALTER TABLE `terms` ADD CONSTRAINT `PK_TERMS` PRIMARY KEY (
	`id`
);

ALTER TABLE `member_mission` ADD CONSTRAINT `PK_MEMBER_MISSION` PRIMARY KEY (
	`id`,
	`mission_id`,
	`member_id`
);

ALTER TABLE `mission` ADD CONSTRAINT `PK_MISSION` PRIMARY KEY (
	`id`,
	`store_id`
);

ALTER TABLE `store` ADD CONSTRAINT `FK_region_TO_store_1` FOREIGN KEY (
	`region_id`
)
REFERENCES `region` (
	`id`
);

ALTER TABLE `review` ADD CONSTRAINT `FK_member_TO_review_1` FOREIGN KEY (
	`member_id`
)
REFERENCES `member` (
	`id`
);

ALTER TABLE `review` ADD CONSTRAINT `FK_store_TO_review_1` FOREIGN KEY (
	`store_id`
)
REFERENCES `store` (
	`id`
);

ALTER TABLE `member_prefer` ADD CONSTRAINT `FK_food_category_TO_member_prefer_1` FOREIGN KEY (
	`category_id`
)
REFERENCES `food_category` (
	`id`
);

ALTER TABLE `member_prefer` ADD CONSTRAINT `FK_member_TO_member_prefer_1` FOREIGN KEY (
	`member_id`
)
REFERENCES `member` (
	`id`
);

ALTER TABLE `review_image` ADD CONSTRAINT `FK_review_TO_review_image_1` FOREIGN KEY (
	`review_id`
)
REFERENCES `review` (
	`id`
);

ALTER TABLE `member_agree` ADD CONSTRAINT `FK_terms_TO_member_agree_1` FOREIGN KEY (
	`terms_id`
)
REFERENCES `terms` (
	`id`
);

ALTER TABLE `member_agree` ADD CONSTRAINT `FK_member_TO_member_agree_1` FOREIGN KEY (
	`member_id`
)
REFERENCES `member` (
	`id`
);

ALTER TABLE `member_mission` ADD CONSTRAINT `FK_mission_TO_member_mission_1` FOREIGN KEY (
	`mission_id`
)
REFERENCES `mission` (
	`id`
);

ALTER TABLE `member_mission` ADD CONSTRAINT `FK_member_TO_member_mission_1` FOREIGN KEY (
	`member_id`
)
REFERENCES `member` (
	`id`
);

ALTER TABLE `mission` ADD CONSTRAINT `FK_store_TO_mission_1` FOREIGN KEY (
	`store_id`
)
REFERENCES `store` (
	`id`
);
