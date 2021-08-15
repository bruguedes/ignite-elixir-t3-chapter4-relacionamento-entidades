defmodule Exmeal.User.UpdateTest do
  use Exmeal.DataCase

  import Exmeal.Factory

  alias Exmeal.Users.Schema.User

  describe "Update Meal" do
    test "when a valid id is given, returns the meal" do
      user_params = build(:users_params)

      {:ok, %User{id: id}} = Exmeal.create_user(user_params)

      response = Exmeal.update_user(%{"id" => id, "name" => "Bruno Silva"})

      assert {:ok,
              %User{
                cpf: "12345678900",
                email: "bruno@mail.com",
                name: "Bruno Silva",
                id: ^id
              }} = response
    end

    test "when an invalid id is given, returns an error" do
      id = "a6ef9b39-d638-4835-9ad7-dbe48d1257eb"
      response = Exmeal.update_user(%{"id" => id})

      assert {:error, %Exmeal.Error{error: "User not found", status: :not_found}} = response
    end
  end
end
