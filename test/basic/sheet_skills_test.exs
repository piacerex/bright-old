defmodule Basic.SheetSkillsTest do
  use Basic.DataCase

  alias Basic.SheetSkills

  describe "sheet_skills" do
    alias Basic.SheetSkills.SheetSkill

    import Basic.SheetSkillsFixtures

    @invalid_attrs %{sheet_id: nil, skill_id: nil}

    test "list_sheet_skills/0 returns all sheet_skills" do
      sheet_skill = sheet_skill_fixture()
      assert SheetSkills.list_sheet_skills() == [sheet_skill]
    end

    test "get_sheet_skill!/1 returns the sheet_skill with given id" do
      sheet_skill = sheet_skill_fixture()
      assert SheetSkills.get_sheet_skill!(sheet_skill.id) == sheet_skill
    end

    test "create_sheet_skill/1 with valid data creates a sheet_skill" do
      valid_attrs = %{sheet_id: 42, skill_id: 42}

      assert {:ok, %SheetSkill{} = sheet_skill} = SheetSkills.create_sheet_skill(valid_attrs)
      assert sheet_skill.sheet_id == 42
      assert sheet_skill.skill_id == 42
    end

    test "create_sheet_skill/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = SheetSkills.create_sheet_skill(@invalid_attrs)
    end

    test "update_sheet_skill/2 with valid data updates the sheet_skill" do
      sheet_skill = sheet_skill_fixture()
      update_attrs = %{sheet_id: 43, skill_id: 43}

      assert {:ok, %SheetSkill{} = sheet_skill} = SheetSkills.update_sheet_skill(sheet_skill, update_attrs)
      assert sheet_skill.sheet_id == 43
      assert sheet_skill.skill_id == 43
    end

    test "update_sheet_skill/2 with invalid data returns error changeset" do
      sheet_skill = sheet_skill_fixture()
      assert {:error, %Ecto.Changeset{}} = SheetSkills.update_sheet_skill(sheet_skill, @invalid_attrs)
      assert sheet_skill == SheetSkills.get_sheet_skill!(sheet_skill.id)
    end

    test "delete_sheet_skill/1 deletes the sheet_skill" do
      sheet_skill = sheet_skill_fixture()
      assert {:ok, %SheetSkill{}} = SheetSkills.delete_sheet_skill(sheet_skill)
      assert_raise Ecto.NoResultsError, fn -> SheetSkills.get_sheet_skill!(sheet_skill.id) end
    end

    test "change_sheet_skill/1 returns a sheet_skill changeset" do
      sheet_skill = sheet_skill_fixture()
      assert %Ecto.Changeset{} = SheetSkills.change_sheet_skill(sheet_skill)
    end
  end
end
