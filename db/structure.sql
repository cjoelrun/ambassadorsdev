CREATE TABLE "credit_types" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar(255), "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "event_types" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar(255), "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "events" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "title" varchar(255), "date" date, "start_time" time, "end_time" time, "members_needed" integer, "hours" integer, "location" varchar(255), "instructions" text, "ait" boolean, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "event_type_id" integer, "credit_type_id" integer);
CREATE TABLE "registration_statuses" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar(255), "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "registrations" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "user_id" integer, "event_id" integer, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "registration_status_id" integer);
CREATE TABLE "roles" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar(255), "resource_id" integer, "resource_type" varchar(255), "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "schema_migrations" ("version" varchar(255) NOT NULL);
CREATE TABLE "users" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "email" varchar(255) DEFAULT '' NOT NULL, "encrypted_password" varchar(255) DEFAULT '', "reset_password_token" varchar(255), "reset_password_sent_at" datetime, "remember_created_at" datetime, "sign_in_count" integer DEFAULT 0, "current_sign_in_at" datetime, "last_sign_in_at" datetime, "current_sign_in_ip" varchar(255), "last_sign_in_ip" varchar(255), "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "confirmation_token" varchar(255), "confirmed_at" datetime, "confirmation_sent_at" datetime, "unconfirmed_email" varchar(255), "invitation_token" varchar(60), "invitation_sent_at" datetime, "invitation_accepted_at" datetime, "invitation_limit" integer, "invited_by_id" integer, "invited_by_type" varchar(255), "first_name" varchar(255), "last_name" varchar(255), "phone" varchar(255), "birthday" date, "local_street" varchar(255), "local_city" varchar(255), "local_state" varchar(255), "local_zip" varchar(255), "local_apt" varchar(255), "permanent_street" varchar(255), "permanent_city" varchar(255), "permanent_state" varchar(255), "permanent_zip" varchar(255), "permanent_apt" varchar(255), "same_address" boolean, "tour_trained" boolean, "banner" varchar(255), "utsa_id" varchar(255));
CREATE TABLE "users_roles" ("user_id" integer, "role_id" integer);
CREATE INDEX "index_roles_on_name" ON "roles" ("name");
CREATE INDEX "index_roles_on_name_and_resource_type_and_resource_id" ON "roles" ("name", "resource_type", "resource_id");
CREATE UNIQUE INDEX "index_users_on_email" ON "users" ("email");
CREATE INDEX "index_users_on_invitation_token" ON "users" ("invitation_token");
CREATE INDEX "index_users_on_invited_by_id" ON "users" ("invited_by_id");
CREATE UNIQUE INDEX "index_users_on_reset_password_token" ON "users" ("reset_password_token");
CREATE INDEX "index_users_roles_on_user_id_and_role_id" ON "users_roles" ("user_id", "role_id");
CREATE UNIQUE INDEX "unique_schema_migrations" ON "schema_migrations" ("version");
INSERT INTO schema_migrations (version) VALUES ('20120502160632');

INSERT INTO schema_migrations (version) VALUES ('20120502160639');

INSERT INTO schema_migrations (version) VALUES ('20120502160646');

INSERT INTO schema_migrations (version) VALUES ('20120502160703');

INSERT INTO schema_migrations (version) VALUES ('20120530204328');

INSERT INTO schema_migrations (version) VALUES ('20120530223408');

INSERT INTO schema_migrations (version) VALUES ('20120601041812');

INSERT INTO schema_migrations (version) VALUES ('20120604192127');

INSERT INTO schema_migrations (version) VALUES ('20120604200029');

INSERT INTO schema_migrations (version) VALUES ('20120604200100');

INSERT INTO schema_migrations (version) VALUES ('20120605135936');

INSERT INTO schema_migrations (version) VALUES ('20120606161302');

INSERT INTO schema_migrations (version) VALUES ('20120616043651');

INSERT INTO schema_migrations (version) VALUES ('20120616043802');