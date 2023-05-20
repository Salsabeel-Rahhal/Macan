import type { HttpContextContract } from "@ioc:Adonis/Core/HttpContext";
import MenuItemCategory from "App/Models/MenuItemCategory";
import { schema } from "@ioc:Adonis/Core/Validator";

export default class MenuItemCategoriesController {
  public async getMenuItems(_ctx: HttpContextContract) {
    var result = await MenuItemCategory.all();
    return result;
  }
  public async getId(ctx: HttpContextContract) {
    var id = ctx.params.id;
    var result = await MenuItemCategory.findOrFail(id);
    return result;
  }
  public async create(ctx: HttpContextContract) {
    const newSchema = schema.create({
      item_category_name: schema.string(),
      item_category_desc: schema.string(),
    });
    const fields = await ctx.request.validate({ schema: newSchema });
    var menu = new MenuItemCategory();
    menu.itemCategoryName = fields.item_category_name;
    menu.itemCategoryDesc = fields.item_category_desc;
    var result = await menu.save();
    return result;
  }
  public async update(ctx: HttpContextContract) {
    const newSchema = schema.create({
      id: schema.number(),
      item_category_name: schema.string(),
      item_category_desc: schema.string(),
    });
    const fields = await ctx.request.validate({ schema: newSchema });
    var id = fields.id;
    var menu = await MenuItemCategory.findOrFail(id);
    menu.itemCategoryName = fields.item_category_name;
    menu.itemCategoryDesc = fields.item_category_desc;
    var result = await menu.save();
    return result;
  }
  public async destroy(ctx: HttpContextContract) {
    var id = ctx.params.id;
    var menu = await MenuItemCategory.findOrFail(id);
    await menu.delete();
    return { message: "The menu item has been deleted!" };
  }
}
