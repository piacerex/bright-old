defmodule Basic.Repo.Migrations.CreateLastAssesmentsTss do
  use Ecto.Migration

  def change do
    create table(:last_assesments_tss) do
      add :account_id, :integer
      add :ts_last_sheet_assesments_ids, :string
      add :account_learned_rate, :float
      add :account_evidence_rate, :float
      add :account_experienced_rate, :float
      add :account_committed_rate, :float

      timestamps()
    end
  end
end
