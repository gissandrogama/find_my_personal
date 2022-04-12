defmodule FindMyPersonal.Members.Mail do
  @moduledoc """
  This module cast function
  """
  import Bamboo.Email
  alias FindMyPersonal.{Mail.Mailer, Members.Member}

  def created({:ok, %Member{} = member}) do
    new_email(
      to: member.email,
      from: "gissandrogama@gmail.com",
      subject: "Bem vindo a Academia!! #{member.name}",
      html_body: "<strong>Obrigado por confiar no nosso time!!!</strong>",
      text_body: "Obrigado!!"
    )
    |> Mailer.deliver_now()
  end
end
