defmodule Exmeal do
  alias Exmeal.Helpers.GetMealOrUser

  alias Exmeal.Meals.Create, as: CreateMeal
  alias Exmeal.Meals.Delete, as: DeleteMeal
  alias Exmeal.Meals.Update, as: UpdateMeal

  alias Exmeal.Users.Create, as: CreateUser
  alias Exmeal.Users.Delete, as: DeleteUser
  alias Exmeal.Users.Update, as: UpdateUser

  defdelegate create_meal(params), to: CreateMeal, as: :call
  defdelegate delete_meal(params), to: DeleteMeal, as: :call
  defdelegate get_meal_by_id(struc, params), to: GetMealOrUser, as: :by_id
  defdelegate update_meal(params), to: UpdateMeal, as: :call

  defdelegate create_user(params), to: CreateUser, as: :call
  defdelegate delete_user(params), to: DeleteUser, as: :call
  defdelegate get_user_by_id(struc, params), to: GetMealOrUser, as: :by_id
  defdelegate update_user(params), to: UpdateUser, as: :call
end
