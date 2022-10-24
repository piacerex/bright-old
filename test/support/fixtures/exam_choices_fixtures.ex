defmodule Basic.ExamChoicesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Basic.ExamChoices` context.
  """

  @doc """
  Generate a exam_choice.
  """
  def exam_choice_fixture(attrs \\ %{}) do
    {:ok, exam_choice} =
      attrs
      |> Enum.into(%{
        correct: "some correct",
        description: "some description",
        explain: "some explain",
        title: "some title",
        wrong1: "some wrong1",
        wrong2: "some wrong2",
        wrong3: "some wrong3"
      })
      |> Basic.ExamChoices.create_exam_choice()

    exam_choice
  end
end
