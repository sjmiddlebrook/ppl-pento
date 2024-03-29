defmodule PentoWeb.WrongLive do
  use PentoWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok,
     assign(socket,
       score: 0,
       message: "Make a guess:",
       time: time(),
       random_number: Enum.random(1..10) |> to_string
     )}
  end

  def handle_event("guess", %{"number" => guess}, socket)
      when guess == socket.assigns.random_number do
    message = "Your guess: #{guess}. Correct!"
    score = socket.assigns.score + 1

    {:noreply,
     assign(socket,
       score: score,
       message: message,
       time: time(),
       random_number: Enum.random(1..10) |> to_string
     )}
  end

  def handle_event("guess", %{"number" => guess}, socket) do
    message = "Your guess: #{guess}. Wrong! Try again."
    score = socket.assigns.score - 1
    {:noreply, assign(socket, score: score, message: message, time: time())}
  end

  def time() do
    DateTime.utc_now() |> to_string
  end

  def render(assigns) do
    ~H"""
    <h1>Your score: <%= @score %></h1>
    <h2><%= @message %></h2>
    <h3>It's <%= @time %></h3>
    <br />
    <div class="flex flex-col space-y-4">
      <%= for n <- 1..10 do %>
        <.link phx-click="guess" phx-value-number={n} class="border rounded-md w-fit p-4">
          <div><%= n %></div>
        </.link>
      <% end %>
    </div>
    """
  end
end
