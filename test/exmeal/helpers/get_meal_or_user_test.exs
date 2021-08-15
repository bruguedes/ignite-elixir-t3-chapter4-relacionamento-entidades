defmodule Exmeal.Helpers.GetMealOrUserTest do
  use Exmeal.DataCase
  import Exmeal.Factory

  alias Exmeal.Helpers.GetMealOrUser
  alias Exmeal.Meals.Schema.Meal
  alias Exmeal.Users.Schema.User

  describe "GetMealOrUser/2" do
    test "when a valid id is given, returns the meal" do
      user_params = build(:users_params)

      {:ok, %User{id: user_id}} = Exmeal.create_user(user_params)

      params = build(:meals_params, %{"user_id" => user_id})

      {:ok, %Meal{id: id}} = Exmeal.create_meal(params)

      response = GetMealOrUser.by_id(Meal, id)

      assert {:ok,
              %Meal{
                calories: 350,
                date: ~U[2021-07-30 12:00:00Z],
                description: "Frango com arroz integral",
                id: ^id,
                user_id: ^user_id
              }} = response
    end

    test "when an invalid id is given, returns an error" do
      id = "a6ef9b39-d638-4835-9ad7-dbe48d1257eb"
      response = GetMealOrUser.by_id(Meal, id)

      assert {:error, %Exmeal.Error{status: :not_found, error: "Meal not found"}} == response
    end

    test "when a valid id is given, returns the user" do
      user_params = build(:users_params)

      {:ok, %User{id: user_id}} = Exmeal.create_user(user_params)
      response = GetMealOrUser.by_id(User, user_id)

      assert {:ok,
              %User{
                cpf: "12345678900",
                email: "bruno@mail.com",
                id: ^user_id,
                name: "Bruno Guedes"
              }} = response
    end
  end

  test "when an invalid user id is given, returns an error" do
    id = "a6ef9b39-d638-4835-9ad7-dbe48d1257eb"
    response = GetMealOrUser.by_id(User, id)

    assert {:error, %Exmeal.Error{error: "User not found", status: :not_found}} == response
  end
end
