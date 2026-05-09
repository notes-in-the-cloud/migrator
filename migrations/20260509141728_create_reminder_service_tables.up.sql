CREATE SCHEMA IF NOT EXISTS reminder;

CREATE TABLE IF NOT EXISTS reminder.reminders (
    id UUID PRIMARY KEY,
    user_id UUID,
    heading VARCHAR(255),
    description VARCHAR(255),
    reminder_date DATE NOT NULL,
    reminder_time TIME NOT NULL,
    remind_at TIMESTAMP WITH TIME ZONE NOT NULL,
    priority VARCHAR(20) NOT NULL,
    status VARCHAR(20) NOT NULL DEFAULT 'PENDING',
    notify_in_app BOOLEAN NOT NULL DEFAULT TRUE,
    created_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS reminder.notifications (
    id UUID PRIMARY KEY,
    user_id UUID NOT NULL,
    reminder_id UUID NOT NULL,
    heading VARCHAR(255) NOT NULL,
    message TEXT,
    priority VARCHAR(20) NOT NULL,
    is_read BOOLEAN NOT NULL DEFAULT FALSE,
    read_at TIMESTAMP WITH TIME ZONE,
    fired_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_notifications_reminder
        FOREIGN KEY (reminder_id)
        REFERENCES reminder.reminders(id)
        ON DELETE CASCADE
);

CREATE INDEX IF NOT EXISTS idx_reminders_user_id
    ON reminder.reminders(user_id);

CREATE INDEX IF NOT EXISTS idx_reminders_user_status_date_time
    ON reminder.reminders(user_id, status, reminder_date, reminder_time);

CREATE INDEX IF NOT EXISTS idx_reminders_status_remind_at
    ON reminder.reminders(status, remind_at);

CREATE INDEX IF NOT EXISTS idx_notifications_user_id
    ON reminder.notifications(user_id);

CREATE INDEX IF NOT EXISTS idx_notifications_user_fired_at
    ON reminder.notifications(user_id, fired_at DESC);

CREATE INDEX IF NOT EXISTS idx_notifications_user_read_fired_at
    ON reminder.notifications(user_id, is_read, fired_at DESC);

CREATE INDEX IF NOT EXISTS idx_notifications_reminder_id
    ON reminder.notifications(reminder_id);