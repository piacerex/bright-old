defmodule BasicWeb.ExamChoiceLiveTest do
  use BasicWeb.ConnCase

  import Phoenix.LiveViewTest
  import Basic.ExamChoicesFixtures

  @create_attrs %{correct: "some correct", description: "some description", explain: "some explain", title: "some title", wrong1: "some wrong1", wrong2: "some wrong2", wrong3: "some wrong3"}
  @update_attrs %{correct: "some updated correct", description: "some updated description", explain: "some updated explain", title: "some updated title", wrong1: "some updated wrong1", wrong2: "some updated wrong2", wrong3: "some updated wrong3"}
  @invalid_attrs %{correct: nil, description: nil, explain: nil, title: nil, wrong1: nil, wrong2: nil, wrong3: nil}

  defp create_exam_choice(_) do
    exam_choice = exam_choice_fixture()
    %{exam_choice: exam_choice}
  end

  describe "Index" do
    setup [:create_exam_choice]

    test "lists all exam_choices", %{conn: conn, exam_choice: exam_choice} do
      {:ok, _index_live, html} = live(conn, Routes.exam_choice_index_path(conn, :index))

      assert html =~ "Listing Exam choices"
      assert html =~ exam_choice.correct
    end

    test "saves new exam_choice", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, Routes.exam_choice_index_path(conn, :index))

      assert index_live |> element("a", "New Exam choice") |> render_click() =~
               "New Exam choice"

      assert_patch(index_live, Routes.exam_choice_index_path(conn, :new))

      assert index_live
             |> form("#exam_choice-form", exam_choice: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#exam_choice-form", exam_choice: @create_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.exam_choice_index_path(conn, :index))

      assert html =~ "Exam choice created successfully"
      assert html =~ "some correct"
    end

    test "updates exam_choice in listing", %{conn: conn, exam_choice: exam_choice} do
      {:ok, index_live, _html} = live(conn, Routes.exam_choice_index_path(conn, :index))

      assert index_live |> element("#exam_choice-#{exam_choice.id} a", "Edit") |> render_click() =~
               "Edit Exam choice"

      assert_patch(index_live, Routes.exam_choice_index_path(conn, :edit, exam_choice))

      assert index_live
             |> form("#exam_choice-form", exam_choice: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#exam_choice-form", exam_choice: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.exam_choice_index_path(conn, :index))

      assert html =~ "Exam choice updated successfully"
      assert html =~ "some updated correct"
    end

    test "deletes exam_choice in listing", %{conn: conn, exam_choice: exam_choice} do
      {:ok, index_live, _html} = live(conn, Routes.exam_choice_index_path(conn, :index))

      assert index_live |> element("#exam_choice-#{exam_choice.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#exam_choice-#{exam_choice.id}")
    end
  end

  describe "Show" do
    setup [:create_exam_choice]

    test "displays exam_choice", %{conn: conn, exam_choice: exam_choice} do
      {:ok, _show_live, html} = live(conn, Routes.exam_choice_show_path(conn, :show, exam_choice))

      assert html =~ "Show Exam choice"
      assert html =~ exam_choice.correct
    end

    test "updates exam_choice within modal", %{conn: conn, exam_choice: exam_choice} do
      {:ok, show_live, _html} = live(conn, Routes.exam_choice_show_path(conn, :show, exam_choice))

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Exam choice"

      assert_patch(show_live, Routes.exam_choice_show_path(conn, :edit, exam_choice))

      assert show_live
             |> form("#exam_choice-form", exam_choice: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        show_live
        |> form("#exam_choice-form", exam_choice: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.exam_choice_show_path(conn, :show, exam_choice))

      assert html =~ "Exam choice updated successfully"
      assert html =~ "some updated correct"
    end
  end
end
