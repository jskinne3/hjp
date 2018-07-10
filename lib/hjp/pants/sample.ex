defmodule Hjp.Pants.Sample do
  use Ecto.Schema
  import Ecto.Changeset
  import Ecto.Query


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

  def waist_min(query, waist_min) when is_nil(waist_min) or byte_size(waist_min) == 0 do
    query
  end
  def waist_min(query, waist_min) do
    from sample in query,
    where: sample.waist >= ^waist_min
  end

  def waist_max(query, waist_max) when is_nil(waist_max) or byte_size(waist_max) == 0 do
    query
  end
  def waist_max(query, waist_max) do
    from sample in query,
    where: sample.waist <= ^waist_max
  end

end
