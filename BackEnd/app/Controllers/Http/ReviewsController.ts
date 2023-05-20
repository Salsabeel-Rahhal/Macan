import type { HttpContextContract } from "@ioc:Adonis/Core/HttpContext";
import { schema } from "@ioc:Adonis/Core/Validator";
import Review from "App/Models/Review";

export default class ReviewsController {
  public async getReviews(_ctx: HttpContextContract) {
    var result = await Review.all();
    return result;
  }
  public async getId(ctx: HttpContextContract) {
    var id = ctx.params.id;
    var result = await Review.findOrFail(id);
    return result;
  }
  public async create(ctx: HttpContextContract) {
    const newSchema = schema.create({
      review: schema.string(),
    });
    const fields = await ctx.request.validate({ schema: newSchema });
    var review = new Review();
    review.review = fields.review;
    var result = await review.save();
    return result;
  }
  public async update(ctx: HttpContextContract) {
    const newSchema = schema.create({
      id: schema.number(),
      review: schema.string(),
    });
    const fields = await ctx.request.validate({ schema: newSchema });
    var id = fields.id;
    var review = await Review.findOrFail(id);
    review.review = fields.review;
    var result = await review.save();
    return result;
  }
  public async destroy(ctx: HttpContextContract) {
    var id = ctx.params.id;
    var review = await Review.findOrFail(id);
    await review.delete();
    return { message: "The Review has been deleted!" };
  }
}
