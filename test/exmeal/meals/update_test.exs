defmodule Exmeal.Meals.UpdateTest do
  use Exmeal.DataCase

  import Exmeal.Factory

  alias Exmeal.Meals.Schema.Meal
  alias Exmeal.Users.Schema.User

  describe "Update Meal" do
    test "when a valid id is given, returns the meal" do
      user_params = build(:users_params)

      {:ok, %User{id: user_id}} = Exmeal.create_user(user_params)

      params = build(:meals_params, %{"user_id" => user_id})

      {:ok, %Meal{id: id}} = Exmeal.create_meal(params)

      response = Exmeal.update_meal(%{"id" => id, "calories" => 25})

      assert {:ok,
              %Meal{
                calories: 25,
                date: ~U[2021-07-30 12:00:00Z],
                description: "Frango com arroz integral",
                id: ^id,
                user_id: ^user_id
              }} = response
    end

    test "when an invalid id is given, returns an error" do
      id = "a6ef9b39-d638-4835-9ad7-dbe48d1257eb"
      response = Exmeal.update_meal(%{"id" => id})

      assert {:error, %Exmeal.Error{status: :not_found, error: "Meal not found"}} = response
    end
  end
end
