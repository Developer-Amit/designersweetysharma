-- ------------------------------
-- 1. store setting
-- ------------------------------
UPDATE `oc_setting` SET `value`='voguemetheme' WHERE `key`='theme_default_directory';

UPDATE `oc_setting` SET `value`='36, Khodiyar Nagar Road, Bhatni Wadi, Khodiyar Nagar, Surat, Gujarat 395006, India.' WHERE `key`='config_address';

-- UPDATE `oc_setting` SET `value`='' WHERE `key`='config_captcha';

UPDATE `oc_setting` SET `value`='Lorem ipsum dolor sit amet conse ctetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat sed do eiusmod tempor incididunt ut labore dolore' WHERE `key`='config_comment';

UPDATE `oc_setting` SET `value`='21.2156260, 72.8531530' WHERE `key`='config_geocode';

UPDATE `oc_setting` SET `value`='88' WHERE `key`= 'theme_default_image_additional_width';
UPDATE `oc_setting` SET `value`='112' WHERE `key`= 'theme_default_image_additional_height';

UPDATE `oc_setting` SET `value`='1352' WHERE `key`= 'theme_default_image_category_width';
UPDATE `oc_setting` SET `value`='800' WHERE `key`= 'theme_default_image_category_height';

UPDATE `oc_setting` SET `value`='870' WHERE `key`= 'theme_default_image_popup_width';
UPDATE `oc_setting` SET `value`='1110' WHERE `key`= 'theme_default_image_popup_height';

UPDATE `oc_setting` SET `value`='278' WHERE `key`= 'theme_default_image_product_width';
UPDATE `oc_setting` SET `value`='355' WHERE `key`= 'theme_default_image_product_height';

UPDATE `oc_setting` SET `value`='278' WHERE `key`= 'theme_default_image_related_width';
UPDATE `oc_setting` SET `value`='355' WHERE `key`= 'theme_default_image_related_height';

UPDATE `oc_setting` SET `value`='348' WHERE `key`= 'theme_default_image_thumb_width';
UPDATE `oc_setting` SET `value`='444' WHERE `key`= 'theme_default_image_thumb_height';

UPDATE `oc_setting` SET `value`='Fabish Responsive Opencart Theme' WHERE `key`='config_meta_title';
UPDATE `oc_setting` SET `value`='Fabish Fashion Store' WHERE `key`='config_name';

UPDATE `oc_setting` SET `value`='TemplateManiacs' WHERE `key`='config_owner';

UPDATE `oc_setting` SET `value`='9' WHERE `key`='theme_default_product_limit';

DELETE FROM `oc_setting` WHERE `key` IN ('default_fontcolor_theme_footer_bottom_color','default_fontcolor_theme_footer_bottom_color','default_fontcolor_theme_footer_text_color','default_fontcolor_theme_footer_text_hover_color','default_fontcolor_theme_footer_top_color','default_fontcolor_theme_text_hover_color','default_fontcolor_theme_main_color','default_fontcolor_theme_sub_color','default_fontcolor_theme_text_color','default_font_color_option','default_font_right_click','default_font_right_click_message','filter_status','information_status','basic_captcha_status');


INSERT INTO `oc_setting` (`code`,`key`,`value`) VALUES ('default_font','default_fontcolor_theme_footer_text_color','adadad');
INSERT INTO `oc_setting` (`code`,`key`,`value`) VALUES ('default_font','default_fontcolor_theme_footer_text_hover_color','ffa907');
INSERT INTO `oc_setting` (`code`,`key`,`value`) VALUES ('default_font','default_fontcolor_theme_text_hover_color','000000');


INSERT INTO `oc_setting` (`code`,`key`,`value`) VALUES ('default_font','default_fontcolor_theme_main_color','ffa907');
INSERT INTO `oc_setting` (`code`,`key`,`value`) VALUES ('default_font','default_fontcolor_theme_sub_color','ffffff');
INSERT INTO `oc_setting` (`code`,`key`,`value`) VALUES ('default_font','default_fontcolor_theme_text_color','555555');
INSERT INTO `oc_setting` (`code`,`key`,`value`) VALUES ('default_font','default_font_color_option','default');
INSERT INTO `oc_setting` (`code`,`key`,`value`) VALUES ('default_font','default_font_right_click','Off');
INSERT INTO `oc_setting` (`code`,`key`,`value`) VALUES ('default_font','default_font_right_click_message','Right Click is Disabled you can edit this option from admin panel');

INSERT INTO `oc_setting` (`code`,`key`,`value`) VALUES ('filter','filter_status','1');

INSERT INTO `oc_setting` (`code`,`key`,`value`) VALUES ('information','information_status','1');

INSERT INTO `oc_setting` (`code`,`key`,`value`) VALUES ('basic_captcha','basic_captcha_status','1');


-- ------------------------------
-- 2. Banner setting
-- ------------------------------
DELETE FROM `oc_banner` WHERE `name` IN ('Leftbanner','Leftbanner-slider');
INSERT INTO `oc_banner` (`name`,`status`) VALUES ('Leftbanner',1);
SET @leftbannerid = LAST_INSERT_ID();

INSERT INTO `oc_banner` (`name`,`status`) VALUES ('Leftbanner-slider',1);
SET @leftbannersliderid = LAST_INSERT_ID();


-- Home Page SlideShow
-- ---------------------

DELETE FROM `oc_banner_image` WHERE `banner_id` IN(SELECT `banner_id` FROM `oc_banner` WHERE `name`='Home Page Slideshow');
DELETE FROM `oc_banner_image_description` WHERE `banner_id` IN(SELECT `banner_id` FROM `oc_banner` WHERE `name`='Home Page Slideshow') AND `language_id`=1;


INSERT INTO `oc_banner_image` (`banner_id`,`link`,`image`,`sort_order`) SELECT MAX(x.banner_id),'','catalog/demo/banners/Mainbanner.jpg',1 FROM (SELECT `banner_id` FROM `oc_banner` WHERE `name`='Home Page Slideshow') as x;
INSERT INTO `oc_banner_image_description` (`banner_image_id`,`language_id`,`banner_id`,`title`) SELECT MAX(img),1,MAX(x.banner_id),'Banner1' FROM (SELECT MAX(`banner_image_id`) as img,null as language_id,null as banner_id,null as title FROM `oc_banner_image` UNION SELECT null as banner_image_id,null as language_id,`banner_id`,null as title FROM `oc_banner` WHERE `name`='Home Page Slideshow') as x;

INSERT INTO `oc_banner_image` (`banner_id`,`link`,`image`,`sort_order`) SELECT MAX(x.banner_id),'','catalog/demo/banners/Mainbanner.jpg',2 FROM (SELECT `banner_id` FROM `oc_banner` WHERE `name`='Home Page Slideshow') as x;
INSERT INTO `oc_banner_image_description` (`banner_image_id`,`language_id`,`banner_id`,`title`) SELECT MAX(img),1,MAX(x.banner_id),'Banner2' FROM (SELECT MAX(`banner_image_id`) as img,null as language_id,null as banner_id,null as title FROM `oc_banner_image` UNION SELECT null as banner_image_id,null as language_id,`banner_id`,null as title FROM `oc_banner` WHERE `name`='Home Page Slideshow') as x;

INSERT INTO `oc_banner_image` (`banner_id`,`link`,`image`,`sort_order`) SELECT MAX(x.banner_id),'','catalog/demo/banners/Mainbanner.jpg',3 FROM (SELECT `banner_id` FROM `oc_banner` WHERE `name`='Home Page Slideshow') as x;
INSERT INTO `oc_banner_image_description` (`banner_image_id`,`language_id`,`banner_id`,`title`) SELECT MAX(img),1,MAX(x.banner_id),'Banner3' FROM (SELECT MAX(`banner_image_id`) as img,null as language_id,null as banner_id,null as title FROM `oc_banner_image` UNION SELECT null as banner_image_id,null as language_id,`banner_id`,null as title FROM `oc_banner` WHERE `name`='Home Page Slideshow') as x;

-- Manufacturers
-- ---------------------

DELETE FROM `oc_banner_image` WHERE `banner_id` IN(SELECT `banner_id` FROM `oc_banner` WHERE `name`='Manufacturers');
DELETE FROM `oc_banner_image_description` WHERE `banner_id` IN(SELECT `banner_id` FROM `oc_banner` WHERE `name`='Manufacturers') AND `language_id`=1;

INSERT INTO `oc_banner_image` (`banner_id`,`link`,`image`,`sort_order`) SELECT MAX(x.banner_id),'','catalog/demo/banners/brandlogo.png',0 FROM (SELECT `banner_id` FROM `oc_banner` WHERE `name`='Manufacturers') as x;
INSERT INTO `oc_banner_image_description` (`banner_image_id`,`language_id`,`banner_id`,`title`) SELECT MAX(img),1,MAX(x.banner_id),'Brand1' FROM (SELECT MAX(`banner_image_id`) as img,null as language_id,null as banner_id,null as title FROM `oc_banner_image` UNION SELECT null as banner_image_id,null as language_id,`banner_id`,null as title FROM `oc_banner` WHERE `name`='Manufacturers') as x;

INSERT INTO `oc_banner_image` (`banner_id`,`link`,`image`,`sort_order`) SELECT MAX(x.banner_id),'','catalog/demo/banners/brandlogo.png',0 FROM (SELECT `banner_id` FROM `oc_banner` WHERE `name`='Manufacturers') as x;
INSERT INTO `oc_banner_image_description` (`banner_image_id`,`language_id`,`banner_id`,`title`) SELECT MAX(img),1,MAX(x.banner_id),'Brand2' FROM (SELECT MAX(`banner_image_id`) as img,null as language_id,null as banner_id,null as title FROM `oc_banner_image` UNION SELECT null as banner_image_id,null as language_id,`banner_id`,null as title FROM `oc_banner` WHERE `name`='Manufacturers') as x;

INSERT INTO `oc_banner_image` (`banner_id`,`link`,`image`,`sort_order`) SELECT MAX(x.banner_id),'','catalog/demo/banners/brandlogo.png',0 FROM (SELECT `banner_id` FROM `oc_banner` WHERE `name`='Manufacturers') as x;
INSERT INTO `oc_banner_image_description` (`banner_image_id`,`language_id`,`banner_id`,`title`) SELECT MAX(img),1,MAX(x.banner_id),'Brand3' FROM (SELECT MAX(`banner_image_id`) as img,null as language_id,null as banner_id,null as title FROM `oc_banner_image` UNION SELECT null as banner_image_id,null as language_id,`banner_id`,null as title FROM `oc_banner` WHERE `name`='Manufacturers') as x;

INSERT INTO `oc_banner_image` (`banner_id`,`link`,`image`,`sort_order`) SELECT MAX(x.banner_id),'','catalog/demo/banners/brandlogo.png',0 FROM (SELECT `banner_id` FROM `oc_banner` WHERE `name`='Manufacturers') as x;
INSERT INTO `oc_banner_image_description` (`banner_image_id`,`language_id`,`banner_id`,`title`) SELECT MAX(img),1,MAX(x.banner_id),'Brand4' FROM (SELECT MAX(`banner_image_id`) as img,null as language_id,null as banner_id,null as title FROM `oc_banner_image` UNION SELECT null as banner_image_id,null as language_id,`banner_id`,null as title FROM `oc_banner` WHERE `name`='Manufacturers') as x;

INSERT INTO `oc_banner_image` (`banner_id`,`link`,`image`,`sort_order`) SELECT MAX(x.banner_id),'','catalog/demo/banners/brandlogo.png',0 FROM (SELECT `banner_id` FROM `oc_banner` WHERE `name`='Manufacturers') as x;
INSERT INTO `oc_banner_image_description` (`banner_image_id`,`language_id`,`banner_id`,`title`) SELECT MAX(img),1,MAX(x.banner_id),'Brand5' FROM (SELECT MAX(`banner_image_id`) as img,null as language_id,null as banner_id,null as title FROM `oc_banner_image` UNION SELECT null as banner_image_id,null as language_id,`banner_id`,null as title FROM `oc_banner` WHERE `name`='Manufacturers') as x;

INSERT INTO `oc_banner_image` (`banner_id`,`link`,`image`,`sort_order`) SELECT MAX(x.banner_id),'','catalog/demo/banners/brandlogo.png',0 FROM (SELECT `banner_id` FROM `oc_banner` WHERE `name`='Manufacturers') as x;
INSERT INTO `oc_banner_image_description` (`banner_image_id`,`language_id`,`banner_id`,`title`) SELECT MAX(img),1,MAX(x.banner_id),'Brand6' FROM (SELECT MAX(`banner_image_id`) as img,null as language_id,null as banner_id,null as title FROM `oc_banner_image` UNION SELECT null as banner_image_id,null as language_id,`banner_id`,null as title FROM `oc_banner` WHERE `name`='Manufacturers') as x;

INSERT INTO `oc_banner_image` (`banner_id`,`link`,`image`,`sort_order`) SELECT MAX(x.banner_id),'','catalog/demo/banners/brandlogo.png',0 FROM (SELECT `banner_id` FROM `oc_banner` WHERE `name`='Manufacturers') as x;
INSERT INTO `oc_banner_image_description` (`banner_image_id`,`language_id`,`banner_id`,`title`) SELECT MAX(img),1,MAX(x.banner_id),'Brand7' FROM (SELECT MAX(`banner_image_id`) as img,null as language_id,null as banner_id,null as title FROM `oc_banner_image` UNION SELECT null as banner_image_id,null as language_id,`banner_id`,null as title FROM `oc_banner` WHERE `name`='Manufacturers') as x;

INSERT INTO `oc_banner_image` (`banner_id`,`link`,`image`,`sort_order`) SELECT MAX(x.banner_id),'','catalog/demo/banners/brandlogo.png',0 FROM (SELECT `banner_id` FROM `oc_banner` WHERE `name`='Manufacturers') as x;
INSERT INTO `oc_banner_image_description` (`banner_image_id`,`language_id`,`banner_id`,`title`) SELECT MAX(img),1,MAX(x.banner_id),'Brand8' FROM (SELECT MAX(`banner_image_id`) as img,null as language_id,null as banner_id,null as title FROM `oc_banner_image` UNION SELECT null as banner_image_id,null as language_id,`banner_id`,null as title FROM `oc_banner` WHERE `name`='Manufacturers') as x;

INSERT INTO `oc_banner_image` (`banner_id`,`link`,`image`,`sort_order`) SELECT MAX(x.banner_id),'','catalog/demo/banners/brandlogo.png',0 FROM (SELECT `banner_id` FROM `oc_banner` WHERE `name`='Manufacturers') as x;
INSERT INTO `oc_banner_image_description` (`banner_image_id`,`language_id`,`banner_id`,`title`) SELECT MAX(img),1,MAX(x.banner_id),'Brand9' FROM (SELECT MAX(`banner_image_id`) as img,null as language_id,null as banner_id,null as title FROM `oc_banner_image` UNION SELECT null as banner_image_id,null as language_id,`banner_id`,null as title FROM `oc_banner` WHERE `name`='Manufacturers') as x;

INSERT INTO `oc_banner_image` (`banner_id`,`link`,`image`,`sort_order`) SELECT MAX(x.banner_id),'','catalog/demo/banners/brandlogo.png',0 FROM (SELECT `banner_id` FROM `oc_banner` WHERE `name`='Manufacturers') as x;
INSERT INTO `oc_banner_image_description` (`banner_image_id`,`language_id`,`banner_id`,`title`) SELECT MAX(img),1,MAX(x.banner_id),'Brand10' FROM (SELECT MAX(`banner_image_id`) as img,null as language_id,null as banner_id,null as title FROM `oc_banner_image` UNION SELECT null as banner_image_id,null as language_id,`banner_id`,null as title FROM `oc_banner` WHERE `name`='Manufacturers') as x;

INSERT INTO `oc_banner_image` (`banner_id`,`link`,`image`,`sort_order`) SELECT MAX(x.banner_id),'','catalog/demo/banners/brandlogo.png',0 FROM (SELECT `banner_id` FROM `oc_banner` WHERE `name`='Manufacturers') as x;
INSERT INTO `oc_banner_image_description` (`banner_image_id`,`language_id`,`banner_id`,`title`) SELECT MAX(img),1,MAX(x.banner_id),'Brand11' FROM (SELECT MAX(`banner_image_id`) as img,null as language_id,null as banner_id,null as title FROM `oc_banner_image` UNION SELECT null as banner_image_id,null as language_id,`banner_id`,null as title FROM `oc_banner` WHERE `name`='Manufacturers') as x;

-- Leftbanner
-- ---------------------

DELETE FROM `oc_banner_image` WHERE `banner_id` IN(SELECT `banner_id` FROM `oc_banner` WHERE `name`='Leftbanner');
DELETE FROM `oc_banner_image_description` WHERE `banner_id` IN(SELECT `banner_id` FROM `oc_banner` WHERE `name`='Leftbanner') AND `language_id`=1;

INSERT INTO `oc_banner_image` (`banner_id`,`link`,`image`,`sort_order`) SELECT MAX(x.banner_id),'','catalog/demo/banners/Leftbanner.jpg',0 FROM (SELECT `banner_id` FROM `oc_banner` WHERE `name`='Leftbanner') as x;
INSERT INTO `oc_banner_image_description` (`banner_image_id`,`language_id`,`banner_id`,`title`) SELECT MAX(img),1,MAX(x.banner_id),'LeftBanner' FROM (SELECT MAX(`banner_image_id`) as img,null as language_id,null as banner_id,null as title FROM `oc_banner_image` UNION SELECT null as banner_image_id,null as language_id,`banner_id`,null as title FROM `oc_banner` WHERE `name`='Leftbanner') as x;

-- Leftbanner-slider
-- ---------------------

DELETE FROM `oc_banner_image` WHERE `banner_id` IN(SELECT `banner_id` FROM `oc_banner` WHERE `name`='Leftbanner-slider');
DELETE FROM `oc_banner_image_description` WHERE `banner_id` IN(SELECT `banner_id` FROM `oc_banner` WHERE `name`='Leftbanner-slider') AND `language_id`=1;

INSERT INTO `oc_banner_image` (`banner_id`,`link`,`image`,`sort_order`) SELECT MAX(x.banner_id),'','catalog/demo/banners/Leftbanner.jpg',1 FROM (SELECT `banner_id` FROM `oc_banner` WHERE `name`='Leftbanner-slider') as x;
INSERT INTO `oc_banner_image_description` (`banner_image_id`,`language_id`,`banner_id`,`title`) SELECT MAX(img),1,MAX(x.banner_id),'LeftBanner-slider1' FROM (SELECT MAX(`banner_image_id`) as img,null as language_id,null as banner_id,null as title FROM `oc_banner_image` UNION SELECT null as banner_image_id,null as language_id,`banner_id`,null as title FROM `oc_banner` WHERE `name`='Leftbanner-slider') as x;

INSERT INTO `oc_banner_image` (`banner_id`,`link`,`image`,`sort_order`) SELECT MAX(x.banner_id),'','catalog/demo/banners/Leftbanner.jpg',2 FROM (SELECT `banner_id` FROM `oc_banner` WHERE `name`='Leftbanner-slider') as x;
INSERT INTO `oc_banner_image_description` (`banner_image_id`,`language_id`,`banner_id`,`title`) SELECT MAX(img),1,MAX(x.banner_id),'LeftBanner-slider2' FROM (SELECT MAX(`banner_image_id`) as img,null as language_id,null as banner_id,null as title FROM `oc_banner_image` UNION SELECT null as banner_image_id,null as language_id,`banner_id`,null as title FROM `oc_banner` WHERE `name`='Leftbanner-slider') as x;

-- ------------------------------
-- 3. Add Category 
-- ------------------------------

DELETE FROM `oc_category`;
DELETE FROM `oc_category_description`;
DELETE FROM `oc_category_path`;
DELETE FROM `oc_category_to_layout`;
DELETE FROM `oc_category_to_store`;
DELETE FROM `oc_product_to_category`;


-- Accessories
-- ------------

INSERT INTO `oc_category` (`image`,`parent_id`,`top`,`column`,`sort_order`,`status`,`date_added`,`date_modified`) VALUES ('catalog/demo/banners/categorybanner.jpg',0,1,1,3,1,NOW(),NOW());
SET @parentid = LAST_INSERT_ID();
INSERT INTO `oc_category_description` (`category_id`,`language_id`,`name`,`description`,`meta_title`) VALUES (@parentid,1,'Accessories','&lt;p&gt;&lt;br&gt;&lt;/p&gt;','Accessories');
INSERT INTO `oc_category_path` (`category_id`,`path_id`,`level`) VALUES (@parentid,@parentid,0);
INSERT INTO `oc_category_to_layout` (`category_id`,`store_id`,`layout_id`) VALUES (@parentid,0,0);
INSERT INTO `oc_category_to_store` (`category_id`,`store_id`) VALUES (@parentid,0);
INSERT INTO `oc_product_to_category` (`product_id`,`category_id`) VALUES (28,@parentid),(29,@parentid),(30,@parentid),(31,@parentid),(42,@parentid),(49,@parentid),(43,@parentid),(32,@parentid),(33,@parentid),(44,@parentid),(34,@parentid),(35,@parentid);

-- Men
-- -----------
INSERT INTO `oc_category` (`image`,`parent_id`,`top`,`column`,`sort_order`,`status`,`date_added`,`date_modified`) VALUES 
('catalog/demo/banners/categorybanner.jpg',0,1,3,1,1,NOW(),NOW());
SET @parentid = LAST_INSERT_ID();
INSERT INTO `oc_category_description` (`category_id`,`language_id`,`name`,`description`,`meta_title`) VALUES (@parentid,1,'Men','&lt;p&gt;&lt;br&gt;&lt;/p&gt;','Men');
INSERT INTO `oc_category_path` (`category_id`,`path_id`,`level`) VALUES (@parentid,@parentid,0);
INSERT INTO `oc_category_to_layout` (`category_id`,`store_id`,`layout_id`) VALUES (@parentid,0,0);
INSERT INTO `oc_category_to_store` (`category_id`,`store_id`) VALUES (@parentid,0);
INSERT INTO `oc_product_to_category` (`product_id`,`category_id`) VALUES (28,@parentid),(29,@parentid),(30,@parentid),(46,@parentid),(42,@parentid),(47,@parentid),(43,@parentid),(32,@parentid),(33,@parentid),(44,@parentid),(34,@parentid),(35,@parentid);


-- child of Men (Shoes)
-- ------------------------
INSERT INTO `oc_category` (`image`,`parent_id`,`top`,`column`,`sort_order`,`status`,`date_added`,`date_modified`) VALUES ('catalog/demo/banners/categorybanner.jpg',@parentid,0,0,1,1,NOW(),NOW());
SET @childid = LAST_INSERT_ID();
INSERT INTO `oc_category_description` (`category_id`,`language_id`,`name`,`description`,`meta_title`) VALUES (@childid,1,'Shoes','&lt;p&gt;&lt;br&gt;&lt;/p&gt;','Shoes');
INSERT INTO `oc_category_path` (`category_id`,`path_id`,`level`) VALUES (@childid,@childid,1);
INSERT INTO `oc_category_path` (`category_id`,`path_id`,`level`) VALUES (@childid,@parentid,0);
INSERT INTO `oc_category_to_layout` (`category_id`,`store_id`,`layout_id`) VALUES (@childid,0,0);
INSERT INTO `oc_category_to_store` (`category_id`,`store_id`) VALUES (@childid,0);
INSERT INTO `oc_product_to_category` (`product_id`,`category_id`) VALUES (28,@childid),(29,@childid),(30,@childid),(31,@childid),(42,@childid),(49,@childid),(43,@childid);


	-- sub child of Shoes (Sandals)
	-- ---------------------------
INSERT INTO `oc_category` (`image`,`parent_id`,`top`,`column`,`sort_order`,`status`,`date_added`,`date_modified`) VALUES 	('catalog/demo/banners/categorybanner.jpg',@childid,0,1,0,1,NOW(),NOW());
SET @subchildid = LAST_INSERT_ID();
INSERT INTO `oc_category_description` (`category_id`,`language_id`,`name`,`description`,`meta_title`) VALUES (@subchildid,1,'Sandals','&lt;p&gt;&lt;br&gt;&lt;/p&gt;','Sandals');
INSERT INTO `oc_category_path` (`category_id`,`path_id`,`level`) VALUES (@subchildid,@subchildid,2);
INSERT INTO `oc_category_path` (`category_id`,`path_id`,`level`) VALUES (@subchildid,@childid,1);
INSERT INTO `oc_category_path` (`category_id`,`path_id`,`level`) VALUES (@subchildid,@parentid,0);
INSERT INTO `oc_category_to_layout` (`category_id`,`store_id`,`layout_id`) VALUES (@subchildid,0,0);
INSERT INTO `oc_category_to_store` (`category_id`,`store_id`) VALUES (@subchildid,0);
INSERT INTO `oc_product_to_category` (`product_id`,`category_id`) VALUES (28,@subchildid),(29,@subchildid),(30,@subchildid),(46,@subchildid),(42,@subchildid),(47,@subchildid),(43,@subchildid),(32,@subchildid),(33,@subchildid),(44,@subchildid),(34,@parentidsubchildid),(35,@subchildid);

	-- sub child of Shoes (Shoes)
	-- ---------------------------
INSERT INTO `oc_category` (`image`,`parent_id`,`top`,`column`,`sort_order`,`status`,`date_added`,`date_modified`) VALUES 	('catalog/demo/banners/categorybanner.jpg',@childid,0,1,0,1,NOW(),NOW());
SET @subchildid = LAST_INSERT_ID();
INSERT INTO `oc_category_description` (`category_id`,`language_id`,`name`,`description`,`meta_title`) VALUES (@subchildid,1,'Shoes','&lt;p&gt;&lt;br&gt;&lt;/p&gt;','Shoes');
INSERT INTO `oc_category_path` (`category_id`,`path_id`,`level`) VALUES (@subchildid,@subchildid,2);
INSERT INTO `oc_category_path` (`category_id`,`path_id`,`level`) VALUES (@subchildid,@childid,1);
INSERT INTO `oc_category_path` (`category_id`,`path_id`,`level`) VALUES (@subchildid,@parentid,0);
INSERT INTO `oc_category_to_layout` (`category_id`,`store_id`,`layout_id`) VALUES (@subchildid,0,0);
INSERT INTO `oc_category_to_store` (`category_id`,`store_id`) VALUES (@subchildid,0);
INSERT INTO `oc_product_to_category` (`product_id`,`category_id`) VALUES (28,@subchildid),(29,@subchildid),(30,@subchildid),(46,@subchildid),(42,@subchildid),(47,@subchildid),(43,@subchildid),(32,@subchildid),(33,@subchildid),(44,@subchildid),(34,@subchildid),(35,@subchildid);

	-- sub child of Shoes (Boots)
	-- ---------------------------
INSERT INTO `oc_category` (`image`,`parent_id`,`top`,`column`,`sort_order`,`status`,`date_added`,`date_modified`) VALUES 	('catalog/demo/banners/categorybanner.jpg',@childid,0,1,0,1,NOW(),NOW());
SET @subchildid = LAST_INSERT_ID();
INSERT INTO `oc_category_description` (`category_id`,`language_id`,`name`,`description`,`meta_title`) VALUES (@subchildid,1,'Boots','&lt;p&gt;&lt;br&gt;&lt;/p&gt;','Boots');
INSERT INTO `oc_category_path` (`category_id`,`path_id`,`level`) VALUES (@subchildid,@subchildid,2);
INSERT INTO `oc_category_path` (`category_id`,`path_id`,`level`) VALUES (@subchildid,@childid,1);
INSERT INTO `oc_category_path` (`category_id`,`path_id`,`level`) VALUES (@subchildid,@parentid,0);
INSERT INTO `oc_category_to_layout` (`category_id`,`store_id`,`layout_id`) VALUES (@subchildid,0,0);
INSERT INTO `oc_category_to_store` (`category_id`,`store_id`) VALUES (@subchildid,0);
INSERT INTO `oc_product_to_category` (`product_id`,`category_id`) VALUES (28,@subchildid),(29,@subchildid),(30,@subchildid),(46,@subchildid),(42,@subchildid),(47,@subchildid),(43,@subchildid),(32,@subchildid),(33,@subchildid),(44,@subchildid),(34,@subchildid),(35,@subchildid);

	
-- child of Men (Clothing Size)
-- ------------------------
INSERT INTO `oc_category` (`image`,`parent_id`,`top`,`column`,`sort_order`,`status`,`date_added`,`date_modified`) VALUES ('catalog/demo/banners/categorybanner.jpg',@parentid,0,0,2,1,NOW(),NOW());
SET @childid = LAST_INSERT_ID();
INSERT INTO `oc_category_description` (`category_id`,`language_id`,`name`,`description`,`meta_title`) VALUES (@childid,1,'Clothing Size','&lt;p&gt;&lt;br&gt;&lt;/p&gt;','Clothing Size');
INSERT INTO `oc_category_path` (`category_id`,`path_id`,`level`) VALUES (@childid,@childid,1);
INSERT INTO `oc_category_path` (`category_id`,`path_id`,`level`) VALUES (@childid,@parentid,0);
INSERT INTO `oc_category_to_layout` (`category_id`,`store_id`,`layout_id`) VALUES (@childid,0,0);
INSERT INTO `oc_category_to_store` (`category_id`,`store_id`) VALUES (@childid,0);
INSERT INTO `oc_product_to_category` (`product_id`,`category_id`) VALUES (28,@childid),(29,@childid),(30,@childid),(46,@childid),(42,@childid),(47,@childid),(43,@childid),(32,@childid),(33,@childid),(44,@childid),(34,@childid),(35,@childid);

	-- sub child of Clothing Size (4 years)
	-- ---------------------------
INSERT INTO `oc_category` (`image`,`parent_id`,`top`,`column`,`sort_order`,`status`,`date_added`,`date_modified`) VALUES 	('catalog/demo/banners/categorybanner.jpg',@childid,0,1,0,1,NOW(),NOW());
SET @subchildid = LAST_INSERT_ID();
INSERT INTO `oc_category_description` (`category_id`,`language_id`,`name`,`description`,`meta_title`) VALUES (@subchildid,1,'4 years','&lt;p&gt;&lt;br&gt;&lt;/p&gt;','4 years');
INSERT INTO `oc_category_path` (`category_id`,`path_id`,`level`) VALUES (@subchildid,@subchildid,2);
INSERT INTO `oc_category_path` (`category_id`,`path_id`,`level`) VALUES (@subchildid,@childid,1);
INSERT INTO `oc_category_path` (`category_id`,`path_id`,`level`) VALUES (@subchildid,@parentid,0);
INSERT INTO `oc_category_to_layout` (`category_id`,`store_id`,`layout_id`) VALUES (@subchildid,0,0);
INSERT INTO `oc_category_to_store` (`category_id`,`store_id`) VALUES (@subchildid,0);
INSERT INTO `oc_product_to_category` (`product_id`,`category_id`) VALUES (28,@subchildid),(29,@subchildid),(30,@subchildid),(46,@subchildid),(42,@subchildid),(47,@subchildid),(43,@subchildid),(32,@subchildid),(33,@subchildid),(44,@subchildid),(34,@subchildid),(35,@subchildid);

	-- sub child of Clothing Size (6 years)
	-- ---------------------------
INSERT INTO `oc_category` (`image`,`parent_id`,`top`,`column`,`sort_order`,`status`,`date_added`,`date_modified`) VALUES 	('catalog/demo/banners/categorybanner.jpg',@childid,0,1,0,1,NOW(),NOW());
SET @subchildid = LAST_INSERT_ID();
INSERT INTO `oc_category_description` (`category_id`,`language_id`,`name`,`description`,`meta_title`) VALUES (@subchildid,1,'6 years','&lt;p&gt;&lt;br&gt;&lt;/p&gt;','6 years');
INSERT INTO `oc_category_path` (`category_id`,`path_id`,`level`) VALUES (@subchildid,@subchildid,2);
INSERT INTO `oc_category_path` (`category_id`,`path_id`,`level`) VALUES (@subchildid,@childid,1);
INSERT INTO `oc_category_path` (`category_id`,`path_id`,`level`) VALUES (@subchildid,@parentid,0);
INSERT INTO `oc_category_to_layout` (`category_id`,`store_id`,`layout_id`) VALUES (@subchildid,0,0);
INSERT INTO `oc_category_to_store` (`category_id`,`store_id`) VALUES (@subchildid,0);
INSERT INTO `oc_product_to_category` (`product_id`,`category_id`) VALUES (28,@subchildid),(29,@subchildid),(30,@subchildid),(46,@subchildid),(42,@subchildid),(47,@subchildid),(43,@subchildid),(32,@subchildid),(33,@subchildid),(44,@subchildid),(34,@subchildid),(35,@subchildid);

	-- sub child of Clothing Size (2 years)
	-- ---------------------------
INSERT INTO `oc_category` (`image`,`parent_id`,`top`,`column`,`sort_order`,`status`,`date_added`,`date_modified`) VALUES 	('catalog/demo/banners/categorybanner.jpg',@childid,0,1,0,1,NOW(),NOW());
SET @subchildid = LAST_INSERT_ID();
INSERT INTO `oc_category_description` (`category_id`,`language_id`,`name`,`description`,`meta_title`) VALUES (@subchildid,1,'2 years','&lt;p&gt;&lt;br&gt;&lt;/p&gt;','2 years');
INSERT INTO `oc_category_path` (`category_id`,`path_id`,`level`) VALUES (@subchildid,@subchildid,2);
INSERT INTO `oc_category_path` (`category_id`,`path_id`,`level`) VALUES (@subchildid,@childid,1);
INSERT INTO `oc_category_path` (`category_id`,`path_id`,`level`) VALUES (@subchildid,@parentid,0);
INSERT INTO `oc_category_to_layout` (`category_id`,`store_id`,`layout_id`) VALUES (@subchildid,0,0);
INSERT INTO `oc_category_to_store` (`category_id`,`store_id`) VALUES (@subchildid,0);
INSERT INTO `oc_product_to_category` (`product_id`,`category_id`) VALUES (28,@subchildid),(29,@subchildid),(30,@subchildid),(46,@subchildid),(42,@subchildid),(47,@subchildid),(43,@subchildid),(32,@subchildid),(33,@subchildid),(44,@subchildid),(34,@subchildid),(35,@subchildid);


-- child of Men (Clothing)
-- ------------------------
INSERT INTO `oc_category` (`image`,`parent_id`,`top`,`column`,`sort_order`,`status`,`date_added`,`date_modified`) VALUES ('catalog/demo/banners/categorybanner.jpg',@parentid,0,1,0,1,NOW(),NOW());
SET @childid = LAST_INSERT_ID();
INSERT INTO `oc_category_description` (`category_id`,`language_id`,`name`,`description`,`meta_title`) VALUES (@childid,1,'Clothing','&lt;p&gt;&lt;br&gt;&lt;/p&gt;','Clothing');
INSERT INTO `oc_category_path` (`category_id`,`path_id`,`level`) VALUES (@childid,@childid,1);
INSERT INTO `oc_category_path` (`category_id`,`path_id`,`level`) VALUES (@childid,@parentid,0);
INSERT INTO `oc_category_to_layout` (`category_id`,`store_id`,`layout_id`) VALUES (@childid,0,0);
INSERT INTO `oc_category_to_store` (`category_id`,`store_id`) VALUES (@childid,0);
INSERT INTO `oc_product_to_category` (`product_id`,`category_id`) VALUES (28,@childid),(29,@childid),(30,@childid),(46,@childid),(42,@childid),(47,@childid),(43,@childid),(32,@childid),(33,@childid),(44,@childid),(34,@childid),(35,@childid);

	-- sub child of Clothing (Bottoms)
	-- ---------------------------
INSERT INTO `oc_category` (`image`,`parent_id`,`top`,`column`,`sort_order`,`status`,`date_added`,`date_modified`) VALUES 	('catalog/demo/banners/categorybanner.jpg',@childid,0,1,0,1,NOW(),NOW());
SET @subchildid = LAST_INSERT_ID();
INSERT INTO `oc_category_description` (`category_id`,`language_id`,`name`,`description`,`meta_title`) VALUES (@subchildid,1,'Bottoms','&lt;p&gt;&lt;br&gt;&lt;/p&gt;','Bottoms');
INSERT INTO `oc_category_path` (`category_id`,`path_id`,`level`) VALUES (@subchildid,@subchildid,2);
INSERT INTO `oc_category_path` (`category_id`,`path_id`,`level`) VALUES (@subchildid,@childid,1);
INSERT INTO `oc_category_path` (`category_id`,`path_id`,`level`) VALUES (@subchildid,@parentid,0);
INSERT INTO `oc_category_to_layout` (`category_id`,`store_id`,`layout_id`) VALUES (@subchildid,0,0);
INSERT INTO `oc_category_to_store` (`category_id`,`store_id`) VALUES (@subchildid,0);
INSERT INTO `oc_product_to_category` (`product_id`,`category_id`) VALUES (28,@subchildid),(29,@subchildid),(30,@subchildid),(46,@subchildid),(42,@subchildid),(47,@subchildid),(43,@subchildid),(32,@subchildid),(33,@subchildid),(44,@subchildid),(34,@subchildid),(35,@subchildid);

	-- sub child of Clothing (Coats and jackets)
	-- ---------------------------
INSERT INTO `oc_category` (`image`,`parent_id`,`top`,`column`,`sort_order`,`status`,`date_added`,`date_modified`) VALUES 	('catalog/demo/banners/categorybanner.jpg',@childid,0,1,0,1,NOW(),NOW());
SET @subchildid = LAST_INSERT_ID();
INSERT INTO `oc_category_description` (`category_id`,`language_id`,`name`,`description`,`meta_title`) VALUES (@subchildid,1,'Coats and jackets','&lt;p&gt;&lt;br&gt;&lt;/p&gt;','Coats and jackets');
INSERT INTO `oc_category_path` (`category_id`,`path_id`,`level`) VALUES (@subchildid,@subchildid,2);
INSERT INTO `oc_category_path` (`category_id`,`path_id`,`level`) VALUES (@subchildid,@childid,1);
INSERT INTO `oc_category_path` (`category_id`,`path_id`,`level`) VALUES (@subchildid,@parentid,0);
INSERT INTO `oc_category_to_layout` (`category_id`,`store_id`,`layout_id`) VALUES (@subchildid,0,0);
INSERT INTO `oc_category_to_store` (`category_id`,`store_id`) VALUES (@subchildid,0);
INSERT INTO `oc_product_to_category` (`product_id`,`category_id`) VALUES (28,@subchildid),(29,@subchildid),(30,@subchildid),(46,@subchildid),(42,@subchildid),(47,@subchildid),(43,@subchildid),(32,@subchildid),(33,@subchildid),(44,@subchildid),(34,@subchildid),(35,@subchildid);

	-- sub child of Clothing (Jumpers and knitwear)
	-- ---------------------------
INSERT INTO `oc_category` (`image`,`parent_id`,`top`,`column`,`sort_order`,`status`,`date_added`,`date_modified`) VALUES 	('catalog/demo/banners/categorybanner.jpg',@childid,0,1,0,1,NOW(),NOW());
SET @subchildid = LAST_INSERT_ID();
INSERT INTO `oc_category_description` (`category_id`,`language_id`,`name`,`description`,`meta_title`) VALUES (@subchildid,1,'Jumpers and knitwear','&lt;p&gt;&lt;br&gt;&lt;/p&gt;','Jumpers and knitwear');
INSERT INTO `oc_category_path` (`category_id`,`path_id`,`level`) VALUES (@subchildid,@subchildid,2);
INSERT INTO `oc_category_path` (`category_id`,`path_id`,`level`) VALUES (@subchildid,@childid,1);
INSERT INTO `oc_category_path` (`category_id`,`path_id`,`level`) VALUES (@subchildid,@parentid,0);
INSERT INTO `oc_category_to_layout` (`category_id`,`store_id`,`layout_id`) VALUES (@subchildid,0,0);
INSERT INTO `oc_category_to_store` (`category_id`,`store_id`) VALUES (@subchildid,0);
INSERT INTO `oc_product_to_category` (`product_id`,`category_id`) VALUES (28,@subchildid),(29,@subchildid),(30,@subchildid),(46,@subchildid),(42,@subchildid),(47,@subchildid),(43,@subchildid),(32,@subchildid),(33,@subchildid),(44,@subchildid),(34,@subchildid),(35,@subchildid);


-- Designers
-- ------------

INSERT INTO `oc_category` (`image`,`parent_id`,`top`,`column`,`sort_order`,`status`,`date_added`,`date_modified`) VALUES ('catalog/demo/banners/categorybanner.jpg',0,1,1,4,1,NOW(),NOW());
SET @parentid = LAST_INSERT_ID();
INSERT INTO `oc_category_description` (`category_id`,`language_id`,`name`,`description`,`meta_title`) VALUES (@parentid,1,'Designers','&lt;p&gt;&lt;br&gt;&lt;/p&gt;','Designers');
INSERT INTO `oc_category_path` (`category_id`,`path_id`,`level`) VALUES (@parentid,@parentid,0);
INSERT INTO `oc_category_to_layout` (`category_id`,`store_id`,`layout_id`) VALUES (@parentid,0,0);
INSERT INTO `oc_category_to_store` (`category_id`,`store_id`) VALUES (@parentid,0);
INSERT INTO `oc_product_to_category` (`product_id`,`category_id`) VALUES (28,@parentid),(29,@parentid),(30,@parentid),(46,@parentid),(42,@parentid),(47,@parentid),(43,@parentid),(32,@parentid),(33,@parentid),(44,@parentid),(34,@parentid),(35,@parentid);

-- Women
-- ------------

INSERT INTO `oc_category` (`image`,`parent_id`,`top`,`column`,`sort_order`,`status`,`date_added`,`date_modified`) VALUES ('catalog/demo/banners/categorybanner.jpg',0,1,2,2,1,NOW(),NOW());
SET @parentid = LAST_INSERT_ID();
INSERT INTO `oc_category_description` (`category_id`,`language_id`,`name`,`description`,`meta_title`) VALUES (@parentid,1,'Women','&lt;p&gt;&lt;br&gt;&lt;/p&gt;','Women');
INSERT INTO `oc_category_path` (`category_id`,`path_id`,`level`) VALUES (@parentid,@parentid,0);
INSERT INTO `oc_category_to_layout` (`category_id`,`store_id`,`layout_id`) VALUES (@parentid,0,0);
INSERT INTO `oc_category_to_store` (`category_id`,`store_id`) VALUES (@parentid,0);
INSERT INTO `oc_product_to_category` (`product_id`,`category_id`) VALUES (28,@parentid),(29,@parentid),(30,@parentid),(46,@parentid),(42,@parentid),(47,@parentid),(43,@parentid),(32,@parentid),(33,@parentid),(44,@parentid),(34,@parentid),(35,@parentid);

-- child of Women (Shoes)
-- ------------------------
INSERT INTO `oc_category` (`image`,`parent_id`,`top`,`column`,`sort_order`,`status`,`date_added`,`date_modified`) VALUES ('catalog/demo/banners/categorybanner.jpg',@parentid,0,1,0,1,NOW(),NOW());
SET @childid = LAST_INSERT_ID();
INSERT INTO `oc_category_description` (`category_id`,`language_id`,`name`,`description`,`meta_title`) VALUES (@childid,1,'Shoes','&lt;p&gt;&lt;br&gt;&lt;/p&gt;','Shoes');
INSERT INTO `oc_category_path` (`category_id`,`path_id`,`level`) VALUES (@childid,@childid,1);
INSERT INTO `oc_category_path` (`category_id`,`path_id`,`level`) VALUES (@childid,@parentid,0);
INSERT INTO `oc_category_to_layout` (`category_id`,`store_id`,`layout_id`) VALUES (@childid,0,0);
INSERT INTO `oc_category_to_store` (`category_id`,`store_id`) VALUES (@childid,0);
INSERT INTO `oc_product_to_category` (`product_id`,`category_id`) VALUES (28,@childid),(29,@childid),(30,@childid),(46,@childid),(42,@childid),(47,@childid),(43,@childid),(32,@childid),(33,@childid),(44,@childid),(34,@childid),(35,@childid);

	-- sub child of Shoes (Trainers)
	-- ---------------------------
INSERT INTO `oc_category` (`image`,`parent_id`,`top`,`column`,`sort_order`,`status`,`date_added`,`date_modified`) VALUES 	('catalog/demo/banners/categorybanner.jpg',@childid,0,1,0,1,NOW(),NOW());
SET @subchildid = LAST_INSERT_ID();
INSERT INTO `oc_category_description` (`category_id`,`language_id`,`name`,`description`,`meta_title`) VALUES (@subchildid,1,'Trainers','&lt;p&gt;&lt;br&gt;&lt;/p&gt;','Trainers');
INSERT INTO `oc_category_path` (`category_id`,`path_id`,`level`) VALUES (@subchildid,@subchildid,2);
INSERT INTO `oc_category_path` (`category_id`,`path_id`,`level`) VALUES (@subchildid,@childid,1);
INSERT INTO `oc_category_path` (`category_id`,`path_id`,`level`) VALUES (@subchildid,@parentid,0);
INSERT INTO `oc_category_to_layout` (`category_id`,`store_id`,`layout_id`) VALUES (@subchildid,0,0);
INSERT INTO `oc_category_to_store` (`category_id`,`store_id`) VALUES (@subchildid,0);
INSERT INTO `oc_product_to_category` (`product_id`,`category_id`) VALUES (28,@subchildid),(29,@subchildid),(30,@subchildid),(46,@subchildid),(42,@subchildid),(47,@subchildid),(43,@subchildid),(32,@subchildid),(33,@subchildid),(44,@subchildid),(34,@subchildid),(35,@subchildid);

	-- sub child of Shoes (Slippers)
	-- ---------------------------
INSERT INTO `oc_category` (`image`,`parent_id`,`top`,`column`,`sort_order`,`status`,`date_added`,`date_modified`) VALUES 	('catalog/demo/banners/categorybanner.jpg',@childid,0,1,0,1,NOW(),NOW());
SET @subchildid = LAST_INSERT_ID();
INSERT INTO `oc_category_description` (`category_id`,`language_id`,`name`,`description`,`meta_title`) VALUES (@subchildid,1,'Slippers','&lt;p&gt;&lt;br&gt;&lt;/p&gt;','Slippers');
INSERT INTO `oc_category_path` (`category_id`,`path_id`,`level`) VALUES (@subchildid,@subchildid,2);
INSERT INTO `oc_category_path` (`category_id`,`path_id`,`level`) VALUES (@subchildid,@childid,1);
INSERT INTO `oc_category_path` (`category_id`,`path_id`,`level`) VALUES (@subchildid,@parentid,0);
INSERT INTO `oc_category_to_layout` (`category_id`,`store_id`,`layout_id`) VALUES (@subchildid,0,0);
INSERT INTO `oc_category_to_store` (`category_id`,`store_id`) VALUES (@subchildid,0);
INSERT INTO `oc_product_to_category` (`product_id`,`category_id`) VALUES (28,@subchildid),(29,@subchildid),(30,@subchildid),(46,@subchildid),(42,@subchildid),(47,@subchildid),(43,@subchildid),(32,@subchildid),(33,@subchildid),(44,@subchildid),(34,@subchildid),(35,@subchildid);

	-- sub child of Shoes (Sandals)
	-- ---------------------------
INSERT INTO `oc_category` (`image`,`parent_id`,`top`,`column`,`sort_order`,`status`,`date_added`,`date_modified`) VALUES 	('catalog/demo/banners/categorybanner.jpg',@childid,0,1,0,1,NOW(),NOW());
SET @subchildid = LAST_INSERT_ID();
INSERT INTO `oc_category_description` (`category_id`,`language_id`,`name`,`description`,`meta_title`) VALUES (@subchildid,1,'Sandals','&lt;p&gt;&lt;br&gt;&lt;/p&gt;','Sandals');
INSERT INTO `oc_category_path` (`category_id`,`path_id`,`level`) VALUES (@subchildid,@subchildid,2);
INSERT INTO `oc_category_path` (`category_id`,`path_id`,`level`) VALUES (@subchildid,@childid,1);
INSERT INTO `oc_category_path` (`category_id`,`path_id`,`level`) VALUES (@subchildid,@parentid,0);
INSERT INTO `oc_category_to_layout` (`category_id`,`store_id`,`layout_id`) VALUES (@subchildid,0,0);
INSERT INTO `oc_category_to_store` (`category_id`,`store_id`) VALUES (@subchildid,0);
INSERT INTO `oc_product_to_category` (`product_id`,`category_id`) VALUES (28,@subchildid),(29,@subchildid),(30,@subchildid),(46,@subchildid),(42,@subchildid),(47,@subchildid),(43,@subchildid),(32,@subchildid),(33,@subchildid),(44,@subchildid),(34,@subchildid),(35,@subchildid);

-- child of Women (Clothing)
-- ------------------------
INSERT INTO `oc_category` (`image`,`parent_id`,`top`,`column`,`sort_order`,`status`,`date_added`,`date_modified`) VALUES ('catalog/demo/banners/categorybanner.jpg',@parentid,0,1,0,1,NOW(),NOW());
SET @childid = LAST_INSERT_ID();
INSERT INTO `oc_category_description` (`category_id`,`language_id`,`name`,`description`,`meta_title`) VALUES (@childid,1,'Clothing','&lt;p&gt;&lt;br&gt;&lt;/p&gt;','Clothing');
INSERT INTO `oc_category_path` (`category_id`,`path_id`,`level`) VALUES (@childid,@childid,1);
INSERT INTO `oc_category_path` (`category_id`,`path_id`,`level`) VALUES (@childid,@parentid,0);
INSERT INTO `oc_category_to_layout` (`category_id`,`store_id`,`layout_id`) VALUES (@childid,0,0);
INSERT INTO `oc_category_to_store` (`category_id`,`store_id`) VALUES (@childid,0);
INSERT INTO `oc_product_to_category` (`product_id`,`category_id`) VALUES (28,@childid),(29,@childid),(30,@childid),(46,@childid),(42,@childid),(47,@childid),(43,@childid),(32,@childid),(33,@childid),(44,@childid),(34,@childid),(35,@childid);

	-- sub child of Clothing (Skirts)
	-- ---------------------------
INSERT INTO `oc_category` (`image`,`parent_id`,`top`,`column`,`sort_order`,`status`,`date_added`,`date_modified`) VALUES 	('catalog/demo/banners/categorybanner.jpg',@childid,0,1,0,1,NOW(),NOW());
SET @subchildid = LAST_INSERT_ID();
INSERT INTO `oc_category_description` (`category_id`,`language_id`,`name`,`description`,`meta_title`) VALUES (@subchildid,1,'Skirts','&lt;p&gt;&lt;br&gt;&lt;/p&gt;','Skirts');
INSERT INTO `oc_category_path` (`category_id`,`path_id`,`level`) VALUES (@subchildid,@subchildid,2);
INSERT INTO `oc_category_path` (`category_id`,`path_id`,`level`) VALUES (@subchildid,@childid,1);
INSERT INTO `oc_category_path` (`category_id`,`path_id`,`level`) VALUES (@subchildid,@parentid,0);
INSERT INTO `oc_category_to_layout` (`category_id`,`store_id`,`layout_id`) VALUES (@subchildid,0,0);
INSERT INTO `oc_category_to_store` (`category_id`,`store_id`) VALUES (@subchildid,0);
INSERT INTO `oc_product_to_category` (`product_id`,`category_id`) VALUES (28,@subchildid),(29,@subchildid),(30,@subchildid),(46,@subchildid),(42,@subchildid),(47,@subchildid),(43,@subchildid),(32,@subchildid),(33,@subchildid),(44,@subchildid),(34,@subchildid),(35,@subchildid);

	-- sub child of Clothing (Shorts)
	-- ---------------------------
INSERT INTO `oc_category` (`image`,`parent_id`,`top`,`column`,`sort_order`,`status`,`date_added`,`date_modified`) VALUES 	('catalog/demo/banners/categorybanner.jpg',@childid,0,1,0,1,NOW(),NOW());
SET @subchildid = LAST_INSERT_ID();
INSERT INTO `oc_category_description` (`category_id`,`language_id`,`name`,`description`,`meta_title`) VALUES (@subchildid,1,'Shorts','&lt;p&gt;&lt;br&gt;&lt;/p&gt;','Shorts');
INSERT INTO `oc_category_path` (`category_id`,`path_id`,`level`) VALUES (@subchildid,@subchildid,2);
INSERT INTO `oc_category_path` (`category_id`,`path_id`,`level`) VALUES (@subchildid,@childid,1);
INSERT INTO `oc_category_path` (`category_id`,`path_id`,`level`) VALUES (@subchildid,@parentid,0);
INSERT INTO `oc_category_to_layout` (`category_id`,`store_id`,`layout_id`) VALUES (@subchildid,0,0);
INSERT INTO `oc_category_to_store` (`category_id`,`store_id`) VALUES (@subchildid,0);
INSERT INTO `oc_product_to_category` (`product_id`,`category_id`) VALUES (28,@subchildid),(29,@subchildid),(30,@subchildid),(46,@subchildid),(42,@subchildid),(47,@subchildid),(43,@subchildid),(32,@subchildid),(33,@subchildid),(44,@subchildid),(34,@subchildid),(35,@subchildid);

	-- sub child of Clothing (Swimwear &amp; coverups)
	-- ---------------------------
INSERT INTO `oc_category` (`image`,`parent_id`,`top`,`column`,`sort_order`,`status`,`date_added`,`date_modified`) VALUES 	('catalog/demo/banners/categorybanner.jpg',@childid,0,1,3,1,NOW(),NOW());
SET @subchildid = LAST_INSERT_ID();
INSERT INTO `oc_category_description` (`category_id`,`language_id`,`name`,`description`,`meta_title`) VALUES (@subchildid,1,'Swimwear &amp; coverups','&lt;p&gt;&lt;br&gt;&lt;/p&gt;','Swimwear &amp; coverups');
INSERT INTO `oc_category_path` (`category_id`,`path_id`,`level`) VALUES (@subchildid,@subchildid,2);
INSERT INTO `oc_category_path` (`category_id`,`path_id`,`level`) VALUES (@subchildid,@childid,1);
INSERT INTO `oc_category_path` (`category_id`,`path_id`,`level`) VALUES (@subchildid,@parentid,0);
INSERT INTO `oc_category_to_layout` (`category_id`,`store_id`,`layout_id`) VALUES (@subchildid,0,0);
INSERT INTO `oc_category_to_store` (`category_id`,`store_id`) VALUES (@subchildid,0);
INSERT INTO `oc_product_to_category` (`product_id`,`category_id`) VALUES (28,@subchildid),(29,@subchildid),(30,@subchildid),(46,@subchildid),(42,@subchildid),(47,@subchildid),(43,@subchildid),(32,@subchildid),(33,@subchildid),(44,@subchildid),(34,@subchildid),(35,@subchildid);


-- Party wear
-- ------------

INSERT INTO `oc_category` (`image`,`parent_id`,`top`,`column`,`sort_order`,`status`,`date_added`,`date_modified`) VALUES ('catalog/demo/banners/categorybanner.jpg',0,1,1,6,1,NOW(),NOW());
SET @parentid = LAST_INSERT_ID();
INSERT INTO `oc_category_description` (`category_id`,`language_id`,`name`,`description`,`meta_title`) VALUES (@parentid,1,'Party wear','&lt;p&gt;&lt;br&gt;&lt;/p&gt;','Party wear');
INSERT INTO `oc_category_path` (`category_id`,`path_id`,`level`) VALUES (@parentid,@parentid,0);
INSERT INTO `oc_category_to_layout` (`category_id`,`store_id`,`layout_id`) VALUES (@parentid,0,0);
INSERT INTO `oc_category_to_store` (`category_id`,`store_id`) VALUES (@parentid,0);
INSERT INTO `oc_product_to_category` (`product_id`,`category_id`) VALUES (28,@parentid),(29,@parentid),(30,@parentid),(46,@parentid),(42,@parentid),(47,@parentid),(43,@parentid),(32,@parentid),(33,@parentid),(44,@parentid),(34,@parentid),(35,@parentid);

-- ------------------------------
-- 12. Add Product
-- ------------------------------
SET @db = DATABASE();

SET @r_count = (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'oc_product' AND COLUMN_NAME = 'rollover_image' AND TABLE_SCHEMA = @db);

SET @s = IF(@r_count=0, "ALTER TABLE `oc_product` ADD `rollover_image` VARCHAR( 255 ) NOT NULL DEFAULT ''",'SELECT DATABASE()');

PREPARE stmt1 FROM @s;

EXECUTE stmt1;


UPDATE `oc_product` SET `image`='catalog/demo/banners/Productimage.jpg',`rollover_image`='catalog/demo/banners/Productimage.jpg' ;

UPDATE `oc_product_image` SET `image`='catalog/demo/banners/Productimage.jpg' ;

UPDATE `oc_product_description` SET `name`='Fauxwaii Shirt - Oldss',`meta_title`='Fauxwaii Shirt - Oldss' WHERE `product_id`=28;
UPDATE `oc_product_description` SET `name`='Farlap Shirt',`meta_title`='Farlap Shirt' WHERE `product_id`=29;
UPDATE `oc_product_description` SET `name`='Crossed Shirt - Beluga',`meta_title`='Crossed Shirt - Beluga' WHERE `product_id`=30;
UPDATE `oc_product_description` SET `name`='Vestibulumut nulla',`meta_title`='Vestibulumut nulla' WHERE `product_id`=31;
UPDATE `oc_product_description` SET `name`='youthful elegance',`meta_title`='youthful elegance' WHERE `product_id`=32;
UPDATE `oc_product_description` SET `name`='Floral chunky',`meta_title`='Floral chunky' WHERE `product_id`=33;
UPDATE `oc_product_description` SET `name`='youthful',`meta_title`='youthful' WHERE `product_id`=34;
UPDATE `oc_product_description` SET `name`='Vestibulum ut nulla',`meta_title`='Vestibulum ut nulla' WHERE `product_id`=35;
UPDATE `oc_product_description` SET `name`='Sander shirt',`meta_title`='Sander shirt' WHERE `product_id`=36;
UPDATE `oc_product_description` SET `name`='Crossed Shirt',`meta_title`='Crossed Shirt' WHERE `product_id`=40;
UPDATE `oc_product_description` SET `name`='Sleeve Less Top',`meta_title`='Sleeve Less Top' WHERE `product_id`=41;
UPDATE `oc_product_description` SET `name`='Sleeve Less',`meta_title`='Sleeve Less' WHERE `product_id`=42;
UPDATE `oc_product_description` SET `name`='Fauxwaii Shirt - Oldss',`meta_title`='Fauxwaii Shirt - Oldss' WHERE `product_id`=43;
UPDATE `oc_product_description` SET `name`='Vestibulum ut nulla',`meta_title`='Vestibulum ut nulla' WHERE `product_id`=44;
UPDATE `oc_product_description` SET `name`='Aviator T-Shirt',`meta_title`='Aviator T-Shirt' WHERE `product_id`=45;
UPDATE `oc_product_description` SET `name`='Joy Pop T-Shirt',`meta_title`='Joy Pop T-Shirt' WHERE `product_id`=46;
UPDATE `oc_product_description` SET `name`='Heart Tee',`meta_title`='Heart Tee' WHERE `product_id`=47;
UPDATE `oc_product_description` SET `name`='Loaded Boho Top',`meta_title`='Loaded Boho Top' WHERE `product_id`=48;
UPDATE `oc_product_description` SET `name`='Crossed Shirt',`meta_title`='Crossed Shirt' WHERE `product_id`=49;

-- ------------------------------
-- 4. Add Filter 
-- ------------------------------

DELETE FROM `oc_filter_group`;
DELETE FROM `oc_filter_group_description`; 
DELETE FROM `oc_category_filter`; 
DELETE FROM `oc_product_filter`; 


-- Filter Group 1
-- ------------

INSERT INTO `oc_filter_group` (`sort_order`) VALUES (1);

SET @groupid = LAST_INSERT_ID();

INSERT INTO `oc_filter_group_description` (`filter_group_id`,`language_id`,`name`) VALUES (@groupid,1,'Category');



INSERT INTO `oc_filter` (`filter_group_id`,`sort_order`) VALUES (@groupid,1);

SET @filterid = LAST_INSERT_ID();

INSERT INTO `oc_filter_description` (`filter_id`,`language_id`,`filter_group_id`,`name`) VALUES (@filterid,1,@groupid,'Bottoms');
INSERT INTO `oc_category_filter` (`category_id`,`filter_id`) SELECT MAX(x.category_id),@filterid FROM (SELECT `category_id` FROM `oc_category_description` WHERE `name`='Men') as x;
INSERT INTO `oc_product_filter` (`product_id`,`filter_id`) VALUES (42,@filterid);



INSERT INTO `oc_filter` (`filter_group_id`,`sort_order`) VALUES (@groupid,2);

SET @filterid = LAST_INSERT_ID();

INSERT INTO `oc_filter_description` (`filter_id`,`language_id`,`filter_group_id`,`name`) VALUES (@filterid,1,@groupid,'Shoes');
INSERT INTO `oc_category_filter` (`category_id`,`filter_id`) SELECT MAX(x.category_id),@filterid FROM (SELECT `category_id` FROM `oc_category_description` WHERE `name`='Men') as x;
INSERT INTO `oc_product_filter` (`product_id`,`filter_id`) VALUES (42,@filterid);


INSERT INTO `oc_filter` (`filter_group_id`,`sort_order`) VALUES (@groupid,3);

SET @filterid = LAST_INSERT_ID();

INSERT INTO `oc_filter_description` (`filter_id`,`language_id`,`filter_group_id`,`name`) VALUES (@filterid,1,@groupid,'Boots');
INSERT INTO `oc_category_filter` (`category_id`,`filter_id`) SELECT MAX(x.category_id),@filterid FROM (SELECT `category_id` FROM `oc_category_description` WHERE `name`='Men') as x;


INSERT INTO `oc_filter` (`filter_group_id`,`sort_order`) VALUES (@groupid,4);

SET @filterid = LAST_INSERT_ID();

INSERT INTO `oc_filter_description` (`filter_id`,`language_id`,`filter_group_id`,`name`) VALUES (@filterid,1,@groupid,'Sandals');
INSERT INTO `oc_category_filter` (`category_id`,`filter_id`) SELECT MAX(x.category_id),@filterid FROM (SELECT `category_id` FROM `oc_category_description` WHERE `name`='Men') as x;

INSERT INTO `oc_filter` (`filter_group_id`,`sort_order`) VALUES (@groupid,5);

SET @filterid = LAST_INSERT_ID();

INSERT INTO `oc_filter_description` (`filter_id`,`language_id`,`filter_group_id`,`name`) VALUES (@filterid,1,@groupid,'Shoes');
INSERT INTO `oc_category_filter` (`category_id`,`filter_id`) SELECT MAX(x.category_id),@filterid FROM (SELECT `category_id` FROM `oc_category_description` WHERE `name`='Men') as x;
INSERT INTO `oc_product_filter` (`product_id`,`filter_id`) VALUES (42,@filterid);


INSERT INTO `oc_filter` (`filter_group_id`,`sort_order`) VALUES (@groupid,6);

SET @filterid = LAST_INSERT_ID();

INSERT INTO `oc_filter_description` (`filter_id`,`language_id`,`filter_group_id`,`name`) VALUES (@filterid,1,@groupid,'Coats and jackets');
INSERT INTO `oc_category_filter` (`category_id`,`filter_id`) SELECT MAX(x.category_id),@filterid FROM (SELECT `category_id` FROM `oc_category_description` WHERE `name`='Men') as x;
INSERT INTO `oc_product_filter` (`product_id`,`filter_id`) VALUES (42,@filterid);



-- Filter Group 2
-- ------------

INSERT INTO `oc_filter_group` (`sort_order`) VALUES (2);

SET @groupid = LAST_INSERT_ID();

INSERT INTO `oc_filter_group_description` (`filter_group_id`,`language_id`,`name`) VALUES (@groupid,1,'Color');


INSERT INTO `oc_filter` (`filter_group_id`,`sort_order`) VALUES (@groupid,1);

SET @filterid = LAST_INSERT_ID();

INSERT INTO `oc_filter_description` (`filter_id`,`language_id`,`filter_group_id`,`name`) VALUES (@filterid,1,@groupid,'Red');
INSERT INTO `oc_category_filter` (`category_id`,`filter_id`) SELECT MAX(x.category_id),@filterid FROM (SELECT `category_id` FROM `oc_category_description` WHERE `name`='Men') as x;
INSERT INTO `oc_product_filter` (`product_id`,`filter_id`) VALUES (42,@filterid);



INSERT INTO `oc_filter` (`filter_group_id`,`sort_order`) VALUES (@groupid,2);

SET @filterid = LAST_INSERT_ID();

INSERT INTO `oc_filter_description` (`filter_id`,`language_id`,`filter_group_id`,`name`) VALUES (@filterid,1,@groupid,'Blue');
INSERT INTO `oc_category_filter` (`category_id`,`filter_id`) SELECT MAX(x.category_id),@filterid FROM (SELECT `category_id` FROM `oc_category_description` WHERE `name`='Men') as x;

INSERT INTO `oc_filter` (`filter_group_id`,`sort_order`) VALUES (@groupid,3);

SET @filterid = LAST_INSERT_ID();

INSERT INTO `oc_filter_description` (`filter_id`,`language_id`,`filter_group_id`,`name`) VALUES (@filterid,1,@groupid,'White');
INSERT INTO `oc_category_filter` (`category_id`,`filter_id`) SELECT MAX(x.category_id),@filterid FROM (SELECT `category_id` FROM `oc_category_description` WHERE `name`='Men') as x;


INSERT INTO `oc_filter` (`filter_group_id`,`sort_order`) VALUES (@groupid,4);

SET @filterid = LAST_INSERT_ID();

INSERT INTO `oc_filter_description` (`filter_id`,`language_id`,`filter_group_id`,`name`) VALUES (@filterid,1,@groupid,'Yellow');
INSERT INTO `oc_category_filter` (`category_id`,`filter_id`) SELECT MAX(x.category_id),@filterid FROM (SELECT `category_id` FROM `oc_category_description` WHERE `name`='Men') as x;
INSERT INTO `oc_product_filter` (`product_id`,`filter_id`) VALUES (42,@filterid);


INSERT INTO `oc_filter` (`filter_group_id`,`sort_order`) VALUES (@groupid,5);

SET @filterid = LAST_INSERT_ID();

INSERT INTO `oc_filter_description` (`filter_id`,`language_id`,`filter_group_id`,`name`) VALUES (@filterid,1,@groupid,'Black');
INSERT INTO `oc_category_filter` (`category_id`,`filter_id`) SELECT MAX(x.category_id),@filterid FROM (SELECT `category_id` FROM `oc_category_description` WHERE `name`='Men') as x;
INSERT INTO `oc_product_filter` (`product_id`,`filter_id`) VALUES (42,@filterid);


INSERT INTO `oc_filter` (`filter_group_id`,`sort_order`) VALUES (@groupid,6);

SET @filterid = LAST_INSERT_ID();

INSERT INTO `oc_filter_description` (`filter_id`,`language_id`,`filter_group_id`,`name`) VALUES (@filterid,1,@groupid,'Green');
INSERT INTO `oc_category_filter` (`category_id`,`filter_id`) SELECT MAX(x.category_id),@filterid FROM (SELECT `category_id` FROM `oc_category_description` WHERE `name`='Men') as x;

INSERT INTO `oc_filter` (`filter_group_id`,`sort_order`) VALUES (@groupid,7);

SET @filterid = LAST_INSERT_ID();

INSERT INTO `oc_filter_description` (`filter_id`,`language_id`,`filter_group_id`,`name`) VALUES (@filterid,1,@groupid,'Grey');
INSERT INTO `oc_category_filter` (`category_id`,`filter_id`) SELECT MAX(x.category_id),@filterid FROM (SELECT `category_id` FROM `oc_category_description` WHERE `name`='Men') as x;
INSERT INTO `oc_product_filter` (`product_id`,`filter_id`) VALUES (42,@filterid);


INSERT INTO `oc_filter` (`filter_group_id`,`sort_order`) VALUES (@groupid,8);

SET @filterid = LAST_INSERT_ID();

INSERT INTO `oc_filter_description` (`filter_id`,`language_id`,`filter_group_id`,`name`) VALUES (@filterid,1,@groupid,'Pink');
INSERT INTO `oc_category_filter` (`category_id`,`filter_id`) SELECT MAX(x.category_id),@filterid FROM (SELECT `category_id` FROM `oc_category_description` WHERE `name`='Men') as x;


-- ------------------------------
-- 5. Add Module 
-- ------------------------------

DELETE FROM `oc_extension` WHERE `code` IN ('nilkanthinfo_cms','nilkanthinfo_newsletter','nilkanthinfoproduct_tab','filter','information','nilkanthinfo_blog','nilkanthinfo_latest_blog','special','basic_captcha');

INSERT INTO `oc_extension` (`type`,`code`) VALUES ('module','nilkanthinfo_cms'),('module','nilkanthinfo_newsletter'),('module','nilkanthinfoproduct_tab'),('module','nilkanthinfo_testimonial'),('module','filter'),('module','information'),('module','ni_category_tab'),('module','nilkanthinfo_blog'),('module','nilkanthinfo_latest_blog'),('module','special'),('captcha','basic_captcha');

-- ------------------------------
-- 6. Add Layout 
-- ------------------------------

DELETE FROM `oc_layout` WHERE `name` IN ('Single Blog','All Blog');

INSERT INTO `oc_layout` (`name`) VALUES ('Single Blog'),('All Blog');

-- ------------------------------
-- 7. Add Module Setting
-- ------------------------------

DELETE FROM `oc_module` WHERE `code` IN ('nilkanthinfo_cms','nilkanthinfo_testimonial','latest','ni_category_tab','nilkanthinfo_newsletter','nilkanthinfoproduct_tab','nilkanthinfo_blog','nilkanthinfo_latest_blog','special');
DELETE FROM `oc_module` WHERE `code`='featured' AND `name`='leftcolum-featured';
DELETE FROM `oc_module` WHERE `code`='featured' AND `name`='Home Page';

DELETE FROM `oc_module` WHERE `code`='banner' AND `name`='Leftbanner-slider';
DELETE FROM `oc_module` WHERE `code`='banner' AND `name`='Leftbanner';



UPDATE `oc_module` SET `setting`='{"name":"Home Page","banner_id":"7","width":"1920","height":"627","status":"1"}' WHERE `name`='Home Page' AND `code` = 'slideshow';

UPDATE `oc_module` SET `setting`='{"name":"Home Page","banner_id":"8","width":"105","height":"70","status":"1"}' WHERE `name`='Home Page' AND `code` = 'carousel';

INSERT INTO `oc_module` (`name`,`code`,`setting`) VALUES ('Footer-Contacts','nilkanthinfo_cms','{"name":"Footer-Contacts","module_description":{"1":{"title":"","description":"&lt;div class=&quot;footer_Contacts&quot;&gt;        &lt;h5&gt;Contacts&lt;span&gt; Us&lt;\/span&gt;&lt;\/h5&gt;\\r\\n\\r\\n\\r\\n\\r\\n&lt;button class=&quot;footer-menu-toggle&quot; style=&quot;display:none&quot;&gt;+&lt;\/button&gt;\\t\\t\\t&lt;!-- button add by nilkanthinfo--&gt;        &lt;ul class=&quot;list-unstyled sub-footer&quot;&gt;\\r\\n\\r\\n\\r\\n\\r\\n&lt;!--added class by nilkanthinfo--&gt;          \\t&lt;li&gt;Offices&lt;\/li&gt;\\r\\n\\r\\n\\r\\n\\r\\n\\t\\t\\t\\t&lt;li&gt;&lt;i class=&quot;fa fa-map-marker&quot; aria-hidden=&quot;true&quot;&gt;&lt;\/i&gt;36, Shiv Shankar Parvati Soc, &lt;\/li&gt;\\r\\n\\r\\n\\r\\n\\r\\n\\t\\t&lt;li&gt;Khodiyarnagar road, Varacha,&lt;\/li&gt;\\r\\n\\r\\n\\r\\n\\r\\n\\t\\t&lt;li&gt;Surat, Gujarat, India.&lt;\/li&gt;\\r\\n\\r\\n\\r\\n\\r\\n\\t\\t&lt;li&gt;&lt;i class=&quot;fa fa-phone&quot; aria-hidden=&quot;true&quot;&gt;&lt;\/i&gt;+91 - 9033064592 &lt;\/li&gt;\\r\\n\\r\\n\\r\\n\\r\\n&lt;li&gt;&lt;i class=&quot;fa fa-envelope-o&quot; aria-hidden=&quot;true&quot;&gt;&lt;\/i&gt;support@localhost.com&lt;\/li&gt;\\r\\n\\r\\n\\r\\n\\r\\n                  &lt;\/ul&gt;\\r\\n\\r\\n\\r\\n\\r\\n      &lt;\/div&gt;"}},"status":"1"}');

INSERT INTO `oc_module` (`name`,`code`,`setting`) VALUES ('footerPayment_Block','nilkanthinfo_cms','{"name":"footerPayment_Block","module_description":{"1":{"title":"","description":"&lt;div class=&quot;Payment_Block&quot;&gt;&lt;h5&gt;Payment Block&lt;\/h5&gt;\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n&lt;ul class=&quot;payment_block&quot;&gt;\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n&lt;li class=&quot;visa&quot;&gt;&lt;a href=&quot;#&quot;&gt; &lt;\/a&gt;&lt;\/li&gt;\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n&lt;li class=&quot;mastro&quot;&gt;&lt;a href=&quot;#&quot;&gt; &lt;\/a&gt;&lt;\/li&gt;\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n&lt;li class=&quot;paypal&quot;&gt;&lt;a href=&quot;#&quot;&gt; &lt;\/a&gt;&lt;\/li&gt;\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n&lt;li class=&quot;amex&quot;&gt;&lt;a href=&quot;#&quot;&gt; &lt;\/a&gt;&lt;\/li&gt;\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n&lt;\/ul&gt;\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n\\r\\n&lt;\/div&gt;"}},"status":"1"}');

INSERT INTO `oc_module` (`name`,`code`,`setting`) VALUES ('footerSocial','nilkanthinfo_cms','{"name":"footerSocial","module_description":{"1":{"title":"","description":"&lt;div class=&quot;Follow_Us&quot;&gt;&lt;h5&gt;Follow Us&lt;\/h5&gt;\\r\\n\\r\\n\\r\\n&lt;ul class=&quot;social_block&quot;&gt;\\r\\n\\r\\n\\r\\n\\t\\t&lt;li class=&quot;facebook&quot;&gt;\\t\\t&lt;a href=&quot;https:\/\/www.facebook.com\/TemplateManiacs&quot;&gt;&lt;i class=&quot;fa fa-facebook&quot;&gt;&lt;\/i&gt;&lt;\/a&gt;\\t\\t&lt;\/li&gt;\\r\\n\\r\\n\\r\\n\\t\\t&lt;li class=&quot;twitter&quot;&gt;\\t\\t&lt;a href=&quot;https:\/\/twitter.com\/TemplateManiacs&quot;&gt;&lt;i class=&quot;fa fa-twitter&quot;&gt;&lt;\/i&gt;&lt;\/a&gt;\\t\\t&lt;\/li&gt;\\r\\n\\r\\n\\r\\n\\t\\t&lt;li class=&quot;rss&quot;&gt;\\t\\t&lt;a href=&quot;#&quot;&gt;&lt;i class=&quot;fa fa-google-plus&quot;&gt;&lt;\/i&gt;&lt;\/a&gt;\\t\\t&lt;\/li&gt;\\r\\n\\r\\n\\r\\n\\t\\t&lt;li class=&quot;linkin&quot;&gt;\\t\\t&lt;a href=&quot;https:\/\/in.linkedin.com\/in\/template-maniacs-0793a8118&quot;&gt;&lt;i class=&quot;fa fa-linkedin&quot;&gt;&lt;\/i&gt;&lt;\/a&gt;\\t\\t&lt;\/li&gt;\\r\\n\\r\\n\\r\\n\\t\\t&lt;\/ul&gt;\\r\\n\\r\\n\\r\\n\\t\\t&lt;\/div&gt;"}},"status":"1"}');

INSERT INTO `oc_module` (`name`,`code`,`setting`) VALUES ('Home CMS','nilkanthinfo_cms','{"name":"Home CMS","module_description":{"1":{"title":"","description":"&lt;div class=&quot;subbanner_main&quot;&gt;&lt;div class=&quot;container&quot;&gt;\\t\\t&lt;div class=&quot;sub sub1&quot;&gt;\\t\\t\\t&lt;div class=&quot;text-block&quot;&gt;\\t\\t\\t\\t\\t\\t&lt;span class=&quot;text1&quot;&gt;Fashion&lt;\/span&gt;\\t\\t\\t\\t\\t\\t&lt;span class=&quot;text2&quot;&gt;Suits&lt;\/span&gt;\\t\\t\\t\\t\\t\\t&lt;div&gt;&lt;a href=&quot;#&quot;&gt;Shop Now&lt;\/a&gt;&lt;\/div&gt;\\r\\n\\r\\n\\t\\t&lt;\/div&gt;\\r\\n\\r\\n\\t\\t&lt;a href=&quot;#&quot;&gt;&lt;img src=&quot;~\/..\/image\/catalog\/demo\/banners\/Subbanner1.jpg&quot;&gt;&lt;\/a&gt;\\t\\t&lt;\/div&gt;\\r\\n\\r\\n\\t&lt;div class=&quot;sub sub2&quot;&gt;\\t\\t&lt;div class=&quot;text-block&quot;&gt;\\t\\t\\t\\t\\t\\t&lt;span class=&quot;text1&quot;&gt;Spring&lt;\/span&gt;\\t\\t\\t\\t\\t\\t&lt;span class=&quot;text2&quot;&gt;Looks&lt;\/span&gt;\\t\\t\\t\\t\\t\\t&lt;div&gt;&lt;a href=&quot;#&quot;&gt;Shop Now&lt;\/a&gt;&lt;\/div&gt;\\r\\n\\r\\n\\t\\t&lt;\/div&gt;\\r\\n\\r\\n\\t\\t&lt;a href=&quot;#&quot;&gt;&lt;img src=&quot;~\/..\/image\/catalog\/demo\/banners\/Subbanner1.jpg&quot;&gt;&lt;\/a&gt;\\t\\t&lt;\/div&gt;\\r\\n\\r\\n\\t&lt;div class=&quot;sub sub3&quot;&gt;\\t\\t&lt;div class=&quot;text-block&quot;&gt;\\t\\t\\t\\t\\t\\t&lt;span class=&quot;text1&quot;&gt;Men\'s&lt;\/span&gt;\\t\\t\\t\\t\\t\\t&lt;span class=&quot;text2&quot;&gt;hoodie&lt;\/span&gt;\\t\\t\\t\\t\\t\\t&lt;div&gt;&lt;a href=&quot;#&quot;&gt;Shop Now&lt;\/a&gt;&lt;\/div&gt;\\r\\n\\r\\n\\t\\t&lt;\/div&gt;\\r\\n\\r\\n\\t\\t&lt;a href=&quot;#&quot;&gt;&lt;img src=&quot;~\/..\/image\/catalog\/demo\/banners\/Subbanner1.jpg&quot;&gt;&lt;\/a&gt;\\t\\t&lt;\/div&gt;\\r\\n\\r\\n&lt;\/div&gt;\\r\\n\\r\\n&lt;\/div&gt;"}},"status":"1"}');

INSERT INTO `oc_module` (`name`,`code`,`setting`) VALUES ('Tab-bottom-banner','nilkanthinfo_cms','{"name":"Tab-bottom-banner","module_description":{"1":{"title":"","description":"&lt;div class=&quot;subbanner-main&quot;&gt;\\t&lt;div class=&quot;container&quot;&gt;\\t\\t\\t&lt;div class=&quot;banner-content&quot;&gt;\\t\\t\\t\\t\\t\\t&lt;div class=&quot;left-banner content&quot;&gt;\\t\\t\\t\\t\\t\\t\\t\\t\\t&lt;div class=&quot;subbanner_inner&quot;&gt;\\t\\t\\t\\t\\t&lt;a href=&quot;#&quot;&gt;\\t&lt;img src=&quot;~\/..\/image\/catalog\/demo\/banners\/Subbanner2.jpg&quot;&gt;\\t\\t&lt;\/a&gt;\\t\\t\\t\\t\\t&lt;\/div&gt;\\r\\n\\r\\n\\r\\n\\t\\t\\t&lt;\/div&gt;\\r\\n\\r\\n\\r\\n\\t\\t\\t&lt;div class=&quot;right-banner content&quot;&gt;\\t\\t\\t\\t\\t\\t\\t\\t\\t&lt;div class=&quot;top-content&quot;&gt;\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t\\t&lt;div class=&quot;left&quot;&gt;\\t\\t\\t\\t\\t\\t&lt;div class=&quot;subbanner_inner&quot;&gt;\\t\\t\\t\\t\\t\\t\\t\\t&lt;a href=&quot;#&quot;&gt;&lt;img src=&quot;~\/..\/image\/catalog\/demo\/banners\/Subbanner3.jpg&quot;&gt;&lt;\/a&gt;\\t\\t\\t\\t\\t\\t&lt;\/div&gt;\\r\\n\\r\\n\\r\\n\\t\\t\\t\\t\\t&lt;\/div&gt;\\r\\n\\r\\n\\r\\n\\t\\t\\t\\t\\t&lt;div class=&quot;right&quot;&gt;\\t\\t\\t\\t\\t\\t&lt;div class=&quot;subbanner_inner&quot;&gt;\\t\\t\\t\\t\\t\\t&lt;a href=&quot;#&quot;&gt;&lt;img src=&quot;~\/..\/image\/catalog\/demo\/banners\/Subbanner3.jpg&quot;&gt;&lt;\/a&gt;\\t\\t\\t\\t\\t\\t&lt;\/div&gt;\\r\\n\\r\\n\\r\\n\\t\\t\\t\\t\\t&lt;\/div&gt;\\r\\n\\r\\n\\r\\n\\t\\t\\t\\t&lt;\/div&gt;\\r\\n\\r\\n\\r\\n\\t\\t\\t\\t&lt;div class=&quot;bottom-content&quot;&gt;\\t\\t\\t\\t\\t\\t&lt;div class=&quot;left&quot;&gt;\\t\\t\\t\\t\\t&lt;div class=&quot;subbanner_inner&quot;&gt;\\t\\t\\t\\t\\t&lt;a href=&quot;#&quot;&gt;&lt;img src=&quot;~\/..\/image\/catalog\/demo\/banners\/Subbanner3.jpg&quot;&gt;&lt;\/a&gt;\\t\\t\\t\\t\\t&lt;\/div&gt;\\r\\n\\r\\n\\r\\n\\t\\t\\t\\t&lt;\/div&gt;\\r\\n\\r\\n\\r\\n\\t\\t\\t\\t&lt;div class=&quot;right&quot;&gt;\\t\\t\\t\\t\\t&lt;div class=&quot;subbanner_inner&quot;&gt;\\t\\t\\t\\t\\t&lt;a href=&quot;#&quot;&gt;&lt;img src=&quot;~\/..\/image\/catalog\/demo\/banners\/Subbanner3.jpg&quot;&gt;&lt;\/a&gt;\\t\\t\\t\\t\\t&lt;\/div&gt;\\r\\n\\r\\n\\r\\n\\t\\t\\t\\t&lt;\/div&gt;\\r\\n\\r\\n\\r\\n\\t\\t\\t&lt;\/div&gt;\\r\\n\\r\\n\\r\\n\\t\\t\\t&lt;\/div&gt;\\r\\n\\r\\n\\r\\n\\t\\t&lt;\/div&gt;\\r\\n\\r\\n\\r\\n\\t&lt;\/div&gt;\\r\\n\\r\\n\\r\\n&lt;\/div&gt;"}},"status":"1"}');




INSERT INTO `oc_module` (`name`,`code`,`setting`) VALUES ('leftcolum-featured','featured','{"name":"leftcolum-featured","product":["42","30","47","28","41","40"],"limit":"10","width":"278","height":"355","status":"1"}');

INSERT INTO `oc_module` (`name`,`code`,`setting`) VALUES ('Home Page','featured','{"name":"Home Page","product":["43","40","30","28","41","42","33","49","46"],"limit":"50","width":"271","height":"346","status":"1"}');


INSERT INTO `oc_module` (`name`,`code`,`setting`) VALUES ('Home Testimonial','nilkanthinfo_testimonial','{"testimonial_admin_approved":"1","testimonial_default_rating":"5","testimonial_send_to_admin":"1","name":"Home Testimonial","limit":"5","width":"89","height":"89","status":"1"}');

SET @Leftbannersliderdata = concat('{"name":"Leftbanner-slider","banner_id":"',@leftbannersliderid,'","width":"282","height":"361","status":"1"}');
INSERT INTO `oc_module` (`name`,`code`,`setting`) VALUES ('Leftbanner-slider','banner',@Leftbannersliderdata);

SET @Leftbannerdata = concat('{"name":"Leftbanner","banner_id":"',@leftbannerid,'","width":"282","height":"361","status":"1"}');
INSERT INTO `oc_module` (`name`,`code`,`setting`) VALUES ('Leftbanner','banner',@Leftbannerdata);


SET @catid1 = concat('{"name":"home-cat-tab","category":["',(SELECT `category_id` FROM `oc_category_description` WHERE `name`="Accessories"),'","',(SELECT `category_id` FROM `oc_category_description` WHERE `name`="Men"),'","',(SELECT `category_id` FROM `oc_category_description` WHERE `name`="Women"),'","',(SELECT `category_id` FROM `oc_category_description` WHERE `name`="Party wear"),'","',(SELECT `category_id` FROM `oc_category_description` WHERE `name`="Designers"),'"],"limit":"10","width":"278","height":"355","status":"1"}');

INSERT INTO `oc_module` (`name`,`code`,`setting`) VALUES ('home-cat-tab','ni_category_tab',@catid1);

INSERT INTO `oc_module` (`name`,`code`,`setting`) VALUES ('Home Tab','nilkanthinfoproduct_tab','{"name":"Home Tab","limit":"10","width":"271","height":"346","status":"1"}');


INSERT INTO `oc_module` (`name`,`code`,`setting`) VALUES ('Footer','nilkanthinfo_newsletter','{"name":"Footer","module_description":{"1":{"is_popup":"on","heading":"Subscribe For Newsletter","description":"Get Update &amp; Know What\'s New","image":"catalog\/Newsletter.jpg","position":"center top","repeat":"repeat"}},"status":"1"}');

INSERT INTO `oc_module` (`name`,`code`,`setting`) VALUES ('Blog','nilkanthinfo_blog','{"name":"Blog","status":"1","top":"1","config_image_blog_home_width":"358","config_image_blog_home_height":"242","config_image_blog_leftcolumn_width":"244","config_image_blog_leftcolumn_height":"150","config_image_blog_detail_width":"895","config_image_blog_detail_height":"550","config_image_blog_list_width":"895","config_image_blog_list_height":"550"}');

INSERT INTO `oc_module` (`name`,`code`,`setting`) VALUES ('Latest Blog','nilkanthinfo_latest_blog','{"name":"Latest Blog","status":"1","limit":"3"}');




-- ------------------------------
-- 8. Add Module to Layout
-- ------------------------------

DELETE FROM `oc_layout_module`;

-- 1. Home layout
-- ---------------
INSERT INTO `oc_layout_module`(`layout_id`, `code`, `position`, `sort_order`) SELECT MAX(x.layout_id) layout_id, concat('carousel.',MAX(x.module_id)),'content_bottom',1 FROM (SELECT layout_id,null as code,null as module_id,null as sort_order FROM oc_layout WHERE name='Home' UNION SELECT null as layout_id,null as code,module_id as module_id,null as sort_order from oc_module where name='Home Page' and code='carousel') as x;

INSERT INTO `oc_layout_module`(`layout_id`, `code`, `position`, `sort_order`) SELECT MAX(x.layout_id) layout_id, concat('featured.',MAX(x.module_id)),'content_top',5 FROM (SELECT layout_id,null as code,null as module_id,null as sort_order FROM oc_layout WHERE name='Home' UNION SELECT null as layout_id,null as code,module_id as module_id,null as sort_order from oc_module where name='Home Page' and code='featured') as x;

INSERT INTO `oc_layout_module`(`layout_id`, `code`, `position`, `sort_order`) SELECT MAX(x.layout_id) layout_id, concat('nilkanthinfoproduct_tab.',MAX(x.module_id)),'content_top',3 FROM (SELECT layout_id,null as code,null as module_id,null as sort_order FROM oc_layout WHERE name='Home' UNION SELECT null as layout_id,null as code,module_id as module_id,null as sort_order from oc_module where name='Home Tab' and code='nilkanthinfoproduct_tab') as x;

INSERT INTO `oc_layout_module`(`layout_id`, `code`, `position`, `sort_order`) SELECT MAX(x.layout_id) layout_id, concat('nilkanthinfo_blog.',MAX(x.module_id)),'content_top',20 FROM (SELECT layout_id,null as code,null as module_id,null as sort_order FROM oc_layout WHERE name='Home' UNION SELECT null as layout_id,null as code,module_id as module_id,null as sort_order from oc_module where name='Blog' and code='nilkanthinfo_blog') as x;

INSERT INTO `oc_layout_module`(`layout_id`, `code`, `position`, `sort_order`) SELECT MAX(x.layout_id) layout_id, concat('nilkanthinfo_cms.',MAX(x.module_id)),'content_foter1',0 FROM (SELECT layout_id,null as code,null as module_id,null as sort_order FROM oc_layout WHERE name='Home' UNION SELECT null as layout_id,null as code,module_id as module_id,null as sort_order from oc_module where name='Footer-Contacts' and code='nilkanthinfo_cms') as x;

INSERT INTO `oc_layout_module`(`layout_id`, `code`, `position`, `sort_order`) SELECT MAX(x.layout_id) layout_id, concat('nilkanthinfo_cms.',MAX(x.module_id)),'content_foter3',0 FROM (SELECT layout_id,null as code,null as module_id,null as sort_order FROM oc_layout WHERE name='Home' UNION SELECT null as layout_id,null as code,module_id as module_id,null as sort_order from oc_module where name='footerPayment_Block' AND `code`='nilkanthinfo_cms') as x;

INSERT INTO `oc_layout_module`(`layout_id`, `code`, `position`, `sort_order`) SELECT MAX(x.layout_id) layout_id, concat('nilkanthinfo_cms.',MAX(x.module_id)),'content_foter2',0 FROM (SELECT layout_id,null as code,null as module_id,null as sort_order FROM oc_layout WHERE name='Home' UNION SELECT null as layout_id,null as code,module_id as module_id,null as sort_order from oc_module where name='footerSocial' and code='nilkanthinfo_cms') as x;

INSERT INTO `oc_layout_module`(`layout_id`, `code`, `position`, `sort_order`) SELECT MAX(x.layout_id) layout_id, concat('nilkanthinfo_cms.',MAX(x.module_id)),'content_top',2 FROM (SELECT layout_id,null as code,null as module_id,null as sort_order FROM oc_layout WHERE name='Home' UNION SELECT null as layout_id,null as code,module_id as module_id,null as sort_order from oc_module where name='Home CMS' and code='nilkanthinfo_cms') as x;

INSERT INTO `oc_layout_module`(`layout_id`, `code`, `position`, `sort_order`) SELECT MAX(x.layout_id) layout_id, concat('nilkanthinfo_cms.',MAX(x.module_id)),'content_top',4 FROM (SELECT layout_id,null as code,null as module_id,null as sort_order FROM oc_layout WHERE name='Home' UNION SELECT null as layout_id,null as code,module_id as module_id,null as sort_order from oc_module where name='Tab-bottom-banner' and code='nilkanthinfo_cms') as x;

INSERT INTO `oc_layout_module`(`layout_id`, `code`, `position`, `sort_order`) SELECT MAX(x.layout_id) layout_id, concat('nilkanthinfo_newsletter.',MAX(x.module_id)),'content_footer',0 FROM (SELECT layout_id,null as code,null as module_id,null as sort_order FROM oc_layout WHERE name='Home' UNION SELECT null as layout_id,null as code,module_id as module_id,null as sort_order from oc_module where name='Footer' and code='nilkanthinfo_newsletter') as x;

INSERT INTO `oc_layout_module`(`layout_id`, `code`, `position`, `sort_order`) SELECT MAX(x.layout_id) layout_id, concat('nilkanthinfo_testimonial.',MAX(x.module_id)),'content_top',6 FROM (SELECT layout_id,null as code,null as module_id,null as sort_order FROM oc_layout WHERE name='Home' UNION SELECT null as layout_id,null as code,module_id as module_id,null as sort_order from oc_module where name='Home Testimonial' and code='nilkanthinfo_testimonial') as x;

INSERT INTO `oc_layout_module`(`layout_id`, `code`, `position`, `sort_order`) SELECT MAX(x.layout_id) layout_id, concat('ni_category_tab.',MAX(x.module_id)),'content_top',9 FROM (SELECT layout_id,null as code,null as module_id,null as sort_order FROM oc_layout WHERE name='Home' UNION SELECT null as layout_id,null as code,module_id as module_id,null as sort_order from oc_module where name='home-cat-tab' and code='ni_category_tab') as x;

INSERT INTO `oc_layout_module`(`layout_id`, `code`, `position`, `sort_order`) SELECT MAX(x.layout_id) layout_id, concat('slideshow.',MAX(x.module_id)),'content_top',1 FROM (SELECT layout_id,null as code,null as module_id,null as sort_order FROM oc_layout WHERE name='Home' UNION SELECT null as layout_id,null as code,module_id as module_id,null as sort_order from oc_module where name='Home Page' AND `code`='slideshow') as x;


-- 2. Product layout
-- ---------------

INSERT INTO `oc_layout_module`(`layout_id`, `code`, `position`, `sort_order`) SELECT MAX(x.layout_id) layout_id, concat('nilkanthinfo_cms.',MAX(x.module_id)),'content_foter2',0 FROM (SELECT layout_id,null as code,null as module_id,null as sort_order FROM oc_layout WHERE name='Product' UNION SELECT null as layout_id,null as code,module_id as module_id,null as sort_order from oc_module where name='footerSocial' and code='nilkanthinfo_cms') as x;

INSERT INTO `oc_layout_module`(`layout_id`, `code`, `position`, `sort_order`) SELECT MAX(x.layout_id) layout_id, concat('banner.',MAX(x.module_id)),'column_right',2 FROM (SELECT layout_id,null as code,null as module_id,null as sort_order FROM oc_layout WHERE name='Product' UNION SELECT null as layout_id,null as code,module_id as module_id,null as sort_order from oc_module where name='Leftbanner' and code='banner') as x;

INSERT INTO `oc_layout_module`(`layout_id`, `code`, `position`, `sort_order`) SELECT MAX(x.layout_id) layout_id, concat('nilkanthinfo_cms.',MAX(x.module_id)),'content_foter1',0 FROM (SELECT layout_id,null as code,null as module_id,null as sort_order FROM oc_layout WHERE name='Product' UNION SELECT null as layout_id,null as code,module_id as module_id,null as sort_order from oc_module where name='Footer-Contacts' and code='nilkanthinfo_cms') as x;

INSERT INTO `oc_layout_module`(`layout_id`, `code`, `position`, `sort_order`) SELECT MAX(x.layout_id) layout_id, concat('nilkanthinfo_cms.',MAX(x.module_id)),'content_foter3',0 FROM (SELECT layout_id,null as code,null as module_id,null as sort_order FROM oc_layout WHERE name='Product' UNION SELECT null as layout_id,null as code,module_id as module_id,null as sort_order from oc_module where name='footerPayment_Block' AND `code`='nilkanthinfo_cms') as x;


INSERT INTO `oc_layout_module`(`layout_id`, `code`, `position`, `sort_order`) SELECT MAX(x.layout_id) layout_id, concat('nilkanthinfo_newsletter.',MAX(x.module_id)),'content_footer',0 FROM (SELECT layout_id,null as code,null as module_id,null as sort_order FROM oc_layout WHERE name='Product' UNION SELECT null as layout_id,null as code,module_id as module_id,null as sort_order from oc_module where name='Footer' and code='nilkanthinfo_newsletter') as x;

-- 3. Category layout
-- ---------------

INSERT INTO `oc_layout_module`(`layout_id`, `code`, `position`, `sort_order`) SELECT MAX(x.layout_id) layout_id, concat('banner.',MAX(x.module_id)),'column_left',2 FROM (SELECT layout_id,null as code,null as module_id,null as sort_order FROM oc_layout WHERE name='Category' UNION SELECT null as layout_id,null as code,module_id as module_id,null as sort_order from oc_module where name='Leftbanner-slider' and code='banner') as x;

INSERT INTO `oc_layout_module`(`layout_id`, `code`, `position`, `sort_order`) SELECT MAX(x.layout_id) layout_id, 'category','column_left',1 FROM (SELECT layout_id,null as code,null as module_id,null as sort_order FROM oc_layout WHERE name='Category') as x;

INSERT INTO `oc_layout_module`(`layout_id`, `code`, `position`, `sort_order`) SELECT MAX(x.layout_id) layout_id, concat('featured.',MAX(x.module_id)),'column_left',10 FROM (SELECT layout_id,null as code,null as module_id,null as sort_order FROM oc_layout WHERE name='Category' UNION SELECT null as layout_id,null as code,module_id as module_id,null as sort_order from oc_module where name='leftcolum-featured' and code='featured') as x;

INSERT INTO `oc_layout_module`(`layout_id`, `code`, `position`, `sort_order`) SELECT MAX(x.layout_id) layout_id, 'filter','column_left',3 FROM (SELECT layout_id,null as code,null as module_id,null as sort_order FROM oc_layout WHERE name='Category') as x;

INSERT INTO `oc_layout_module`(`layout_id`, `code`, `position`, `sort_order`) SELECT MAX(x.layout_id) layout_id, concat('nilkanthinfo_cms.',MAX(x.module_id)),'content_foter1',0 FROM (SELECT layout_id,null as code,null as module_id,null as sort_order FROM oc_layout WHERE name='Category' UNION SELECT null as layout_id,null as code,module_id as module_id,null as sort_order from oc_module where name='Footer-Contacts' and code='nilkanthinfo_cms') as x;

INSERT INTO `oc_layout_module`(`layout_id`, `code`, `position`, `sort_order`) SELECT MAX(x.layout_id) layout_id, concat('nilkanthinfo_cms.',MAX(x.module_id)),'content_foter3',0 FROM (SELECT layout_id,null as code,null as module_id,null as sort_order FROM oc_layout WHERE name='Category' UNION SELECT null as layout_id,null as code,module_id as module_id,null as sort_order from oc_module where name='footerPayment_Block' AND `code`='nilkanthinfo_cms') as x;

INSERT INTO `oc_layout_module`(`layout_id`, `code`, `position`, `sort_order`) SELECT MAX(x.layout_id) layout_id, concat('nilkanthinfo_cms.',MAX(x.module_id)),'content_foter2',0 FROM (SELECT layout_id,null as code,null as module_id,null as sort_order FROM oc_layout WHERE name='Category' UNION SELECT null as layout_id,null as code,module_id as module_id,null as sort_order from oc_module where name='footerSocial' and code='nilkanthinfo_cms') as x;

INSERT INTO `oc_layout_module`(`layout_id`, `code`, `position`, `sort_order`) SELECT MAX(x.layout_id) layout_id, concat('nilkanthinfo_newsletter.',MAX(x.module_id)),'content_footer',0 FROM (SELECT layout_id,null as code,null as module_id,null as sort_order FROM oc_layout WHERE name='Category' UNION SELECT null as layout_id,null as code,module_id as module_id,null as sort_order from oc_module where name='Footer' and code='nilkanthinfo_newsletter') as x;

-- 4. Default layout
-- ---------------

INSERT INTO `oc_layout_module`(`layout_id`, `code`, `position`, `sort_order`) SELECT MAX(x.layout_id) layout_id, 'account','column_left',1 FROM (SELECT layout_id,null as code,null as module_id,null as sort_order FROM oc_layout WHERE name='Default') as x;

INSERT INTO `oc_layout_module`(`layout_id`, `code`, `position`, `sort_order`) SELECT MAX(x.layout_id) layout_id, concat('featured.',MAX(x.module_id)),'column_left',2 FROM (SELECT layout_id,null as code,null as module_id,null as sort_order FROM oc_layout WHERE name='Default' UNION SELECT null as layout_id,null as code,module_id as module_id,null as sort_order from oc_module where name='leftcolum-featured' and code='featured') as x;


INSERT INTO `oc_layout_module`(`layout_id`, `code`, `position`, `sort_order`) SELECT MAX(x.layout_id) layout_id, concat('nilkanthinfo_cms.',MAX(x.module_id)),'content_foter1',0 FROM (SELECT layout_id,null as code,null as module_id,null as sort_order FROM oc_layout WHERE name='Default' UNION SELECT null as layout_id,null as code,module_id as module_id,null as sort_order from oc_module where name='Footer-Contacts' and code='nilkanthinfo_cms') as x;

INSERT INTO `oc_layout_module`(`layout_id`, `code`, `position`, `sort_order`) SELECT MAX(x.layout_id) layout_id, concat('nilkanthinfo_cms.',MAX(x.module_id)),'content_foter3',0 FROM (SELECT layout_id,null as code,null as module_id,null as sort_order FROM oc_layout WHERE name='Default' UNION SELECT null as layout_id,null as code,module_id as module_id,null as sort_order from oc_module where name='footerPayment_Block' AND `code`='nilkanthinfo_cms') as x;


INSERT INTO `oc_layout_module`(`layout_id`, `code`, `position`, `sort_order`) SELECT MAX(x.layout_id) layout_id, concat('nilkanthinfo_cms.',MAX(x.module_id)),'content_foter2',0 FROM (SELECT layout_id,null as code,null as module_id,null as sort_order FROM oc_layout WHERE name='Default' UNION SELECT null as layout_id,null as code,module_id as module_id,null as sort_order from oc_module where name='footerSocial' and code='nilkanthinfo_cms') as x;

INSERT INTO `oc_layout_module`(`layout_id`, `code`, `position`, `sort_order`) SELECT MAX(x.layout_id) layout_id, concat('nilkanthinfo_newsletter.',MAX(x.module_id)),'content_footer',0 FROM (SELECT layout_id,null as code,null as module_id,null as sort_order FROM oc_layout WHERE name='Default' UNION SELECT null as layout_id,null as code,module_id as module_id,null as sort_order from oc_module where name='Footer' and code='nilkanthinfo_newsletter') as x;

-- 5. Manufacturer layout
-- ---------------

INSERT INTO `oc_layout_module`(`layout_id`, `code`, `position`, `sort_order`) SELECT MAX(x.layout_id) layout_id, 'account','column_left',1 FROM (SELECT layout_id,null as code,null as module_id,null as sort_order FROM oc_layout WHERE name='Manufacturer') as x;

INSERT INTO `oc_layout_module`(`layout_id`, `code`, `position`, `sort_order`) SELECT MAX(x.layout_id) layout_id, concat('featured.',MAX(x.module_id)),'column_left',2 FROM (SELECT layout_id,null as code,null as module_id,null as sort_order FROM oc_layout WHERE name='Manufacturer' UNION SELECT null as layout_id,null as code,module_id as module_id,null as sort_order from oc_module where name='leftcolum-featured' and code='featured') as x;

INSERT INTO `oc_layout_module`(`layout_id`, `code`, `position`, `sort_order`) SELECT MAX(x.layout_id) layout_id, concat('nilkanthinfo_cms.',MAX(x.module_id)),'content_foter1',0 FROM (SELECT layout_id,null as code,null as module_id,null as sort_order FROM oc_layout WHERE name='Manufacturer' UNION SELECT null as layout_id,null as code,module_id as module_id,null as sort_order from oc_module where name='Footer-Contacts' and code='nilkanthinfo_cms') as x;

INSERT INTO `oc_layout_module`(`layout_id`, `code`, `position`, `sort_order`) SELECT MAX(x.layout_id) layout_id, concat('nilkanthinfo_cms.',MAX(x.module_id)),'content_foter3',0 FROM (SELECT layout_id,null as code,null as module_id,null as sort_order FROM oc_layout WHERE name='Manufacturer' UNION SELECT null as layout_id,null as code,module_id as module_id,null as sort_order from oc_module where name='footerPayment_Block' AND `code`='nilkanthinfo_cms') as x;

INSERT INTO `oc_layout_module`(`layout_id`, `code`, `position`, `sort_order`) SELECT MAX(x.layout_id) layout_id, concat('nilkanthinfo_cms.',MAX(x.module_id)),'content_foter2',0 FROM (SELECT layout_id,null as code,null as module_id,null as sort_order FROM oc_layout WHERE name='Manufacturer' UNION SELECT null as layout_id,null as code,module_id as module_id,null as sort_order from oc_module where name='footerSocial' and code='nilkanthinfo_cms') as x;

INSERT INTO `oc_layout_module`(`layout_id`, `code`, `position`, `sort_order`) SELECT MAX(x.layout_id) layout_id, concat('nilkanthinfo_newsletter.',MAX(x.module_id)),'content_footer',0 FROM (SELECT layout_id,null as code,null as module_id,null as sort_order FROM oc_layout WHERE name='Manufacturer' UNION SELECT null as layout_id,null as code,module_id as module_id,null as sort_order from oc_module where name='Footer' and code='nilkanthinfo_newsletter') as x;

-- 6. Account layout
-- ---------------

INSERT INTO `oc_layout_module`(`layout_id`, `code`, `position`, `sort_order`) SELECT MAX(x.layout_id) layout_id, 'account','column_top',1 FROM (SELECT layout_id,null as code,null as module_id,null as sort_order FROM oc_layout WHERE name='Account') as x;

INSERT INTO `oc_layout_module`(`layout_id`, `code`, `position`, `sort_order`) SELECT MAX(x.layout_id) layout_id, concat('featured.',MAX(x.module_id)),'column_left',10 FROM (SELECT layout_id,null as code,null as module_id,null as sort_order FROM oc_layout WHERE name='Account' UNION SELECT null as layout_id,null as code,module_id as module_id,null as sort_order from oc_module where name='leftcolum-featured' and code='featured') as x;

INSERT INTO `oc_layout_module`(`layout_id`, `code`, `position`, `sort_order`) SELECT MAX(x.layout_id) layout_id, concat('nilkanthinfo_cms.',MAX(x.module_id)),'content_foter1',0 FROM (SELECT layout_id,null as code,null as module_id,null as sort_order FROM oc_layout WHERE name='Account' UNION SELECT null as layout_id,null as code,module_id as module_id,null as sort_order from oc_module where name='Footer-Contacts' and code='nilkanthinfo_cms') as x;

INSERT INTO `oc_layout_module`(`layout_id`, `code`, `position`, `sort_order`) SELECT MAX(x.layout_id) layout_id, concat('nilkanthinfo_cms.',MAX(x.module_id)),'content_foter3',0 FROM (SELECT layout_id,null as code,null as module_id,null as sort_order FROM oc_layout WHERE name='Account' UNION SELECT null as layout_id,null as code,module_id as module_id,null as sort_order from oc_module where name='footerPayment_Block' AND `code`='nilkanthinfo_cms') as x;

INSERT INTO `oc_layout_module`(`layout_id`, `code`, `position`, `sort_order`) SELECT MAX(x.layout_id) layout_id, concat('nilkanthinfo_cms.',MAX(x.module_id)),'content_foter2',0 FROM (SELECT layout_id,null as code,null as module_id,null as sort_order FROM oc_layout WHERE name='Account' UNION SELECT null as layout_id,null as code,module_id as module_id,null as sort_order from oc_module where name='footerSocial' and code='nilkanthinfo_cms') as x;

INSERT INTO `oc_layout_module`(`layout_id`, `code`, `position`, `sort_order`) SELECT MAX(x.layout_id) layout_id, concat('nilkanthinfo_newsletter.',MAX(x.module_id)),'content_footer',0 FROM (SELECT layout_id,null as code,null as module_id,null as sort_order FROM oc_layout WHERE name='Account' UNION SELECT null as layout_id,null as code,module_id as module_id,null as sort_order from oc_module where name='Footer' and code='nilkanthinfo_newsletter') as x;

-- 7. Checkout layout
-- ---------------

INSERT INTO `oc_layout_module`(`layout_id`, `code`, `position`, `sort_order`) SELECT MAX(x.layout_id) layout_id, 'account','column_left',1 FROM (SELECT layout_id,null as code,null as module_id,null as sort_order FROM oc_layout WHERE name='Checkout') as x;

INSERT INTO `oc_layout_module`(`layout_id`, `code`, `position`, `sort_order`) SELECT MAX(x.layout_id) layout_id, concat('featured.',MAX(x.module_id)),'column_left',2 FROM (SELECT layout_id,null as code,null as module_id,null as sort_order FROM oc_layout WHERE name='Checkout' UNION SELECT null as layout_id,null as code,module_id as module_id,null as sort_order from oc_module where name='leftcolum-featured' and code='featured') as x;

INSERT INTO `oc_layout_module`(`layout_id`, `code`, `position`, `sort_order`) SELECT MAX(x.layout_id) layout_id, concat('nilkanthinfo_cms.',MAX(x.module_id)),'content_foter1',0 FROM (SELECT layout_id,null as code,null as module_id,null as sort_order FROM oc_layout WHERE name='Checkout' UNION SELECT null as layout_id,null as code,module_id as module_id,null as sort_order from oc_module where name='Footer-Contacts' and code='nilkanthinfo_cms') as x;

INSERT INTO `oc_layout_module`(`layout_id`, `code`, `position`, `sort_order`) SELECT MAX(x.layout_id) layout_id, concat('nilkanthinfo_cms.',MAX(x.module_id)),'content_foter3',0 FROM (SELECT layout_id,null as code,null as module_id,null as sort_order FROM oc_layout WHERE name='Checkout' UNION SELECT null as layout_id,null as code,module_id as module_id,null as sort_order from oc_module where name='footerPayment_Block' AND `code`='nilkanthinfo_cms') as x;

INSERT INTO `oc_layout_module`(`layout_id`, `code`, `position`, `sort_order`) SELECT MAX(x.layout_id) layout_id, concat('nilkanthinfo_cms.',MAX(x.module_id)),'content_foter2',0 FROM (SELECT layout_id,null as code,null as module_id,null as sort_order FROM oc_layout WHERE name='Checkout' UNION SELECT null as layout_id,null as code,module_id as module_id,null as sort_order from oc_module where name='footerSocial' and code='nilkanthinfo_cms') as x;

INSERT INTO `oc_layout_module`(`layout_id`, `code`, `position`, `sort_order`) SELECT MAX(x.layout_id) layout_id, concat('nilkanthinfo_newsletter.',MAX(x.module_id)),'content_footer',0 FROM (SELECT layout_id,null as code,null as module_id,null as sort_order FROM oc_layout WHERE name='Checkout' UNION SELECT null as layout_id,null as code,module_id as module_id,null as sort_order from oc_module where name='Footer' and code='nilkanthinfo_newsletter') as x;

-- 8. Contact layout
-- ---------------

INSERT INTO `oc_layout_module`(`layout_id`, `code`, `position`, `sort_order`) SELECT MAX(x.layout_id) layout_id, 'account','column_left',1 FROM (SELECT layout_id,null as code,null as module_id,null as sort_order FROM oc_layout WHERE name='Contact') as x;

INSERT INTO `oc_layout_module`(`layout_id`, `code`, `position`, `sort_order`) SELECT MAX(x.layout_id) layout_id, concat('featured.',MAX(x.module_id)),'column_left',2 FROM (SELECT layout_id,null as code,null as module_id,null as sort_order FROM oc_layout WHERE name='Contact' UNION SELECT null as layout_id,null as code,module_id as module_id,null as sort_order from oc_module where name='leftcolum-featured' and code='featured') as x;

INSERT INTO `oc_layout_module`(`layout_id`, `code`, `position`, `sort_order`) SELECT MAX(x.layout_id) layout_id, concat('nilkanthinfo_cms.',MAX(x.module_id)),'content_foter1',0 FROM (SELECT layout_id,null as code,null as module_id,null as sort_order FROM oc_layout WHERE name='Contact' UNION SELECT null as layout_id,null as code,module_id as module_id,null as sort_order from oc_module where name='Footer-Contacts' and code='nilkanthinfo_cms') as x;

INSERT INTO `oc_layout_module`(`layout_id`, `code`, `position`, `sort_order`) SELECT MAX(x.layout_id) layout_id, concat('nilkanthinfo_cms.',MAX(x.module_id)),'content_foter3',0 FROM (SELECT layout_id,null as code,null as module_id,null as sort_order FROM oc_layout WHERE name='Contact' UNION SELECT null as layout_id,null as code,module_id as module_id,null as sort_order from oc_module where name='footerPayment_Block' AND `code`='nilkanthinfo_cms') as x;

INSERT INTO `oc_layout_module`(`layout_id`, `code`, `position`, `sort_order`) SELECT MAX(x.layout_id) layout_id, concat('nilkanthinfo_cms.',MAX(x.module_id)),'content_foter2',0 FROM (SELECT layout_id,null as code,null as module_id,null as sort_order FROM oc_layout WHERE name='Contact' UNION SELECT null as layout_id,null as code,module_id as module_id,null as sort_order from oc_module where name='footerSocial' and code='nilkanthinfo_cms') as x;

INSERT INTO `oc_layout_module`(`layout_id`, `code`, `position`, `sort_order`) SELECT MAX(x.layout_id) layout_id, concat('nilkanthinfo_newsletter.',MAX(x.module_id)),'content_footer',0 FROM (SELECT layout_id,null as code,null as module_id,null as sort_order FROM oc_layout WHERE name='Contact' UNION SELECT null as layout_id,null as code,module_id as module_id,null as sort_order from oc_module where name='Footer' and code='nilkanthinfo_newsletter') as x;

-- 9. Sitemap layout
-- ---------------

INSERT INTO `oc_layout_module`(`layout_id`, `code`, `position`, `sort_order`) SELECT MAX(x.layout_id) layout_id, 'account','column_left',1 FROM (SELECT layout_id,null as code,null as module_id,null as sort_order FROM oc_layout WHERE name='Sitemap') as x;

INSERT INTO `oc_layout_module`(`layout_id`, `code`, `position`, `sort_order`) SELECT MAX(x.layout_id) layout_id, concat('featured.',MAX(x.module_id)),'column_left',2 FROM (SELECT layout_id,null as code,null as module_id,null as sort_order FROM oc_layout WHERE name='Sitemap' UNION SELECT null as layout_id,null as code,module_id as module_id,null as sort_order from oc_module where name='leftcolum-featured' and code='featured') as x;

INSERT INTO `oc_layout_module`(`layout_id`, `code`, `position`, `sort_order`) SELECT MAX(x.layout_id) layout_id, concat('nilkanthinfo_cms.',MAX(x.module_id)),'content_foter1',0 FROM (SELECT layout_id,null as code,null as module_id,null as sort_order FROM oc_layout WHERE name='Sitemap' UNION SELECT null as layout_id,null as code,module_id as module_id,null as sort_order from oc_module where name='Footer-Contacts' and code='nilkanthinfo_cms') as x;

INSERT INTO `oc_layout_module`(`layout_id`, `code`, `position`, `sort_order`) SELECT MAX(x.layout_id) layout_id, concat('nilkanthinfo_cms.',MAX(x.module_id)),'content_foter3',0 FROM (SELECT layout_id,null as code,null as module_id,null as sort_order FROM oc_layout WHERE name='Sitemap' UNION SELECT null as layout_id,null as code,module_id as module_id,null as sort_order from oc_module where name='footerPayment_Block' AND `code`='nilkanthinfo_cms') as x;

INSERT INTO `oc_layout_module`(`layout_id`, `code`, `position`, `sort_order`) SELECT MAX(x.layout_id) layout_id, concat('nilkanthinfo_cms.',MAX(x.module_id)),'content_foter2',0 FROM (SELECT layout_id,null as code,null as module_id,null as sort_order FROM oc_layout WHERE name='Sitemap' UNION SELECT null as layout_id,null as code,module_id as module_id,null as sort_order from oc_module where name='footerSocial' and code='nilkanthinfo_cms') as x;

INSERT INTO `oc_layout_module`(`layout_id`, `code`, `position`, `sort_order`) SELECT MAX(x.layout_id) layout_id, concat('nilkanthinfo_newsletter.',MAX(x.module_id)),'content_footer',0 FROM (SELECT layout_id,null as code,null as module_id,null as sort_order FROM oc_layout WHERE name='Sitemap' UNION SELECT null as layout_id,null as code,module_id as module_id,null as sort_order from oc_module where name='Footer' and code='nilkanthinfo_newsletter') as x;

-- 10. Affiliate layout
-- ---------------

INSERT INTO `oc_layout_module`(`layout_id`, `code`, `position`, `sort_order`) SELECT MAX(x.layout_id) layout_id, 'account','column_left',1 FROM (SELECT layout_id,null as code,null as module_id,null as sort_order FROM oc_layout WHERE name='Affiliate') as x;

INSERT INTO `oc_layout_module`(`layout_id`, `code`, `position`, `sort_order`) SELECT MAX(x.layout_id) layout_id, concat('featured.',MAX(x.module_id)),'column_left',10 FROM (SELECT layout_id,null as code,null as module_id,null as sort_order FROM oc_layout WHERE name='Affiliate' UNION SELECT null as layout_id,null as code,module_id as module_id,null as sort_order from oc_module where name='leftcolum-featured' and code='featured') as x;

INSERT INTO `oc_layout_module`(`layout_id`, `code`, `position`, `sort_order`) SELECT MAX(x.layout_id) layout_id, concat('nilkanthinfo_cms.',MAX(x.module_id)),'content_foter1',0 FROM (SELECT layout_id,null as code,null as module_id,null as sort_order FROM oc_layout WHERE name='Affiliate' UNION SELECT null as layout_id,null as code,module_id as module_id,null as sort_order from oc_module where name='Footer-Contacts' and code='nilkanthinfo_cms') as x;

INSERT INTO `oc_layout_module`(`layout_id`, `code`, `position`, `sort_order`) SELECT MAX(x.layout_id) layout_id, concat('nilkanthinfo_cms.',MAX(x.module_id)),'content_foter3',0 FROM (SELECT layout_id,null as code,null as module_id,null as sort_order FROM oc_layout WHERE name='Affiliate' UNION SELECT null as layout_id,null as code,module_id as module_id,null as sort_order from oc_module where name='footerPayment_Block' AND `code`='nilkanthinfo_cms') as x;

INSERT INTO `oc_layout_module`(`layout_id`, `code`, `position`, `sort_order`) SELECT MAX(x.layout_id) layout_id, concat('nilkanthinfo_cms.',MAX(x.module_id)),'content_foter2',0 FROM (SELECT layout_id,null as code,null as module_id,null as sort_order FROM oc_layout WHERE name='Affiliate' UNION SELECT null as layout_id,null as code,module_id as module_id,null as sort_order from oc_module where name='footerSocial' and code='nilkanthinfo_cms') as x;

INSERT INTO `oc_layout_module`(`layout_id`, `code`, `position`, `sort_order`) SELECT MAX(x.layout_id) layout_id, concat('nilkanthinfo_newsletter.',MAX(x.module_id)),'content_footer',0 FROM (SELECT layout_id,null as code,null as module_id,null as sort_order FROM oc_layout WHERE name='Affiliate' UNION SELECT null as layout_id,null as code,module_id as module_id,null as sort_order from oc_module where name='Footer' and code='nilkanthinfo_newsletter') as x;

-- 11. Information layout
-- ---------------

INSERT INTO `oc_layout_module`(`layout_id`, `code`, `position`, `sort_order`) SELECT MAX(x.layout_id) layout_id, 'account','column_left',1 FROM (SELECT layout_id,null as code,null as module_id,null as sort_order FROM oc_layout WHERE name='Information') as x;

INSERT INTO `oc_layout_module`(`layout_id`, `code`, `position`, `sort_order`) SELECT MAX(x.layout_id) layout_id, concat('featured.',MAX(x.module_id)),'column_left',2 FROM (SELECT layout_id,null as code,null as module_id,null as sort_order FROM oc_layout WHERE name='Information' UNION SELECT null as layout_id,null as code,module_id as module_id,null as sort_order from oc_module where name='leftcolum-featured' and code='featured') as x;

INSERT INTO `oc_layout_module`(`layout_id`, `code`, `position`, `sort_order`) SELECT MAX(x.layout_id) layout_id, concat('nilkanthinfo_cms.',MAX(x.module_id)),'content_foter1',0 FROM (SELECT layout_id,null as code,null as module_id,null as sort_order FROM oc_layout WHERE name='Information' UNION SELECT null as layout_id,null as code,module_id as module_id,null as sort_order from oc_module where name='Footer-Contacts' and code='nilkanthinfo_cms') as x;

INSERT INTO `oc_layout_module`(`layout_id`, `code`, `position`, `sort_order`) SELECT MAX(x.layout_id) layout_id, concat('nilkanthinfo_cms.',MAX(x.module_id)),'content_foter3',0 FROM (SELECT layout_id,null as code,null as module_id,null as sort_order FROM oc_layout WHERE name='Information' UNION SELECT null as layout_id,null as code,module_id as module_id,null as sort_order from oc_module where name='footerPayment_Block' AND `code`='nilkanthinfo_cms') as x;

INSERT INTO `oc_layout_module`(`layout_id`, `code`, `position`, `sort_order`) SELECT MAX(x.layout_id) layout_id, concat('nilkanthinfo_cms.',MAX(x.module_id)),'content_foter2',0 FROM (SELECT layout_id,null as code,null as module_id,null as sort_order FROM oc_layout WHERE name='Information' UNION SELECT null as layout_id,null as code,module_id as module_id,null as sort_order from oc_module where name='footerSocial' and code='nilkanthinfo_cms') as x;

INSERT INTO `oc_layout_module`(`layout_id`, `code`, `position`, `sort_order`) SELECT MAX(x.layout_id) layout_id, concat('nilkanthinfo_newsletter.',MAX(x.module_id)),'content_footer',0 FROM (SELECT layout_id,null as code,null as module_id,null as sort_order FROM oc_layout WHERE name='Information' UNION SELECT null as layout_id,null as code,module_id as module_id,null as sort_order from oc_module where name='Footer' and code='nilkanthinfo_newsletter') as x;

-- 12. Compare layout
-- ---------------

INSERT INTO `oc_layout_module`(`layout_id`, `code`, `position`, `sort_order`) SELECT MAX(x.layout_id) layout_id, 'account','column_left',1 FROM (SELECT layout_id,null as code,null as module_id,null as sort_order FROM oc_layout WHERE name='Compare') as x;

INSERT INTO `oc_layout_module`(`layout_id`, `code`, `position`, `sort_order`) SELECT MAX(x.layout_id) layout_id, concat('featured.',MAX(x.module_id)),'column_left',2 FROM (SELECT layout_id,null as code,null as module_id,null as sort_order FROM oc_layout WHERE name='Compare' UNION SELECT null as layout_id,null as code,module_id as module_id,null as sort_order from oc_module where name='leftcolum-featured' and code='featured') as x;

INSERT INTO `oc_layout_module`(`layout_id`, `code`, `position`, `sort_order`) SELECT MAX(x.layout_id) layout_id, concat('nilkanthinfo_cms.',MAX(x.module_id)),'content_foter1',0 FROM (SELECT layout_id,null as code,null as module_id,null as sort_order FROM oc_layout WHERE name='Compare' UNION SELECT null as layout_id,null as code,module_id as module_id,null as sort_order from oc_module where name='Footer-Contacts' and code='nilkanthinfo_cms') as x;

INSERT INTO `oc_layout_module`(`layout_id`, `code`, `position`, `sort_order`) SELECT MAX(x.layout_id) layout_id, concat('nilkanthinfo_cms.',MAX(x.module_id)),'content_foter3',0 FROM (SELECT layout_id,null as code,null as module_id,null as sort_order FROM oc_layout WHERE name='Compare' UNION SELECT null as layout_id,null as code,module_id as module_id,null as sort_order from oc_module where name='footerPayment_Block' AND `code`='nilkanthinfo_cms') as x;

INSERT INTO `oc_layout_module`(`layout_id`, `code`, `position`, `sort_order`) SELECT MAX(x.layout_id) layout_id, concat('nilkanthinfo_cms.',MAX(x.module_id)),'content_foter2',0 FROM (SELECT layout_id,null as code,null as module_id,null as sort_order FROM oc_layout WHERE name='Compare' UNION SELECT null as layout_id,null as code,module_id as module_id,null as sort_order from oc_module where name='footerSocial' and code='nilkanthinfo_cms') as x;

INSERT INTO `oc_layout_module`(`layout_id`, `code`, `position`, `sort_order`) SELECT MAX(x.layout_id) layout_id, concat('nilkanthinfo_newsletter.',MAX(x.module_id)),'content_footer',0 FROM (SELECT layout_id,null as code,null as module_id,null as sort_order FROM oc_layout WHERE name='Compare' UNION SELECT null as layout_id,null as code,module_id as module_id,null as sort_order from oc_module where name='Footer' and code='nilkanthinfo_newsletter') as x;

-- 13. Search layout
-- ---------------

INSERT INTO `oc_layout_module`(`layout_id`, `code`, `position`, `sort_order`) SELECT MAX(x.layout_id) layout_id, concat('featured.',MAX(x.module_id)),'column_left',1 FROM (SELECT layout_id,null as code,null as module_id,null as sort_order FROM oc_layout WHERE name='Search' UNION SELECT null as layout_id,null as code,module_id as module_id,null as sort_order from oc_module where name='leftcolum-featured' and code='featured') as x;

INSERT INTO `oc_layout_module`(`layout_id`, `code`, `position`, `sort_order`) SELECT MAX(x.layout_id) layout_id, concat('nilkanthinfo_cms.',MAX(x.module_id)),'content_foter1',0 FROM (SELECT layout_id,null as code,null as module_id,null as sort_order FROM oc_layout WHERE name='Search' UNION SELECT null as layout_id,null as code,module_id as module_id,null as sort_order from oc_module where name='Footer-Contacts' and code='nilkanthinfo_cms') as x;

INSERT INTO `oc_layout_module`(`layout_id`, `code`, `position`, `sort_order`) SELECT MAX(x.layout_id) layout_id, concat('nilkanthinfo_cms.',MAX(x.module_id)),'content_foter3',0 FROM (SELECT layout_id,null as code,null as module_id,null as sort_order FROM oc_layout WHERE name='Search' UNION SELECT null as layout_id,null as code,module_id as module_id,null as sort_order from oc_module where name='footerPayment_Block' AND `code`='nilkanthinfo_cms') as x;

INSERT INTO `oc_layout_module`(`layout_id`, `code`, `position`, `sort_order`) SELECT MAX(x.layout_id) layout_id, concat('nilkanthinfo_cms.',MAX(x.module_id)),'content_foter2',0 FROM (SELECT layout_id,null as code,null as module_id,null as sort_order FROM oc_layout WHERE name='Search' UNION SELECT null as layout_id,null as code,module_id as module_id,null as sort_order from oc_module where name='footerSocial' and code='nilkanthinfo_cms') as x;

INSERT INTO `oc_layout_module`(`layout_id`, `code`, `position`, `sort_order`) SELECT MAX(x.layout_id) layout_id, concat('nilkanthinfo_newsletter.',MAX(x.module_id)),'content_footer',0 FROM (SELECT layout_id,null as code,null as module_id,null as sort_order FROM oc_layout WHERE name='Search' UNION SELECT null as layout_id,null as code,module_id as module_id,null as sort_order from oc_module where name='Footer' and code='nilkanthinfo_newsletter') as x;

-- 16. Single Blog layout
-- ---------------

INSERT INTO `oc_layout_module`(`layout_id`, `code`, `position`, `sort_order`) SELECT MAX(x.layout_id) layout_id, concat('featured.',MAX(x.module_id)),'column_left',2 FROM (SELECT layout_id,null as code,null as module_id,null as sort_order FROM oc_layout WHERE name='Single Blog' UNION SELECT null as layout_id,null as code,module_id as module_id,null as sort_order from oc_module where name='leftcolum-featured' and code='featured') as x;

INSERT INTO `oc_layout_module`(`layout_id`, `code`, `position`, `sort_order`) SELECT MAX(x.layout_id) layout_id, concat('nilkanthinfo_cms.',MAX(x.module_id)),'content_foter1',0 FROM (SELECT layout_id,null as code,null as module_id,null as sort_order FROM oc_layout WHERE name='Single Blog' UNION SELECT null as layout_id,null as code,module_id as module_id,null as sort_order from oc_module where name='Footer-Contacts' and code='nilkanthinfo_cms') as x;

INSERT INTO `oc_layout_module`(`layout_id`, `code`, `position`, `sort_order`) SELECT MAX(x.layout_id) layout_id, concat('nilkanthinfo_cms.',MAX(x.module_id)),'content_foter3',0 FROM (SELECT layout_id,null as code,null as module_id,null as sort_order FROM oc_layout WHERE name='Single Blog' UNION SELECT null as layout_id,null as code,module_id as module_id,null as sort_order from oc_module where name='footerPayment_Block' AND `code`='nilkanthinfo_cms') as x;

INSERT INTO `oc_layout_module`(`layout_id`, `code`, `position`, `sort_order`) SELECT MAX(x.layout_id) layout_id, concat('nilkanthinfo_cms.',MAX(x.module_id)),'content_foter2',0 FROM (SELECT layout_id,null as code,null as module_id,null as sort_order FROM oc_layout WHERE name='Single Blog' UNION SELECT null as layout_id,null as code,module_id as module_id,null as sort_order from oc_module where name='footerSocial' and code='nilkanthinfo_cms') as x;

INSERT INTO `oc_layout_module`(`layout_id`, `code`, `position`, `sort_order`) SELECT MAX(x.layout_id) layout_id, concat('nilkanthinfo_latest_blog.',MAX(x.module_id)),'column_left',1 FROM (SELECT layout_id,null as code,null as module_id,null as sort_order FROM oc_layout WHERE name='Single Blog' UNION SELECT null as layout_id,null as code,module_id as module_id,null as sort_order from oc_module where name='Latest Blog' and code='nilkanthinfo_latest_blog') as x;

INSERT INTO `oc_layout_module`(`layout_id`, `code`, `position`, `sort_order`) SELECT MAX(x.layout_id) layout_id, concat('nilkanthinfo_newsletter.',MAX(x.module_id)),'content_footer',0 FROM (SELECT layout_id,null as code,null as module_id,null as sort_order FROM oc_layout WHERE name='Single Blog' UNION SELECT null as layout_id,null as code,module_id as module_id,null as sort_order from oc_module where name='Footer' and code='nilkanthinfo_newsletter') as x;

-- 15. All Blog layout
-- ---------------

INSERT INTO `oc_layout_module`(`layout_id`, `code`, `position`, `sort_order`) SELECT MAX(x.layout_id) layout_id, concat('featured.',MAX(x.module_id)),'column_left',2 FROM (SELECT layout_id,null as code,null as module_id,null as sort_order FROM oc_layout WHERE name='All Blog' UNION SELECT null as layout_id,null as code,module_id as module_id,null as sort_order from oc_module where name='leftcolum-featured' and code='featured') as x;

INSERT INTO `oc_layout_module`(`layout_id`, `code`, `position`, `sort_order`) SELECT MAX(x.layout_id) layout_id, concat('nilkanthinfo_cms.',MAX(x.module_id)),'content_foter1',0 FROM (SELECT layout_id,null as code,null as module_id,null as sort_order FROM oc_layout WHERE name='All Blog' UNION SELECT null as layout_id,null as code,module_id as module_id,null as sort_order from oc_module where name='Footer-Contacts' and code='nilkanthinfo_cms') as x;

INSERT INTO `oc_layout_module`(`layout_id`, `code`, `position`, `sort_order`) SELECT MAX(x.layout_id) layout_id, concat('nilkanthinfo_cms.',MAX(x.module_id)),'content_foter3',0 FROM (SELECT layout_id,null as code,null as module_id,null as sort_order FROM oc_layout WHERE name='All Blog' UNION SELECT null as layout_id,null as code,module_id as module_id,null as sort_order from oc_module where name='footerPayment_Block' AND `code`='nilkanthinfo_cms') as x;

INSERT INTO `oc_layout_module`(`layout_id`, `code`, `position`, `sort_order`) SELECT MAX(x.layout_id) layout_id, concat('nilkanthinfo_cms.',MAX(x.module_id)),'content_foter2',0 FROM (SELECT layout_id,null as code,null as module_id,null as sort_order FROM oc_layout WHERE name='Single Blog' UNION SELECT null as layout_id,null as code,module_id as module_id,null as sort_order from oc_module where name='footerSocial' and code='nilkanthinfo_cms') as x;


INSERT INTO `oc_layout_module`(`layout_id`, `code`, `position`, `sort_order`) SELECT MAX(x.layout_id) layout_id, concat('nilkanthinfo_latest_blog.',MAX(x.module_id)),'column_left',1 FROM (SELECT layout_id,null as code,null as module_id,null as sort_order FROM oc_layout WHERE name='All Blog' UNION SELECT null as layout_id,null as code,module_id as module_id,null as sort_order from oc_module where name='Latest Blog' and code='nilkanthinfo_latest_blog') as x;

INSERT INTO `oc_layout_module`(`layout_id`, `code`, `position`, `sort_order`) SELECT MAX(x.layout_id) layout_id, concat('nilkanthinfo_newsletter.',MAX(x.module_id)),'content_footer',0 FROM (SELECT layout_id,null as code,null as module_id,null as sort_order FROM oc_layout WHERE name='All Blog' UNION SELECT null as layout_id,null as code,module_id as module_id,null as sort_order from oc_module where name='Footer' and code='nilkanthinfo_newsletter') as x;

-- ------------------------------
-- 9. Add Layout Route
-- ------------------------------

DELETE FROM `oc_layout_route` WHERE `route` IN('nilkanthinfo/nilkanthinfo_singleblog','nilkanthinfo/nilkanthinfo_allblog');

INSERT INTO `oc_layout_route` (`layout_id`,`store_id`,`route`) SELECT MAX(x.layout_id),0,'nilkanthinfo/nilkanthinfo_singleblog' FROM (SELECT `layout_id` FROM `oc_layout` WHERE `name`='Single Blog') as x;

INSERT INTO `oc_layout_route` (`layout_id`,`store_id`,`route`) SELECT MAX(x.layout_id),0,'nilkanthinfo/nilkanthinfo_allblog' FROM (SELECT `layout_id` FROM `oc_layout` WHERE `name`='All Blog') as x;

-- ------------------------------
-- 10. Add Nilkanthinfo Blog Entries
-- ------------------------------

DROP TABLE IF EXISTS `oc_nilkanthinfo_blog`;
DROP TABLE IF EXISTS `oc_nilkanthinfo_blog_description`;
DROP TABLE IF EXISTS `oc_nilkanthinfo_blog_comment`;
DROP TABLE IF EXISTS `oc_nilkanthinfo_blog_comment_description`;

CREATE TABLE IF NOT EXISTS `oc_nilkanthinfo_blog` (`blog_id` int(11) NOT NULL AUTO_INCREMENT,`image` varchar(256) COLLATE utf8_general_ci NULL,`published_date` datetime COLLATE utf8_bin DEFAULT NULL,`status` tinyint(1) COLLATE utf8_bin DEFAULT NULL,`sort_order` int(11) COLLATE utf8_bin DEFAULT NULL,`viewed` int(15) COLLATE utf8_bin DEFAULT NULL,PRIMARY KEY (`blog_id`) ) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `oc_nilkanthinfo_blog_description` ( `blog_description_id` int(11) NOT NULL AUTO_INCREMENT,`blog_id` int(11) NOT NULL ,`language_id` int(11) NOT NULL , `blog_name` varchar(96) COLLATE utf8_bin DEFAULT NULL,`description` text COLLATE utf8_bin DEFAULT NULL,`meta_tag_description` varchar(255) COLLATE utf8_bin DEFAULT NULL,`meta_tag_keyword` varchar(255) COLLATE utf8_bin DEFAULT NULL, `tags` text COLLATE utf8_bin DEFAULT NULL,`author` varchar(255) COLLATE utf8_bin DEFAULT NULL,`keyword` text COLLATE utf8_bin DEFAULT NULL,PRIMARY KEY (`blog_description_id`)) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `oc_nilkanthinfo_blog_comment` ( `comment_id` int(11) NOT NULL AUTO_INCREMENT,`blog_id` int(11) COLLATE utf8_bin DEFAULT NULL, `created` datetime COLLATE utf8_bin DEFAULT NULL,`email_id` text COLLATE utf8_bin DEFAULT NULL,`status` tinyint(1) COLLATE utf8_bin DEFAULT NULL,PRIMARY KEY (`comment_id`) ) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `oc_nilkanthinfo_blog_comment_description` ( `comment_description_id` int(11) NOT NULL AUTO_INCREMENT,`language_id` int(11) NOT NULL ,`comment_id` int(11) COLLATE utf8_bin DEFAULT NULL,`comment` text COLLATE utf8_bin DEFAULT NULL,`user` varchar(255) COLLATE utf8_bin DEFAULT NULL,PRIMARY KEY (`comment_description_id`)) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

INSERT INTO `oc_nilkanthinfo_blog` (`image`,`published_date`,`status`,`sort_order`,`viewed`) VALUES ('catalog/Blogimage.jpg',NOW(),1,0,0);
SET @blogid = LAST_INSERT_ID();

INSERT INTO `oc_nilkanthinfo_blog_description` (`blog_id`,`language_id`,`blog_name`,`description`,`meta_tag_description`,`meta_tag_keyword`,`tags`,`author`,`keyword`) VALUES (@blogid,1,'Winter Fashion 2016','&lt;p&gt;All the Lorem Ipsum treatise on of ethics, very popular duringAll the 
Lorem Ipsum treatise on of ethics, very popular duringAll the Lorem 
Ipsum treatise on of ethics, very popular duringAll the Lorem Ipsum 
treatise on of ethics, very popular duringAll the Lorem Ipsum treatise 
on of ethics, very popular duringAll the Lorem Ipsum treatise on of 
ethics, very popular duringAll the Lorem Ipsum treatise on of ethics, 
very popular duringAll the Lorem Ipsum treatise on of ethics, very 
popular duringAll the Lorem Ipsum treatise on of ethics, very popular 
duringAll the Lorem Ipsum treatise on of ethics, very popular during &lt;/p&gt;','Winter Fashion 2016','Winter Fashion 2016','Winter Fashion 2016','Gavin','Winter Fashion 2016');

INSERT INTO `oc_nilkanthinfo_blog_comment` (`blog_id`,`created`,`email_id`,`status`) VALUES (@blogid,NOW(),'yourname@gmail.com',1);
SET @commentid = LAST_INSERT_ID();

INSERT INTO `oc_nilkanthinfo_blog_comment_description` (`language_id`,`comment_id`,`comment`,`user`) VALUES (1,@commentid,'opular duringAll the Lorem Ipsum treatise on of ethics, opular duringAll the Lorem Ipsum treatise on of ethics, very popular duringAll the Lorem Ipsum treatise on of ethics, very popular duringAll the Lo','User1');

INSERT INTO `oc_nilkanthinfo_blog` (`image`,`published_date`,`status`,`sort_order`,`viewed`) VALUES ('catalog/Blogimage.jpg',NOW(),1,0,0);
SET @blogid = LAST_INSERT_ID();

INSERT INTO `oc_nilkanthinfo_blog_description` (`blog_id`,`language_id`,`blog_name`,`description`,`meta_tag_description`,`meta_tag_keyword`,`tags`,`author`,`keyword`) VALUES (@blogid,1,'Monsoon Fashion 2016','&lt;p&gt;All the Lorem Ipsum treatise on of ethics, very popular duringAll the 
Lorem Ipsum treatise on of ethics, very popular duringAll the Lorem 
Ipsum treatise on of ethics, very popular duringAll the Lorem Ipsum 
treatise on of ethics, very popular duringAll the Lorem Ipsum treatise 
on of ethics, very popular duringAll the Lorem Ipsum treatise on of 
ethics, very popular duringAll the Lorem Ipsum treatise on of ethics, 
very popular duringAll the Lorem Ipsum treatise on of ethics, very 
popular duringAll the Lorem Ipsum treatise on of ethics, very popular 
duringAll the Lorem Ipsum treatise on of ethics, very popular during &lt;/p&gt;','Monsoon Fashion 2016','Monsoon Fashion 2016','Monsoon Fashion 2016','Mary','Monsoon Fashion 2016');

INSERT INTO `oc_nilkanthinfo_blog` (`image`,`published_date`,`status`,`sort_order`,`viewed`) VALUES ('catalog/Blogimage.jpg',NOW(),1,0,0);
SET @blogid = LAST_INSERT_ID();

INSERT INTO `oc_nilkanthinfo_blog_description` (`blog_id`,`language_id`,`blog_name`,`description`,`meta_tag_description`,`meta_tag_keyword`,`tags`,`author`,`keyword`) VALUES (@blogid,1,'Summer Fashion 2016','&lt;p&gt;All the Lorem Ipsum treatise on of ethics, very popular duringAll the 
Lorem Ipsum treatise on of ethics, very popular duringAll the Lorem 
Ipsum treatise on of ethics, very popular duringAll the Lorem Ipsum 
treatise on of ethics, very popular duringAll the Lorem Ipsum treatise 
on of ethics, very popular duringAll the Lorem Ipsum treatise on of 
ethics, very popular duringAll the Lorem Ipsum treatise on of ethics, 
very popular duringAll the Lorem Ipsum treatise on of ethics, very 
popular duringAll the Lorem Ipsum treatise on of ethics, very popular 
duringAll the Lorem Ipsum treatise on of ethics, very popular during &lt;/p&gt;','Summer Fashion 2016','Summer Fashion 2016','Summer Fashion 2016','Mary','Summer Fashion 2016');

INSERT INTO `oc_nilkanthinfo_blog` (`image`,`published_date`,`status`,`sort_order`,`viewed`) VALUES ('catalog/Blogimage.jpg',NOW(),1,0,0);
SET @blogid = LAST_INSERT_ID();

INSERT INTO `oc_nilkanthinfo_blog_description` (`blog_id`,`language_id`,`blog_name`,`description`,`meta_tag_description`,`meta_tag_keyword`,`tags`,`author`,`keyword`) VALUES (@blogid,1,'Summer Spring Fashion 2016','&lt;p&gt;All the Lorem Ipsum treatise on of ethics, very popular duringAll the 
Lorem Ipsum treatise on of ethics, very popular duringAll the Lorem 
Ipsum treatise on of ethics, very popular duringAll the Lorem Ipsum 
treatise on of ethics, very popular duringAll the Lorem Ipsum treatise 
on of ethics, very popular duringAll the Lorem Ipsum treatise on of 
ethics, very popular duringAll the Lorem Ipsum treatise on of ethics, 
very popular duringAll the Lorem Ipsum treatise on of ethics, very 
popular duringAll the Lorem Ipsum treatise on of ethics, very popular 
duringAll the Lorem Ipsum treatise on of ethics, very popular during &lt;/p&gt;','Summer Spring Fashion 2016','Summer Spring Fashion 2016','Summer Spring Fashion 2016','Jhon','Summer Spring Fashion 2016');

INSERT INTO `oc_nilkanthinfo_blog` (`image`,`published_date`,`status`,`sort_order`,`viewed`) VALUES ('catalog/Blogimage.jpg',NOW(),1,0,0);
SET @blogid = LAST_INSERT_ID();

INSERT INTO `oc_nilkanthinfo_blog_description` (`blog_id`,`language_id`,`blog_name`,`description`,`meta_tag_description`,`meta_tag_keyword`,`tags`,`author`,`keyword`) VALUES (@blogid,1,'Spring Fashion 2016','&lt;p&gt;All the Lorem Ipsum treatise on of ethics, very popular duringAll the 
Lorem Ipsum treatise on of ethics, very popular duringAll the Lorem 
Ipsum treatise on of ethics, very popular duringAll the Lorem Ipsum 
treatise on of ethics, very popular duringAll the Lorem Ipsum treatise 
on of ethics, very popular duringAll the Lorem Ipsum treatise on of 
ethics, very popular duringAll the Lorem Ipsum treatise on of ethics, 
very popular duringAll the Lorem Ipsum treatise on of ethics, very 
popular duringAll the Lorem Ipsum treatise on of ethics, very popular 
duringAll the Lorem Ipsum treatise on of ethics, very popular during &lt;/p&gt;','Spring Fashion 2016','Spring Fashion 2016','Spring Fashion 2016','Gabriel','Spring Fashion 2016');

-- ------------------------------
-- 11. Add Newsletter
-- ------------------------------

CREATE TABLE IF NOT EXISTS `oc_nilkanthinfo_newsletter` (`nilkanthinfo_newsletter_id` int(11) NOT NULL AUTO_INCREMENT,`email` varchar(96) COLLATE utf8_bin DEFAULT NULL,`status` int(1) NOT NULL DEFAULT '0',PRIMARY KEY (`nilkanthinfo_newsletter_id`)) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- ------------------------------
-- 15. Add Order
-- ------------------------------

DELETE FROM `oc_order`;
DELETE FROM `oc_order_history`;
DELETE FROM `oc_order_product`;

INSERT INTO `oc_order` (`invoice_no`,`invoice_prefix`,`store_id`,`store_name`,`store_url`,`customer_id`,`customer_group_id`,`firstname`,`lastname`,`email`,`telephone`,`payment_firstname`,`payment_lastname`,`payment_address_1`,`payment_city`,`payment_postcode`,`payment_country`,`payment_country_id`,`payment_zone`,`payment_zone_id`,`payment_custom_field`,`payment_method`,`payment_code`,`shipping_firstname`,`shipping_lastname`,`shipping_address_1`,`shipping_city`,`shipping_postcode`,`shipping_country`,`shipping_country_id`,`shipping_zone`,`shipping_zone_id`,`shipping_custom_field`,`shipping_method`,`shipping_code`,`total`,`order_status_id`,`affiliate_id`,`commission`,`marketing_id`,`language_id`,`currency_id`,`currency_code`) VALUES (0,'INV-2013-00',0,'Default Store','',1,1,'ABC','ABC','yourname@gmail.com','','ABC','ABC','ABC','ABC','admin','Tuvalu',218,'Nui',3420,'[]','Cash On Delivery','cod','ABC','ABC','ABC','ABC','admin','Tuvalu',218,'Nui',3420,'[]','Flat Shipping Rate','flat.flat',4805.0000,1,0,0,0,1,2,'USD');
SET @orderid = LAST_INSERT_ID();

INSERT INTO `oc_order_history` (`order_id`,`order_status_id`,`notify`,`date_added`) VALUES (@orderid,1,0,NOW());

INSERT INTO `oc_order_product` (`order_id`,`product_id`,`name`,`model`,`quantity`,`price`,`total`,`tax`,`reward`) VALUES (@orderid,28,'Crossed Shirt - Beluga','Product 1',1,100.000,100,0,0);

INSERT INTO `oc_order` (`invoice_no`,`invoice_prefix`,`store_id`,`store_name`,`store_url`,`customer_id`,`customer_group_id`,`firstname`,`lastname`,`email`,`telephone`,`payment_firstname`,`payment_lastname`,`payment_address_1`,`payment_city`,`payment_postcode`,`payment_country`,`payment_country_id`,`payment_zone`,`payment_zone_id`,`payment_custom_field`,`payment_method`,`payment_code`,`shipping_firstname`,`shipping_lastname`,`shipping_address_1`,`shipping_city`,`shipping_postcode`,`shipping_country`,`shipping_country_id`,`shipping_zone`,`shipping_zone_id`,`shipping_custom_field`,`shipping_method`,`shipping_code`,`total`,`order_status_id`,`affiliate_id`,`commission`,`marketing_id`,`language_id`,`currency_id`,`currency_code`) VALUES (0,'INV-2013-00',0,'Default Store','',1,1,'ABC','ABC','yourname@gmail.com','','ABC','ABC','ABC','ABC','admin','Tuvalu',218,'Nui',3420,'[]','Cash On Delivery','cod','ABC','ABC','ABC','ABC','admin','Tuvalu',218,'Nui',3420,'[]','Flat Shipping Rate','flat.flat',4805.0000,1,0,0,0,1,2,'USD');
SET @orderid = LAST_INSERT_ID();

INSERT INTO `oc_order_history` (`order_id`,`order_status_id`,`notify`,`date_added`) VALUES (@orderid,1,0,NOW());

INSERT INTO `oc_order_product` (`order_id`,`product_id`,`name`,`model`,`quantity`,`price`,`total`,`tax`,`reward`) VALUES (@orderid,40,'Farlap Shirt','product 11',1,100.000,100,0,0);


-- ------------------------------
-- 13. Add Product Related
-- ------------------------------

DELETE FROM `oc_product_related`;


INSERT INTO `oc_product_related` (`product_id`,`related_id`) VALUES (28,28);
INSERT INTO `oc_product_related` (`product_id`,`related_id`) VALUES (28,31);
INSERT INTO `oc_product_related` (`product_id`,`related_id`) VALUES (28,34);
INSERT INTO `oc_product_related` (`product_id`,`related_id`) VALUES (28,40);
INSERT INTO `oc_product_related` (`product_id`,`related_id`) VALUES (28,44);
INSERT INTO `oc_product_related` (`product_id`,`related_id`) VALUES (28,45);
INSERT INTO `oc_product_related` (`product_id`,`related_id`) VALUES (28,46);
INSERT INTO `oc_product_related` (`product_id`,`related_id`) VALUES (28,47);

INSERT INTO `oc_product_related` (`product_id`,`related_id`) VALUES (29,34);
INSERT INTO `oc_product_related` (`product_id`,`related_id`) VALUES (29,35);
INSERT INTO `oc_product_related` (`product_id`,`related_id`) VALUES (29,36);
INSERT INTO `oc_product_related` (`product_id`,`related_id`) VALUES (29,40);


INSERT INTO `oc_product_related` (`product_id`,`related_id`) VALUES (30,30); 
INSERT INTO `oc_product_related` (`product_id`,`related_id`) VALUES (30,35);
INSERT INTO `oc_product_related` (`product_id`,`related_id`) VALUES (30,36);
INSERT INTO `oc_product_related` (`product_id`,`related_id`) VALUES (30,40);
INSERT INTO `oc_product_related` (`product_id`,`related_id`) VALUES (30,42);
INSERT INTO `oc_product_related` (`product_id`,`related_id`) VALUES (30,45); 


INSERT INTO `oc_product_related` (`product_id`,`related_id`) VALUES (31,28);       
INSERT INTO `oc_product_related` (`product_id`,`related_id`) VALUES (31,33);       
INSERT INTO `oc_product_related` (`product_id`,`related_id`) VALUES (31,35);       
INSERT INTO `oc_product_related` (`product_id`,`related_id`) VALUES (31,36);       
INSERT INTO `oc_product_related` (`product_id`,`related_id`) VALUES (31,40);       
INSERT INTO `oc_product_related` (`product_id`,`related_id`) VALUES (31,42);       
INSERT INTO `oc_product_related` (`product_id`,`related_id`) VALUES (31,49);

INSERT INTO `oc_product_related` (`product_id`,`related_id`) VALUES (32,35);       
INSERT INTO `oc_product_related` (`product_id`,`related_id`) VALUES (32,36);       
INSERT INTO `oc_product_related` (`product_id`,`related_id`) VALUES (32,41);       
INSERT INTO `oc_product_related` (`product_id`,`related_id`) VALUES (32,43);       

-- ------------------------------
-- 14. Add Product Review
-- ------------------------------

DELETE FROM `oc_review`;


INSERT INTO `oc_review` (`product_id`,`customer_id`,`author`,`text`,`rating`,`status`,`date_added`,`date_modified`)  VALUES (42,0,'Gabriel','The best collection of website templates online with live real store experience.',4,1,NOW(),NOW()),(30,0,'Grace','Awesome eCommerce templates for your online store with live real store experience.',2,1,NOW(),NOW()),(31,0,'Tessa','Templates with wonderful Awesome support and with satisfaction.',3,1,NOW(),NOW()),(29,0,'Thomas','The best collection of website templates online with best functionality with live real store experience.',5,1,NOW(),NOW());

-- ------------------------------
-- 15. Add Testimonial
-- ------------------------------

DROP TABLE IF EXISTS `oc_testimonial`;
DROP TABLE IF EXISTS `oc_testimonial_description`;

CREATE TABLE IF NOT EXISTS `oc_testimonial` ( `testimonial_id` int(11) NOT NULL AUTO_INCREMENT,`name` varchar(64) COLLATE utf8_bin NOT NULL, `image` varchar(256) COLLATE utf8_general_ci NULL,`city` varchar(64) COLLATE utf8_bin DEFAULT NULL,`email` varchar(96) COLLATE utf8_bin DEFAULT NULL,`status` int(1) NOT NULL DEFAULT '0', `rating` int(1) NOT NULL DEFAULT '0', `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',PRIMARY KEY (`testimonial_id`)) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `oc_testimonial_description` ( `testimonial_id` int(11) NOT NULL,`language_id` int(11) NOT NULL, `title` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '', `description` text COLLATE utf8_unicode_ci NOT NULL,PRIMARY KEY (`testimonial_id`,`language_id`)) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


INSERT INTO `oc_testimonial` (`name`,`image`,`city`,`email`,`status`,`rating`,`date_added`) VALUES ('Thomas','catalog/testimonial.jpg','Turky','thomas@gmail.com',1,3,NOW());
SET @testimonialid = LAST_INSERT_ID();
INSERT INTO `oc_testimonial_description` (`testimonial_id`,`language_id`,`title`,`description`) VALUES (@testimonialid,1,'Thomas','<p>The best collection of website templates online with best functionality with live real store experience. </p>');


INSERT INTO `oc_testimonial` (`name`,`image`,`city`,`email`,`status`,`rating`,`date_added`) VALUES ('Tessa','catalog/testimonial.jpg','Paris','tessa@gmail.com',1,3,NOW());
SET @testimonialid = LAST_INSERT_ID();
INSERT INTO `oc_testimonial_description` (`testimonial_id`,`language_id`,`title`,`description`) VALUES (@testimonialid,1,'Tessa','<p>TemplateManiacs offers web templates designed and developed by their highly experienced professional experts. </p>');


INSERT INTO `oc_testimonial` (`name`,`image`,`city`,`email`,`status`,`rating`,`date_added`) VALUES ('Grace','catalog/testimonial.jpg','London','grace@gmail.com',1,3,NOW());
SET @testimonialid = LAST_INSERT_ID();
INSERT INTO `oc_testimonial_description` (`testimonial_id`,`language_id`,`title`,`description`) VALUES (@testimonialid,1,'Grace','<p>Awesome eCommerce templates for your online store with live real store experience. </p>');


INSERT INTO `oc_testimonial` (`name`,`image`,`city`,`email`,`status`,`rating`,`date_added`) VALUES ('Grayson','catalog/testimonial.jpg','Fiji','fiji@gmail.com',1,3,NOW());
SET @testimonialid = LAST_INSERT_ID();
INSERT INTO `oc_testimonial_description` (`testimonial_id`,`language_id`,`title`,`description`) VALUES (@testimonialid,1,'Grayson','<p>Templates with wonderful Awesome support and with satisfaction. </p>');


-- ------------------------------
-- 16. Add Permission
-- ------------------------------


UPDATE `oc_user_group` SET `permission`='{"access":["analytics\/google_analytics","captcha\/basic_captcha","captcha\/google_captcha","catalog\/attribute","catalog\/attribute_group","catalog\/category","catalog\/download","catalog\/filter","catalog\/information","catalog\/manufacturer","catalog\/option","catalog\/product","catalog\/recurring","catalog\/review","common\/column_left","common\/filemanager","common\/menu","common\/profile","common\/stats","customer\/custom_field","customer\/customer","customer\/customer_group","design\/banner","design\/language","design\/layout","design\/theme","extension\/analytics","extension\/captcha","extension\/feed","extension\/fraud","extension\/installer","extension\/modification","extension\/module","extension\/openbay","extension\/payment","extension\/shipping","extension\/theme","extension\/total","feed\/google_base","feed\/google_sitemap","feed\/openbaypro","fraud\/fraudlabspro","fraud\/ip","fraud\/maxmind","localisation\/country","localisation\/currency","localisation\/geo_zone","localisation\/language","localisation\/length_class","localisation\/location","localisation\/order_status","localisation\/return_action","localisation\/return_reason","localisation\/return_status","localisation\/stock_status","localisation\/tax_class","localisation\/tax_rate","localisation\/weight_class","localisation\/zone","marketing\/affiliate","marketing\/contact","marketing\/coupon","marketing\/marketing","module\/account","module\/affiliate","module\/amazon_login","module\/amazon_pay","module\/banner","module\/bestseller","module\/carousel","module\/category","module\/ebay_listing","module\/featured","module\/filter","module\/google_hangouts","module\/html","module\/information","module\/latest","module\/ni_category_tab","module\/nilkanthinfo_blog","module\/nilkanthinfo_cms","module\/nilkanthinfo_latest_blog","module\/nilkanthinfo_newsletter","module\/nilkanthinfo_testimonial","module\/nilkanthinfoproduct_tab","module\/pp_button","module\/pp_login","module\/sagepay_direct_cards","module\/sagepay_server_cards","module\/slideshow","module\/special","module\/store","nilkanthinfo\/ni_blog","nilkanthinfo\/ni_blog_comment","nilkanthinfo\/ni_setting","nilkanthinfo\/nilkanthinfo_newsletter","nilkanthinfo\/nilkanthinfo_testimonial","openbay\/amazon","openbay\/amazon_listing","openbay\/amazon_product","openbay\/amazonus","openbay\/amazonus_listing","openbay\/amazonus_product","openbay\/ebay","openbay\/ebay_profile","openbay\/ebay_template","openbay\/etsy","openbay\/etsy_product","openbay\/etsy_shipping","openbay\/etsy_shop","payment\/amazon_login_pay","payment\/authorizenet_aim","payment\/authorizenet_sim","payment\/bank_transfer","payment\/bluepay_hosted","payment\/bluepay_redirect","payment\/cheque","payment\/cod","payment\/eway","payment\/firstdata","payment\/firstdata_remote","payment\/free_checkout","payment\/g2apay","payment\/globalpay","payment\/globalpay_remote","payment\/klarna_account","payment\/klarna_invoice","payment\/liqpay","payment\/nochex","payment\/paymate","payment\/paypoint","payment\/payza","payment\/perpetual_payments","payment\/pp_express","payment\/pp_payflow","payment\/pp_payflow_iframe","payment\/pp_pro","payment\/pp_pro_iframe","payment\/pp_standard","payment\/realex","payment\/realex_remote","payment\/sagepay_direct","payment\/sagepay_server","payment\/sagepay_us","payment\/securetrading_pp","payment\/securetrading_ws","payment\/skrill","payment\/twocheckout","payment\/web_payment_software","payment\/worldpay","report\/affiliate","report\/affiliate_activity","report\/affiliate_login","report\/customer_activity","report\/customer_credit","report\/customer_login","report\/customer_online","report\/customer_order","report\/customer_reward","report\/marketing","report\/product_purchased","report\/product_viewed","report\/sale_coupon","report\/sale_order","report\/sale_return","report\/sale_shipping","report\/sale_tax","sale\/order","sale\/recurring","sale\/return","sale\/voucher","sale\/voucher_theme","setting\/setting","setting\/store","shipping\/auspost","shipping\/citylink","shipping\/fedex","shipping\/flat","shipping\/free","shipping\/item","shipping\/parcelforce_48","shipping\/pickup","shipping\/royal_mail","shipping\/ups","shipping\/usps","shipping\/weight","startup\/error","startup\/event","startup\/login","startup\/permission","startup\/router","startup\/sass","theme\/theme_default","tool\/backup","tool\/error_log","tool\/upload","total\/coupon","total\/credit","total\/handling","total\/klarna_fee","total\/low_order_fee","total\/reward","total\/shipping","total\/sub_total","total\/tax","total\/total","total\/voucher","user\/api","user\/user","user\/user_permission"],"modify":["analytics\/google_analytics","captcha\/basic_captcha","captcha\/google_captcha","catalog\/attribute","catalog\/attribute_group","catalog\/category","catalog\/download","catalog\/filter","catalog\/information","catalog\/manufacturer","catalog\/option","catalog\/product","catalog\/recurring","catalog\/review","common\/column_left","common\/filemanager","common\/menu","common\/profile","common\/stats","customer\/custom_field","customer\/customer","customer\/customer_group","design\/banner","design\/language","design\/layout","design\/theme","extension\/analytics","extension\/captcha","extension\/feed","extension\/fraud","extension\/installer","extension\/modification","extension\/module","extension\/openbay","extension\/payment","extension\/shipping","extension\/theme","extension\/total","feed\/google_base","feed\/google_sitemap","feed\/openbaypro","fraud\/fraudlabspro","fraud\/ip","fraud\/maxmind","localisation\/country","localisation\/currency","localisation\/geo_zone","localisation\/language","localisation\/length_class","localisation\/location","localisation\/order_status","localisation\/return_action","localisation\/return_reason","localisation\/return_status","localisation\/stock_status","localisation\/tax_class","localisation\/tax_rate","localisation\/weight_class","localisation\/zone","marketing\/affiliate","marketing\/contact","marketing\/coupon","marketing\/marketing","module\/account","module\/affiliate","module\/amazon_login","module\/amazon_pay","module\/banner","module\/bestseller","module\/carousel","module\/category","module\/ebay_listing","module\/featured","module\/filter","module\/google_hangouts","module\/html","module\/information","module\/latest","module\/ni_category_tab","module\/nilkanthinfo_blog","module\/nilkanthinfo_cms","module\/nilkanthinfo_latest_blog","module\/nilkanthinfo_newsletter","module\/nilkanthinfo_testimonial","module\/nilkanthinfoproduct_tab","module\/pp_button","module\/pp_login","module\/sagepay_direct_cards","module\/sagepay_server_cards","module\/slideshow","module\/special","module\/store","nilkanthinfo\/ni_blog","nilkanthinfo\/ni_blog_comment","nilkanthinfo\/ni_setting","nilkanthinfo\/nilkanthinfo_newsletter","nilkanthinfo\/nilkanthinfo_testimonial","openbay\/amazon","openbay\/amazon_listing","openbay\/amazon_product","openbay\/amazonus","openbay\/amazonus_listing","openbay\/amazonus_product","openbay\/ebay","openbay\/ebay_profile","openbay\/ebay_template","openbay\/etsy","openbay\/etsy_product","openbay\/etsy_shipping","openbay\/etsy_shop","payment\/amazon_login_pay","payment\/authorizenet_aim","payment\/authorizenet_sim","payment\/bank_transfer","payment\/bluepay_hosted","payment\/bluepay_redirect","payment\/cheque","payment\/cod","payment\/eway","payment\/firstdata","payment\/firstdata_remote","payment\/free_checkout","payment\/g2apay","payment\/globalpay","payment\/globalpay_remote","payment\/klarna_account","payment\/klarna_invoice","payment\/liqpay","payment\/nochex","payment\/paymate","payment\/paypoint","payment\/payza","payment\/perpetual_payments","payment\/pp_express","payment\/pp_payflow","payment\/pp_payflow_iframe","payment\/pp_pro","payment\/pp_pro_iframe","payment\/pp_standard","payment\/realex","payment\/realex_remote","payment\/sagepay_direct","payment\/sagepay_server","payment\/sagepay_us","payment\/securetrading_pp","payment\/securetrading_ws","payment\/skrill","payment\/twocheckout","payment\/web_payment_software","payment\/worldpay","report\/affiliate","report\/affiliate_activity","report\/affiliate_login","report\/customer_activity","report\/customer_credit","report\/customer_login","report\/customer_online","report\/customer_order","report\/customer_reward","report\/marketing","report\/product_purchased","report\/product_viewed","report\/sale_coupon","report\/sale_order","report\/sale_return","report\/sale_shipping","report\/sale_tax","sale\/order","sale\/recurring","sale\/return","sale\/voucher","sale\/voucher_theme","setting\/setting","setting\/store","shipping\/auspost","shipping\/citylink","shipping\/fedex","shipping\/flat","shipping\/free","shipping\/item","shipping\/parcelforce_48","shipping\/pickup","shipping\/royal_mail","shipping\/ups","shipping\/usps","shipping\/weight","startup\/error","startup\/event","startup\/login","startup\/permission","startup\/router","startup\/sass","theme\/theme_default","tool\/backup","tool\/error_log","tool\/upload","total\/coupon","total\/credit","total\/handling","total\/klarna_fee","total\/low_order_fee","total\/reward","total\/shipping","total\/sub_total","total\/tax","total\/total","total\/voucher","user\/api","user\/user","user\/user_permission"]}' WHERE `name`='Administrator';
       

