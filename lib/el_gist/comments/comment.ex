defmodule ElGist.Comments.Comment do
  use Ecto.Schema
  import Ecto.Changeset

  schema "comments" do
    field :markup_text, :string
    belongs_to :user, ElGist.Accounts.User
    belongs_to :gist, ElGist.Gists.Gist

    timestamps()
  end

  @doc false
  def changeset(comment, attrs) do
    comment
    |> cast(attrs, [:markup_text, :user_id, :gist_id])
    |> validate_required([:markup_text, :user_id, :gist_id])
  end
end
