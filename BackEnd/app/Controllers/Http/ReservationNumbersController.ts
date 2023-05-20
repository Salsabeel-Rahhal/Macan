import type { HttpContextContract } from "@ioc:Adonis/Core/HttpContext";
import { schema } from "@ioc:Adonis/Core/Validator";
import ReservationNumber from "App/Models/ReservationNumber";

export default class ReservationNumbersController {
  public async getReservationNum(ctx: HttpContextContract) {
    var result = await ReservationNumber.all();
    return result;
  }
  public async getId(ctx: HttpContextContract) {
    var id = ctx.params.id;
    var result = await ReservationNumber.findOrFail(id);
    return result;
  }
  public async create(ctx: HttpContextContract) {
    const newSchema = schema.create({
      reservation_num: schema.number(),
    });
    const fields = await ctx.request.validate({ schema: newSchema });
    var reserNum = new ReservationNumber();
    reserNum.reservationNum = fields.reservation_num;
    var result = await reserNum.save();
    return result;
  }
  public async update(ctx: HttpContextContract) {
    const newSchema = schema.create({
      id: schema.number(),
      reservation_num: schema.number(),
    });
    const fields = await ctx.request.validate({ schema: newSchema });
    var id = fields.id;
    var reserNum = await ReservationNumber.findOrFail(id);
    reserNum.reservationNum = fields.reservation_num;
    var result = await reserNum.save();
    return result;
  }
  public async destroy(ctx: HttpContextContract) {
    var id = ctx.params.id;
    var reserNum = await ReservationNumber.findOrFail(id);
    await reserNum.delete();
    return { message: "The reservation Number has been deleted!" };
  }
}
