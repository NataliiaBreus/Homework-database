DROP TABLE IF EXISTS "goods" CASCADE;
CREATE TABLE "goods" (
  "id" SERIAL PRIMARY KEY ,
  "name" VARCHAR(100) NOT NULL CHECK ("name" !='') UNIQUE,
  "price" INTEGER NOT NULL CHECK ("price" > 0)
);

DROP TABLE IF EXISTS "orders" CASCADE;

CREATE TABLE "orders" (
"orders_id" SERIAL PRIMARY KEY,
"customer_name" VARCHAR (150) NOT NULL CHECK ("customer_name" !=''),
"address" VARCHAR (200) NOT NULL CHECK ("address" !=''),
"phone" VARCHAR (30) NOT NULL CHECK ("phone" !=''),
"contract_number" VARCHAR (65) NOT NULL CHECK ("contract_number" !=''),
"contract_date" DATE NOT NULL DEFAULT CURRENT_DATE,
"product_name" VARCHAR (100) NOT NULL  REFERENCES "goods" ("name"),
"planned_delivery" INTEGER NOT NULL CHECK ("planned_delivery" > 0),
UNIQUE ("customer_name", "contract_number") 
);

DROP TABLE IF EXISTS "shipment" CASCADE;

CREATE TABLE "shipment" (
"shipment_id" SERIAL PRIMARY KEY,
"order_id" INTEGER NOT NULL REFERENCES "orders" ("orders_id"),
"shipping_date" DATE NOT NULL DEFAULT CURRENT_DATE,
"shipped_goods" INTEGER NOT NULL CHECK ("shipped_goods" > 0)
);
