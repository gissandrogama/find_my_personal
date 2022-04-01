defmodule FindMyPersonal.Members.Member do
  @moduledoc """
  module that handles the data structure of members
  """
  use Ecto.Schema
  import Ecto.Changeset

  alias FindMyPersonal.Teachers.Teacher

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "members" do
    field :birth_date, :date
    field :blood, :string
    field :email, :string
    field :height, :string
    field :name, :string
    field :weight, :string
    field :avatar_url, :string

    belongs_to :teacher, Teacher

    timestamps()
  end

  @doc false
  def changeset(member, attrs) do
    member
    |> cast(attrs, [:name, :email, :birth_date, :blood, :height, :weight, :avatar_url, :teacher_id])
    |> validate_required([:name, :email, :birth_date, :blood, :height, :weight, :avatar_url])
    |> foreign_key_constraint(:teacher_id)
  end
end
