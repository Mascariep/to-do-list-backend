-- Active: 1674653434556@@127.0.0.1@3306

-----------------------------------------------
--CRIAÇÃO DAS TABELAS

CREATE TABLE users (
    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL,
    password TEXT NOT NULL
);

CREATE TABLE tasks (
    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    title TEXT NOT NULL,
    description TEXT NOT NULL,
    created_at TEXT DEFAULT (DATETIME()) NOT NULL,
    status INTEGER DEFAULT (0) NOT NULL
);

CREATE TABLE users_tasks (
    user_id TEXT NOT NULL,
    task_id TEXT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users (id),
    FOREIGN KEY (task_id) REFERENCES tasks (id) ON UPDATE CASCADE
);

---------------------------------------------------
--POPULANDO AS TABELAS

INSERT INTO users (id, name, email, password)
VALUES
	("f001", "Fulano", "fulano@email.com", "fulano123"),
	("f002", "Beltrana", "beltrana@email.com", "beltrana00");

INSERT INTO tasks (id, title, description)
VALUES
	("t001", "Implementar o header", "Criar o componente Header do site"),
	("t002", "Implementar o footer", "Criar o componente Footer do site"),
	("t003", "Testar site", "Teste de usabilidade de todo o site"),
	("t004", "Deploy do site", "Subir o site no surge");

INSERT INTO users_tasks (user_id, task_id)
VALUES
	("f001", "t001"),
	("f002", "t002"),
	("f001", "t003"),
	("f002", "t003");

----------------------------------------------------
--VISUALIZAR AS TABELAS CRIADAS

SELECT * FROM users;
SELECT * FROM tasks;
SELECT * FROM users_tasks;

----------------------------------------------------
--DELETANDO AS TABELAS

DROP TABLE users;
DROP TABLE tasks;
DROP TABLE users_tasks;

----------------------------------------------------
--RELAÇÕES DE TABELAS

SELECT * FROM users_tasks
INNER JOIN users
ON users_tasks.user_id = users.id
RIGHT JOIN tasks
ON users_tasks.task_id = tasks.id;

SELECT * FROM tasks
LEFT JOIN users_tasks
ON users_tasks.task_id = tasks.id
LEFT JOIN users
ON users_tasks.user_id = users.id;
