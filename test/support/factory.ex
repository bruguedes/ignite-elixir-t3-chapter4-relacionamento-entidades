defmodule Exmeal.Factory do
  use ExMachina.Ecto, repo: Exmeal.Repo

  alias Exmeal.Meals.Schema.Meal

  @spec meals_params_factory :: %{optional(<<_::32, _::_*8>>) => <<_::64, _::_*8>> | 350}
  def meals_params_factory do
    %{
      "calories" => 350,
      "date" => "2021-07-30",
      "time" => "12:00:00",
      "description" => "Frango com arroz integral"
    }
  end

  def meal_factory do
    %Meal{
      description: "banana",
      date: "2001-05-02",
      calories: "2",
      id: "69961117-d966-4e2f-ac55-476d4f78ddfa"
    }
  end

  def users_params_factory do
    %{
      name: "Bruno Guedes",
      email: "bruno@mail.com",
      cpf: "12345678900"
    }
  end
end
