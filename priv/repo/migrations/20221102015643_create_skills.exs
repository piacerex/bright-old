defmodule Basic.Repo.Migrations.CreateSkills do
  use Ecto.Migration

  def change do
    create table(:skills) do
      add :name, :string
      add :exam_choices_id, :integer
      add :materials_id, :integer

      timestamps()
    end
  end
end
