defmodule Pento.Promo do
  alias Pento.Promo.Recipient

  def change_recipient(%Recipient{} = recipient, attrs \\ %{}) do
    Recipient.changeset(recipient, attrs)
  end

  def send_promo(recipient, _attrs) do
    # Send the promo email to the recipient
    IO.puts(
      "Sending promo email to recipient #{recipient["first_name"]} at #{recipient["email"]}"
    )

    {:ok, %Recipient{}}
  end
end
