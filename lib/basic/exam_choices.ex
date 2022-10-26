defmodule Basic.ExamChoices do
  @moduledoc """
  The ExamChoices context.
  """

  import Ecto.Query, warn: false
  alias Basic.Repo

  alias Basic.ExamChoices.ExamChoice

  @doc """
  Returns the list of exam_choices.

  ## Examples

      iex> list_exam_choices()
      [%ExamChoice{}, ...]

  """
  def list_exam_choices do
    Repo.all(ExamChoice)
  end

  @doc """
  Gets a single exam_choice.

  Raises `Ecto.NoResultsError` if the Exam choice does not exist.

  ## Examples

      iex> get_exam_choice!(123)
      %ExamChoice{}

      iex> get_exam_choice!(456)
      ** (Ecto.NoResultsError)

  """
  def get_exam_choice!(id), do: Repo.get!(ExamChoice, id)

  @doc """
  Creates a exam_choice.

  ## Examples

      iex> create_exam_choice(%{field: value})
      {:ok, %ExamChoice{}}

      iex> create_exam_choice(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_exam_choice(attrs \\ %{}) do
    %ExamChoice{}
    |> ExamChoice.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a exam_choice.

  ## Examples

      iex> update_exam_choice(exam_choice, %{field: new_value})
      {:ok, %ExamChoice{}}

      iex> update_exam_choice(exam_choice, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_exam_choice(%ExamChoice{} = exam_choice, attrs) do
    exam_choice
    |> ExamChoice.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a exam_choice.

  ## Examples

      iex> delete_exam_choice(exam_choice)
      {:ok, %ExamChoice{}}

      iex> delete_exam_choice(exam_choice)
      {:error, %Ecto.Changeset{}}

  """
  def delete_exam_choice(%ExamChoice{} = exam_choice) do
    Repo.delete(exam_choice)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking exam_choice changes.

  ## Examples

      iex> change_exam_choice(exam_choice)
      %Ecto.Changeset{data: %ExamChoice{}}

  """
  def change_exam_choice(%ExamChoice{} = exam_choice, attrs \\ %{}) do
    ExamChoice.changeset(exam_choice, attrs)
  end
end
