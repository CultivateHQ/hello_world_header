defmodule HelloWorldHeader do
  def init(options) do
    options
  end

  def call(conn, _options) do
    conn |> Plug.Conn.put_resp_header("x-hello-world", "YEAH IT WORKS!")
  end
end
