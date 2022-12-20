defmodule Basic.Sheets.Sheet do
  use Ecto.Schema
  import Ecto.Changeset

  schema "sheets" do
    field :level, :integer
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(sheet, attrs) do
    sheet
    |> cast(attrs, [:name, :level])
    |> validate_required([:name, :level])
  end
end
