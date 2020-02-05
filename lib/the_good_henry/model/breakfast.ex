defmodule TheGoodHenry.Model.Breakfast do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "breakfasts" do
    field :user_id, :binary_id
    field :foodstuff_id, :binary_id

    timestamps()
  end

  @doc false
  def changeset(breakfast, attrs) do
    breakfast
    |> cast(attrs, [])
    |> validate_required([])
  end
end
