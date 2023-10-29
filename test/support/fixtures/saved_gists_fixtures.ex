defmodule ElGist.SavedGistsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `ElGist.SavedGists` context.
  """

  @doc """
  Generate a saved_gist.
  """
  def saved_gist_fixture(attrs \\ %{}) do
    {:ok, saved_gist} =
      attrs
      |> Enum.into(%{

      })
      |> ElGist.SavedGists.create_saved_gist()

    saved_gist
  end
end
