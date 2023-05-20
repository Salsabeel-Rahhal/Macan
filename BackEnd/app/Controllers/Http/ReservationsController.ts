import type { HttpContextContract } from "@ioc:Adonis/Core/HttpContext";
import { schema } from "@ioc:Adonis/Core/Validator";
import Reservation from "App/Models/Reservation";

export default class ReservationsController {
  public async getReservations(ctx: HttpContextContract) {
    var result = await Reservation.all();
    return result;
  }
  public async getId(ctx: HttpContextContract) {
    var id = ctx.params.id;
    var result = await Reservation.findOrFail(id);
    return result;
  }
  public async create(ctx: HttpContextContract) {
    const newSchema = schema.create({
      time: schema.date(),
      date: schema.date(),
      cancel: schema.boolean(),
      late_time: schema.date(),
      persons_num: schema.number(),
    });
    const fields = await ctx.request.validate({ schema: newSchema });
    var reservation = new Reservation();
    reservation.time = fields.time;
    reservation.date = fields.date;
    reservation.cancel = fields.cancel;
    reservation.lateTime = fields.late_time;
    reservation.personsNum = fields.persons_num;
    var result = await reservation.save();
    return result;
  }
  public async update(ctx: HttpContextContract) {
    const newSchema = schema.create({
      id: schema.number(),
      time: schema.date(),
      date: schema.date(),
      cancel: schema.boolean(),
      late_time: schema.date(),
      persons_num: schema.number(),
    });
    const fields = await ctx.request.validate({ schema: newSchema });
    var id = fields.id;
    var reservation = await Reservation.findOrFail(id);
    reservation.time = fields.time;
    reservation.date = fields.date;
    reservation.cancel = fields.cancel;
    reservation.lateTime = fields.late_time;
    reservation.personsNum = fields.persons_num;
    var result = await reservation.save();
    return result;
  }
  public async destroy(ctx: HttpContextContract) {
    var id = ctx.params.id;
    var reservation = await Reservation.findOrFail(id);
    await reservation.delete();
    return { message: "The Reservation has been deleted!" };
  }
}
