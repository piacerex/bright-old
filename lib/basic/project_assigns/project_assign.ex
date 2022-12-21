defmodule Basic.ProjectAssigns.ProjectAssign do
  use Ecto.Schema
  import Ecto.Changeset

  schema "project_assigns" do
    field :account_id, :integer
    field :last_assesments_id_at_assigned, :integer
    field :project_id, :integer
    field :reward_level_id, :integer

    timestamps()
  end

  @doc false
  def changeset(project_assign, attrs) do
    project_assign
    |> cast(attrs, [:project_id, :account_id, :last_assesments_id_at_assigned, :reward_level_id])
    |> validate_required([:project_id, :account_id, :last_assesments_id_at_assigned, :reward_level_id])
  end
end
