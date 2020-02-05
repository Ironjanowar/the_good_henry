defmodule TheGoodHenry.Model.User do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "users" do
    field :alias, :string
    field :name, :string
    field :tg_id, :string

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :tg_id, :alias])
    |> validate_required([:name, :tg_id, :alias])
  end
end
