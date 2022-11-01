CREATE TABLE "visitor_user" (
  "id" SERIAL PRIMARY KEY,
  "name" varchar,
  "email" varchar,
  "password" varchar NOT NULL,
  "age" int
);

CREATE TABLE "post" (
  "id" SERIAL PRIMARY KEY,
  "title" varchar,
  "description" varchar,
  "content" varachar,
  "visitor_user_id" int,
  "author_id" int
);

CREATE TABLE "category" (
  "id" SERIAL PRIMARY KEY,
  "name" varchar
);

CREATE TABLE "coment" (
  "id" SERIAL PRIMARY KEY,
  "name" varchar,
  "post_id" int
);

CREATE TABLE "post_category" (
  "id" SERIAL PRIMARY KEY,
  "post_id" int,
  "category_id" int
);

CREATE TABLE "author" (
  "id" SERIAL PRIMARY KEY,
  "name" varchar
);

ALTER TABLE "post_category" ADD FOREIGN KEY ("post_id") REFERENCES "post" ("id");

ALTER TABLE "category" ADD FOREIGN KEY ("id") REFERENCES "post_category" ("category_id");

ALTER TABLE "author" ADD FOREIGN KEY ("id") REFERENCES "post" ("author_id");

ALTER TABLE "post" ADD FOREIGN KEY ("visitor_user_id") REFERENCES "visitor_user" ("id");

ALTER TABLE "coment" ADD FOREIGN KEY ("post_id") REFERENCES "post" ("id");


INSERT INTO visitor_user ("name","email","password","age")
VALUES
('Eliza','sanchezelizabeth99@gmail.com','123456',25),   // id = 1
('Joeslit','joeslit@gmail.com','123456',10),
('Eylit','eylit@gmail.com','123456',22),
('sophie','sophie99@@gmail.com','123456',14);

INSERT INTO category ("name")
VALUES
('Deporte'),         //1
('Personal'),        //2
('Noticia'),        //3
('Musica');         //4

INSERT INTO post_category ("post_id","category_id")
VALUES
(1,1),
(2,1),
(3,1),
(4,2);

INSERT INTO post ("title", "description","content" ,"visitor_user_id","author_id")
VALUES 
('Mundo Deportivo','El deporte extremo',"Las aventuras de Sam Baker, lo llevaron a escalar El Capitán en el Parque Nacional Yosemite de California. A sus 8 años, este pequeño de Colorado se convierte en la persona más joven.",1,1), //1
('Mundo Deportivo','El deporte extremo',"Las aventuras de Sam Baker, lo llevaron a escalar El Capitán en el Parque Nacional Yosemite de California. A sus 8 años, este pequeño de Colorado se convierte en la persona más joven.",2,1), // 2
('Mundo Deportivo','El deporte extremo',"Las aventuras de Sam Baker, lo llevaron a escalar El Capitán en el Parque Nacional Yosemite de California. A sus 8 años, este pequeño de Colorado se convierte en la persona más joven.",3,1), //3
('Desarrollo Personal','Bienestar',"Cuatro Pasos para el Perdón: Una forma ponderosa para la libertad, felicidad y el éxito. Aprender a perdonar sólo puede ayudarte; no puede hacerte daño",4,2); //4



INSERT INTO coment ("name","post_id")
VALUES
 ('Comentario 1',1),
('Comentario 2',2),
('Comentario 3',3),
('Comentario 4',1),
('Comentario 5',4);

INSERT INTO author ("name")
VALUES
('Editor Deporte'),         //1
('Editor Bienestar'),        //2
('Editor Noticiero');        //3
