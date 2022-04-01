defmodule FindMyPersonalWeb.Api.MemberControllerTest do
  use FindMyPersonalWeb.ConnCase

  alias FindMyPersonal.Members
  alias FindMyPersonal.Members.Member
  import FindMyPersonal.MemberFixture

  def fixture(:member) do
    {:ok, member} = Members.create_member(valid_attrs())
    member
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all members", %{conn: conn} do
      conn = get(conn, Routes.api_member_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create member" do
    test "renders member when data is valid", %{conn: conn} do
      conn = post(conn, Routes.api_member_path(conn, :create), member: valid_attrs())
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.api_member_path(conn, :show, id))

      assert %{
               "avatar_url" => "http://imagens.com",
               "birth_date" => "2010-04-17",
               "blood" => "O+",
               "email" => "some_email@email.com",
               "height" => "168",
               "id" => _,
               "name" => "Teste",
               "weight" => "75"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.api_member_path(conn, :create), member: invalid_attrs())
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update member" do
    setup [:create_member]

    test "renders member when data is valid", %{conn: conn, member: %Member{id: id} = member} do
      conn = put(conn, Routes.api_member_path(conn, :update, member), member: update_attrs())
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.api_member_path(conn, :show, id))

      assert %{
               "birth_date" => "2010-04-17",
               "blood" => "O+",
               "email" => "some_email_update@email.com",
               "height" => "168",
               "id" => _,
               "name" => "Teste update",
               "weight" => "79",
               "avatar_url" => "http://imagens.com"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, member: member} do
      conn = put(conn, Routes.api_member_path(conn, :update, member), member: invalid_attrs())
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete member" do
    setup [:create_member]

    test "deletes chosen member", %{conn: conn, member: member} do
      conn = delete(conn, Routes.api_member_path(conn, :delete, member))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.api_member_path(conn, :show, member))
      end
    end
  end

  defp create_member(_) do
    member = fixture(:member)
    %{member: member}
  end
end
