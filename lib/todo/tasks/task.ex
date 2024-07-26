defmodule Todo.Tasks.Task do
  use Ecto.Schema
  import Ecto.Changeset

  schema "tasks" do
    field :date, :date
    field :title, :string
    belongs_to :user, Todo.Accounts.User

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(task, attrs) do
    task
    |> cast(attrs, [:title, :date])
    |> validate_required([:title, :date])
  end
end
