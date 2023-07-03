import type { HttpContextContract } from "@ioc:Adonis/Core/HttpContext";
import Shop from "App/Models/Shop";

export default class ShopsController {
  public async getShops(_ctx: HttpContextContract) {
    var result = await Shop.query().select(
      "shop_name",
      "shop_location",
      "work_time",
      "food_type",
      "service_type",
      "contact_number",
      "rating",
      "image",
      "price_range"
    );

    return result;
  }
  public async getId(ctx: HttpContextContract) {
    var id = ctx.params.id;
    var result = await Shop.findOrFail(id);
    return result;
  }
  // public async Search(ctx: HttpContextContract) {
  //   try {
  //     const { searchTerm } = ctx.request.qs();
  //     const query = Shop.query().orWhere(
  //       "shop_name",
  //       "LIKE",
  //       `%${searchTerm}%`
  //     );
  //     // const shops = query.select("*");
  //     return ctx.response.json(query);
  //   } catch (error) {
  //     console.error(error);
  //     return ctx.response
  //       .status(500)
  //       .send("An error occurred during the search.");
  //   }
  // }
  public async search({ request, response }: HttpContextContract) {
    try {
      const searchTerm = request.qs();
      const shops = await Shop.query()
        .select("shop_name")
        .where("shop_name", "LIKE", `%${searchTerm}%`);

      return response.json(shops);
    } catch (error) {
      console.error(error);
      return response.status(500).send("An error occurred during the search.");
    }
  }
}
