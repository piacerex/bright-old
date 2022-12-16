defmodule Basic.LastSheetAssesmentsTSs.LastSheetAssesmentsTS do
  use Ecto.Schema
  import Ecto.Changeset

  schema "last_sheet_assesments_tss" do
    field :account_id, :integer
    field :sheet_committed_rate, :float
    field :sheet_evidence_rate, :float
    field :sheet_experienced_rate, :float
    field :sheet_id, :integer
    field :sheet_learned_rate, :float

    timestamps()
  end

  @doc false
  def changeset(last_sheet_assesments_ts, attrs) do
    last_sheet_assesments_ts
    |> cast(attrs, [:account_id, :sheet_id, :sheet_learned_rate, :sheet_evidence_rate, :sheet_experienced_rate, :sheet_committed_rate])
    |> validate_required([:account_id, :sheet_id, :sheet_learned_rate, :sheet_evidence_rate, :sheet_experienced_rate, :sheet_committed_rate])
  end
end
