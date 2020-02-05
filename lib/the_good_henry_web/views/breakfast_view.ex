defmodule TheGoodHenryWeb.BreakfastView do
  use TheGoodHenryWeb, :view
  alias TheGoodHenryWeb.BreakfastView

  def render("index.json", %{breakfasts: breakfasts}) do
    %{data: render_many(breakfasts, BreakfastView, "breakfast.json")}
  end

  def render("show.json", %{breakfast: breakfast}) do
    %{data: render_one(breakfast, BreakfastView, "breakfast.json")}
  end

  def render("breakfast.json", %{breakfast: breakfast}) do
    %{id: breakfast.id}
  end
end
