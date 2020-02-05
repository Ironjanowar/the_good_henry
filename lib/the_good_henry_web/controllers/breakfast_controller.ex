defmodule TheGoodHenryWeb.BreakfastController do
  use TheGoodHenryWeb, :controller

  alias TheGoodHenry.Model
  alias TheGoodHenry.Model.Breakfast

  action_fallback TheGoodHenryWeb.FallbackController

  def index(conn, _params) do
    breakfasts = Model.list_breakfasts()
    render(conn, "index.json", breakfasts: breakfasts)
  end

  def create(conn, %{"breakfast" => breakfast_params}) do
    with {:ok, %Breakfast{} = breakfast} <- Model.create_breakfast(breakfast_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.breakfast_path(conn, :show, breakfast))
      |> render("show.json", breakfast: breakfast)
    end
  end

  def show(conn, %{"id" => id}) do
    breakfast = Model.get_breakfast!(id)
    render(conn, "show.json", breakfast: breakfast)
  end

  def update(conn, %{"id" => id, "breakfast" => breakfast_params}) do
    breakfast = Model.get_breakfast!(id)

    with {:ok, %Breakfast{} = breakfast} <- Model.update_breakfast(breakfast, breakfast_params) do
      render(conn, "show.json", breakfast: breakfast)
    end
  end

  def delete(conn, %{"id" => id}) do
    breakfast = Model.get_breakfast!(id)

    with {:ok, %Breakfast{}} <- Model.delete_breakfast(breakfast) do
      send_resp(conn, :no_content, "")
    end
  end
end
