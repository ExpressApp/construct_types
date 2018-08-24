defmodule Construct.Types.CommaListTest do
  use ExUnit.Case

  defmodule Structure do
    use Construct

    structure do
      field(:values, [Construct.Types.CommaList, {:array, :integer}])
    end
  end

  test "splits string and casts into integer" do
    assert {:ok, %Structure{values: [1, 2, 3]}} == Structure.make(values: "1,2,3")
  end

  test "just custs into integer" do
    assert {:ok, %Structure{values: [1, 2, 3]}} == Structure.make(values: ["1", "2", "3"])
  end

  test "also accepts integer" do
    assert {:ok, %Structure{values: [1, 2, 3]}} == Structure.make(values: ["1", 2, "3"])
  end

  test "doesn't trims strings" do
    assert {:error, %{values: :invalid}} == Structure.make(values: "1  ,2,  3")
  end

  test "returns error" do
    assert {:error, %{values: :invalid}} == Structure.make(values: "foo,bar")
  end
end
