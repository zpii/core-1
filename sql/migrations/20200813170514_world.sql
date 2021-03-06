DROP PROCEDURE IF EXISTS add_migration;
delimiter ??
CREATE PROCEDURE `add_migration`()
BEGIN
DECLARE v INT DEFAULT 1;
SET v = (SELECT COUNT(*) FROM `migrations` WHERE `id`='20200813170514');
IF v=0 THEN
INSERT INTO `migrations` VALUES ('20200813170514');
-- Add your query below.

-- Fix Rend event not working pre 1.5
UPDATE `creature` SET `patch_min` = 0 WHERE `map` = 229 AND `id` = 10162;
UPDATE `creature_template` SET `patch` = 0 WHERE `entry` = 10162;

-- End of migration.
END IF;
END??
delimiter ; 
CALL add_migration();
DROP PROCEDURE IF EXISTS add_migration;
