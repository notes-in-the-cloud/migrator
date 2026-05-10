BEGIN;

ALTER TABLE reminder.reminders
    ALTER COLUMN user_id DROP NOT NULL;

ALTER TABLE reminder.reminders
    ALTER COLUMN description TYPE VARCHAR(255);

COMMIT;