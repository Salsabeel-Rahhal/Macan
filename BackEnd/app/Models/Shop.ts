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
import ShopMenu from "./ShopMenu";
import Reservation from "./Reservation";
import Review from "./Review";

export default class Shop extends BaseModel {
  @column({ isPrimary: true })
  public id: number;

  @column({ serializeAs: "shop_name" })
  public shopName: string;

  @column({ serializeAs: "shop_location" })
  public shopLocation: string;

  @column({ serializeAs: "review_id" })
  public reviewId: number;

  @column({ serializeAs: "contact_number" })
  public contactNumber: string;

  @column({ serializeAs: "service_type" })
  public serviceType: string;

  @column({ serializeAs: "food_type" })
  public foodType: string;

  @column({ serializeAs: "work_time" })
  public workTime: DateTime;

  @column({ serializeAs: "shop_menu_id" })
  public menuId: number;

  @column({ serializeAs: "reservation_id" })
  public reservationId: number;

  @column({ serializeAs: "user_id" })
  public userId: number;

  @column.dateTime({ autoCreate: true })
  public createdAt: DateTime;

  @column.dateTime({ autoCreate: true, autoUpdate: true })
  public updatedAt: DateTime;

  @belongsTo(() => ShopMenu, {
    foreignKey: "menuId",
  })
  public MenuId: BelongsTo<typeof ShopMenu>;

  @hasMany(() => Reservation, {
    foreignKey: "reservationId",
  })
  public ReservationId: HasMany<typeof Reservation>;

  @hasMany(() => User, {
    foreignKey: "userId",
  })
  public UserId: HasMany<typeof User>;

  @hasMany(() => Review, {
    foreignKey: "reviewId",
  })
  public ReviewId: HasMany<typeof Review>;
}
