defmodule HelloWorldHeaderTest do
  use ExUnit.Case, async: true
  use Plug.Test

  # Demo module with plug and a simple index action
  defmodule DemoPlug do
    use Plug.Builder

    plug HelloWorldHeader

    plug :index
    defp index(conn, _opts), do: conn |> send_resp(200, "OK")
  end

  test "it works!" do
    conn = conn(:get, "/")
    |> DemoPlug.call []

    assert conn.status == 200
  end

  test "we receive a custom header with content" do
    conn = conn(:get, "/")
    |> DemoPlug.call []

    assert get_resp_header(conn, "x-hello-world") == ["YEAH IT WORKS!"]
  end
end
