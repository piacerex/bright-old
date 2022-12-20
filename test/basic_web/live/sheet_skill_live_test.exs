defmodule BasicWeb.SheetSkillLiveTest do
  use BasicWeb.ConnCase

  import Phoenix.LiveViewTest
  import Basic.SheetSkillsFixtures

  @create_attrs %{sheet_id: 42, skill_id: 42}
  @update_attrs %{sheet_id: 43, skill_id: 43}
  @invalid_attrs %{sheet_id: nil, skill_id: nil}

  defp create_sheet_skill(_) do
    sheet_skill = sheet_skill_fixture()
    %{sheet_skill: sheet_skill}
  end

  describe "Index" do
    setup [:create_sheet_skill]

    test "lists all sheet_skills", %{conn: conn} do
      {:ok, _index_live, html} = live(conn, Routes.sheet_skill_index_path(conn, :index))

      assert html =~ "Listing Sheet skills"
    end

    test "saves new sheet_skill", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, Routes.sheet_skill_index_path(conn, :index))

      assert index_live |> element("a", "New Sheet skill") |> render_click() =~
               "New Sheet skill"

      assert_patch(index_live, Routes.sheet_skill_index_path(conn, :new))

      assert index_live
             |> form("#sheet_skill-form", sheet_skill: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#sheet_skill-form", sheet_skill: @create_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.sheet_skill_index_path(conn, :index))

      assert html =~ "Sheet skill created successfully"
    end

    test "updates sheet_skill in listing", %{conn: conn, sheet_skill: sheet_skill} do
      {:ok, index_live, _html} = live(conn, Routes.sheet_skill_index_path(conn, :index))

      assert index_live |> element("#sheet_skill-#{sheet_skill.id} a", "Edit") |> render_click() =~
               "Edit Sheet skill"

      assert_patch(index_live, Routes.sheet_skill_index_path(conn, :edit, sheet_skill))

      assert index_live
             |> form("#sheet_skill-form", sheet_skill: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#sheet_skill-form", sheet_skill: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.sheet_skill_index_path(conn, :index))

      assert html =~ "Sheet skill updated successfully"
    end

    test "deletes sheet_skill in listing", %{conn: conn, sheet_skill: sheet_skill} do
      {:ok, index_live, _html} = live(conn, Routes.sheet_skill_index_path(conn, :index))

      assert index_live |> element("#sheet_skill-#{sheet_skill.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#sheet_skill-#{sheet_skill.id}")
    end
  end

  describe "Show" do
    setup [:create_sheet_skill]

    test "displays sheet_skill", %{conn: conn, sheet_skill: sheet_skill} do
      {:ok, _show_live, html} = live(conn, Routes.sheet_skill_show_path(conn, :show, sheet_skill))

      assert html =~ "Show Sheet skill"
    end

    test "updates sheet_skill within modal", %{conn: conn, sheet_skill: sheet_skill} do
      {:ok, show_live, _html} = live(conn, Routes.sheet_skill_show_path(conn, :show, sheet_skill))

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Sheet skill"

      assert_patch(show_live, Routes.sheet_skill_show_path(conn, :edit, sheet_skill))

      assert show_live
             |> form("#sheet_skill-form", sheet_skill: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        show_live
        |> form("#sheet_skill-form", sheet_skill: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.sheet_skill_show_path(conn, :show, sheet_skill))

      assert html =~ "Sheet skill updated successfully"
    end
  end
end
