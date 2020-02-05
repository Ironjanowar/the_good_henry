defmodule TheGoodHenryWeb.FoodstuffsView do
  use TheGoodHenryWeb, :view
  alias TheGoodHenryWeb.FoodstuffsView

  def render("index.json", %{foodstuffs: foodstuffs}) do
    %{data: render_many(foodstuffs, FoodstuffsView, "foodstuffs.json")}
  end

  def render("show.json", %{foodstuffs: foodstuffs}) do
    %{data: render_one(foodstuffs, FoodstuffsView, "foodstuffs.json")}
  end

  def render("foodstuffs.json", %{foodstuffs: foodstuffs}) do
    %{id: foodstuffs.id,
      name: foodstuffs.name,
      type: foodstuffs.type,
      price: foodstuffs.price}
  end
end
