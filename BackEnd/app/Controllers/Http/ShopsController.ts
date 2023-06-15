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
}
