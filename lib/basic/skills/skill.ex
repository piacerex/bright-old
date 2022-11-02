defmodule Basic.Skills.Skill do
  use Ecto.Schema
  import Ecto.Changeset

  schema "skills" do
    field :exam_choices_id, :integer
    field :materials_id, :integer
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(skill, attrs) do
    skill
    |> cast(attrs, [:name, :exam_choices_id, :materials_id])
    |> validate_required([:name, :exam_choices_id, :materials_id])
  end
end
