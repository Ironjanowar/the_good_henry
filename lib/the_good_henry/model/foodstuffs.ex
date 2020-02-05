defmodule TheGoodHenry.Model.Foodstuffs do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "foodstuffs" do
    field :name, :string
    field :price, :integer
    field :type, :string

    timestamps()
  end

  @doc false
  def changeset(foodstuffs, attrs) do
    foodstuffs
    |> cast(attrs, [:name, :type, :price])
    |> validate_required([:name, :type, :price])
  end
end
