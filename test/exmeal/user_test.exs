defmodule Exmeal.UserTest do
  use Exmeal.DataCase

  import Exmeal.Factory

  alias Ecto.Changeset

  alias Exmeal.Users.Schema.User

  describe "changeset/1" do
    test "when all params are valid, returns a valid changeset" do
      params = build(:users_params)

      response = User.changeset(params)

      assert %Changeset{
               changes: %{
                 cpf: "12345678900",
                 email: "bruno@mail.com",
                 name: "Bruno Guedes"
               },
               valid?: true
             } = response
    end
  end
end
