defmodule HjpWeb.SampleController do
  use HjpWeb, :controller

  alias Hjp.Pants
  alias Hjp.Pants.Sample
  alias Hjp.Repo

  def index(conn, params) do
    waist_min = get_in(params, ["search", "waist_min"])
    waist_max = get_in(params, ["search", "waist_max"])
    samples = Sample
      |> Sample.waist_min(waist_min)
      |> Sample.waist_max(waist_max)
      |> Repo.all()
    #samples = Pants.list_samples()
    render(conn, "index.html", samples: samples)
  end

  def search(conn, params) do
    waist_min = get_in(params, ["search", "waist_min"])
    waist_max = get_in(params, ["search", "waist_max"])
    samples = Sample
      |> Sample.waist_min(waist_min)
      |> Sample.waist_max(waist_max)
      |> Repo.all()
    #samples = Pants.list_samples()
    render(conn, "search.html", samples: samples)
  end

  def new(conn, _params) do
    changeset = Pants.change_sample(%Sample{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"sample" => sample_params}) do
    case Pants.create_sample(sample_params) do
      {:ok, sample} ->
        conn
        |> put_flash(:info, "Sample created successfully.")
        |> redirect(to: sample_path(conn, :show, sample))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    sample = Pants.get_sample!(id)
    render(conn, "show.html", sample: sample)
  end

  def edit(conn, %{"id" => id}) do
    sample = Pants.get_sample!(id)
    changeset = Pants.change_sample(sample)
    render(conn, "edit.html", sample: sample, changeset: changeset)
  end

  def update(conn, %{"id" => id, "sample" => sample_params}) do
    sample = Pants.get_sample!(id)

    case Pants.update_sample(sample, sample_params) do
      {:ok, sample} ->
        conn
        |> put_flash(:info, "Sample updated successfully.")
        |> redirect(to: sample_path(conn, :show, sample))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", sample: sample, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    sample = Pants.get_sample!(id)
    {:ok, _sample} = Pants.delete_sample(sample)

    conn
    |> put_flash(:info, "Sample deleted successfully.")
    |> redirect(to: sample_path(conn, :index))
  end
end
