import Route from "@ioc:Adonis/Core/Route";

Route.group(() => {
  Route.get("/", "MenuItemCategoriesController.getMenuCategory");
  Route.get("/:id", "MenuItemCategoriesController.getId");
  Route.post("/", "MenuItemCategoriesController.create");
  Route.put("/:id", "MenuItemCategoriesController.update");
  Route.delete("/:id", "MenuItemCategoriesController.destroy");
}).prefix("/Categories");

Route.group(() => {
  Route.get("/", "ReservationsController.getReservationsController");
  Route.get("/:id", "ReservationsController.getId");
  Route.post("/", "ReservationsController.create");
  Route.put("/:id", "ReservationsController.update");
  Route.delete("/:id", "ReservationsController.destroy");
}).prefix("/reservations");

Route.group(() => {
  Route.get("/", "ReservationNumbersController.getReservationNumbers");
  Route.get("/:id", "ReservationNumbersController.getId");
  Route.post("/", "ReservationNumbersController.create");
  Route.put("/:id", "ReservationNumbersController.update");
  Route.delete("/:id", "ReservationNumbersController.destroy");
}).prefix("/reservationNumbers");

Route.group(() => {
  Route.get("/", "ReviewsController.getReviews");
  Route.get("/:id", "ReviewsController.getId");
  Route.post("/", "ReviewsController.create");
  Route.put("/:id", "ReviewsController.update");
  Route.delete("/:id", "ReviewsController.destroy");
}).prefix("/reviews");

Route.group(() => {
  Route.get("/", "ShopsController.getShops");
  Route.get("/search", "ShopController.Search");
  Route.get("/:id", "ShopController.getId");
}).prefix("/shop");

Route.group(() => {
  Route.get("/", "ShopMenusController.getShopMenus");
  Route.get("/:id", "ShopMenusController.getId");
  Route.post("/", "ShopMenusController.create");
  Route.put("/:id", "ShopMenusController.update");
  Route.delete("/:id", "ShopMenusController.destroy");
}).prefix("/shopMenu");

Route.group(() => {
  Route.get("/", "UsersController.getUsers");
  Route.get("/me", "UsersController.getMe");
  Route.post("/signUp", "UsersController.signUp");
  Route.post("/signIn", "UsersController.signIn");
  Route.post("/loginemail", "UsersController.loginemail");
  Route.put("/", "UsersController.update");
  Route.put("/pass", "UsersController.updatePassword");
  Route.delete("/:id", "UsersController.destroy");
}).prefix("/users");
