defmodule Basic.Repo.Migrations.CreateProjectAssigns do
  use Ecto.Migration

  def change do
    create table(:project_assigns) do
      add :project_id, :integer
      add :account_id, :integer
      add :last_assesments_id_at_assigned, :integer
      add :reward_level_id, :integer

      timestamps()
    end
  end
end
