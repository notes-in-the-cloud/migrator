BEGIN;

ALTER TABLE reminder.reminders
    ALTER COLUMN user_id SET NOT NULL;

ALTER TABLE reminder.reminders
    ALTER COLUMN description TYPE TEXT;

COMMIT;