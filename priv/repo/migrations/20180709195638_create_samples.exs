defmodule Hjp.Repo.Migrations.CreateSamples do
  use Ecto.Migration

  def change do
    create table(:samples) do
      add :brand, :string
      add :style, :string
      add :size, :integer
      add :inseam, :integer
      add :waist, :integer
      add :pocket_depth, :integer
      add :rise, :integer

      timestamps()
    end

  end
end
