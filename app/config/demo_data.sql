-- ============================================================================
-- Event Booking - DEMO DATA (events, ticket prices, bookings, discount codes)
-- Direct import (phpMyAdmin / mysql). Table prefix: eventbooking_
-- Uses id range 9100-9499 so it will not collide with real data.
-- Events link to your EXISTING categories by name (Music, Sports,
-- Business & Tech, Arts & Theatre, Food & Drink) - no duplicate categories.
-- Re-runnable: clears its own previous rows (and the demo voucher codes) first.
-- ============================================================================
SET NAMES utf8;
SET FOREIGN_KEY_CHECKS=0;

-- --- Clean previous demo run ------------------------------------------------
DELETE FROM `eventbooking_plugin_base_multi_lang` WHERE `model`='pjEvent' AND `foreign_id` BETWEEN 9100 AND 9199;
DELETE FROM `eventbooking_events` WHERE `id` BETWEEN 9100 AND 9199;
DELETE FROM `eventbooking_plugin_base_multi_lang` WHERE `model`='pjPrice' AND `foreign_id` BETWEEN 9200 AND 9299;
DELETE FROM `eventbooking_prices` WHERE `id` BETWEEN 9200 AND 9299;
DELETE FROM `eventbooking_bookings_tickets` WHERE `booking_id` BETWEEN 9300 AND 9399;
DELETE FROM `eventbooking_bookings_details` WHERE `booking_id` BETWEEN 9300 AND 9399;
DELETE FROM `eventbooking_bookings` WHERE `id` BETWEEN 9300 AND 9399;
DELETE FROM `eventbooking_vouchers_events` WHERE `voucher_id` IN (SELECT `id` FROM (SELECT `id` FROM `eventbooking_vouchers` WHERE `code` IN ('WELCOME10','VIP20','SUMMER15','SAVE5') OR `id` BETWEEN 9400 AND 9499) t);
DELETE FROM `eventbooking_vouchers` WHERE `code` IN ('WELCOME10','VIP20','SUMMER15','SAVE5') OR `id` BETWEEN 9400 AND 9499;

-- --- Events + ticket prices -------------------------------------------------
INSERT INTO `eventbooking_events` (`id`,`recurring_id`,`category_id`,`event_start_ts`,`event_end_ts`,`event_img`,`event_thumb`,`event_medium`,`o_show_start_time`,`o_show_end_time`,`ticket_img`,`status`) VALUES (9101, MD5(CONCAT('demo-',9101)), (SELECT `foreign_id` FROM `eventbooking_plugin_base_multi_lang` WHERE `model`='pjCategory' AND `field`='name' AND `content`='Music' LIMIT 1), UNIX_TIMESTAMP('2026-08-15 19:00:00'), UNIX_TIMESTAMP('2026-08-15 22:00:00'), NULL, NULL, NULL, 'T','T', NULL, 'T');
INSERT INTO `eventbooking_plugin_base_multi_lang` (`id`,`foreign_id`,`model`,`locale`,`field`,`content`,`source`)
SELECT NULL, 9101, 'pjEvent', l.`id`, 'title', 'Summer Jazz Festival', 'data' FROM `eventbooking_plugin_base_locale` l;
INSERT INTO `eventbooking_plugin_base_multi_lang` (`id`,`foreign_id`,`model`,`locale`,`field`,`content`,`source`)
SELECT NULL, 9101, 'pjEvent', l.`id`, 'description', 'An unforgettable open-air evening with world-class jazz musicians, food trucks and a sunset view over the lake.', 'data' FROM `eventbooking_plugin_base_locale` l;
INSERT INTO `eventbooking_plugin_base_multi_lang` (`id`,`foreign_id`,`model`,`locale`,`field`,`content`,`source`)
SELECT NULL, 9101, 'pjEvent', l.`id`, 'location', 'City Park Amphitheatre, Main Stage', 'data' FROM `eventbooking_plugin_base_locale` l;
INSERT INTO `eventbooking_plugin_base_multi_lang` (`id`,`foreign_id`,`model`,`locale`,`field`,`content`,`source`)
SELECT NULL, 9101, 'pjEvent', l.`id`, 'terms_body', 'Tickets are non-refundable. Please arrive 30 minutes before the show. No professional cameras allowed.', 'data' FROM `eventbooking_plugin_base_locale` l;
INSERT INTO `eventbooking_plugin_base_multi_lang` (`id`,`foreign_id`,`model`,`locale`,`field`,`content`,`source`)
SELECT NULL, 9101, 'pjEvent', l.`id`, 'ticket_info', '{Name}, your {Ticket} for {EventTitle} on {EventDateTime}. Please show this ticket at the entrance.', 'data' FROM `eventbooking_plugin_base_locale` l;
INSERT INTO `eventbooking_prices` (`id`,`event_id`,`recurring`,`price`,`available`) VALUES (9201,9101, MD5(CONCAT('demo-price-',9201)), 35.00, 250);
INSERT INTO `eventbooking_plugin_base_multi_lang` (`id`,`foreign_id`,`model`,`locale`,`field`,`content`,`source`)
SELECT NULL, 9201, 'pjPrice', l.`id`, 'name', 'General Admission', 'data' FROM `eventbooking_plugin_base_locale` l;
INSERT INTO `eventbooking_prices` (`id`,`event_id`,`recurring`,`price`,`available`) VALUES (9202,9101, MD5(CONCAT('demo-price-',9202)), 75.00, 50);
INSERT INTO `eventbooking_plugin_base_multi_lang` (`id`,`foreign_id`,`model`,`locale`,`field`,`content`,`source`)
SELECT NULL, 9202, 'pjPrice', l.`id`, 'name', 'VIP Lounge', 'data' FROM `eventbooking_plugin_base_locale` l;

INSERT INTO `eventbooking_events` (`id`,`recurring_id`,`category_id`,`event_start_ts`,`event_end_ts`,`event_img`,`event_thumb`,`event_medium`,`o_show_start_time`,`o_show_end_time`,`ticket_img`,`status`) VALUES (9102, MD5(CONCAT('demo-',9102)), (SELECT `foreign_id` FROM `eventbooking_plugin_base_multi_lang` WHERE `model`='pjCategory' AND `field`='name' AND `content`='Music' LIMIT 1), UNIX_TIMESTAMP('2026-09-05 20:00:00'), UNIX_TIMESTAMP('2026-09-05 23:30:00'), NULL, NULL, NULL, 'T','T', NULL, 'T');
INSERT INTO `eventbooking_plugin_base_multi_lang` (`id`,`foreign_id`,`model`,`locale`,`field`,`content`,`source`)
SELECT NULL, 9102, 'pjEvent', l.`id`, 'title', 'Indie Rock Night', 'data' FROM `eventbooking_plugin_base_locale` l;
INSERT INTO `eventbooking_plugin_base_multi_lang` (`id`,`foreign_id`,`model`,`locale`,`field`,`content`,`source`)
SELECT NULL, 9102, 'pjEvent', l.`id`, 'description', 'Four rising indie bands, one electric night. Doors open at 19:30. Bar available all evening.', 'data' FROM `eventbooking_plugin_base_locale` l;
INSERT INTO `eventbooking_plugin_base_multi_lang` (`id`,`foreign_id`,`model`,`locale`,`field`,`content`,`source`)
SELECT NULL, 9102, 'pjEvent', l.`id`, 'location', 'The Warehouse Club', 'data' FROM `eventbooking_plugin_base_locale` l;
INSERT INTO `eventbooking_plugin_base_multi_lang` (`id`,`foreign_id`,`model`,`locale`,`field`,`content`,`source`)
SELECT NULL, 9102, 'pjEvent', l.`id`, 'terms_body', '18+ event, valid ID required.', 'data' FROM `eventbooking_plugin_base_locale` l;
INSERT INTO `eventbooking_prices` (`id`,`event_id`,`recurring`,`price`,`available`) VALUES (9203,9102, MD5(CONCAT('demo-price-',9203)), 35.00, 250);
INSERT INTO `eventbooking_plugin_base_multi_lang` (`id`,`foreign_id`,`model`,`locale`,`field`,`content`,`source`)
SELECT NULL, 9203, 'pjPrice', l.`id`, 'name', 'General Admission', 'data' FROM `eventbooking_plugin_base_locale` l;
INSERT INTO `eventbooking_prices` (`id`,`event_id`,`recurring`,`price`,`available`) VALUES (9204,9102, MD5(CONCAT('demo-price-',9204)), 75.00, 50);
INSERT INTO `eventbooking_plugin_base_multi_lang` (`id`,`foreign_id`,`model`,`locale`,`field`,`content`,`source`)
SELECT NULL, 9204, 'pjPrice', l.`id`, 'name', 'VIP Lounge', 'data' FROM `eventbooking_plugin_base_locale` l;

INSERT INTO `eventbooking_events` (`id`,`recurring_id`,`category_id`,`event_start_ts`,`event_end_ts`,`event_img`,`event_thumb`,`event_medium`,`o_show_start_time`,`o_show_end_time`,`ticket_img`,`status`) VALUES (9103, MD5(CONCAT('demo-',9103)), (SELECT `foreign_id` FROM `eventbooking_plugin_base_multi_lang` WHERE `model`='pjCategory' AND `field`='name' AND `content`='Music' LIMIT 1), UNIX_TIMESTAMP('2026-06-20 18:30:00'), UNIX_TIMESTAMP('2026-06-20 21:00:00'), NULL, NULL, NULL, 'T','T', NULL, 'T');
INSERT INTO `eventbooking_plugin_base_multi_lang` (`id`,`foreign_id`,`model`,`locale`,`field`,`content`,`source`)
SELECT NULL, 9103, 'pjEvent', l.`id`, 'title', 'Classical Evening: Strings & Piano', 'data' FROM `eventbooking_plugin_base_locale` l;
INSERT INTO `eventbooking_plugin_base_multi_lang` (`id`,`foreign_id`,`model`,`locale`,`field`,`content`,`source`)
SELECT NULL, 9103, 'pjEvent', l.`id`, 'description', 'A refined programme of Chopin, Debussy and Vivaldi performed by the National Chamber Orchestra.', 'data' FROM `eventbooking_plugin_base_locale` l;
INSERT INTO `eventbooking_plugin_base_multi_lang` (`id`,`foreign_id`,`model`,`locale`,`field`,`content`,`source`)
SELECT NULL, 9103, 'pjEvent', l.`id`, 'location', 'Grand Concert Hall', 'data' FROM `eventbooking_plugin_base_locale` l;
INSERT INTO `eventbooking_prices` (`id`,`event_id`,`recurring`,`price`,`available`) VALUES (9205,9103, MD5(CONCAT('demo-price-',9205)), 35.00, 250);
INSERT INTO `eventbooking_plugin_base_multi_lang` (`id`,`foreign_id`,`model`,`locale`,`field`,`content`,`source`)
SELECT NULL, 9205, 'pjPrice', l.`id`, 'name', 'General Admission', 'data' FROM `eventbooking_plugin_base_locale` l;
INSERT INTO `eventbooking_prices` (`id`,`event_id`,`recurring`,`price`,`available`) VALUES (9206,9103, MD5(CONCAT('demo-price-',9206)), 75.00, 50);
INSERT INTO `eventbooking_plugin_base_multi_lang` (`id`,`foreign_id`,`model`,`locale`,`field`,`content`,`source`)
SELECT NULL, 9206, 'pjPrice', l.`id`, 'name', 'VIP Lounge', 'data' FROM `eventbooking_plugin_base_locale` l;

INSERT INTO `eventbooking_events` (`id`,`recurring_id`,`category_id`,`event_start_ts`,`event_end_ts`,`event_img`,`event_thumb`,`event_medium`,`o_show_start_time`,`o_show_end_time`,`ticket_img`,`status`) VALUES (9104, MD5(CONCAT('demo-',9104)), (SELECT `foreign_id` FROM `eventbooking_plugin_base_multi_lang` WHERE `model`='pjCategory' AND `field`='name' AND `content`='Sports' LIMIT 1), UNIX_TIMESTAMP('2026-10-11 06:00:00'), UNIX_TIMESTAMP('2026-10-11 12:00:00'), NULL, NULL, NULL, 'T','T', NULL, 'T');
INSERT INTO `eventbooking_plugin_base_multi_lang` (`id`,`foreign_id`,`model`,`locale`,`field`,`content`,`source`)
SELECT NULL, 9104, 'pjEvent', l.`id`, 'title', 'City Marathon 2026', 'data' FROM `eventbooking_plugin_base_locale` l;
INSERT INTO `eventbooking_plugin_base_multi_lang` (`id`,`foreign_id`,`model`,`locale`,`field`,`content`,`source`)
SELECT NULL, 9104, 'pjEvent', l.`id`, 'description', 'Run the full marathon, half marathon or 10K through the heart of the city. Includes medal and finisher pack.', 'data' FROM `eventbooking_plugin_base_locale` l;
INSERT INTO `eventbooking_plugin_base_multi_lang` (`id`,`foreign_id`,`model`,`locale`,`field`,`content`,`source`)
SELECT NULL, 9104, 'pjEvent', l.`id`, 'location', 'Downtown - Riverside Start Line', 'data' FROM `eventbooking_plugin_base_locale` l;
INSERT INTO `eventbooking_plugin_base_multi_lang` (`id`,`foreign_id`,`model`,`locale`,`field`,`content`,`source`)
SELECT NULL, 9104, 'pjEvent', l.`id`, 'terms_body', 'Participants run at their own risk. A signed health declaration is required at check-in.', 'data' FROM `eventbooking_plugin_base_locale` l;
INSERT INTO `eventbooking_prices` (`id`,`event_id`,`recurring`,`price`,`available`) VALUES (9207,9104, MD5(CONCAT('demo-price-',9207)), 25.00, 300);
INSERT INTO `eventbooking_plugin_base_multi_lang` (`id`,`foreign_id`,`model`,`locale`,`field`,`content`,`source`)
SELECT NULL, 9207, 'pjPrice', l.`id`, 'name', '10K Run', 'data' FROM `eventbooking_plugin_base_locale` l;
INSERT INTO `eventbooking_prices` (`id`,`event_id`,`recurring`,`price`,`available`) VALUES (9208,9104, MD5(CONCAT('demo-price-',9208)), 40.00, 200);
INSERT INTO `eventbooking_plugin_base_multi_lang` (`id`,`foreign_id`,`model`,`locale`,`field`,`content`,`source`)
SELECT NULL, 9208, 'pjPrice', l.`id`, 'name', 'Half Marathon', 'data' FROM `eventbooking_plugin_base_locale` l;
INSERT INTO `eventbooking_prices` (`id`,`event_id`,`recurring`,`price`,`available`) VALUES (9209,9104, MD5(CONCAT('demo-price-',9209)), 55.00, 150);
INSERT INTO `eventbooking_plugin_base_multi_lang` (`id`,`foreign_id`,`model`,`locale`,`field`,`content`,`source`)
SELECT NULL, 9209, 'pjPrice', l.`id`, 'name', 'Full Marathon', 'data' FROM `eventbooking_plugin_base_locale` l;

INSERT INTO `eventbooking_events` (`id`,`recurring_id`,`category_id`,`event_start_ts`,`event_end_ts`,`event_img`,`event_thumb`,`event_medium`,`o_show_start_time`,`o_show_end_time`,`ticket_img`,`status`) VALUES (9105, MD5(CONCAT('demo-',9105)), (SELECT `foreign_id` FROM `eventbooking_plugin_base_multi_lang` WHERE `model`='pjCategory' AND `field`='name' AND `content`='Sports' LIMIT 1), UNIX_TIMESTAMP('2026-08-30 16:00:00'), UNIX_TIMESTAMP('2026-08-30 18:00:00'), NULL, NULL, NULL, 'T','T', NULL, 'T');
INSERT INTO `eventbooking_plugin_base_multi_lang` (`id`,`foreign_id`,`model`,`locale`,`field`,`content`,`source`)
SELECT NULL, 9105, 'pjEvent', l.`id`, 'title', 'Charity Football Match', 'data' FROM `eventbooking_plugin_base_locale` l;
INSERT INTO `eventbooking_plugin_base_multi_lang` (`id`,`foreign_id`,`model`,`locale`,`field`,`content`,`source`)
SELECT NULL, 9105, 'pjEvent', l.`id`, 'description', 'Legends vs. Celebrities in a fun match to raise funds for local youth sports. All proceeds go to charity.', 'data' FROM `eventbooking_plugin_base_locale` l;
INSERT INTO `eventbooking_plugin_base_multi_lang` (`id`,`foreign_id`,`model`,`locale`,`field`,`content`,`source`)
SELECT NULL, 9105, 'pjEvent', l.`id`, 'location', 'National Stadium', 'data' FROM `eventbooking_plugin_base_locale` l;
INSERT INTO `eventbooking_prices` (`id`,`event_id`,`recurring`,`price`,`available`) VALUES (9210,9105, MD5(CONCAT('demo-price-',9210)), 25.00, 200);
INSERT INTO `eventbooking_plugin_base_multi_lang` (`id`,`foreign_id`,`model`,`locale`,`field`,`content`,`source`)
SELECT NULL, 9210, 'pjPrice', l.`id`, 'name', 'General Admission', 'data' FROM `eventbooking_plugin_base_locale` l;
INSERT INTO `eventbooking_prices` (`id`,`event_id`,`recurring`,`price`,`available`) VALUES (9211,9105, MD5(CONCAT('demo-price-',9211)), 60.00, 50);
INSERT INTO `eventbooking_plugin_base_multi_lang` (`id`,`foreign_id`,`model`,`locale`,`field`,`content`,`source`)
SELECT NULL, 9211, 'pjPrice', l.`id`, 'name', 'VIP', 'data' FROM `eventbooking_plugin_base_locale` l;

INSERT INTO `eventbooking_events` (`id`,`recurring_id`,`category_id`,`event_start_ts`,`event_end_ts`,`event_img`,`event_thumb`,`event_medium`,`o_show_start_time`,`o_show_end_time`,`ticket_img`,`status`) VALUES (9106, MD5(CONCAT('demo-',9106)), (SELECT `foreign_id` FROM `eventbooking_plugin_base_multi_lang` WHERE `model`='pjCategory' AND `field`='name' AND `content`='Business & Tech' LIMIT 1), UNIX_TIMESTAMP('2026-09-18 09:00:00'), UNIX_TIMESTAMP('2026-09-18 17:00:00'), NULL, NULL, NULL, 'T','T', NULL, 'T');
INSERT INTO `eventbooking_plugin_base_multi_lang` (`id`,`foreign_id`,`model`,`locale`,`field`,`content`,`source`)
SELECT NULL, 9106, 'pjEvent', l.`id`, 'title', 'Tech Startup Summit', 'data' FROM `eventbooking_plugin_base_locale` l;
INSERT INTO `eventbooking_plugin_base_multi_lang` (`id`,`foreign_id`,`model`,`locale`,`field`,`content`,`source`)
SELECT NULL, 9106, 'pjEvent', l.`id`, 'description', 'A full day of keynotes, panels and networking with founders, investors and product leaders. Lunch included.', 'data' FROM `eventbooking_plugin_base_locale` l;
INSERT INTO `eventbooking_plugin_base_multi_lang` (`id`,`foreign_id`,`model`,`locale`,`field`,`content`,`source`)
SELECT NULL, 9106, 'pjEvent', l.`id`, 'location', 'Metro Convention Center, Hall B', 'data' FROM `eventbooking_plugin_base_locale` l;
INSERT INTO `eventbooking_plugin_base_multi_lang` (`id`,`foreign_id`,`model`,`locale`,`field`,`content`,`source`)
SELECT NULL, 9106, 'pjEvent', l.`id`, 'terms_body', 'Badge must be worn at all times. Sessions may be recorded.', 'data' FROM `eventbooking_plugin_base_locale` l;
INSERT INTO `eventbooking_plugin_base_multi_lang` (`id`,`foreign_id`,`model`,`locale`,`field`,`content`,`source`)
SELECT NULL, 9106, 'pjEvent', l.`id`, 'ticket_info', '{Name}, welcome to {EventTitle}. Your {Ticket} grants access on {EventDateTime}.', 'data' FROM `eventbooking_plugin_base_locale` l;
INSERT INTO `eventbooking_prices` (`id`,`event_id`,`recurring`,`price`,`available`) VALUES (9212,9106, MD5(CONCAT('demo-price-',9212)), 120.00, 150);
INSERT INTO `eventbooking_plugin_base_multi_lang` (`id`,`foreign_id`,`model`,`locale`,`field`,`content`,`source`)
SELECT NULL, 9212, 'pjPrice', l.`id`, 'name', 'Standard', 'data' FROM `eventbooking_plugin_base_locale` l;
INSERT INTO `eventbooking_prices` (`id`,`event_id`,`recurring`,`price`,`available`) VALUES (9213,9106, MD5(CONCAT('demo-price-',9213)), 220.00, 40);
INSERT INTO `eventbooking_plugin_base_multi_lang` (`id`,`foreign_id`,`model`,`locale`,`field`,`content`,`source`)
SELECT NULL, 9213, 'pjPrice', l.`id`, 'name', 'VIP (front row + lunch)', 'data' FROM `eventbooking_plugin_base_locale` l;

INSERT INTO `eventbooking_events` (`id`,`recurring_id`,`category_id`,`event_start_ts`,`event_end_ts`,`event_img`,`event_thumb`,`event_medium`,`o_show_start_time`,`o_show_end_time`,`ticket_img`,`status`) VALUES (9107, MD5(CONCAT('demo-',9107)), (SELECT `foreign_id` FROM `eventbooking_plugin_base_multi_lang` WHERE `model`='pjCategory' AND `field`='name' AND `content`='Business & Tech' LIMIT 1), UNIX_TIMESTAMP('2026-08-08 10:00:00'), UNIX_TIMESTAMP('2026-08-08 15:00:00'), NULL, NULL, NULL, 'T','T', NULL, 'T');
INSERT INTO `eventbooking_plugin_base_multi_lang` (`id`,`foreign_id`,`model`,`locale`,`field`,`content`,`source`)
SELECT NULL, 9107, 'pjEvent', l.`id`, 'title', 'Digital Marketing Workshop', 'data' FROM `eventbooking_plugin_base_locale` l;
INSERT INTO `eventbooking_plugin_base_multi_lang` (`id`,`foreign_id`,`model`,`locale`,`field`,`content`,`source`)
SELECT NULL, 9107, 'pjEvent', l.`id`, 'description', 'Hands-on workshop covering SEO, paid ads and analytics. Bring your laptop. Small group, limited seats.', 'data' FROM `eventbooking_plugin_base_locale` l;
INSERT INTO `eventbooking_plugin_base_multi_lang` (`id`,`foreign_id`,`model`,`locale`,`field`,`content`,`source`)
SELECT NULL, 9107, 'pjEvent', l.`id`, 'location', 'Innovation Hub, Room 3', 'data' FROM `eventbooking_plugin_base_locale` l;
INSERT INTO `eventbooking_prices` (`id`,`event_id`,`recurring`,`price`,`available`) VALUES (9214,9107, MD5(CONCAT('demo-price-',9214)), 120.00, 150);
INSERT INTO `eventbooking_plugin_base_multi_lang` (`id`,`foreign_id`,`model`,`locale`,`field`,`content`,`source`)
SELECT NULL, 9214, 'pjPrice', l.`id`, 'name', 'Standard', 'data' FROM `eventbooking_plugin_base_locale` l;
INSERT INTO `eventbooking_prices` (`id`,`event_id`,`recurring`,`price`,`available`) VALUES (9215,9107, MD5(CONCAT('demo-price-',9215)), 220.00, 40);
INSERT INTO `eventbooking_plugin_base_multi_lang` (`id`,`foreign_id`,`model`,`locale`,`field`,`content`,`source`)
SELECT NULL, 9215, 'pjPrice', l.`id`, 'name', 'VIP (front row + lunch)', 'data' FROM `eventbooking_plugin_base_locale` l;

INSERT INTO `eventbooking_events` (`id`,`recurring_id`,`category_id`,`event_start_ts`,`event_end_ts`,`event_img`,`event_thumb`,`event_medium`,`o_show_start_time`,`o_show_end_time`,`ticket_img`,`status`) VALUES (9108, MD5(CONCAT('demo-',9108)), (SELECT `foreign_id` FROM `eventbooking_plugin_base_multi_lang` WHERE `model`='pjCategory' AND `field`='name' AND `content`='Business & Tech' LIMIT 1), UNIX_TIMESTAMP('2026-07-01 09:00:00'), UNIX_TIMESTAMP('2026-07-01 16:00:00'), NULL, NULL, NULL, 'T','T', NULL, 'T');
INSERT INTO `eventbooking_plugin_base_multi_lang` (`id`,`foreign_id`,`model`,`locale`,`field`,`content`,`source`)
SELECT NULL, 9108, 'pjEvent', l.`id`, 'title', 'Leadership Bootcamp', 'data' FROM `eventbooking_plugin_base_locale` l;
INSERT INTO `eventbooking_plugin_base_multi_lang` (`id`,`foreign_id`,`model`,`locale`,`field`,`content`,`source`)
SELECT NULL, 9108, 'pjEvent', l.`id`, 'description', 'Intensive one-day bootcamp on modern leadership and team building.', 'data' FROM `eventbooking_plugin_base_locale` l;
INSERT INTO `eventbooking_plugin_base_multi_lang` (`id`,`foreign_id`,`model`,`locale`,`field`,`content`,`source`)
SELECT NULL, 9108, 'pjEvent', l.`id`, 'location', 'Business Tower, 12th Floor', 'data' FROM `eventbooking_plugin_base_locale` l;
INSERT INTO `eventbooking_prices` (`id`,`event_id`,`recurring`,`price`,`available`) VALUES (9216,9108, MD5(CONCAT('demo-price-',9216)), 120.00, 150);
INSERT INTO `eventbooking_plugin_base_multi_lang` (`id`,`foreign_id`,`model`,`locale`,`field`,`content`,`source`)
SELECT NULL, 9216, 'pjPrice', l.`id`, 'name', 'Standard', 'data' FROM `eventbooking_plugin_base_locale` l;
INSERT INTO `eventbooking_prices` (`id`,`event_id`,`recurring`,`price`,`available`) VALUES (9217,9108, MD5(CONCAT('demo-price-',9217)), 220.00, 40);
INSERT INTO `eventbooking_plugin_base_multi_lang` (`id`,`foreign_id`,`model`,`locale`,`field`,`content`,`source`)
SELECT NULL, 9217, 'pjPrice', l.`id`, 'name', 'VIP (front row + lunch)', 'data' FROM `eventbooking_plugin_base_locale` l;

INSERT INTO `eventbooking_events` (`id`,`recurring_id`,`category_id`,`event_start_ts`,`event_end_ts`,`event_img`,`event_thumb`,`event_medium`,`o_show_start_time`,`o_show_end_time`,`ticket_img`,`status`) VALUES (9109, MD5(CONCAT('demo-',9109)), (SELECT `foreign_id` FROM `eventbooking_plugin_base_multi_lang` WHERE `model`='pjCategory' AND `field`='name' AND `content`='Arts & Theatre' LIMIT 1), UNIX_TIMESTAMP('2026-08-22 19:30:00'), UNIX_TIMESTAMP('2026-08-22 22:00:00'), NULL, NULL, NULL, 'T','T', NULL, 'T');
INSERT INTO `eventbooking_plugin_base_multi_lang` (`id`,`foreign_id`,`model`,`locale`,`field`,`content`,`source`)
SELECT NULL, 9109, 'pjEvent', l.`id`, 'title', 'Shakespeare in the Park: Hamlet', 'data' FROM `eventbooking_plugin_base_locale` l;
INSERT INTO `eventbooking_plugin_base_multi_lang` (`id`,`foreign_id`,`model`,`locale`,`field`,`content`,`source`)
SELECT NULL, 9109, 'pjEvent', l.`id`, 'description', 'A modern open-air staging of Hamlet under the stars. Bring a blanket. Interval refreshments available.', 'data' FROM `eventbooking_plugin_base_locale` l;
INSERT INTO `eventbooking_plugin_base_multi_lang` (`id`,`foreign_id`,`model`,`locale`,`field`,`content`,`source`)
SELECT NULL, 9109, 'pjEvent', l.`id`, 'location', 'Riverside Open-Air Theatre', 'data' FROM `eventbooking_plugin_base_locale` l;
INSERT INTO `eventbooking_plugin_base_multi_lang` (`id`,`foreign_id`,`model`,`locale`,`field`,`content`,`source`)
SELECT NULL, 9109, 'pjEvent', l.`id`, 'terms_body', 'In case of heavy rain the show moves to the indoor hall.', 'data' FROM `eventbooking_plugin_base_locale` l;
INSERT INTO `eventbooking_prices` (`id`,`event_id`,`recurring`,`price`,`available`) VALUES (9218,9109, MD5(CONCAT('demo-price-',9218)), 30.00, 180);
INSERT INTO `eventbooking_plugin_base_multi_lang` (`id`,`foreign_id`,`model`,`locale`,`field`,`content`,`source`)
SELECT NULL, 9218, 'pjPrice', l.`id`, 'name', 'Adult', 'data' FROM `eventbooking_plugin_base_locale` l;
INSERT INTO `eventbooking_prices` (`id`,`event_id`,`recurring`,`price`,`available`) VALUES (9219,9109, MD5(CONCAT('demo-price-',9219)), 15.00, 60);
INSERT INTO `eventbooking_plugin_base_multi_lang` (`id`,`foreign_id`,`model`,`locale`,`field`,`content`,`source`)
SELECT NULL, 9219, 'pjPrice', l.`id`, 'name', 'Child (under 12)', 'data' FROM `eventbooking_plugin_base_locale` l;

INSERT INTO `eventbooking_events` (`id`,`recurring_id`,`category_id`,`event_start_ts`,`event_end_ts`,`event_img`,`event_thumb`,`event_medium`,`o_show_start_time`,`o_show_end_time`,`ticket_img`,`status`) VALUES (9110, MD5(CONCAT('demo-',9110)), (SELECT `foreign_id` FROM `eventbooking_plugin_base_multi_lang` WHERE `model`='pjCategory' AND `field`='name' AND `content`='Arts & Theatre' LIMIT 1), UNIX_TIMESTAMP('2026-09-12 10:00:00'), UNIX_TIMESTAMP('2026-09-12 18:00:00'), NULL, NULL, NULL, 'T','T', NULL, 'T');
INSERT INTO `eventbooking_plugin_base_multi_lang` (`id`,`foreign_id`,`model`,`locale`,`field`,`content`,`source`)
SELECT NULL, 9110, 'pjEvent', l.`id`, 'title', 'Modern Art Expo', 'data' FROM `eventbooking_plugin_base_locale` l;
INSERT INTO `eventbooking_plugin_base_multi_lang` (`id`,`foreign_id`,`model`,`locale`,`field`,`content`,`source`)
SELECT NULL, 9110, 'pjEvent', l.`id`, 'description', 'A curated exhibition of contemporary painting, sculpture and digital art from 40 emerging artists.', 'data' FROM `eventbooking_plugin_base_locale` l;
INSERT INTO `eventbooking_plugin_base_multi_lang` (`id`,`foreign_id`,`model`,`locale`,`field`,`content`,`source`)
SELECT NULL, 9110, 'pjEvent', l.`id`, 'location', 'Metropolitan Gallery', 'data' FROM `eventbooking_plugin_base_locale` l;
INSERT INTO `eventbooking_prices` (`id`,`event_id`,`recurring`,`price`,`available`) VALUES (9220,9110, MD5(CONCAT('demo-price-',9220)), 30.00, 180);
INSERT INTO `eventbooking_plugin_base_multi_lang` (`id`,`foreign_id`,`model`,`locale`,`field`,`content`,`source`)
SELECT NULL, 9220, 'pjPrice', l.`id`, 'name', 'Adult', 'data' FROM `eventbooking_plugin_base_locale` l;
INSERT INTO `eventbooking_prices` (`id`,`event_id`,`recurring`,`price`,`available`) VALUES (9221,9110, MD5(CONCAT('demo-price-',9221)), 15.00, 60);
INSERT INTO `eventbooking_plugin_base_multi_lang` (`id`,`foreign_id`,`model`,`locale`,`field`,`content`,`source`)
SELECT NULL, 9221, 'pjPrice', l.`id`, 'name', 'Child (under 12)', 'data' FROM `eventbooking_plugin_base_locale` l;

INSERT INTO `eventbooking_events` (`id`,`recurring_id`,`category_id`,`event_start_ts`,`event_end_ts`,`event_img`,`event_thumb`,`event_medium`,`o_show_start_time`,`o_show_end_time`,`ticket_img`,`status`) VALUES (9111, MD5(CONCAT('demo-',9111)), (SELECT `foreign_id` FROM `eventbooking_plugin_base_multi_lang` WHERE `model`='pjCategory' AND `field`='name' AND `content`='Food & Drink' LIMIT 1), UNIX_TIMESTAMP('2026-08-28 18:00:00'), UNIX_TIMESTAMP('2026-08-28 21:00:00'), NULL, NULL, NULL, 'T','T', NULL, 'T');
INSERT INTO `eventbooking_plugin_base_multi_lang` (`id`,`foreign_id`,`model`,`locale`,`field`,`content`,`source`)
SELECT NULL, 9111, 'pjEvent', l.`id`, 'title', 'Wine Tasting Evening', 'data' FROM `eventbooking_plugin_base_locale` l;
INSERT INTO `eventbooking_plugin_base_multi_lang` (`id`,`foreign_id`,`model`,`locale`,`field`,`content`,`source`)
SELECT NULL, 9111, 'pjEvent', l.`id`, 'description', 'Guided tasting of twelve regional wines paired with artisan cheeses. Transport from the city included.', 'data' FROM `eventbooking_plugin_base_locale` l;
INSERT INTO `eventbooking_plugin_base_multi_lang` (`id`,`foreign_id`,`model`,`locale`,`field`,`content`,`source`)
SELECT NULL, 9111, 'pjEvent', l.`id`, 'location', 'Hillside Vineyard Estate', 'data' FROM `eventbooking_plugin_base_locale` l;
INSERT INTO `eventbooking_plugin_base_multi_lang` (`id`,`foreign_id`,`model`,`locale`,`field`,`content`,`source`)
SELECT NULL, 9111, 'pjEvent', l.`id`, 'terms_body', 'Guests must be 18 or older. Please drink responsibly.', 'data' FROM `eventbooking_plugin_base_locale` l;
INSERT INTO `eventbooking_prices` (`id`,`event_id`,`recurring`,`price`,`available`) VALUES (9222,9111, MD5(CONCAT('demo-price-',9222)), 20.00, 200);
INSERT INTO `eventbooking_plugin_base_multi_lang` (`id`,`foreign_id`,`model`,`locale`,`field`,`content`,`source`)
SELECT NULL, 9222, 'pjPrice', l.`id`, 'name', 'Entry', 'data' FROM `eventbooking_plugin_base_locale` l;
INSERT INTO `eventbooking_prices` (`id`,`event_id`,`recurring`,`price`,`available`) VALUES (9223,9111, MD5(CONCAT('demo-price-',9223)), 45.00, 60);
INSERT INTO `eventbooking_plugin_base_multi_lang` (`id`,`foreign_id`,`model`,`locale`,`field`,`content`,`source`)
SELECT NULL, 9223, 'pjPrice', l.`id`, 'name', 'Premium', 'data' FROM `eventbooking_plugin_base_locale` l;

INSERT INTO `eventbooking_events` (`id`,`recurring_id`,`category_id`,`event_start_ts`,`event_end_ts`,`event_img`,`event_thumb`,`event_medium`,`o_show_start_time`,`o_show_end_time`,`ticket_img`,`status`) VALUES (9112, MD5(CONCAT('demo-',9112)), (SELECT `foreign_id` FROM `eventbooking_plugin_base_multi_lang` WHERE `model`='pjCategory' AND `field`='name' AND `content`='Food & Drink' LIMIT 1), UNIX_TIMESTAMP('2026-09-27 12:00:00'), UNIX_TIMESTAMP('2026-09-27 20:00:00'), NULL, NULL, NULL, 'T','T', NULL, 'T');
INSERT INTO `eventbooking_plugin_base_multi_lang` (`id`,`foreign_id`,`model`,`locale`,`field`,`content`,`source`)
SELECT NULL, 9112, 'pjEvent', l.`id`, 'title', 'Street Food Carnival', 'data' FROM `eventbooking_plugin_base_locale` l;
INSERT INTO `eventbooking_plugin_base_multi_lang` (`id`,`foreign_id`,`model`,`locale`,`field`,`content`,`source`)
SELECT NULL, 9112, 'pjEvent', l.`id`, 'description', 'Fifty food stalls, live music and family activities along the waterfront. Entry ticket includes 3 food tokens.', 'data' FROM `eventbooking_plugin_base_locale` l;
INSERT INTO `eventbooking_plugin_base_multi_lang` (`id`,`foreign_id`,`model`,`locale`,`field`,`content`,`source`)
SELECT NULL, 9112, 'pjEvent', l.`id`, 'location', 'Old Harbour Front', 'data' FROM `eventbooking_plugin_base_locale` l;
INSERT INTO `eventbooking_prices` (`id`,`event_id`,`recurring`,`price`,`available`) VALUES (9224,9112, MD5(CONCAT('demo-price-',9224)), 20.00, 200);
INSERT INTO `eventbooking_plugin_base_multi_lang` (`id`,`foreign_id`,`model`,`locale`,`field`,`content`,`source`)
SELECT NULL, 9224, 'pjPrice', l.`id`, 'name', 'Entry', 'data' FROM `eventbooking_plugin_base_locale` l;
INSERT INTO `eventbooking_prices` (`id`,`event_id`,`recurring`,`price`,`available`) VALUES (9225,9112, MD5(CONCAT('demo-price-',9225)), 45.00, 60);
INSERT INTO `eventbooking_plugin_base_multi_lang` (`id`,`foreign_id`,`model`,`locale`,`field`,`content`,`source`)
SELECT NULL, 9225, 'pjPrice', l.`id`, 'name', 'Premium', 'data' FROM `eventbooking_plugin_base_locale` l;

-- --- Bookings + details + tickets -------------------------------------------
INSERT INTO `eventbooking_bookings` (`id`,`unique_id`,`event_id`,`booking_total`,`booking_deposit`,`booking_tax`,`booking_discount`,`voucher_code`,`booking_status`,`payment_method`,`payment_option`,`customer_name`,`customer_email`,`customer_phone`,`customer_country`,`customer_city`,`customer_people`,`customer_ip`,`reminder_email`,`reminder_sms`,`created`,`modified`) VALUES (9301,'OH1749629301',9101,145.00,14.50,0.00,0.00,NULL,'confirmed','paypal','deposit','Emma Johnson','emma.johnson@example.com','+1 555 0101',NULL,'Springfield',3,'127.0.0.1','F','F','2026-07-05 14:22:10',NULL);
INSERT INTO `eventbooking_bookings_details` (`booking_id`,`price_id`,`price`,`unit_price`,`price_title`,`cnt`) VALUES (9301,9201,70.00,35.00,'General Admission',2);
INSERT INTO `eventbooking_bookings_tickets` (`id`,`booking_id`,`ticket_id`,`price_id`,`unit_price`,`price_title`,`is_used`) VALUES (9500,9301,'OH1749629301-1',9201,35.00,'General Admission','F');
INSERT INTO `eventbooking_bookings_tickets` (`id`,`booking_id`,`ticket_id`,`price_id`,`unit_price`,`price_title`,`is_used`) VALUES (9501,9301,'OH1749629301-2',9201,35.00,'General Admission','F');
INSERT INTO `eventbooking_bookings_details` (`booking_id`,`price_id`,`price`,`unit_price`,`price_title`,`cnt`) VALUES (9301,9202,75.00,75.00,'VIP Lounge',1);
INSERT INTO `eventbooking_bookings_tickets` (`id`,`booking_id`,`ticket_id`,`price_id`,`unit_price`,`price_title`,`is_used`) VALUES (9502,9301,'OH1749629301-3',9202,75.00,'VIP Lounge','F');

INSERT INTO `eventbooking_bookings` (`id`,`unique_id`,`event_id`,`booking_total`,`booking_deposit`,`booking_tax`,`booking_discount`,`voucher_code`,`booking_status`,`payment_method`,`payment_option`,`customer_name`,`customer_email`,`customer_phone`,`customer_country`,`customer_city`,`customer_people`,`customer_ip`,`reminder_email`,`reminder_sms`,`created`,`modified`) VALUES (9302,'OH1749629302',9101,126.00,12.60,0.00,14.00,'WELCOME10','pending','bank','deposit','Liam Smith','liam.smith@example.com','+1 555 0102',NULL,'Springfield',4,'127.0.0.1','F','F','2026-07-18 09:05:41',NULL);
INSERT INTO `eventbooking_bookings_details` (`booking_id`,`price_id`,`price`,`unit_price`,`price_title`,`cnt`) VALUES (9302,9201,140.00,35.00,'General Admission',4);
INSERT INTO `eventbooking_bookings_tickets` (`id`,`booking_id`,`ticket_id`,`price_id`,`unit_price`,`price_title`,`is_used`) VALUES (9503,9302,'OH1749629302-1',9201,35.00,'General Admission','F');
INSERT INTO `eventbooking_bookings_tickets` (`id`,`booking_id`,`ticket_id`,`price_id`,`unit_price`,`price_title`,`is_used`) VALUES (9504,9302,'OH1749629302-2',9201,35.00,'General Admission','F');
INSERT INTO `eventbooking_bookings_tickets` (`id`,`booking_id`,`ticket_id`,`price_id`,`unit_price`,`price_title`,`is_used`) VALUES (9505,9302,'OH1749629302-3',9201,35.00,'General Admission','F');
INSERT INTO `eventbooking_bookings_tickets` (`id`,`booking_id`,`ticket_id`,`price_id`,`unit_price`,`price_title`,`is_used`) VALUES (9506,9302,'OH1749629302-4',9201,35.00,'General Admission','F');

INSERT INTO `eventbooking_bookings` (`id`,`unique_id`,`event_id`,`booking_total`,`booking_deposit`,`booking_tax`,`booking_discount`,`voucher_code`,`booking_status`,`payment_method`,`payment_option`,`customer_name`,`customer_email`,`customer_phone`,`customer_country`,`customer_city`,`customer_people`,`customer_ip`,`reminder_email`,`reminder_sms`,`created`,`modified`) VALUES (9303,'OH1749629303',9104,80.00,8.00,0.00,0.00,NULL,'confirmed','paypal','deposit','Olivia Brown','olivia.brown@example.com','+1 555 0103',NULL,'Springfield',2,'127.0.0.1','F','F','2026-07-10 18:40:00',NULL);
INSERT INTO `eventbooking_bookings_details` (`booking_id`,`price_id`,`price`,`unit_price`,`price_title`,`cnt`) VALUES (9303,9207,25.00,25.00,'10K Run',1);
INSERT INTO `eventbooking_bookings_tickets` (`id`,`booking_id`,`ticket_id`,`price_id`,`unit_price`,`price_title`,`is_used`) VALUES (9507,9303,'OH1749629303-1',9207,25.00,'10K Run','F');
INSERT INTO `eventbooking_bookings_details` (`booking_id`,`price_id`,`price`,`unit_price`,`price_title`,`cnt`) VALUES (9303,9209,55.00,55.00,'Full Marathon',1);
INSERT INTO `eventbooking_bookings_tickets` (`id`,`booking_id`,`ticket_id`,`price_id`,`unit_price`,`price_title`,`is_used`) VALUES (9508,9303,'OH1749629303-2',9209,55.00,'Full Marathon','F');

INSERT INTO `eventbooking_bookings` (`id`,`unique_id`,`event_id`,`booking_total`,`booking_deposit`,`booking_tax`,`booking_discount`,`voucher_code`,`booking_status`,`payment_method`,`payment_option`,`customer_name`,`customer_email`,`customer_phone`,`customer_country`,`customer_city`,`customer_people`,`customer_ip`,`reminder_email`,`reminder_sms`,`created`,`modified`) VALUES (9304,'OH1749629304',9106,352.00,35.20,0.00,88.00,'VIP20','confirmed','cash','deposit','Noah Davis','noah.davis@example.com','+1 555 0104',NULL,'Springfield',2,'127.0.0.1','F','F','2026-07-12 11:15:30',NULL);
INSERT INTO `eventbooking_bookings_details` (`booking_id`,`price_id`,`price`,`unit_price`,`price_title`,`cnt`) VALUES (9304,9213,440.00,220.00,'VIP (front row + lunch)',2);
INSERT INTO `eventbooking_bookings_tickets` (`id`,`booking_id`,`ticket_id`,`price_id`,`unit_price`,`price_title`,`is_used`) VALUES (9509,9304,'OH1749629304-1',9213,220.00,'VIP (front row + lunch)','F');
INSERT INTO `eventbooking_bookings_tickets` (`id`,`booking_id`,`ticket_id`,`price_id`,`unit_price`,`price_title`,`is_used`) VALUES (9510,9304,'OH1749629304-2',9213,220.00,'VIP (front row + lunch)','F');

INSERT INTO `eventbooking_bookings` (`id`,`unique_id`,`event_id`,`booking_total`,`booking_deposit`,`booking_tax`,`booking_discount`,`voucher_code`,`booking_status`,`payment_method`,`payment_option`,`customer_name`,`customer_email`,`customer_phone`,`customer_country`,`customer_city`,`customer_people`,`customer_ip`,`reminder_email`,`reminder_sms`,`created`,`modified`) VALUES (9305,'OH1749629305',9109,90.00,9.00,0.00,0.00,NULL,'cancelled','paypal','deposit','Ava Wilson','ava.wilson@example.com','+1 555 0105',NULL,'Springfield',3,'127.0.0.1','F','F','2026-07-02 20:11:09',NULL);
INSERT INTO `eventbooking_bookings_details` (`booking_id`,`price_id`,`price`,`unit_price`,`price_title`,`cnt`) VALUES (9305,9218,90.00,30.00,'Adult',3);
INSERT INTO `eventbooking_bookings_tickets` (`id`,`booking_id`,`ticket_id`,`price_id`,`unit_price`,`price_title`,`is_used`) VALUES (9511,9305,'OH1749629305-1',9218,30.00,'Adult','F');
INSERT INTO `eventbooking_bookings_tickets` (`id`,`booking_id`,`ticket_id`,`price_id`,`unit_price`,`price_title`,`is_used`) VALUES (9512,9305,'OH1749629305-2',9218,30.00,'Adult','F');
INSERT INTO `eventbooking_bookings_tickets` (`id`,`booking_id`,`ticket_id`,`price_id`,`unit_price`,`price_title`,`is_used`) VALUES (9513,9305,'OH1749629305-3',9218,30.00,'Adult','F');

INSERT INTO `eventbooking_bookings` (`id`,`unique_id`,`event_id`,`booking_total`,`booking_deposit`,`booking_tax`,`booking_discount`,`voucher_code`,`booking_status`,`payment_method`,`payment_option`,`customer_name`,`customer_email`,`customer_phone`,`customer_country`,`customer_city`,`customer_people`,`customer_ip`,`reminder_email`,`reminder_sms`,`created`,`modified`) VALUES (9306,'OH1749629306',9111,110.50,11.05,0.00,19.50,'SUMMER15','confirmed','paypal','deposit','Sophia Miller','sophia.miller@example.com','+1 555 0106',NULL,'Springfield',4,'127.0.0.1','F','F','2026-07-19 16:30:22',NULL);
INSERT INTO `eventbooking_bookings_details` (`booking_id`,`price_id`,`price`,`unit_price`,`price_title`,`cnt`) VALUES (9306,9222,40.00,20.00,'Entry',2);
INSERT INTO `eventbooking_bookings_tickets` (`id`,`booking_id`,`ticket_id`,`price_id`,`unit_price`,`price_title`,`is_used`) VALUES (9514,9306,'OH1749629306-1',9222,20.00,'Entry','F');
INSERT INTO `eventbooking_bookings_tickets` (`id`,`booking_id`,`ticket_id`,`price_id`,`unit_price`,`price_title`,`is_used`) VALUES (9515,9306,'OH1749629306-2',9222,20.00,'Entry','F');
INSERT INTO `eventbooking_bookings_details` (`booking_id`,`price_id`,`price`,`unit_price`,`price_title`,`cnt`) VALUES (9306,9223,90.00,45.00,'Premium',2);
INSERT INTO `eventbooking_bookings_tickets` (`id`,`booking_id`,`ticket_id`,`price_id`,`unit_price`,`price_title`,`is_used`) VALUES (9516,9306,'OH1749629306-3',9223,45.00,'Premium','F');
INSERT INTO `eventbooking_bookings_tickets` (`id`,`booking_id`,`ticket_id`,`price_id`,`unit_price`,`price_title`,`is_used`) VALUES (9517,9306,'OH1749629306-4',9223,45.00,'Premium','F');

INSERT INTO `eventbooking_bookings` (`id`,`unique_id`,`event_id`,`booking_total`,`booking_deposit`,`booking_tax`,`booking_discount`,`voucher_code`,`booking_status`,`payment_method`,`payment_option`,`customer_name`,`customer_email`,`customer_phone`,`customer_country`,`customer_city`,`customer_people`,`customer_ip`,`reminder_email`,`reminder_sms`,`created`,`modified`) VALUES (9307,'OH1749629307',9108,120.00,12.00,0.00,0.00,NULL,'confirmed','cash','deposit','Mason Garcia','mason.garcia@example.com','+1 555 0107',NULL,'Springfield',1,'127.0.0.1','F','F','2026-06-25 10:00:00',NULL);
INSERT INTO `eventbooking_bookings_details` (`booking_id`,`price_id`,`price`,`unit_price`,`price_title`,`cnt`) VALUES (9307,9216,120.00,120.00,'Standard',1);
INSERT INTO `eventbooking_bookings_tickets` (`id`,`booking_id`,`ticket_id`,`price_id`,`unit_price`,`price_title`,`is_used`) VALUES (9518,9307,'OH1749629307-1',9216,120.00,'Standard','F');

INSERT INTO `eventbooking_bookings` (`id`,`unique_id`,`event_id`,`booking_total`,`booking_deposit`,`booking_tax`,`booking_discount`,`voucher_code`,`booking_status`,`payment_method`,`payment_option`,`customer_name`,`customer_email`,`customer_phone`,`customer_country`,`customer_city`,`customer_people`,`customer_ip`,`reminder_email`,`reminder_sms`,`created`,`modified`) VALUES (9308,'OH1749629308',9112,60.00,6.00,0.00,0.00,NULL,'pending','paypal','deposit','Isabella Martinez','isabella.martinez@example.com','+1 555 0108',NULL,'Springfield',3,'127.0.0.1','F','F','2026-07-20 13:45:55',NULL);
INSERT INTO `eventbooking_bookings_details` (`booking_id`,`price_id`,`price`,`unit_price`,`price_title`,`cnt`) VALUES (9308,9224,60.00,20.00,'Entry',3);
INSERT INTO `eventbooking_bookings_tickets` (`id`,`booking_id`,`ticket_id`,`price_id`,`unit_price`,`price_title`,`is_used`) VALUES (9519,9308,'OH1749629308-1',9224,20.00,'Entry','F');
INSERT INTO `eventbooking_bookings_tickets` (`id`,`booking_id`,`ticket_id`,`price_id`,`unit_price`,`price_title`,`is_used`) VALUES (9520,9308,'OH1749629308-2',9224,20.00,'Entry','F');
INSERT INTO `eventbooking_bookings_tickets` (`id`,`booking_id`,`ticket_id`,`price_id`,`unit_price`,`price_title`,`is_used`) VALUES (9521,9308,'OH1749629308-3',9224,20.00,'Entry','F');

-- --- Discount codes (voucher module) ---------------------------------------
INSERT INTO `eventbooking_vouchers` (`id`,`code`,`type`,`apply`,`discount`,`valid`,`date_from`,`date_to`,`time_from`,`time_to`,`every`) VALUES (9401,'WELCOME10','percent','total',10.00,'period','2026-07-01','2026-12-31','00:00:00','23:59:00',NULL);
INSERT INTO `eventbooking_vouchers` (`id`,`code`,`type`,`apply`,`discount`,`valid`,`date_from`,`date_to`,`time_from`,`time_to`,`every`) VALUES (9402,'VIP20','percent','total',20.00,'fixed','2026-09-18','2026-09-18','00:00:00','23:59:00',NULL);
INSERT INTO `eventbooking_vouchers_events` (`voucher_id`,`event_id`) VALUES (9402,9106);
INSERT INTO `eventbooking_vouchers` (`id`,`code`,`type`,`apply`,`discount`,`valid`,`date_from`,`date_to`,`time_from`,`time_to`,`every`) VALUES (9403,'SUMMER15','percent','total',15.00,'period','2026-07-01','2026-09-30','00:00:00','23:59:00',NULL);
INSERT INTO `eventbooking_vouchers` (`id`,`code`,`type`,`apply`,`discount`,`valid`,`date_from`,`date_to`,`time_from`,`time_to`,`every`) VALUES (9404,'SAVE5','amount','each',5.00,'recurring',NULL,NULL,'00:00:00','23:00:00','friday');
INSERT INTO `eventbooking_vouchers_events` (`voucher_id`,`event_id`) VALUES (9404,9101);
INSERT INTO `eventbooking_vouchers_events` (`voucher_id`,`event_id`) VALUES (9404,9111);

SET FOREIGN_KEY_CHECKS=1;
-- End of demo data.
