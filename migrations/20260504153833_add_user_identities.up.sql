BEGIN;

CREATE TABLE auth_service.identities (
   id                uuid PRIMARY KEY,
   user_id           uuid NOT NULL REFERENCES auth_service.users(id) ON DELETE CASCADE,
   provider          varchar(50)  NOT NULL,
   provider_user_id  varchar(255) NOT NULL,
   email             varchar(255),
   email_verified    boolean,
   created_at        timestamptz NOT NULL DEFAULT now(),
   updated_at        timestamptz,
   UNIQUE (provider, provider_user_id)
);

CREATE INDEX ON auth_service.identities (user_id);

COMMIT;