import type { HttpContextContract } from "@ioc:Adonis/Core/HttpContext";
import Shop from "App/Models/Shop";
import { schema } from "@ioc:Adonis/Core/Validator";

export default class ShopsController {
  public async getShops(_ctx: HttpContextContract) {
    var result = await Shop.all();
    return result;
  }
  public async getId(ctx: HttpContextContract) {
    var id = ctx.params.id;
    var result = await Shop.findOrFail(id);
    return result;
  }
  public async create(ctx: HttpContextContract) {
    const newSchema = schema.create({
      shop_name: schema.string(),
      shop_location: schema.string(),
      rate: schema.number(),
      contact_number: schema.string(),
      service_type: schema.string(),
      food_type: schema.string(),
      work_time: schema.date(),
      price_range: schema.number(),
    });
    const fields = await ctx.request.validate({ schema: newSchema });
    var shop = new Shop();
    shop.shopName = fields.shop_name;
    shop.shopLocation = fields.shop_location;
    shop.contactNumber = fields.contact_number;
    shop.serviceType = fields.service_type;
    shop.foodType = fields.food_type;
    shop.workTime = fields.work_time;
    var result = await shop.save();
    return result;
  }
  public async update(ctx: HttpContextContract) {
    const newSchema = schema.create({
      id: schema.number(),
      shop_name: schema.string(),
      shop_location: schema.string(),
      contact_number: schema.string(),
      service_type: schema.string(),
      food_type: schema.string(),
      work_time: schema.date(),
    });
    const fields = await ctx.request.validate({ schema: newSchema });
    var id = fields.id;
    var shop = await Shop.findOrFail(id);
    shop.shopName = fields.shop_name;
    shop.shopLocation = fields.shop_location;
    shop.contactNumber = fields.contact_number;
    shop.serviceType = fields.service_type;
    shop.foodType = fields.food_type;
    shop.workTime = fields.work_time;
    var result = await shop.save();
    return result;
  }
  public async destroy(ctx: HttpContextContract) {
    var id = ctx.params.id;
    var shop = await Shop.findOrFail(id);
    await shop.delete();
    return { message: "The Shop Number has been deleted!" };
  }
}
