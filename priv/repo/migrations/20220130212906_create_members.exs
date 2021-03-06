defmodule FindMyPersonal.Repo.Migrations.CreateMembers do
  use Ecto.Migration

  def change do
    create table(:members, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :string
      add :email, :string
      add :birth_date, :date
      add :blood, :string
      add :height, :string
      add :weight, :string

      timestamps()
    end
  end
end
