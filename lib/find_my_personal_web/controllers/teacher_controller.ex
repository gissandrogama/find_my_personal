defmodule FindMyPersonalWeb.TeacherController do
  use FindMyPersonalWeb, :controller

  alias FindMyPersonal.Teachers
  alias FindMyPersonal.Teachers.Teacher

  def index(conn, _params) do
    teachers = Teachers.list_teacher()
    render(conn, "index.html", teachers: teachers)
  end

  def new(conn, _params) do
    changeset = Teacher.changeset(%Teacher{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"teacher" => teacher}) do
    case Teachers.create_teacher(teacher) do
      {:ok, post} ->
        conn
        |> put_flash(:info, "Cadastro criado com sucesoo!")
        |> redirect(to: Routes.teacher_path(conn, :show, post))

      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def edit(conn, %{"id" => id}) do
    teacher = Teachers.get_teacher!(id)
    changeset = Teacher.changeset(teacher)
    render(conn, "edit.html", teacher: teacher, changeset: changeset)
  end

  def show(conn, %{"id" => id}) do
    teacher = Teachers.get_teacher!(id)
    render(conn, "show.html", teacher: teacher)
  end

  def update(conn, %{"id" => id, "teacher" => teacher_params}) do
    teacher = Teachers.get_teacher!(id)

    case Teachers.update_teacher(teacher, teacher_params) do
      {:ok, teacher} ->
        conn
        |> put_flash(:info, "Perfil atualizado com sucesoo!")
        |> redirect(to: Routes.teacher_path(conn, :show, teacher))

      {:error, changeset} ->
        render(conn, "edit.html", changeset: changeset, teacher: teacher)
    end
  end

  def delete(conn, %{"id" => id}) do
    Teachers.delete_teacher(id)

    conn
    |> put_flash(:info, "Perfil foi deletado")
    |> redirect(to: Routes.teacher_path(conn, :index))
  end
end
