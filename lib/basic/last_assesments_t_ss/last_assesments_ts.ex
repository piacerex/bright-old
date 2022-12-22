defmodule Basic.LastAssesmentsTSs.LastAssesmentsTS do
  use Ecto.Schema
  import Ecto.Changeset

  schema "last_assesments_tss" do
    field :account_committed_rate, :float
    field :account_evidence_rate, :float
    field :account_experienced_rate, :float
    field :account_id, :integer
    field :account_learned_rate, :float
    field :ts_last_sheet_assesments_ids, :string

    timestamps()
  end

  @doc false
  def changeset(last_assesments_ts, attrs) do
    last_assesments_ts
    |> cast(attrs, [:account_id, :ts_last_sheet_assesments_ids, :account_learned_rate, :account_evidence_rate, :account_experienced_rate, :account_committed_rate])
    |> validate_required([:account_id, :ts_last_sheet_assesments_ids, :account_learned_rate, :account_evidence_rate, :account_experienced_rate, :account_committed_rate])
  end
end
