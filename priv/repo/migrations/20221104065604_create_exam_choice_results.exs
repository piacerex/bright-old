defmodule Basic.Repo.Migrations.CreateExamChoiceResults do
  use Ecto.Migration

  def change do
    create table(:exam_choice_results) do
      add :account_id, :integer
      add :exam_count, :integer
      add :exam_choice_id, :integer
      add :pass, :boolean, default: false, null: false

      timestamps()
    end
  end
end
