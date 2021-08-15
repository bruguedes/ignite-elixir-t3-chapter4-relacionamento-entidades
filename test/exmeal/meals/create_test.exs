defmodule Exmeal.Meals.CreateTest do
  use Exmeal.DataCase, async: true

  import Exmeal.Factory

  alias Exmeal.Meals.Schema.Meal
  alias Exmeal.Users.Schema.User

  describe "Create Meal" do
    test "when all params are valid, returns the meal" do
      user_params = build(:users_params)

      {:ok, %User{id: user_id}} = Exmeal.create_user(user_params)

      params = build(:meals_params, %{"user_id" => user_id})

      {:ok, %Meal{id: id} = response} = Exmeal.create_meal(params)

      assert %Meal{
               calories: 350,
               date: ~U[2021-07-30 12:00:00Z],
               description: "Frango com arroz integral",
               id: ^id,
               user_id: ^user_id
             } = response
    end

    test "when there are invalid params, returns an error" do
      params = %{
        " calories" => 20,
        "date" => ~D[2001-05-02],
        "user_id" => Ecto.UUID.generate()
      }

      response = Exmeal.create_meal(params)

      assert {:error, %Exmeal.Error{}} = response
    end
  end
end
