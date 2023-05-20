import { DateTime } from "luxon";
import {
  BaseModel,
  belongsTo,
  BelongsTo,
  column,
  HasMany,
  hasMany,
} from "@ioc:Adonis/Lucid/Orm";
import User from "./User";
import Shop from "./Shop";

export default class Review extends BaseModel {
  @column({ isPrimary: true })
  public id: number;

  @column({ serializeAs: "review" })
  public review: string;

  @column({ serializeAs: "user_id" })
  public userId: number;

  @column({ serializeAs: "shop_id" })
  public shopId: number;

  @column.dateTime({ autoCreate: true })
  public createdAt: DateTime;

  @column.dateTime({ autoCreate: true, autoUpdate: true })
  public updatedAt: DateTime;

  @belongsTo(() => User, {
    foreignKey: "userId",
  })
  public UserId: BelongsTo<typeof User>;

  @belongsTo(() => Shop, {
    foreignKey: "shopId",
  })
  public ShopId: BelongsTo<typeof Shop>;
}
