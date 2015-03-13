CREATE TABLE IF NOT EXISTS `lc_quantity_units` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `decimals` tinyint(1) NOT NULL,
  `separate` tinyint(1) NOT NULL,
  `priority` tinyint(2) NOT NULL,
  `date_updated` datetime NOT NULL,
  `date_created` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
-- --------------------------------------------------------
CREATE TABLE IF NOT EXISTS `lc_quantity_units_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quantity_unit_id` int(11) NOT NULL,
  `language_code` varchar(2) NOT NULL,
  `name` varchar(32) NOT NULL,
  `description` VARCHAR(512),
  PRIMARY KEY (`id`),
  KEY `quantity_unit_id` (`quantity_unit_id`),
  KEY `language_code` (`language_code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
-- --------------------------------------------------------
INSERT INTO `lc_settings` (`setting_group_key`, `type`, `title`, `description`, `key`, `value`, `function`, `priority`, `date_updated`, `date_created`) VALUES
('defaults', 'global', 'Default Quantity Unit', 'Default quantity unit that will be preset when creating new products.', 'default_quantity_unit_id', '1', 'quantity_units()', 15, NOW(), NOW());
-- --------------------------------------------------------
INSERT INTO `lc_quantity_units` (`id`, `priority`, `date_updated`, `date_created`) VALUES
(1, 0, NOW(), NOW());
-- --------------------------------------------------------
INSERT INTO `lc_quantity_units` (`id`, `decimals`, `priority`, `date_updated`, `date_created`) VALUES
(1, 0, 0, NOW(), NOW());
-- --------------------------------------------------------
ALTER TABLE `lc_products` ADD `quantity_unit_id` TINYINT(2) NOT NULL AFTER  `quantity`;
-- --------------------------------------------------------
UPDATE `lc_products` set quantity_unit_id = 1 WHERE quantity_unit_id = 0;