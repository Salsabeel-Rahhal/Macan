import { DateTime } from "luxon";
import Hash from "@ioc:Adonis/Core/Hash";
import {
  BaseModel,
  beforeSave,
  BelongsTo,
  belongsTo,
  column,
  HasMany,
  hasMany,
} from "@ioc:Adonis/Lucid/Orm";
import Review from "./Review";
import Reservation from "./Reservation";
import Shop from "./Shop";

export default class User extends BaseModel {
  @column({ isPrimary: true })
  public id: number;

  @column({ serializeAs: "user_name" })
  public userName: string;

  @column({ serializeAs: "email" })
  public email: string;

  @column({ serializeAs: "phone_number" })
  public phoneNumber: string;

  @column({ serializeAs: "password" })
  public password: string;

  @column({ serializeAs: "review_id" })
  public reviewId: number;

  @column({ serializeAs: "reservation_id" })
  public reservationId: number;

  @column({ serializeAs: "shop_id" })
  public shopId: number;

  @column.dateTime({ autoCreate: true })
  public createdAt: DateTime;

  @column.dateTime({ autoCreate: true, autoUpdate: true })
  public updatedAt: DateTime;

  @hasMany(() => Review, {
    foreignKey: "reviewId",
  })
  public ReviewId: HasMany<typeof Review>;

  @belongsTo(() => Reservation, {
    foreignKey: "reservationId",
  })
  public ReservationId: BelongsTo<typeof Reservation>;

  @hasMany(() => Shop, {
    foreignKey: "shopId",
  })
  public ShopId: HasMany<typeof Shop>;

  @beforeSave()
  public static async hashPassword(user: User) {
    if (user.$dirty.password) {
      user.password = await Hash.make(user.password);
    }
  }
}
