defmodule Todo.Repo.Migrations.AddUserId do
  use Ecto.Migration

  def change do
    # alter table(:users_tokens) do
    #   add :user_id, references(:users)
    # end
    alter table(:tasks) do
      add :user_id, references(:users)
    end
  end
end
