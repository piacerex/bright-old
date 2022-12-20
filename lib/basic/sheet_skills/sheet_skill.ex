defmodule Basic.SheetSkills.SheetSkill do
  use Ecto.Schema
  import Ecto.Changeset

  schema "sheet_skills" do
    field :sheet_id, :integer
    field :skill_id, :integer

    timestamps()
  end

  @doc false
  def changeset(sheet_skill, attrs) do
    sheet_skill
    |> cast(attrs, [:sheet_id, :skill_id])
    |> validate_required([:sheet_id, :skill_id])
  end
end
