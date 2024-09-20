CREATE TABLE "customer" (
  "customer_id" integer PRIMARY KEY,
  "first_name" varchar,
  "last_name" varchar,
  "email" varchar,
  "region" varchar
);

CREATE TABLE "order" (
  "order_id" integer PRIMARY KEY,
  "order_detail_id" integer,
  "branch_id" integer,
  "customer_id" integer,
  "payment_method_id" integer,
  "order_date" timestamp,
  "total_amount" float
);

CREATE TABLE "branch" (
  "branch_id" integer PRIMARY KEY,
  "name" varchar,
  "location" varchar,
  "manager" varchar
);

CREATE TABLE "menu_item" (
  "menu_item_id" integer PRIMARY KEY,
  "name" varchar,
  "description" varchar,
  "price" float
);

CREATE TABLE "order_detail" (
  "order_detail_id" integer PRIMARY KEY,
  "order_id" varchar,
  "menu_item_id" integer,
  "quantity" numeric,
  "unit_price" numeric
);

CREATE TABLE "inventory" (
  "inventory_id" integer PRIMARY KEY,
  "branch_id" varchar,
  "menu_item_id" integer,
  "stock_level" numeric,
  "reorder_level" numeric
);

CREATE TABLE "payment_method" (
  "payment_method_id" integer PRIMARY KEY,
  "payment_type" varchar
);

CREATE TABLE "date" (
  "datekey" timestamp PRIMARY KEY,
  "date" timestamp,
  "month" varchar,
  "quarter" varchar,
  "year" integer,
  "weekday" varchar
);

ALTER TABLE "order" ADD FOREIGN KEY ("payment_method_id") REFERENCES "payment_method" ("payment_method_id");

ALTER TABLE "order" ADD FOREIGN KEY ("order_id") REFERENCES "customer" ("customer_id");

ALTER TABLE "menu_item" ADD FOREIGN KEY ("menu_item_id") REFERENCES "inventory" ("menu_item_id");

ALTER TABLE "order" ADD FOREIGN KEY ("order_date") REFERENCES "date" ("date");

ALTER TABLE "order_detail" ADD FOREIGN KEY ("order_id") REFERENCES "order" ("order_detail_id");

ALTER TABLE "order" ADD FOREIGN KEY ("branch_id") REFERENCES "branch" ("branch_id");

ALTER TABLE "inventory" ADD FOREIGN KEY ("branch_id") REFERENCES "branch" ("branch_id");

ALTER TABLE "menu_item" ADD FOREIGN KEY ("menu_item_id") REFERENCES "order_detail" ("menu_item_id");
