import BaseSchema from "@ioc:Adonis/Lucid/Schema";

export default class extends BaseSchema {
  protected tableName = "users";

  public async up() {
    this.schema.alterTable(this.tableName, (table) => {
      // table.increments("id").primary().notNullable();
      // table.string("email", 255).notNullable().unique().notNullable();
      // table.string("password", 255).notNullable();
      // table.string("remember_me_token").nullable();

      table.timestamps(true, true);
    });
  }

  public async down() {
    this.schema.dropTable(this.tableName);
  }
}
