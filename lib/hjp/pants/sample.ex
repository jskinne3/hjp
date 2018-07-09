defmodule Hjp.Pants.Sample do
  use Ecto.Schema
  import Ecto.Changeset


  schema "samples" do
    field :brand, :string
    field :inseam, :integer
    field :pocket_depth, :integer
    field :rise, :integer
    field :size, :integer
    field :style, :string
    field :waist, :integer

    timestamps()
  end

  @doc false
  def changeset(sample, attrs) do
    sample
    |> cast(attrs, [:brand, :style, :size, :inseam, :waist, :pocket_depth, :rise])
    |> validate_required([:brand, :style, :size, :inseam, :waist, :pocket_depth, :rise])
  end
end
