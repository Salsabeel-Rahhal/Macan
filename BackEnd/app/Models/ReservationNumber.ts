import { DateTime } from "luxon";
import {
  BaseModel,
  BelongsTo,
  belongsTo,
  column,
  HasMany,
  hasMany,
} from "@ioc:Adonis/Lucid/Orm";
import User from "./User";
import Shop from "./Shop";

export default class ReservationNumber extends BaseModel {
  @column({ isPrimary: true })
  public id: number;

  @column({ serializeAs: "reservation_num" })
  public reservationNum: number;

  @column({ serializeAs: "points" })
  public points: number;

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

  @hasMany(() => Shop, {
    foreignKey: "shopId",
  })
  public ShopId: HasMany<typeof Shop>;
}
