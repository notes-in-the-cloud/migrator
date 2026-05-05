CREATE SCHEMA IF NOT EXISTS todo;

CREATE TABLE IF NOT EXISTS todo.todo_lists (
    id UUID PRIMARY KEY,
    user_id UUID NOT NULL,
    title VARCHAR(255) NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS todo.todo_tasks (
    id UUID PRIMARY KEY,
    list_id UUID NULL,
    user_id UUID NOT NULL,
    title VARCHAR(255) NOT NULL,
    done BOOLEAN NOT NULL DEFAULT FALSE,
    priority VARCHAR(20) NOT NULL DEFAULT 'MEDIUM',
    due_date TIMESTAMP NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_todo_task_list
        FOREIGN KEY (list_id)
        REFERENCES todo.todo_lists(id)
        ON DELETE SET NULL
);

CREATE INDEX IF NOT EXISTS idx_todo_lists_user_id
    ON todo.todo_lists(user_id);

CREATE INDEX IF NOT EXISTS idx_todo_tasks_user_id
    ON todo.todo_tasks(user_id);

CREATE INDEX IF NOT EXISTS idx_todo_tasks_list_id
    ON todo.todo_tasks(list_id);

CREATE INDEX IF NOT EXISTS idx_todo_tasks_user_done_list
    ON todo.todo_tasks(user_id, done, list_id);