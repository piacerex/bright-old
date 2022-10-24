defmodule Basic.ExamChoices.ExamChoice do
  use Ecto.Schema
  import Ecto.Changeset

  schema "exam_choices" do
    field :correct, :string
    field :description, :string
    field :explain, :string
    field :title, :string
    field :wrong1, :string
    field :wrong2, :string
    field :wrong3, :string

    timestamps()
  end

  @doc false
  def changeset(exam_choice, attrs) do
    exam_choice
    |> cast(attrs, [:title, :description, :correct, :wrong1, :wrong2, :wrong3, :explain])
    |> validate_required([:title, :description, :correct, :wrong1, :wrong2, :wrong3, :explain])
  end
end
