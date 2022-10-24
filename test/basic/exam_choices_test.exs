defmodule Basic.ExamChoicesTest do
  use Basic.DataCase

  alias Basic.ExamChoices

  describe "exam_choices" do
    alias Basic.ExamChoices.ExamChoice

    import Basic.ExamChoicesFixtures

    @invalid_attrs %{correct: nil, description: nil, explain: nil, title: nil, wrong1: nil, wrong2: nil, wrong3: nil}

    test "list_exam_choices/0 returns all exam_choices" do
      exam_choice = exam_choice_fixture()
      assert ExamChoices.list_exam_choices() == [exam_choice]
    end

    test "get_exam_choice!/1 returns the exam_choice with given id" do
      exam_choice = exam_choice_fixture()
      assert ExamChoices.get_exam_choice!(exam_choice.id) == exam_choice
    end

    test "create_exam_choice/1 with valid data creates a exam_choice" do
      valid_attrs = %{correct: "some correct", description: "some description", explain: "some explain", title: "some title", wrong1: "some wrong1", wrong2: "some wrong2", wrong3: "some wrong3"}

      assert {:ok, %ExamChoice{} = exam_choice} = ExamChoices.create_exam_choice(valid_attrs)
      assert exam_choice.correct == "some correct"
      assert exam_choice.description == "some description"
      assert exam_choice.explain == "some explain"
      assert exam_choice.title == "some title"
      assert exam_choice.wrong1 == "some wrong1"
      assert exam_choice.wrong2 == "some wrong2"
      assert exam_choice.wrong3 == "some wrong3"
    end

    test "create_exam_choice/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = ExamChoices.create_exam_choice(@invalid_attrs)
    end

    test "update_exam_choice/2 with valid data updates the exam_choice" do
      exam_choice = exam_choice_fixture()
      update_attrs = %{correct: "some updated correct", description: "some updated description", explain: "some updated explain", title: "some updated title", wrong1: "some updated wrong1", wrong2: "some updated wrong2", wrong3: "some updated wrong3"}

      assert {:ok, %ExamChoice{} = exam_choice} = ExamChoices.update_exam_choice(exam_choice, update_attrs)
      assert exam_choice.correct == "some updated correct"
      assert exam_choice.description == "some updated description"
      assert exam_choice.explain == "some updated explain"
      assert exam_choice.title == "some updated title"
      assert exam_choice.wrong1 == "some updated wrong1"
      assert exam_choice.wrong2 == "some updated wrong2"
      assert exam_choice.wrong3 == "some updated wrong3"
    end

    test "update_exam_choice/2 with invalid data returns error changeset" do
      exam_choice = exam_choice_fixture()
      assert {:error, %Ecto.Changeset{}} = ExamChoices.update_exam_choice(exam_choice, @invalid_attrs)
      assert exam_choice == ExamChoices.get_exam_choice!(exam_choice.id)
    end

    test "delete_exam_choice/1 deletes the exam_choice" do
      exam_choice = exam_choice_fixture()
      assert {:ok, %ExamChoice{}} = ExamChoices.delete_exam_choice(exam_choice)
      assert_raise Ecto.NoResultsError, fn -> ExamChoices.get_exam_choice!(exam_choice.id) end
    end

    test "change_exam_choice/1 returns a exam_choice changeset" do
      exam_choice = exam_choice_fixture()
      assert %Ecto.Changeset{} = ExamChoices.change_exam_choice(exam_choice)
    end
  end
end
