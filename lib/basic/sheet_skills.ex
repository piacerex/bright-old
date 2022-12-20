defmodule Basic.SheetSkills do
  @moduledoc """
  The SheetSkills context.
  """

  import Ecto.Query, warn: false
  alias Basic.Repo

  alias Basic.SheetSkills.SheetSkill

  @doc """
  Returns the list of sheet_skills.

  ## Examples

      iex> list_sheet_skills()
      [%SheetSkill{}, ...]

  """
  def list_sheet_skills do
    Repo.all(SheetSkill)
  end

  @doc """
  Gets a single sheet_skill.

  Raises `Ecto.NoResultsError` if the Sheet skill does not exist.

  ## Examples

      iex> get_sheet_skill!(123)
      %SheetSkill{}

      iex> get_sheet_skill!(456)
      ** (Ecto.NoResultsError)

  """
  def get_sheet_skill!(id), do: Repo.get!(SheetSkill, id)

  @doc """
  Creates a sheet_skill.

  ## Examples

      iex> create_sheet_skill(%{field: value})
      {:ok, %SheetSkill{}}

      iex> create_sheet_skill(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_sheet_skill(attrs \\ %{}) do
    %SheetSkill{}
    |> SheetSkill.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a sheet_skill.

  ## Examples

      iex> update_sheet_skill(sheet_skill, %{field: new_value})
      {:ok, %SheetSkill{}}

      iex> update_sheet_skill(sheet_skill, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_sheet_skill(%SheetSkill{} = sheet_skill, attrs) do
    sheet_skill
    |> SheetSkill.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a sheet_skill.

  ## Examples

      iex> delete_sheet_skill(sheet_skill)
      {:ok, %SheetSkill{}}

      iex> delete_sheet_skill(sheet_skill)
      {:error, %Ecto.Changeset{}}

  """
  def delete_sheet_skill(%SheetSkill{} = sheet_skill) do
    Repo.delete(sheet_skill)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking sheet_skill changes.

  ## Examples

      iex> change_sheet_skill(sheet_skill)
      %Ecto.Changeset{data: %SheetSkill{}}

  """
  def change_sheet_skill(%SheetSkill{} = sheet_skill, attrs \\ %{}) do
    SheetSkill.changeset(sheet_skill, attrs)
  end
end
