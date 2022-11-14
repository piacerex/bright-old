defmodule Basic.ExamChoiceResults do
  @moduledoc """
  The ExamChoiceResults context.
  """

  import Ecto.Query, warn: false
  alias Basic.Repo

  alias Basic.ExamChoiceResults.ExamChoiceResult

  @doc """
  Returns the list of exam_choice_results.

  ## Examples

      iex> list_exam_choice_results()
      [%ExamChoiceResult{}, ...]

  """
  def list_exam_choice_results do
    Repo.all(ExamChoiceResult)
  end

  @doc """
  Gets a single exam_choice_result.

  Raises `Ecto.NoResultsError` if the Exam choice result does not exist.

  ## Examples

      iex> get_exam_choice_result!(123)
      %ExamChoiceResult{}

      iex> get_exam_choice_result!(456)
      ** (Ecto.NoResultsError)

  """
  def get_exam_choice_result!(id), do: Repo.get!(ExamChoiceResult, id)

  @doc """
  Creates a exam_choice_result.

  ## Examples

      iex> create_exam_choice_result(%{field: value})
      {:ok, %ExamChoiceResult{}}

      iex> create_exam_choice_result(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_exam_choice_result(attrs \\ %{}) do
    %ExamChoiceResult{}
    |> ExamChoiceResult.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a exam_choice_result.

  ## Examples

      iex> update_exam_choice_result(exam_choice_result, %{field: new_value})
      {:ok, %ExamChoiceResult{}}

      iex> update_exam_choice_result(exam_choice_result, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_exam_choice_result(%ExamChoiceResult{} = exam_choice_result, attrs) do
    exam_choice_result
    |> ExamChoiceResult.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a exam_choice_result.

  ## Examples

      iex> delete_exam_choice_result(exam_choice_result)
      {:ok, %ExamChoiceResult{}}

      iex> delete_exam_choice_result(exam_choice_result)
      {:error, %Ecto.Changeset{}}

  """
  def delete_exam_choice_result(%ExamChoiceResult{} = exam_choice_result) do
    Repo.delete(exam_choice_result)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking exam_choice_result changes.

  ## Examples

      iex> change_exam_choice_result(exam_choice_result)
      %Ecto.Changeset{data: %ExamChoiceResult{}}

  """
  def change_exam_choice_result(%ExamChoiceResult{} = exam_choice_result, attrs \\ %{}) do
    ExamChoiceResult.changeset(exam_choice_result, attrs)
  end
end
