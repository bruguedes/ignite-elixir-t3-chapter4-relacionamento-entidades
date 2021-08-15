defmodule ExmealWeb.MealsViewTest do
  use ExmealWeb.ConnCase, async: true

  import Phoenix.View

  import Exmeal.Factory

  alias Exmeal.Meals.Schema.Meal
  alias Exmeal.Users.Schema.User

  alias ExmealWeb.MealsView

  test "render create.json" do
    user_params = build(:users_params)

    {:ok, %User{id: user_id}} = Exmeal.create_user(user_params)

    params = build(:meals_params, %{"user_id" => user_id})
    {:ok, %Meal{id: id} = meal} = Exmeal.create_meal(params)
    response = render(MealsView, "create.json", meal: meal)

    assert %{
             meal: %Meal{
               calories: 350,
               date: ~U[2021-07-30 12:00:00Z],
               description: "Frango com arroz integral",
               id: ^id,
               user_id: ^user_id
             },
             message: "Meal created!"
           } = response
  end

  test "render meal.json" do
    user_params = build(:users_params)

    {:ok, %User{id: user_id}} = Exmeal.create_user(user_params)

    params = build(:meals_params, %{"user_id" => user_id})
    {:ok, %Meal{id: id} = meal} = Exmeal.create_meal(params)

    response = render(MealsView, "meal.json", meal: meal)

    assert %{
             meal: %Meal{
               calories: 350,
               date: ~U[2021-07-30 12:00:00Z],
               description: "Frango com arroz integral",
               id: ^id,
               user_id: ^user_id
             }
           } = response
  end
end
