defmodule TheGoodHenryWeb.UserView do
  use TheGoodHenryWeb, :view
  alias TheGoodHenryWeb.UserView

  def render("index.json", %{users: users}) do
    %{data: render_many(users, UserView, "user.json")}
  end

  def render("show.json", %{user: user}) do
    %{data: render_one(user, UserView, "user.json")}
  end

  def render("user.json", %{user: user}) do
    %{id: user.id,
      name: user.name,
      tg_id: user.tg_id,
      alias: user.alias}
  end
end
