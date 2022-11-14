defmodule Basic.OwnedSkills do
  @moduledoc """
  The OwnedSkills context.
  """

  import Ecto.Query, warn: false
  alias Basic.Repo

  alias Basic.OwnedSkills.OwnedSkill

  @doc """
  Returns the list of owned_skills.

  ## Examples

      iex> list_owned_skills()
      [%OwnedSkill{}, ...]

  """
  def list_owned_skills do
    Repo.all(OwnedSkill)
  end

  @doc """
  Gets a single owned_skill.

  Raises `Ecto.NoResultsError` if the Owned skill does not exist.

  ## Examples

      iex> get_owned_skill!(123)
      %OwnedSkill{}

      iex> get_owned_skill!(456)
      ** (Ecto.NoResultsError)

  """
  def get_owned_skill!(id), do: Repo.get!(OwnedSkill, id)

  @doc """
  Creates a owned_skill.

  ## Examples

      iex> create_owned_skill(%{field: value})
      {:ok, %OwnedSkill{}}

      iex> create_owned_skill(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_owned_skill(attrs \\ %{}) do
    %OwnedSkill{}
    |> OwnedSkill.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a owned_skill.

  ## Examples

      iex> update_owned_skill(owned_skill, %{field: new_value})
      {:ok, %OwnedSkill{}}

      iex> update_owned_skill(owned_skill, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_owned_skill(%OwnedSkill{} = owned_skill, attrs) do
    owned_skill
    |> OwnedSkill.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a owned_skill.

  ## Examples

      iex> delete_owned_skill(owned_skill)
      {:ok, %OwnedSkill{}}

      iex> delete_owned_skill(owned_skill)
      {:error, %Ecto.Changeset{}}

  """
  def delete_owned_skill(%OwnedSkill{} = owned_skill) do
    Repo.delete(owned_skill)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking owned_skill changes.

  ## Examples

      iex> change_owned_skill(owned_skill)
      %Ecto.Changeset{data: %OwnedSkill{}}

  """
  def change_owned_skill(%OwnedSkill{} = owned_skill, attrs \\ %{}) do
    OwnedSkill.changeset(owned_skill, attrs)
  end
end
