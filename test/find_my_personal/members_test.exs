defmodule FindMyPersonal.MembersTest do
  use FindMyPersonal.DataCase
  use Bamboo.Test

  alias FindMyPersonal.{Members, Members.Mail}
  import FindMyPersonal.MemberFixture

  describe "emails tests" do
    test "welcome email" do
      member = member_fixture()

      {:ok, email} = Mail.created({:ok, member})

      assert email.to == [nil: member.email]
      assert email.from == {nil, "gissandrogama@gmail.com"}
      assert email.html_body =~ "<strong>Obrigado por confiar no nosso time!!!</strong>"
      assert email.text_body =~ "Obrigado!!"
    end

    test "after registering, the member gets a welcome email" do
      member = member_fixture()
      {:ok, expected_email} = Mail.created({:ok, member})

      assert_delivered_email expected_email
    end
  end

  describe "members" do
    alias FindMyPersonal.Members.Member

    test "list_members/0 returns all members" do
      member = member_fixture()
      assert Members.list_members() == [member]
    end

    test "count_member_teacher/1" do
      member = member_fixture()
      assert Members.count_members_teacher(member.teacher_id) == 1
    end

    test "list_members/1 returns all members using filter" do
      member_fixture()
      assert Members.list_members("asdasd") == []
    end

    test "get_member!/1 returns the member with given id" do
      member = member_fixture()
      assert Members.get_member!(member.id) == member
    end

    test "create_member/1 with valid data creates a member" do
      assert {:ok, %Member{} = member} = Members.create_member(valid_attrs())
      assert member.birth_date == ~D[2010-04-17]
      assert member.blood == "O+"
      assert member.email == "some_email@email.com"
      assert member.height == "168"
      assert member.name == "Teste"
      assert member.weight == "75"
    end

    test "create_member/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Members.create_member(invalid_attrs())
    end

    test "update_member/2 with valid data updates the member" do
      member = member_fixture()
      assert {:ok, %Member{} = member} = Members.update_member(member, update_attrs())
      assert member.birth_date == ~D[2010-04-17]
      assert member.blood == "O+"
      assert member.email == "some_email_update@email.com"
      assert member.height == "168"
      assert member.name == "Teste update"
      assert member.weight == "79"
    end

    test "update_member/2 with invalid data returns error changeset" do
      member = member_fixture()
      assert {:error, %Ecto.Changeset{}} = Members.update_member(member, invalid_attrs())
      assert member == Members.get_member!(member.id)
    end

    test "delete_member/1 deletes the member" do
      member = member_fixture()
      assert {:ok, %Member{}} = Members.delete_member(member)
      assert_raise Ecto.NoResultsError, fn -> Members.get_member!(member.id) end
    end

    test "change_member/1 returns a member changeset" do
      member = member_fixture()
      assert %Ecto.Changeset{} = Members.change_member(member)
    end
  end
end
