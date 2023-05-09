DROP TABLE IF EXISTS tasks_labels, tasks, labels, users;

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE labels (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE tasks (
    id SERIAL PRIMARY KEY,
    opened BIGINT NOT NULL DEFAULT extract(epoch from now()), -- время создания задачи
    closed BIGINT DEFAULT 0, -- время выполнения задачи
    author_id INTEGER REFERENCES users(id) DEFAULT 0, -- автор задачи
    assigned_id INTEGER REFERENCES users(id) DEFAULT 0, -- ответственный
    title TEXT NOT NULL, -- название задачи
    content TEXT -- задачи
);

CREATE TABLE tasks_labels (
    task_id INTEGER REFERENCES tasks(id),
    label_id INTEGER REFERENCES labels(id)
);

INSERT INTO users (id, name) VALUES (0, 'default');
INSERT INTO users (id, name) VALUES (1, 'default1');

INSERT INTO tasks (id, opened, author_id, assigned_id, title, content)
VALUES (2, 999, 0, 1, 'title', 'content');
INSERT INTO tasks (id, opened, author_id, assigned_id, title, content)
VALUES (3, 9999, 0, 2, 'id3', 'auth2');
INSERT INTO tasks (id, opened, author_id, assigned_id, title, content)
VALUES (4, 99999, 0, 5, 'id4', 'auth5');
INSERT INTO labels (id, name) VALUES (1, 'label name');
INSERT INTO tasks_labels (task_id, label_id) VALUES (2, 1);

SELECT * FROM tasks;

