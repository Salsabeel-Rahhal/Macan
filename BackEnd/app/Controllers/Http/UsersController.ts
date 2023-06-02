import type { HttpContextContract } from "@ioc:Adonis/Core/HttpContext";
import { schema, rules, validator } from "@ioc:Adonis/Core/Validator";
import User from "App/Models/User";

export default class UsersController {
  public async getUsers(auth, ctx: HttpContextContract) {
    var result = await User.all();
    return result;
  }
  public async getId(ctx: HttpContextContract) {
    var authId = await ctx.auth.authenticate();
    var result = await User.findOrFail(authId.id);
    return result;
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
  async signUp({ auth, request, response }: HttpContextContract) {
    const createSchema = schema.create({
      email: schema.string([
        rules.email(),
        rules.unique({ table: "users", column: "email" }),
      ]),
      password: schema.string([rules.minLength(8)]),
    });

    const payload = await request.validate({ schema: createSchema });

    const user = new User();
    user.email = payload.email;
    user.password = payload.password;

    await user.save();
    const token = await auth.attempt(payload.email, payload.password);

    return token;
    // const signUp = schema.create({
    //   // user_name: schema.string(),
    //   email: schema.string([
    //     rules.email(),
    //     rules.unique({ table: "users", column: "email" }),
    //   ]),
    //   password: schema.string([rules.minLength(8)]),
    //   // phone_number: schema.string(),
    //   // country: schema.string(),
    // });
    // const payload = await request.validate({ schema: signUp });
    // const user = new User();
    // // user.userName = payload.user_name;
    // user.email = payload.email;
    // user.password = payload.password;
    // // user.phoneNumber = payload.phone_number;
    // // user.country = payload.country;
    // var newUser = await user.save();
    // const token = await auth
    //   .use("api")
    //   .attempt(payload.email, payload.password);
    // return token;
  }

  public async updateProfile(ctx: HttpContextContract) {
    var authId = await ctx.auth.authenticate();
    var result = await User.findOrFail(authId.id);
    await result.delete();
    return { message: "The Users has been deleted!" };
  }

  public async destroy(ctx: HttpContextContract) {
    var id = ctx.params.id;
    var user = await User.findOrFail(id);
    await user.delete();
    return { message: "The Users has been deleted!" };
  }
}
