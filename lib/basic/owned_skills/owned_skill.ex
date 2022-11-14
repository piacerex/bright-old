defmodule Basic.OwnedSkills.OwnedSkill do
  use Ecto.Schema
  import Ecto.Changeset

  schema "owned_skills" do
    field :account_id, :integer
    field :evidence_text, :string
    field :evidence_url, :string
    field :exam_count, :integer
    field :exam_limit, :date
    field :exam_score, :integer
    field :learned_progress, :float
    field :learning_limit, :date
    field :mark, :integer
    field :skill_id, :integer

    timestamps()
  end

  @doc false
  def changeset(owned_skill, attrs) do
    owned_skill
    |> cast(attrs, [:account_id, :skill_id, :mark, :learned_progress, :evidence_text, :evidence_url, :exam_score, :exam_count, :learning_limit, :exam_limit])
    |> validate_required([:account_id, :skill_id, :mark, :learned_progress, :evidence_text, :evidence_url, :exam_score, :exam_count, :learning_limit, :exam_limit])
  end
end
