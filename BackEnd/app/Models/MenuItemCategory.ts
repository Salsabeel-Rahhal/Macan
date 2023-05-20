import { DateTime } from "luxon";
import { BaseModel, BelongsTo, belongsTo, column } from "@ioc:Adonis/Lucid/Orm";
import ShopMenu from "./ShopMenu";

export default class MenuItemCategory extends BaseModel {
  @column({ isPrimary: true })
  public id: number;

  @column({ serializeAs: "item_category_name" })
  public itemCategoryName: string;

  @column({ serializeAs: "item_category_desc" })
  public itemCategoryDesc: string;

  @column({ serializeAs: "menu_id" })
  public menuId: number;

  @column.dateTime({ autoCreate: true })
  public createdAt: DateTime;

  @column.dateTime({ autoCreate: true, autoUpdate: true })
  public updatedAt: DateTime;

  @belongsTo(() => ShopMenu, {
    foreignKey: "menuId",
  })
  public MenuId: BelongsTo<typeof ShopMenu>;
}
