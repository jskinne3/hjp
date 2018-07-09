defmodule Hjp.PantsTest do
  use Hjp.DataCase

  alias Hjp.Pants

  describe "samples" do
    alias Hjp.Pants.Sample

    @valid_attrs %{brand: "some brand", inseam: 42, pocket_depth: 42, rise: 42, size: 42, style: "some style", waist: 42}
    @update_attrs %{brand: "some updated brand", inseam: 43, pocket_depth: 43, rise: 43, size: 43, style: "some updated style", waist: 43}
    @invalid_attrs %{brand: nil, inseam: nil, pocket_depth: nil, rise: nil, size: nil, style: nil, waist: nil}

    def sample_fixture(attrs \\ %{}) do
      {:ok, sample} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Pants.create_sample()

      sample
    end

    test "list_samples/0 returns all samples" do
      sample = sample_fixture()
      assert Pants.list_samples() == [sample]
    end

    test "get_sample!/1 returns the sample with given id" do
      sample = sample_fixture()
      assert Pants.get_sample!(sample.id) == sample
    end

    test "create_sample/1 with valid data creates a sample" do
      assert {:ok, %Sample{} = sample} = Pants.create_sample(@valid_attrs)
      assert sample.brand == "some brand"
      assert sample.inseam == 42
      assert sample.pocket_depth == 42
      assert sample.rise == 42
      assert sample.size == 42
      assert sample.style == "some style"
      assert sample.waist == 42
    end

    test "create_sample/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Pants.create_sample(@invalid_attrs)
    end

    test "update_sample/2 with valid data updates the sample" do
      sample = sample_fixture()
      assert {:ok, sample} = Pants.update_sample(sample, @update_attrs)
      assert %Sample{} = sample
      assert sample.brand == "some updated brand"
      assert sample.inseam == 43
      assert sample.pocket_depth == 43
      assert sample.rise == 43
      assert sample.size == 43
      assert sample.style == "some updated style"
      assert sample.waist == 43
    end

    test "update_sample/2 with invalid data returns error changeset" do
      sample = sample_fixture()
      assert {:error, %Ecto.Changeset{}} = Pants.update_sample(sample, @invalid_attrs)
      assert sample == Pants.get_sample!(sample.id)
    end

    test "delete_sample/1 deletes the sample" do
      sample = sample_fixture()
      assert {:ok, %Sample{}} = Pants.delete_sample(sample)
      assert_raise Ecto.NoResultsError, fn -> Pants.get_sample!(sample.id) end
    end

    test "change_sample/1 returns a sample changeset" do
      sample = sample_fixture()
      assert %Ecto.Changeset{} = Pants.change_sample(sample)
    end
  end
end
