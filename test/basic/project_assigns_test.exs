defmodule Basic.ProjectAssignsTest do
  use Basic.DataCase

  alias Basic.ProjectAssigns

  describe "project_assigns" do
    alias Basic.ProjectAssigns.ProjectAssign

    import Basic.ProjectAssignsFixtures

    @invalid_attrs %{account_id: nil, last_assesments_id_at_assigned: nil, project_id: nil, reward_level_id: nil}

    test "list_project_assigns/0 returns all project_assigns" do
      project_assign = project_assign_fixture()
      assert ProjectAssigns.list_project_assigns() == [project_assign]
    end

    test "get_project_assign!/1 returns the project_assign with given id" do
      project_assign = project_assign_fixture()
      assert ProjectAssigns.get_project_assign!(project_assign.id) == project_assign
    end

    test "create_project_assign/1 with valid data creates a project_assign" do
      valid_attrs = %{account_id: 42, last_assesments_id_at_assigned: 42, project_id: 42, reward_level_id: 42}

      assert {:ok, %ProjectAssign{} = project_assign} = ProjectAssigns.create_project_assign(valid_attrs)
      assert project_assign.account_id == 42
      assert project_assign.last_assesments_id_at_assigned == 42
      assert project_assign.project_id == 42
      assert project_assign.reward_level_id == 42
    end

    test "create_project_assign/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = ProjectAssigns.create_project_assign(@invalid_attrs)
    end

    test "update_project_assign/2 with valid data updates the project_assign" do
      project_assign = project_assign_fixture()
      update_attrs = %{account_id: 43, last_assesments_id_at_assigned: 43, project_id: 43, reward_level_id: 43}

      assert {:ok, %ProjectAssign{} = project_assign} = ProjectAssigns.update_project_assign(project_assign, update_attrs)
      assert project_assign.account_id == 43
      assert project_assign.last_assesments_id_at_assigned == 43
      assert project_assign.project_id == 43
      assert project_assign.reward_level_id == 43
    end

    test "update_project_assign/2 with invalid data returns error changeset" do
      project_assign = project_assign_fixture()
      assert {:error, %Ecto.Changeset{}} = ProjectAssigns.update_project_assign(project_assign, @invalid_attrs)
      assert project_assign == ProjectAssigns.get_project_assign!(project_assign.id)
    end

    test "delete_project_assign/1 deletes the project_assign" do
      project_assign = project_assign_fixture()
      assert {:ok, %ProjectAssign{}} = ProjectAssigns.delete_project_assign(project_assign)
      assert_raise Ecto.NoResultsError, fn -> ProjectAssigns.get_project_assign!(project_assign.id) end
    end

    test "change_project_assign/1 returns a project_assign changeset" do
      project_assign = project_assign_fixture()
      assert %Ecto.Changeset{} = ProjectAssigns.change_project_assign(project_assign)
    end
  end
end
