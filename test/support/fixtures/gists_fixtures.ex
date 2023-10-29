defmodule ElGist.GistsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `ElGist.Gists` context.
  """

  @doc """
  Generate a gist.
  """
  def gist_fixture(attrs \\ %{}) do
    {:ok, gist} =
      attrs
      |> Enum.into(%{
        description: "some description",
        markup_text: "some markup_text",
        name: "some name"
      })
      |> ElGist.Gists.create_gist()

    gist
  end
end
