defmodule Basic.ExamChoiceResults.ExamChoiceResult do
  use Ecto.Schema
  import Ecto.Changeset

  schema "exam_choice_results" do
    field :account_id, :integer
    field :exam_choice_id, :integer
    field :exam_count, :integer
    field :pass, :boolean, default: false

    timestamps()
  end

  @doc false
  def changeset(exam_choice_result, attrs) do
    exam_choice_result
    |> cast(attrs, [:account_id, :exam_count, :exam_choice_id, :pass])
    |> validate_required([:account_id, :exam_count, :exam_choice_id, :pass])
  end
end
