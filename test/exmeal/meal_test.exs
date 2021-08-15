defmodule Exmeal.MealTest do
  use Exmeal.DataCase

  import Exmeal.Factory

  alias Ecto.Changeset

  alias Exmeal.Helpers.DateParse
  alias Exmeal.Meals.Schema.Meal

  describe "changeset/1" do
    test "when all params are valid, returns a valid changeset" do
      user_params = build(:users_params)

      {:ok, %{id: user_id}} = Exmeal.create_user(user_params)

      {:ok, meal_input} =
        :meals_params
        |> build()
        |> Map.put("user_id", user_id)
        |> DateParse.parse()

      assert %Changeset{
               changes: %{
                 description: "Frango com arroz integral",
                 date: ~U[2021-07-30 12:00:00Z],
                 calories: 350,
                 user_id: _user_id
               },
               valid?: true
             } = Meal.changeset(meal_input)
    end
  end
end
