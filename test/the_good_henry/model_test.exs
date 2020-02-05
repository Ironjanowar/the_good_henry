defmodule TheGoodHenry.ModelTest do
  use TheGoodHenry.DataCase

  alias TheGoodHenry.Model

  describe "foodstuffs" do
    alias TheGoodHenry.Model.Foodstuffs

    @valid_attrs %{name: "some name", price: 42, type: "some type"}
    @update_attrs %{name: "some updated name", price: 43, type: "some updated type"}
    @invalid_attrs %{name: nil, price: nil, type: nil}

    def foodstuffs_fixture(attrs \\ %{}) do
      {:ok, foodstuffs} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Model.create_foodstuffs()

      foodstuffs
    end

    test "list_foodstuffs/0 returns all foodstuffs" do
      foodstuffs = foodstuffs_fixture()
      assert Model.list_foodstuffs() == [foodstuffs]
    end

    test "get_foodstuffs!/1 returns the foodstuffs with given id" do
      foodstuffs = foodstuffs_fixture()
      assert Model.get_foodstuffs!(foodstuffs.id) == foodstuffs
    end

    test "create_foodstuffs/1 with valid data creates a foodstuffs" do
      assert {:ok, %Foodstuffs{} = foodstuffs} = Model.create_foodstuffs(@valid_attrs)
      assert foodstuffs.name == "some name"
      assert foodstuffs.price == 42
      assert foodstuffs.type == "some type"
    end

    test "create_foodstuffs/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Model.create_foodstuffs(@invalid_attrs)
    end

    test "update_foodstuffs/2 with valid data updates the foodstuffs" do
      foodstuffs = foodstuffs_fixture()
      assert {:ok, %Foodstuffs{} = foodstuffs} = Model.update_foodstuffs(foodstuffs, @update_attrs)
      assert foodstuffs.name == "some updated name"
      assert foodstuffs.price == 43
      assert foodstuffs.type == "some updated type"
    end

    test "update_foodstuffs/2 with invalid data returns error changeset" do
      foodstuffs = foodstuffs_fixture()
      assert {:error, %Ecto.Changeset{}} = Model.update_foodstuffs(foodstuffs, @invalid_attrs)
      assert foodstuffs == Model.get_foodstuffs!(foodstuffs.id)
    end

    test "delete_foodstuffs/1 deletes the foodstuffs" do
      foodstuffs = foodstuffs_fixture()
      assert {:ok, %Foodstuffs{}} = Model.delete_foodstuffs(foodstuffs)
      assert_raise Ecto.NoResultsError, fn -> Model.get_foodstuffs!(foodstuffs.id) end
    end

    test "change_foodstuffs/1 returns a foodstuffs changeset" do
      foodstuffs = foodstuffs_fixture()
      assert %Ecto.Changeset{} = Model.change_foodstuffs(foodstuffs)
    end
  end

  describe "users" do
    alias TheGoodHenry.Model.User

    @valid_attrs %{alias: "some alias", name: "some name", tg_id: "some tg_id"}
    @update_attrs %{alias: "some updated alias", name: "some updated name", tg_id: "some updated tg_id"}
    @invalid_attrs %{alias: nil, name: nil, tg_id: nil}

    def user_fixture(attrs \\ %{}) do
      {:ok, user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Model.create_user()

      user
    end

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Model.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Model.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      assert {:ok, %User{} = user} = Model.create_user(@valid_attrs)
      assert user.alias == "some alias"
      assert user.name == "some name"
      assert user.tg_id == "some tg_id"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Model.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      assert {:ok, %User{} = user} = Model.update_user(user, @update_attrs)
      assert user.alias == "some updated alias"
      assert user.name == "some updated name"
      assert user.tg_id == "some updated tg_id"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Model.update_user(user, @invalid_attrs)
      assert user == Model.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Model.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Model.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Model.change_user(user)
    end
  end

  describe "breakfasts" do
    alias TheGoodHenry.Model.Breakfast

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def breakfast_fixture(attrs \\ %{}) do
      {:ok, breakfast} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Model.create_breakfast()

      breakfast
    end

    test "list_breakfasts/0 returns all breakfasts" do
      breakfast = breakfast_fixture()
      assert Model.list_breakfasts() == [breakfast]
    end

    test "get_breakfast!/1 returns the breakfast with given id" do
      breakfast = breakfast_fixture()
      assert Model.get_breakfast!(breakfast.id) == breakfast
    end

    test "create_breakfast/1 with valid data creates a breakfast" do
      assert {:ok, %Breakfast{} = breakfast} = Model.create_breakfast(@valid_attrs)
    end

    test "create_breakfast/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Model.create_breakfast(@invalid_attrs)
    end

    test "update_breakfast/2 with valid data updates the breakfast" do
      breakfast = breakfast_fixture()
      assert {:ok, %Breakfast{} = breakfast} = Model.update_breakfast(breakfast, @update_attrs)
    end

    test "update_breakfast/2 with invalid data returns error changeset" do
      breakfast = breakfast_fixture()
      assert {:error, %Ecto.Changeset{}} = Model.update_breakfast(breakfast, @invalid_attrs)
      assert breakfast == Model.get_breakfast!(breakfast.id)
    end

    test "delete_breakfast/1 deletes the breakfast" do
      breakfast = breakfast_fixture()
      assert {:ok, %Breakfast{}} = Model.delete_breakfast(breakfast)
      assert_raise Ecto.NoResultsError, fn -> Model.get_breakfast!(breakfast.id) end
    end

    test "change_breakfast/1 returns a breakfast changeset" do
      breakfast = breakfast_fixture()
      assert %Ecto.Changeset{} = Model.change_breakfast(breakfast)
    end
  end
end
