CREATE TABLE "MOVIE" (
  "id" SERIAL PRIMARY KEY,
  "title" varchar,
  "year_of_release" int,
  "length" float8,
  "production_company" int,
  "genre" int,
  "director" int,
  "actor" int,
  "outline" text,
  "quote" int
);

CREATE TABLE "Genre" (
  "code" SERIAL PRIMARY KEY,
  "genre" varchar
);

CREATE TABLE "Director" (
  "id" SERIAL PRIMARY KEY,
  "birth_date" date,
  "directed_mov" int,
  "act" int,
  "name" varchar
);

CREATE TABLE "Actor" (
  "id" SERIAL PRIMARY KEY,
  "birth_date" date,
  "movie" int,
  "role" varchar,
  "name" varchar
);

CREATE TABLE "Quote" (
  "id" SERIAL PRIMARY KEY,
  "quote" text,
  "actor" int
);

CREATE TABLE "Production" (
  "id" SERIAL PRIMARY KEY,
  "name" varchar,
  "address" text,
  "product" int
);

CREATE TABLE "Actor_job" (
  "id" SERIAL PRIMARY KEY,
  "actor_id" int,
  "movie_id" int,
  "actor_role" varchar
);

CREATE TABLE "Director_job" (
  "id" SERIAL PRIMARY KEY,
  "movie_id" int,
  "director_id" int,
  "actor" int,
  "directed_mov" int
);

CREATE TABLE "Production_job" (
  "id" SERIAL PRIMARY KEY,
  "movie_id" int,
  "production_company_id" int,
  "product" int
);

ALTER TABLE "MOVIE" ADD FOREIGN KEY ("genre") REFERENCES "Genre" ("code");

ALTER TABLE "MOVIE" ADD FOREIGN KEY ("quote") REFERENCES "Quote" ("id");

ALTER TABLE "Actor_job" ADD FOREIGN KEY ("movie_id") REFERENCES "MOVIE" ("id");

ALTER TABLE "Actor_job" ADD FOREIGN KEY ("actor_id") REFERENCES "Actor" ("id");

ALTER TABLE "Actor_job" ADD FOREIGN KEY ("actor_role") REFERENCES "Actor" ("role");

ALTER TABLE "MOVIE" ADD FOREIGN KEY ("actor") REFERENCES "Actor_job" ("actor_id");

ALTER TABLE "Director_job" ADD FOREIGN KEY ("movie_id") REFERENCES "MOVIE" ("id");

ALTER TABLE "MOVIE" ADD FOREIGN KEY ("director") REFERENCES "Director_job" ("director_id");

ALTER TABLE "Director" ADD FOREIGN KEY ("directed_mov") REFERENCES "Director_job" ("director_id");

ALTER TABLE "Director" ADD FOREIGN KEY ("act") REFERENCES "Director_job" ("actor");

ALTER TABLE "MOVIE" ADD FOREIGN KEY ("id") REFERENCES "Production_job" ("movie_id");

ALTER TABLE "Production" ADD FOREIGN KEY ("id") REFERENCES "Production_job" ("production_company_id");

ALTER TABLE "MOVIE" ADD FOREIGN KEY ("id") REFERENCES "Production_job" ("product");

ALTER TABLE "Production" ADD FOREIGN KEY ("product") REFERENCES "Production_job" ("product");

ALTER TABLE "Actor_job" ADD FOREIGN KEY ("actor_id") REFERENCES "Quote" ("id");
