defmodule TheGoodHenry.Repo.Migrations.CreateFoodstuffs do
  use Ecto.Migration

  def change do
    execute("CREATE EXTENSION IF NOT EXISTS \"uuid-ossp\";")

    create table(:foodstuffs, primary_key: false) do
      add :id, :binary_id, primary_key: true, default: fragment("uuid_generate_v4()")
      add :name, :string, null: false
      add :type, :string, null: false
      add :price, :integer

      timestamps()
    end

  end
end
