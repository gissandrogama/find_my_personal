defmodule FindMyPersonal.Members.Member do
  @moduledoc """
  module that handles the data structure of members
  """
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "members" do
    field :birth_date, :date
    field :blood, :string
    field :email, :string
    field :height, :string
    field :name, :string
    field :weight, :string

    timestamps()
  end

  @doc false
  def changeset(member, attrs) do
    member
    |> cast(attrs, [:name, :email, :birth_date, :blood, :height, :weight])
    |> validate_required([:name, :email, :birth_date, :blood, :height, :weight])
  end
end
