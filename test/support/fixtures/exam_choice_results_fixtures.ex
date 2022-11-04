defmodule Basic.ExamChoiceResultsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Basic.ExamChoiceResults` context.
  """

  @doc """
  Generate a exam_choice_result.
  """
  def exam_choice_result_fixture(attrs \\ %{}) do
    {:ok, exam_choice_result} =
      attrs
      |> Enum.into(%{
        account_id: 42,
        exam_choice_id: 42,
        exam_count: 42,
        pass: true
      })
      |> Basic.ExamChoiceResults.create_exam_choice_result()

    exam_choice_result
  end
end
