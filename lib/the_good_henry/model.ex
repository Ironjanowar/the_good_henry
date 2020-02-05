defmodule TheGoodHenry.Model do
  @moduledoc """
  The Model context.
  """

  import Ecto.Query, warn: false
  alias TheGoodHenry.Repo

  alias TheGoodHenry.Model.Foodstuffs

  @doc """
  Returns the list of foodstuffs.

  ## Examples

      iex> list_foodstuffs()
      [%Foodstuffs{}, ...]

  """
  def list_foodstuffs do
    Repo.all(Foodstuffs)
  end

  @doc """
  Gets a single foodstuffs.

  Raises `Ecto.NoResultsError` if the Foodstuffs does not exist.

  ## Examples

      iex> get_foodstuffs!(123)
      %Foodstuffs{}

      iex> get_foodstuffs!(456)
      ** (Ecto.NoResultsError)

  """
  def get_foodstuffs!(id), do: Repo.get!(Foodstuffs, id)

  @doc """
  Creates a foodstuffs.

  ## Examples

      iex> create_foodstuffs(%{field: value})
      {:ok, %Foodstuffs{}}

      iex> create_foodstuffs(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_foodstuffs(attrs \\ %{}) do
    %Foodstuffs{}
    |> Foodstuffs.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a foodstuffs.

  ## Examples

      iex> update_foodstuffs(foodstuffs, %{field: new_value})
      {:ok, %Foodstuffs{}}

      iex> update_foodstuffs(foodstuffs, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_foodstuffs(%Foodstuffs{} = foodstuffs, attrs) do
    foodstuffs
    |> Foodstuffs.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a foodstuffs.

  ## Examples

      iex> delete_foodstuffs(foodstuffs)
      {:ok, %Foodstuffs{}}

      iex> delete_foodstuffs(foodstuffs)
      {:error, %Ecto.Changeset{}}

  """
  def delete_foodstuffs(%Foodstuffs{} = foodstuffs) do
    Repo.delete(foodstuffs)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking foodstuffs changes.

  ## Examples

      iex> change_foodstuffs(foodstuffs)
      %Ecto.Changeset{source: %Foodstuffs{}}

  """
  def change_foodstuffs(%Foodstuffs{} = foodstuffs) do
    Foodstuffs.changeset(foodstuffs, %{})
  end

  alias TheGoodHenry.Model.User

  @doc """
  Returns the list of users.

  ## Examples

      iex> list_users()
      [%User{}, ...]

  """
  def list_users do
    Repo.all(User)
  end

  @doc """
  Gets a single user.

  Raises `Ecto.NoResultsError` if the User does not exist.

  ## Examples

      iex> get_user!(123)
      %User{}

      iex> get_user!(456)
      ** (Ecto.NoResultsError)

  """
  def get_user!(id), do: Repo.get!(User, id)

  @doc """
  Creates a user.

  ## Examples

      iex> create_user(%{field: value})
      {:ok, %User{}}

      iex> create_user(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_user(attrs \\ %{}) do
    %User{}
    |> User.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a user.

  ## Examples

      iex> update_user(user, %{field: new_value})
      {:ok, %User{}}

      iex> update_user(user, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_user(%User{} = user, attrs) do
    user
    |> User.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a user.

  ## Examples

      iex> delete_user(user)
      {:ok, %User{}}

      iex> delete_user(user)
      {:error, %Ecto.Changeset{}}

  """
  def delete_user(%User{} = user) do
    Repo.delete(user)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking user changes.

  ## Examples

      iex> change_user(user)
      %Ecto.Changeset{source: %User{}}

  """
  def change_user(%User{} = user) do
    User.changeset(user, %{})
  end

  alias TheGoodHenry.Model.Breakfast

  @doc """
  Returns the list of breakfasts.

  ## Examples

      iex> list_breakfasts()
      [%Breakfast{}, ...]

  """
  def list_breakfasts do
    Repo.all(Breakfast)
  end

  @doc """
  Gets a single breakfast.

  Raises `Ecto.NoResultsError` if the Breakfast does not exist.

  ## Examples

      iex> get_breakfast!(123)
      %Breakfast{}

      iex> get_breakfast!(456)
      ** (Ecto.NoResultsError)

  """
  def get_breakfast!(id), do: Repo.get!(Breakfast, id)

  @doc """
  Creates a breakfast.

  ## Examples

      iex> create_breakfast(%{field: value})
      {:ok, %Breakfast{}}

      iex> create_breakfast(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_breakfast(attrs \\ %{}) do
    %Breakfast{}
    |> Breakfast.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a breakfast.

  ## Examples

      iex> update_breakfast(breakfast, %{field: new_value})
      {:ok, %Breakfast{}}

      iex> update_breakfast(breakfast, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_breakfast(%Breakfast{} = breakfast, attrs) do
    breakfast
    |> Breakfast.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a breakfast.

  ## Examples

      iex> delete_breakfast(breakfast)
      {:ok, %Breakfast{}}

      iex> delete_breakfast(breakfast)
      {:error, %Ecto.Changeset{}}

  """
  def delete_breakfast(%Breakfast{} = breakfast) do
    Repo.delete(breakfast)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking breakfast changes.

  ## Examples

      iex> change_breakfast(breakfast)
      %Ecto.Changeset{source: %Breakfast{}}

  """
  def change_breakfast(%Breakfast{} = breakfast) do
    Breakfast.changeset(breakfast, %{})
  end
end
