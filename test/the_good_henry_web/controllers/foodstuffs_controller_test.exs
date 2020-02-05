defmodule TheGoodHenryWeb.FoodstuffsControllerTest do
  use TheGoodHenryWeb.ConnCase

  alias TheGoodHenry.Model
  alias TheGoodHenry.Model.Foodstuffs

  @create_attrs %{
    name: "some name",
    price: 42,
    type: "some type"
  }
  @update_attrs %{
    name: "some updated name",
    price: 43,
    type: "some updated type"
  }
  @invalid_attrs %{name: nil, price: nil, type: nil}

  def fixture(:foodstuffs) do
    {:ok, foodstuffs} = Model.create_foodstuffs(@create_attrs)
    foodstuffs
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all foodstuffs", %{conn: conn} do
      conn = get(conn, Routes.foodstuffs_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create foodstuffs" do
    test "renders foodstuffs when data is valid", %{conn: conn} do
      conn = post(conn, Routes.foodstuffs_path(conn, :create), foodstuffs: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.foodstuffs_path(conn, :show, id))

      assert %{
               "id" => id,
               "name" => "some name",
               "price" => 42,
               "type" => "some type"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.foodstuffs_path(conn, :create), foodstuffs: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update foodstuffs" do
    setup [:create_foodstuffs]

    test "renders foodstuffs when data is valid", %{conn: conn, foodstuffs: %Foodstuffs{id: id} = foodstuffs} do
      conn = put(conn, Routes.foodstuffs_path(conn, :update, foodstuffs), foodstuffs: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.foodstuffs_path(conn, :show, id))

      assert %{
               "id" => id,
               "name" => "some updated name",
               "price" => 43,
               "type" => "some updated type"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, foodstuffs: foodstuffs} do
      conn = put(conn, Routes.foodstuffs_path(conn, :update, foodstuffs), foodstuffs: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete foodstuffs" do
    setup [:create_foodstuffs]

    test "deletes chosen foodstuffs", %{conn: conn, foodstuffs: foodstuffs} do
      conn = delete(conn, Routes.foodstuffs_path(conn, :delete, foodstuffs))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.foodstuffs_path(conn, :show, foodstuffs))
      end
    end
  end

  defp create_foodstuffs(_) do
    foodstuffs = fixture(:foodstuffs)
    {:ok, foodstuffs: foodstuffs}
  end
end
