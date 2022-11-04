defmodule Basic.ExamChoiceResultsTest do
  use Basic.DataCase

  alias Basic.ExamChoiceResults

  describe "exam_choice_results" do
    alias Basic.ExamChoiceResults.ExamChoiceResult

    import Basic.ExamChoiceResultsFixtures

    @invalid_attrs %{account_id: nil, exam_choice_id: nil, exam_count: nil, pass: nil}

    test "list_exam_choice_results/0 returns all exam_choice_results" do
      exam_choice_result = exam_choice_result_fixture()
      assert ExamChoiceResults.list_exam_choice_results() == [exam_choice_result]
    end

    test "get_exam_choice_result!/1 returns the exam_choice_result with given id" do
      exam_choice_result = exam_choice_result_fixture()
      assert ExamChoiceResults.get_exam_choice_result!(exam_choice_result.id) == exam_choice_result
    end

    test "create_exam_choice_result/1 with valid data creates a exam_choice_result" do
      valid_attrs = %{account_id: 42, exam_choice_id: 42, exam_count: 42, pass: true}

      assert {:ok, %ExamChoiceResult{} = exam_choice_result} = ExamChoiceResults.create_exam_choice_result(valid_attrs)
      assert exam_choice_result.account_id == 42
      assert exam_choice_result.exam_choice_id == 42
      assert exam_choice_result.exam_count == 42
      assert exam_choice_result.pass == true
    end

    test "create_exam_choice_result/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = ExamChoiceResults.create_exam_choice_result(@invalid_attrs)
    end

    test "update_exam_choice_result/2 with valid data updates the exam_choice_result" do
      exam_choice_result = exam_choice_result_fixture()
      update_attrs = %{account_id: 43, exam_choice_id: 43, exam_count: 43, pass: false}

      assert {:ok, %ExamChoiceResult{} = exam_choice_result} = ExamChoiceResults.update_exam_choice_result(exam_choice_result, update_attrs)
      assert exam_choice_result.account_id == 43
      assert exam_choice_result.exam_choice_id == 43
      assert exam_choice_result.exam_count == 43
      assert exam_choice_result.pass == false
    end

    test "update_exam_choice_result/2 with invalid data returns error changeset" do
      exam_choice_result = exam_choice_result_fixture()
      assert {:error, %Ecto.Changeset{}} = ExamChoiceResults.update_exam_choice_result(exam_choice_result, @invalid_attrs)
      assert exam_choice_result == ExamChoiceResults.get_exam_choice_result!(exam_choice_result.id)
    end

    test "delete_exam_choice_result/1 deletes the exam_choice_result" do
      exam_choice_result = exam_choice_result_fixture()
      assert {:ok, %ExamChoiceResult{}} = ExamChoiceResults.delete_exam_choice_result(exam_choice_result)
      assert_raise Ecto.NoResultsError, fn -> ExamChoiceResults.get_exam_choice_result!(exam_choice_result.id) end
    end

    test "change_exam_choice_result/1 returns a exam_choice_result changeset" do
      exam_choice_result = exam_choice_result_fixture()
      assert %Ecto.Changeset{} = ExamChoiceResults.change_exam_choice_result(exam_choice_result)
    end
  end
end
