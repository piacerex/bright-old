defmodule BasicWeb.ExamChoiceResultLiveTest do
  use BasicWeb.ConnCase

  import Phoenix.LiveViewTest
  import Basic.ExamChoiceResultsFixtures

  @create_attrs %{account_id: 42, exam_choice_id: 42, exam_count: 42, pass: true}
  @update_attrs %{account_id: 43, exam_choice_id: 43, exam_count: 43, pass: false}
  @invalid_attrs %{account_id: nil, exam_choice_id: nil, exam_count: nil, pass: false}

  defp create_exam_choice_result(_) do
    exam_choice_result = exam_choice_result_fixture()
    %{exam_choice_result: exam_choice_result}
  end

  describe "Index" do
    setup [:create_exam_choice_result]

    test "lists all exam_choice_results", %{conn: conn} do
      {:ok, _index_live, html} = live(conn, Routes.exam_choice_result_index_path(conn, :index))

      assert html =~ "Listing Exam choice results"
    end

    test "saves new exam_choice_result", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, Routes.exam_choice_result_index_path(conn, :index))

      assert index_live |> element("a", "New Exam choice result") |> render_click() =~
               "New Exam choice result"

      assert_patch(index_live, Routes.exam_choice_result_index_path(conn, :new))

      assert index_live
             |> form("#exam_choice_result-form", exam_choice_result: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#exam_choice_result-form", exam_choice_result: @create_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.exam_choice_result_index_path(conn, :index))

      assert html =~ "Exam choice result created successfully"
    end

    test "updates exam_choice_result in listing", %{conn: conn, exam_choice_result: exam_choice_result} do
      {:ok, index_live, _html} = live(conn, Routes.exam_choice_result_index_path(conn, :index))

      assert index_live |> element("#exam_choice_result-#{exam_choice_result.id} a", "Edit") |> render_click() =~
               "Edit Exam choice result"

      assert_patch(index_live, Routes.exam_choice_result_index_path(conn, :edit, exam_choice_result))

      assert index_live
             |> form("#exam_choice_result-form", exam_choice_result: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#exam_choice_result-form", exam_choice_result: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.exam_choice_result_index_path(conn, :index))

      assert html =~ "Exam choice result updated successfully"
    end

    test "deletes exam_choice_result in listing", %{conn: conn, exam_choice_result: exam_choice_result} do
      {:ok, index_live, _html} = live(conn, Routes.exam_choice_result_index_path(conn, :index))

      assert index_live |> element("#exam_choice_result-#{exam_choice_result.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#exam_choice_result-#{exam_choice_result.id}")
    end
  end

  describe "Show" do
    setup [:create_exam_choice_result]

    test "displays exam_choice_result", %{conn: conn, exam_choice_result: exam_choice_result} do
      {:ok, _show_live, html} = live(conn, Routes.exam_choice_result_show_path(conn, :show, exam_choice_result))

      assert html =~ "Show Exam choice result"
    end

    test "updates exam_choice_result within modal", %{conn: conn, exam_choice_result: exam_choice_result} do
      {:ok, show_live, _html} = live(conn, Routes.exam_choice_result_show_path(conn, :show, exam_choice_result))

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Exam choice result"

      assert_patch(show_live, Routes.exam_choice_result_show_path(conn, :edit, exam_choice_result))

      assert show_live
             |> form("#exam_choice_result-form", exam_choice_result: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        show_live
        |> form("#exam_choice_result-form", exam_choice_result: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.exam_choice_result_show_path(conn, :show, exam_choice_result))

      assert html =~ "Exam choice result updated successfully"
    end
  end
end
