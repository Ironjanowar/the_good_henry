defmodule TheGoodHenryWeb.FoodstuffsController do
  use TheGoodHenryWeb, :controller

  alias TheGoodHenry.Model
  alias TheGoodHenry.Model.Foodstuffs

  action_fallback TheGoodHenryWeb.FallbackController

  def index(conn, _params) do
    foodstuffs = Model.list_foodstuffs()
    render(conn, "index.json", foodstuffs: foodstuffs)
  end

  def create(conn, %{"foodstuffs" => foodstuffs_params}) do
    with {:ok, %Foodstuffs{} = foodstuffs} <- Model.create_foodstuffs(foodstuffs_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.foodstuffs_path(conn, :show, foodstuffs))
      |> render("show.json", foodstuffs: foodstuffs)
    end
  end

  def show(conn, %{"id" => id}) do
    foodstuffs = Model.get_foodstuffs!(id)
    render(conn, "show.json", foodstuffs: foodstuffs)
  end

  def update(conn, %{"id" => id, "foodstuffs" => foodstuffs_params}) do
    foodstuffs = Model.get_foodstuffs!(id)

    with {:ok, %Foodstuffs{} = foodstuffs} <- Model.update_foodstuffs(foodstuffs, foodstuffs_params) do
      render(conn, "show.json", foodstuffs: foodstuffs)
    end
  end

  def delete(conn, %{"id" => id}) do
    foodstuffs = Model.get_foodstuffs!(id)

    with {:ok, %Foodstuffs{}} <- Model.delete_foodstuffs(foodstuffs) do
      send_resp(conn, :no_content, "")
    end
  end
end
