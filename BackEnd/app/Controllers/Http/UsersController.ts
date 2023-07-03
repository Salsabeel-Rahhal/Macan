import type { HttpContextContract } from "@ioc:Adonis/Core/HttpContext";
import { schema, rules, validator } from "@ioc:Adonis/Core/Validator";
const { use } = require("@adonisjs/core");
import User from "App/Models/User";
import { sign } from "jsonwebtoken";
export default class UsersController {
  async getMe({ auth }: HttpContextContract) {
    var authObject = await auth.authenticate();
    var user = await User.findOrFail(authObject.id);
    return user;
  }
  public async getUsers(auth, ctx: HttpContextContract) {
    const { otp } = require("adonis-otp");
    const User = use("App/Models/User");
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
      userName: schema.string([rules.minLength(4)]),
      phoneNumber: schema.string(),
    });

    const payload = await request.validate({ schema: createSchema });
    const user = new User();
    user.email = payload.email;
    user.password = payload.password;
    user.userName = payload.userName;
    user.phoneNumber = payload.phoneNumber;

    await user.save();
    const token = await auth
      .use("api")
      .attempt(payload.email, payload.password);

    return token;
  }

  async update({ auth, request, response }: HttpContextContract) {
    try {
      var authObject = await auth.authenticate();

      const createSchema = schema.create({
        email: schema.string([rules.email()]),
        userName: schema.string([rules.minLength(2)]),
      });

      const payload = await request.validate({ schema: createSchema });
      const user = await User.findOrFail(authObject.id);
      user.userName = payload.userName;
      user.email = payload.email;
      if (
        request.input("password") &&
        request.input("password").toString().length > 0
      ) {
        user.password = request.input("password");
      }

      await user.save();
      return response.json({
        email: user.email,
        userName: user.userName,
      });
    } catch (ex) {
      console.log(ex);
      return response.badRequest({ message: ex.toString() });
    }
  }

  public async updatePassword(ctx: HttpContextContract) {
    const newSchema = schema.create({
      password: schema.string(),
    });

    const fields = await ctx.request.validate({
      schema: newSchema,
    });

    var authobject = await ctx.auth.authenticate();

    var user = await User.findOrFail(authobject.id);

    user.password = fields.password;

    var newUser = await user.save();

    const token = sign({ userId: authobject.id }, "your-secret-key");

    return ctx.response.json({
      token: token,
      type: "Bearer",
    });
  }
  public async loginemail({ request, response, auth }: HttpContextContract) {
    var object = request.all();
    var email = object.email;
    try {
      await email;
      response.type("json");
      return { email };
    } catch (error) {
      response.type("json");
      return { success: false, message: "Invalid email " };
    }
  }
  public async destroy(ctx: HttpContextContract) {
    var id = ctx.params.id;
    var user = await User.findOrFail(id);
    await user.delete();
    return { message: "The Users has been deleted!" };
  }
}
