defmodule Construct.Types.CommaList do
  @moduledoc """
  Extracts list of separated by comma values from string.
  You can use it alone, just for splitting values:

      defmodule Structure do
        use Construct

        structure do
          field :values, Construct.Types.CommaList
        end
      end

      > Structure.make!(values: "foo,bar,baz,42")
      %Structure{values: ["foo", "bar", "baz", "42"]}

      > Structure.make!(values: ["foo", 42])
      %Structure{values: ["foo", 42]}

  Also you can compose it with other types:

      defmodule UserInfoRequest do
        use Construct

        structure do
          field :user_ids, [Construct.Types.CommaList, {:array, :integer}]
        end
      end

      > UserInfoRequest.make!(%{user_ids: "1,2,42"})
      %UserInfoRequest{user_ids: [1, 2, 42]}

      > UserInfoRequest.make(%{user_ids: "1,foo"})
      {:error, %{user_ids: :invalid}}
  """

  @behaviour Construct.Type

  def cast(""), do: {:ok, []}
  def cast(v) when is_binary(v), do: {:ok, String.split(v, ",")}
  def cast(v) when is_list(v), do: {:ok, v}
  def cast(_), do: :error
end
