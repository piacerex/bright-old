defmodule Basic.ProjectAssigns do
  @moduledoc """
  The ProjectAssigns context.
  """

  import Ecto.Query, warn: false
  alias Basic.Repo

  alias Basic.ProjectAssigns.ProjectAssign

  @doc """
  Returns the list of project_assigns.

  ## Examples

      iex> list_project_assigns()
      [%ProjectAssign{}, ...]

  """
  def list_project_assigns do
    Repo.all(ProjectAssign)
  end

  @doc """
  Gets a single project_assign.

  Raises `Ecto.NoResultsError` if the Project assign does not exist.

  ## Examples

      iex> get_project_assign!(123)
      %ProjectAssign{}

      iex> get_project_assign!(456)
      ** (Ecto.NoResultsError)

  """
  def get_project_assign!(id), do: Repo.get!(ProjectAssign, id)

  @doc """
  Creates a project_assign.

  ## Examples

      iex> create_project_assign(%{field: value})
      {:ok, %ProjectAssign{}}

      iex> create_project_assign(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_project_assign(attrs \\ %{}) do
    %ProjectAssign{}
    |> ProjectAssign.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a project_assign.

  ## Examples

      iex> update_project_assign(project_assign, %{field: new_value})
      {:ok, %ProjectAssign{}}

      iex> update_project_assign(project_assign, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_project_assign(%ProjectAssign{} = project_assign, attrs) do
    project_assign
    |> ProjectAssign.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a project_assign.

  ## Examples

      iex> delete_project_assign(project_assign)
      {:ok, %ProjectAssign{}}

      iex> delete_project_assign(project_assign)
      {:error, %Ecto.Changeset{}}

  """
  def delete_project_assign(%ProjectAssign{} = project_assign) do
    Repo.delete(project_assign)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking project_assign changes.

  ## Examples

      iex> change_project_assign(project_assign)
      %Ecto.Changeset{data: %ProjectAssign{}}

  """
  def change_project_assign(%ProjectAssign{} = project_assign, attrs \\ %{}) do
    ProjectAssign.changeset(project_assign, attrs)
  end
end
