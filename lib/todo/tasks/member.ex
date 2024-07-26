defmodule Todo.Tasks.Member do
  use Ecto.Schema
  import Ecto.Changeset

  schema "members" do

    field :user_id, :id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(member, attrs) do
    member
    |> cast(attrs, [])
    |> validate_required([])
  end
end
