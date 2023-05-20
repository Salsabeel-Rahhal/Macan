import type { HttpContextContract } from "@ioc:Adonis/Core/HttpContext";
import { schema, rules, validator } from "@ioc:Adonis/Core/Validator";
import { column } from "@ioc:Adonis/Lucid/Orm";
import User from "App/Models/User";

export default class UsersController {
  async signUp({ auth, request, response }: HttpContextContract) {
    const signUp = schema.create({
      first_name: schema.string(),
      last_name: schema.string(),
      email: schema.string([
        rules.email(),
        rules.unique({ table: "users", column: "email" }),
      ]),
      password: schema.string([rules.minLength(8)]),
      phone_number: schema.string(),
      country: schema.string(),
    });
    const payload = await request.validate({ schema: signUp });
    const user = new User();
    user.firstName = payload.first_name;
    user.lastName = payload.last_name;
    user.email = payload.email;
    user.password = payload.password;
    user.phoneNumber = payload.phone_number;
    user.country = payload.country;
    var newUser = await user.save();

    const token = await auth
      .use("api")
      .attempt(payload.email, payload.password);
    return { message: "your account created" };

    // return payload;
  }

  async signIn({ auth, request, response }: HttpContextContract) {
    const email = request.input("email");
    const password = request.input("password");
    try {
      const token = await auth.use("api").attempt(email, password);
      return token;
    } catch {
      return response.unauthorized("Invalid credentials");
    }
  }
  // public async getUsers(ctx: HttpContextContract) {
  //   var result = await User.all();
  //   return result;
  // }
  // public async getId(ctx: HttpContextContract) {
  //   // var authId = await ctx.auth.authenticate();
  //   // var result = await User.findOrFail(authId.id);
  //   // return result;
  // }
  // public async create(ctx: HttpContextContract) {
  //   const newSchema = schema.create({
  // first_name: schema.string(),
  // last_name: schema.string(),
  // email: schema.string(),
  // password: schema.string(),
  // phone_number: schema.string(),
  // country: schema.string(),
  //   });
  //   const fields = await ctx.request.validate({ schema: newSchema });
  //   var user = new User();
  //   user.firstName = fields.first_name;
  //   user.lastName = fields.last_name;
  //   user.email = fields.email;
  //   user.password = fields.password;
  //   user.phoneNumber = fields.phone_number;
  //   user.country = fields.country;
  //   var result = await user.save();
  //   return result;
  // }
  // public async update(ctx: HttpContextContract) {
  //   const newSchema = schema.create({
  //     id: schema.number(),
  //     first_name: schema.string(),
  //     last_name: schema.string(),
  //     email: schema.string(),
  //     password: schema.string(),
  //     phone_number: schema.string(),
  //     country: schema.string(),
  //   });
  //   const fields = await ctx.request.validate({ schema: newSchema });
  //   var id = fields.id;
  //   var user = await User.findOrFail(id);
  //   user.firstName = fields.first_name;
  //   user.lastName = fields.last_name;
  //   user.email = fields.email;
  //   user.password = fields.password;
  //   user.phoneNumber = fields.phone_number;
  //   user.country = fields.country;
  //   var result = await user.save();
  //   return result;
  // }
  // public async destroy(ctx: HttpContextContract) {
  //   var id = ctx.params.id;
  //   var user = await User.findOrFail(id);
  //   await user.delete();
  //   return { message: "The Users has been deleted!" };
  // }
}
