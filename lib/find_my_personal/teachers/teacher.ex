defmodule FindMyPersonal.Teachers.Teacher do
  @moduledoc """
  Module that prepares and validates personal data
  """
  use Ecto.Schema
  import Ecto.Changeset

  alias FindMyPersonal.Members.Member

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "teacher" do
    field :avatar_url, :string
    field :birth_date, :date
    field :class_type, :string
    field :education_level, :string
    field :name, :string

    has_many :members, Member

    timestamps()
  end

  @doc false
  def changeset(teacher, attrs \\ %{}) do
    teacher
    |> cast(attrs, [:avatar_url, :name, :birth_date, :education_level, :class_type])
    |> validate_required([:avatar_url, :name, :birth_date, :education_level, :class_type])
  end
end
