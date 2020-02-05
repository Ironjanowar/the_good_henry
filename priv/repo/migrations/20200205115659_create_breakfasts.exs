defmodule TheGoodHenry.Repo.Migrations.CreateBreakfasts do
  use Ecto.Migration

  def change do
    execute("CREATE EXTENSION IF NOT EXISTS \"uuid-ossp\";")

    create table(:breakfasts, primary_key: false) do
      add :id, :binary_id, primary_key: true, default: fragment("uuid_generate_v4()")
      add :user_id, references(:users, on_delete: :nothing, type: :binary_id)
      add :foodstuff_id, references(:foodstuffs, on_delete: :nothing, type: :binary_id)

      timestamps()
    end

    create index(:breakfasts, [:user_id])
    create index(:breakfasts, [:foodstuff_id])
  end
end
