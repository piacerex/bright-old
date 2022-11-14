defmodule Basic.OwnedSkillsTest do
  use Basic.DataCase

  alias Basic.OwnedSkills

  describe "owned_skills" do
    alias Basic.OwnedSkills.OwnedSkill

    import Basic.OwnedSkillsFixtures

    @invalid_attrs %{account_id: nil, evidence_text: nil, evidence_url: nil, exam_count: nil, exam_limit: nil, exam_score: nil, learned_progress: nil, learning_limit: nil, level: nil, skill_id: nil}

    test "list_owned_skills/0 returns all owned_skills" do
      owned_skill = owned_skill_fixture()
      assert OwnedSkills.list_owned_skills() == [owned_skill]
    end

    test "get_owned_skill!/1 returns the owned_skill with given id" do
      owned_skill = owned_skill_fixture()
      assert OwnedSkills.get_owned_skill!(owned_skill.id) == owned_skill
    end

    test "create_owned_skill/1 with valid data creates a owned_skill" do
      valid_attrs = %{account_id: 42, evidence_text: "some evidence_text", evidence_url: "some evidence_url", exam_count: 42, exam_limit: ~D[2022-11-06], exam_score: 42, learned_progress: 120.5, learning_limit: ~D[2022-11-06], level: 42, skill_id: 42}

      assert {:ok, %OwnedSkill{} = owned_skill} = OwnedSkills.create_owned_skill(valid_attrs)
      assert owned_skill.account_id == 42
      assert owned_skill.evidence_text == "some evidence_text"
      assert owned_skill.evidence_url == "some evidence_url"
      assert owned_skill.exam_count == 42
      assert owned_skill.exam_limit == ~D[2022-11-06]
      assert owned_skill.exam_score == 42
      assert owned_skill.learned_progress == 120.5
      assert owned_skill.learning_limit == ~D[2022-11-06]
      assert owned_skill.level == 42
      assert owned_skill.skill_id == 42
    end

    test "create_owned_skill/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = OwnedSkills.create_owned_skill(@invalid_attrs)
    end

    test "update_owned_skill/2 with valid data updates the owned_skill" do
      owned_skill = owned_skill_fixture()
      update_attrs = %{account_id: 43, evidence_text: "some updated evidence_text", evidence_url: "some updated evidence_url", exam_count: 43, exam_limit: ~D[2022-11-07], exam_score: 43, learned_progress: 456.7, learning_limit: ~D[2022-11-07], level: 43, skill_id: 43}

      assert {:ok, %OwnedSkill{} = owned_skill} = OwnedSkills.update_owned_skill(owned_skill, update_attrs)
      assert owned_skill.account_id == 43
      assert owned_skill.evidence_text == "some updated evidence_text"
      assert owned_skill.evidence_url == "some updated evidence_url"
      assert owned_skill.exam_count == 43
      assert owned_skill.exam_limit == ~D[2022-11-07]
      assert owned_skill.exam_score == 43
      assert owned_skill.learned_progress == 456.7
      assert owned_skill.learning_limit == ~D[2022-11-07]
      assert owned_skill.level == 43
      assert owned_skill.skill_id == 43
    end

    test "update_owned_skill/2 with invalid data returns error changeset" do
      owned_skill = owned_skill_fixture()
      assert {:error, %Ecto.Changeset{}} = OwnedSkills.update_owned_skill(owned_skill, @invalid_attrs)
      assert owned_skill == OwnedSkills.get_owned_skill!(owned_skill.id)
    end

    test "delete_owned_skill/1 deletes the owned_skill" do
      owned_skill = owned_skill_fixture()
      assert {:ok, %OwnedSkill{}} = OwnedSkills.delete_owned_skill(owned_skill)
      assert_raise Ecto.NoResultsError, fn -> OwnedSkills.get_owned_skill!(owned_skill.id) end
    end

    test "change_owned_skill/1 returns a owned_skill changeset" do
      owned_skill = owned_skill_fixture()
      assert %Ecto.Changeset{} = OwnedSkills.change_owned_skill(owned_skill)
    end
  end
end
