BEGIN;

DROP INDEX IF EXISTS todo.idx_todo_tasks_user_done_list;
DROP INDEX IF EXISTS todo.idx_todo_tasks_list_id;
DROP INDEX IF EXISTS todo.idx_todo_tasks_user_id;
DROP INDEX IF EXISTS todo.idx_todo_lists_user_id;

DROP TABLE IF EXISTS todo.todo_tasks;
DROP TABLE IF EXISTS todo.todo_lists;

DROP SCHEMA IF EXISTS todo;

COMMIT;