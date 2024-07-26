defmodule TodoWeb.TaskController do
  use TodoWeb, :controller

  alias Todo.Tasks

  def list(conn, _params) do
    tasks = Tasks.get_tasks()

    render(conn, :list, tasks: tasks)
  end

  def new(conn, _params) do
    cs = Tasks.change_tasks(%Tasks.Task{})

    render(conn, :new, changeset: cs)
  end

  def create(conn, %{"task" => task_params}) do
    case Tasks.create_task(task_params) do
      {:ok, task} ->
        conn
        |> put_flash(:info, "Task created successfully.")
        |> redirect(to: ~p"/tasks/#{task}")

      {:error, cs} ->
          render(conn, :new, changeset: cs)
    end
  end

  def detail(conn, %{"id" => id}) do
    task = Tasks.get_task!(id)

    render(conn, :detail, task: task)
end




      def edit(conn, %{"id" => id}) do
        task = Tasks.get_task!(id)
        cs = Tasks.change_task(task)

        render(conn, :edit, task: task, changeset: cs)
      end

      def update(conn, %{"id" => id, "task" => params}) do
        task = Tasks.get_task!(id)
        case Tasks.update_task(task, params) do
          {:ok, task} ->
            conn
            |> put_flash(:info, "Task updated successfully.")
            |> redirect(to: ~p"/tasks/#{task}")

          {:error, cs} ->
              render(conn, :edit, task: task, changeset: cs)
        end

      end

      def delete(conn, %{"id" => id}) do
        task = Tasks.get_task!(id)

          {:ok, _task} = Tasks.delete_task(task)
            conn
            |> put_flash(:info, "Task deleted successfully.")
            |> redirect(to: ~p"/tasks")


        end

      end
