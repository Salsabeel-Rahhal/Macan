import type { HttpContextContract } from "@ioc:Adonis/Core/HttpContext";
import ShopMenu from "App/Models/ShopMenu";
import { schema } from "@ioc:Adonis/Core/Validator";

export default class ShopMenusController {
  public async getShopMenu(_ctx: HttpContextContract) {
    var result = await ShopMenu.all();
    return result;
  }
  public async getId(ctx: HttpContextContract) {
    var id = ctx.params.id;
    var result = await ShopMenu.findOrFail(id);
    return result;
  }
  public async create(ctx: HttpContextContract) {
    const newSchema = schema.create({
      item_name: schema.string(),
      //item_image: schema.(),
      cost: schema.number(),
    });
    const fields = await ctx.request.validate({ schema: newSchema });
    var menu = new ShopMenu();
    menu.itemName = fields.item_name;
    //menu.itemImage = fields.item_image
    menu.cost = fields.cost;
    var result = await menu.save();
    return result;
  }
  public async update(ctx: HttpContextContract) {
    const newSchema = schema.create({
      id: schema.number(),
      item_name: schema.string(),
      //item_image: schema.(),
      cost: schema.number(),
    });
    const fields = await ctx.request.validate({ schema: newSchema });
    var id = fields.id;
    var menu = await ShopMenu.findOrFail(id);
    menu.itemName = fields.item_name;
    //  menu.itemImage = fields.item_image
    menu.cost = fields.cost;
    var result = await menu.save();
    return result;
  }
  public async destroy(ctx: HttpContextContract) {
    var id = ctx.params.id;
    var menu = await ShopMenu.findOrFail(id);
    await menu.delete();
    return { message: "The Menu has been deleted!" };
  }
}
