defmodule Construct.Types.UUIDTest do
  use ExUnit.Case

  defmodule Structure do
    use Construct

    structure do
      field :value, Construct.Types.UUID
    end
  end

  test "checks that string is in UUID format" do
    uuid = "fd4ddf80-a7d9-4af8-b46c-26fc4566d92c"

    assert {:ok, %Structure{value: uuid}}
        == Structure.make(value: uuid)
  end

  test "returns error" do
    assert {:error, %{value: :invalid}}
        == Structure.make(value: "foo")
  end
end
