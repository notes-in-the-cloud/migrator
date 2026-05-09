BEGIN;

CREATE SCHEMA IF NOT EXISTS sharing;

CREATE TABLE IF NOT EXISTS sharing.note_share_links (
    id UUID PRIMARY KEY,
    note_id UUID NOT NULL,
    owner_id UUID NOT NULL,
    token VARCHAR(255) NOT NULL UNIQUE,
    expires_at TIMESTAMP NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX IF NOT EXISTS idx_note_share_links_token
    ON sharing.note_share_links(token);

CREATE INDEX IF NOT EXISTS idx_note_share_links_note_id
    ON sharing.note_share_links(note_id);

CREATE INDEX IF NOT EXISTS idx_note_share_links_owner_id
    ON sharing.note_share_links(owner_id);

CREATE INDEX IF NOT EXISTS idx_note_share_links_expires_at
    ON sharing.note_share_links(expires_at);

COMMIT;