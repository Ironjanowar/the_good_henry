defmodule TheGoodHenryWeb.BreakfastControllerTest do
  use TheGoodHenryWeb.ConnCase

  alias TheGoodHenry.Model
  alias TheGoodHenry.Model.Breakfast

  @create_attrs %{

  }
  @update_attrs %{

  }
  @invalid_attrs %{}

  def fixture(:breakfast) do
    {:ok, breakfast} = Model.create_breakfast(@create_attrs)
    breakfast
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all breakfasts", %{conn: conn} do
      conn = get(conn, Routes.breakfast_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create breakfast" do
    test "renders breakfast when data is valid", %{conn: conn} do
      conn = post(conn, Routes.breakfast_path(conn, :create), breakfast: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.breakfast_path(conn, :show, id))

      assert %{
               "id" => id
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.breakfast_path(conn, :create), breakfast: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update breakfast" do
    setup [:create_breakfast]

    test "renders breakfast when data is valid", %{conn: conn, breakfast: %Breakfast{id: id} = breakfast} do
      conn = put(conn, Routes.breakfast_path(conn, :update, breakfast), breakfast: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.breakfast_path(conn, :show, id))

      assert %{
               "id" => id
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, breakfast: breakfast} do
      conn = put(conn, Routes.breakfast_path(conn, :update, breakfast), breakfast: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete breakfast" do
    setup [:create_breakfast]

    test "deletes chosen breakfast", %{conn: conn, breakfast: breakfast} do
      conn = delete(conn, Routes.breakfast_path(conn, :delete, breakfast))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.breakfast_path(conn, :show, breakfast))
      end
    end
  end

  defp create_breakfast(_) do
    breakfast = fixture(:breakfast)
    {:ok, breakfast: breakfast}
  end
end
