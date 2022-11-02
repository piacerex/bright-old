defmodule Basic.Skills.Skill do
  use Ecto.Schema
  import Ecto.Changeset

  schema "skills" do
    field :exam_choice_id, :integer
    field :material_id, :integer
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(skill, attrs) do
    skill
    |> cast(attrs, [:name, :exam_choice_id, :material_id])
    |> validate_required([:name, :exam_choice_id, :material_id])
  end
end
