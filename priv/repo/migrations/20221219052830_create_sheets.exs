defmodule Basic.Repo.Migrations.CreateSheets do
  use Ecto.Migration

  def change do
    create table(:sheets) do
      add :name, :string
      add :level, :integer

      timestamps()
    end
  end
end
