defmodule HttpServer do
  def init(default_options) do
    IO.puts "Starter server"
    default_options
  end

  def call(conn, props) do
    IO.puts "kaller plug"

    conn
    |> Plug.conn.send_resp(200, "Hello world")
  end


end
