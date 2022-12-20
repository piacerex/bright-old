defmodule Basic.Repo.Migrations.CreateSheetSkills do
  use Ecto.Migration

  def change do
    create table(:sheet_skills) do
      add :sheet_id, :integer
      add :skill_id, :integer

      timestamps()
    end
  end
end
