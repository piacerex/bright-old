defmodule Basic.Repo.Migrations.CreateOwnedSkills do
  use Ecto.Migration

  def change do
    create table(:owned_skills) do
      add :account_id, :integer
      add :skill_id, :integer
      add :level, :integer
      add :learned_progress, :float
      add :evidence_text, :text
      add :evidence_url, :string
      add :exam_score, :integer
      add :exam_count, :integer
      add :learning_limit, :date
      add :exam_limit, :date

      timestamps()
    end
  end
end
