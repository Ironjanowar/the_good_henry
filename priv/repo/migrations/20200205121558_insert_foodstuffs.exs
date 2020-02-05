defmodule TheGoodHenry.Repo.Migrations.InsertFoodstuffs do
  use Ecto.Migration

  def up do
    execute("""
    INSERT INTO
      foodstuffs (name, type, inserted_at, updated_at)
    VALUES
      ('Café con leche', 'drink', NOW(), NOW()),
      ('Café solo largo', 'drink', NOW(), NOW()),
      ('Café solo', 'drink', NOW(), NOW()),
      ('Café con hielo', 'drink', NOW(), NOW()),
      ('Café americano', 'drink', NOW(), NOW()),
      ('ColaCao', 'drink', NOW(), NOW()),
      ('ColaCao frío', 'drink', NOW(), NOW()),
      ('Barrita con tomate', 'food', NOW(), NOW()),
      ('Barrita sin', 'food', NOW(), NOW()),
      ('Mixto huevo', 'food', NOW(), NOW()),
      ('Mixto huevo muy hecho', 'food', NOW(), NOW()),
      ('Croissant plancha', 'food', NOW(), NOW()),
      ('Croissant mixto', 'food', NOW(), NOW()),
      ('Pincho tortilla', 'food', NOW(), NOW()),
      ('Napolitana', 'food', NOW(), NOW())
    """)
  end

  def down do
    execute("TRUNCATE TABLE foodstuffs")
  end
end
