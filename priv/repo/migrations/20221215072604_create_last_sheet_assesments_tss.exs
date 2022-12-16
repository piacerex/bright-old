defmodule Basic.Repo.Migrations.CreateLastSheetAssesmentsTss do
  use Ecto.Migration

  def change do
    create table(:last_sheet_assesments_tss) do
      add :account_id, :integer
      add :sheet_id, :integer
      add :sheet_learned_rate, :float
      add :sheet_evidence_rate, :float
      add :sheet_experienced_rate, :float
      add :sheet_committed_rate, :float

      timestamps()
    end
  end
end
