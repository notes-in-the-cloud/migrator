BEGIN

CREATE SCHEMA IF NOT EXISTS notes_service;

CREATE TABLE notes_service.notes (
    id UUID PRIMARY KEY,
    user_id UUID NOT NULL,
    title VARCHAR(255) NOT NULL,
    content TEXT,
    color VARCHAR(50),
    priority VARCHAR(20) NOT NULL DEFAULT 'None',
    created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    updated_at TIMESTAMPTZ
);

CREATE INDEX idx_notes_user_id ON notes_service.notes(user_id);

COMMIT;