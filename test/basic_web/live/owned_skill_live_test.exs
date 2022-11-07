defmodule BasicWeb.OwnedSkillLiveTest do
  use BasicWeb.ConnCase

  import Phoenix.LiveViewTest
  import Basic.OwnedSkillsFixtures

  @create_attrs %{account_id: 42, evidence_text: "some evidence_text", evidence_url: "some evidence_url", exam_count: 42, exam_limit: %{day: 6, month: 11, year: 2022}, exam_score: 42, learned_progress: 120.5, learning_limit: %{day: 6, month: 11, year: 2022}, level: 42, skill_id: 42}
  @update_attrs %{account_id: 43, evidence_text: "some updated evidence_text", evidence_url: "some updated evidence_url", exam_count: 43, exam_limit: %{day: 7, month: 11, year: 2022}, exam_score: 43, learned_progress: 456.7, learning_limit: %{day: 7, month: 11, year: 2022}, level: 43, skill_id: 43}
  @invalid_attrs %{account_id: nil, evidence_text: nil, evidence_url: nil, exam_count: nil, exam_limit: %{day: 30, month: 2, year: 2022}, exam_score: nil, learned_progress: nil, learning_limit: %{day: 30, month: 2, year: 2022}, level: nil, skill_id: nil}

  defp create_owned_skill(_) do
    owned_skill = owned_skill_fixture()
    %{owned_skill: owned_skill}
  end

  describe "Index" do
    setup [:create_owned_skill]

    test "lists all owned_skills", %{conn: conn, owned_skill: owned_skill} do
      {:ok, _index_live, html} = live(conn, Routes.owned_skill_index_path(conn, :index))

      assert html =~ "Listing Owned skills"
      assert html =~ owned_skill.evidence_text
    end

    test "saves new owned_skill", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, Routes.owned_skill_index_path(conn, :index))

      assert index_live |> element("a", "New Owned skill") |> render_click() =~
               "New Owned skill"

      assert_patch(index_live, Routes.owned_skill_index_path(conn, :new))

      assert index_live
             |> form("#owned_skill-form", owned_skill: @invalid_attrs)
             |> render_change() =~ "is invalid"

      {:ok, _, html} =
        index_live
        |> form("#owned_skill-form", owned_skill: @create_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.owned_skill_index_path(conn, :index))

      assert html =~ "Owned skill created successfully"
      assert html =~ "some evidence_text"
    end

    test "updates owned_skill in listing", %{conn: conn, owned_skill: owned_skill} do
      {:ok, index_live, _html} = live(conn, Routes.owned_skill_index_path(conn, :index))

      assert index_live |> element("#owned_skill-#{owned_skill.id} a", "Edit") |> render_click() =~
               "Edit Owned skill"

      assert_patch(index_live, Routes.owned_skill_index_path(conn, :edit, owned_skill))

      assert index_live
             |> form("#owned_skill-form", owned_skill: @invalid_attrs)
             |> render_change() =~ "is invalid"

      {:ok, _, html} =
        index_live
        |> form("#owned_skill-form", owned_skill: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.owned_skill_index_path(conn, :index))

      assert html =~ "Owned skill updated successfully"
      assert html =~ "some updated evidence_text"
    end

    test "deletes owned_skill in listing", %{conn: conn, owned_skill: owned_skill} do
      {:ok, index_live, _html} = live(conn, Routes.owned_skill_index_path(conn, :index))

      assert index_live |> element("#owned_skill-#{owned_skill.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#owned_skill-#{owned_skill.id}")
    end
  end

  describe "Show" do
    setup [:create_owned_skill]

    test "displays owned_skill", %{conn: conn, owned_skill: owned_skill} do
      {:ok, _show_live, html} = live(conn, Routes.owned_skill_show_path(conn, :show, owned_skill))

      assert html =~ "Show Owned skill"
      assert html =~ owned_skill.evidence_text
    end

    test "updates owned_skill within modal", %{conn: conn, owned_skill: owned_skill} do
      {:ok, show_live, _html} = live(conn, Routes.owned_skill_show_path(conn, :show, owned_skill))

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Owned skill"

      assert_patch(show_live, Routes.owned_skill_show_path(conn, :edit, owned_skill))

      assert show_live
             |> form("#owned_skill-form", owned_skill: @invalid_attrs)
             |> render_change() =~ "is invalid"

      {:ok, _, html} =
        show_live
        |> form("#owned_skill-form", owned_skill: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.owned_skill_show_path(conn, :show, owned_skill))

      assert html =~ "Owned skill updated successfully"
      assert html =~ "some updated evidence_text"
    end
  end
end
