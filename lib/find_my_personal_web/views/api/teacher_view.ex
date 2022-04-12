defmodule FindMyPersonalWeb.Api.TeacherView do
  use FindMyPersonalWeb, :view

  alias FindMyPersonal.Repo
  alias FindMyPersonalWeb.Api.MemberView

  def render("index.json", %{teacher: teacher}) do
    %{data: render_many(teacher, __MODULE__, "teacher.json")}
  end

  def render("show.json", %{teacher: teacher}) do
    %{data: render_one(teacher, __MODULE__, "teacher.json")}
  end

  def render("teacher.json", %{teacher: teacher}) do
    %{members: members} = Repo.preload(teacher, :members)

    %{
      id: teacher.id,
      avatar_url: teacher.avatar_url,
      name: teacher.name,
      birth_date: teacher.birth_date,
      education_level: teacher.education_level,
      class_type: teacher.class_type,
      members: MemberView.render("index.json", members: members),
      total_members: Enum.count(members)
    }
  end
end
