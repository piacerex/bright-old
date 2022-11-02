defmodule BasicWeb.SkillLiveTest do
  use BasicWeb.ConnCase

  import Phoenix.LiveViewTest
  import Basic.SkillsFixtures

  @create_attrs %{exam_choices_id: 42, materials_id: 42, name: "some name"}
  @update_attrs %{exam_choices_id: 43, materials_id: 43, name: "some updated name"}
  @invalid_attrs %{exam_choices_id: nil, materials_id: nil, name: nil}

  defp create_skill(_) do
    skill = skill_fixture()
    %{skill: skill}
  end

  describe "Index" do
    setup [:create_skill]

    test "lists all skills", %{conn: conn, skill: skill} do
      {:ok, _index_live, html} = live(conn, Routes.skill_index_path(conn, :index))

      assert html =~ "Listing Skills"
      assert html =~ skill.name
    end

    test "saves new skill", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, Routes.skill_index_path(conn, :index))

      assert index_live |> element("a", "New Skill") |> render_click() =~
               "New Skill"

      assert_patch(index_live, Routes.skill_index_path(conn, :new))

      assert index_live
             |> form("#skill-form", skill: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#skill-form", skill: @create_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.skill_index_path(conn, :index))

      assert html =~ "Skill created successfully"
      assert html =~ "some name"
    end

    test "updates skill in listing", %{conn: conn, skill: skill} do
      {:ok, index_live, _html} = live(conn, Routes.skill_index_path(conn, :index))

      assert index_live |> element("#skill-#{skill.id} a", "Edit") |> render_click() =~
               "Edit Skill"

      assert_patch(index_live, Routes.skill_index_path(conn, :edit, skill))

      assert index_live
             |> form("#skill-form", skill: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#skill-form", skill: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.skill_index_path(conn, :index))

      assert html =~ "Skill updated successfully"
      assert html =~ "some updated name"
    end

    test "deletes skill in listing", %{conn: conn, skill: skill} do
      {:ok, index_live, _html} = live(conn, Routes.skill_index_path(conn, :index))

      assert index_live |> element("#skill-#{skill.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#skill-#{skill.id}")
    end
  end

  describe "Show" do
    setup [:create_skill]

    test "displays skill", %{conn: conn, skill: skill} do
      {:ok, _show_live, html} = live(conn, Routes.skill_show_path(conn, :show, skill))

      assert html =~ "Show Skill"
      assert html =~ skill.name
    end

    test "updates skill within modal", %{conn: conn, skill: skill} do
      {:ok, show_live, _html} = live(conn, Routes.skill_show_path(conn, :show, skill))

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Skill"

      assert_patch(show_live, Routes.skill_show_path(conn, :edit, skill))

      assert show_live
             |> form("#skill-form", skill: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        show_live
        |> form("#skill-form", skill: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.skill_show_path(conn, :show, skill))

      assert html =~ "Skill updated successfully"
      assert html =~ "some updated name"
    end
  end
end
