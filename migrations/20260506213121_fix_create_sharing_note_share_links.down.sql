DROP INDEX IF EXISTS sharing.idx_note_share_links_expires_at;
DROP INDEX IF EXISTS sharing.idx_note_share_links_owner_id;
DROP INDEX IF EXISTS sharing.idx_note_share_links_note_id;
DROP INDEX IF EXISTS sharing.idx_note_share_links_token;

DROP TABLE IF EXISTS sharing.note_share_links;