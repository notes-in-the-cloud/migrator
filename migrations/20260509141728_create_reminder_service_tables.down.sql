BEGIN;

DROP INDEX IF EXISTS reminder.idx_notifications_reminder_id;
DROP INDEX IF EXISTS reminder.idx_notifications_user_read_fired_at;
DROP INDEX IF EXISTS reminder.idx_notifications_user_fired_at;
DROP INDEX IF EXISTS reminder.idx_notifications_user_id;

DROP INDEX IF EXISTS reminder.idx_reminders_status_remind_at;
DROP INDEX IF EXISTS reminder.idx_reminders_user_status_date_time;
DROP INDEX IF EXISTS reminder.idx_reminders_user_id;

DROP TABLE IF EXISTS reminder.notifications;
DROP TABLE IF EXISTS reminder.reminders;

DROP SCHEMA IF EXISTS reminder;

COMMIT;