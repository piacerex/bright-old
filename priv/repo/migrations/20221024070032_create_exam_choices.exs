defmodule Basic.Repo.Migrations.CreateExamChoices do
  use Ecto.Migration

  def change do
    create table(:exam_choices) do
      add :title, :string
      add :description, :text
      add :correct, :string
      add :wrong1, :string
      add :wrong2, :string
      add :wrong3, :string
      add :explain, :text

      timestamps()
    end
  end
end
