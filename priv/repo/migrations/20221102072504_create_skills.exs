defmodule Basic.Repo.Migrations.CreateSkills do
  use Ecto.Migration

  def change do
    create table(:skills) do
      add :name, :string
      add :exam_choice_id, :integer
      add :material_id, :integer

      timestamps()
    end
  end
end
