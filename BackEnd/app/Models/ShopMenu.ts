import { DateTime } from "luxon";
import {
  BaseModel,
  BelongsTo,
  HasMany,
  belongsTo,
  column,
  hasMany,
} from "@ioc:Adonis/Lucid/Orm";
import MenuItemCategory from "./MenuItemCategory";
import Shop from "./Shop";

export default class ShopMenu extends BaseModel {
  @column({ isPrimary: true })
  public id: number;

  @column({ serializeAs: "item_name" })
  public itemName: string;

  @column({ serializeAs: "itemImage" })
  public itemImage: Blob;

  @column({ serializeAs: "cost" })
  public cost: number;

  @column({ serializeAs: "item_category_id" })
  public categoryId: number;

  @column({ serializeAs: "shop_id" })
  public shopId: number;

  @column({ serializeAs: "price_range" })
  public priceRange: number;

  @column.dateTime({ autoCreate: true })
  public createdAt: DateTime;

  @column.dateTime({ autoCreate: true, autoUpdate: true })
  public updatedAt: DateTime;

  @hasMany(() => MenuItemCategory, {
    foreignKey: "categoryId",
  })
  public CategoryId: HasMany<typeof MenuItemCategory>;

  @belongsTo(() => Shop, {
    foreignKey: "shopId",
  })
  public ShopId: BelongsTo<typeof Shop>;
}
