defmodule TheGoodHenryWeb.Router do
  use TheGoodHenryWeb, :router

  pipeline :api do
    plug(:accepts, ["json"])
  end

  scope "/api", TheGoodHenryWeb do
    pipe_through(:api)

    resources("/foodstuffs", FoodstuffsController, except: [:new, :edit])
    resources("/users", UserController, except: [:new, :edit])
    resources("/breakfasts", BreakfastController, except: [:new, :edit])
  end
end
