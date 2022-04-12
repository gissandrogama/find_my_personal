defmodule FindMyPersonal.MemberFixture do
  @moduledoc """
  this module
  """
  alias FindMyPersonal.Members
  alias FindMyPersonal.Teachers

  def valid_attrs,
    do: %{
      "avatar_url" => "http://imagens.com",
      "birth_date" => "2010-04-17",
      "blood" => "O+",
      "email" => "some_email@email.com",
      "height" => "168",
      "name" => "Teste",
      "teacher_id" => get_teacher(),
      "weight" => "75"
    }

  def update_attrs,
    do: %{
      "avatar_url" => "http://imagens.com",
      "birth_date" => "2010-04-17",
      "blood" => "O+",
      "email" => "some_email_update@email.com",
      "height" => "168",
      "name" => "Teste update",
      "teacher_id" => get_teacher(),
      "weight" => "79"
    }

  def invalid_attrs,
    do: %{
      "avatar_url" => "",
      "birth_date" => "",
      "blood" => "",
      "email" => "",
      "height" => "",
      "name" => "",
      "teacher_id" => get_teacher(),
      "weight" => ""
    }

  def member_fixture(attrs \\ %{}) do
    {:ok, member} =
      attrs
      |> Enum.into(valid_attrs)
      |> Members.create_member()

    member
  end

  def get_teacher do
    {:ok, teacher} =
      %{
        avatar_url: "some_avatar_url",
        birth_date: ~D[2010-04-17],
        class_type: "some class_type",
        education_level: "some edication_level",
        name: "some teacher"
      }
      |> Teachers.create_teacher()

    teacher.id
  end
end
