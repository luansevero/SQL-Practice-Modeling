CREATE DATABASE "modelingPractice";

--States Table
CREATE TABLE states (
    "id" SERIAL NOT NULL PRIMARY KEY,
    "name" TEXT NOT NULL
)

--Cities Table
CREATE TABLE cities (
    "id" SERIAL NOT NULL PRIMARY KEY,
    "name" TEXT NOT NULL,
    "stateId" INTEGER NOT NULL REFERENCES "states"("id")
)

--CustomerAddresses Table
CREATE TABLE "customerAddresses" (
    "id" SERIAL NOT NULL PRIMARY KEY,
    "customerId" INTEGER NOT NULL REFERENCES "customers"("id"),
    "street" TEXT NOT NULL,
    "number" INTEGER NOT NULL,
    "complement" TEXT NOT NULL,
    "postalCode" TEXT NOT NULL,
    "cityId" INTEGER NOT NULL REFERENCES "cities"("id")
);

--CustomerPhones Table
CREATE TYPE type AS ENUM('landline','mobile');

CREATE TABLE "customerPhones" (
    "id"  SERIAL NOT NULL PRIMARY KEY,
    "customerId" INTEGER NOT NULL REFERENCES "customers"("id"),
    "number" TEXT NOT NULL,
    "type" TYPE
)

--Customer Table
CREATE TABLE customers (
    "id" SERIAL NOT NULL PRIMARY KEY,
    "fullName" TEXT NOT NULL,
    "cpf" VARCHAR(11) NOT NULL UNIQUE,
    "email" TEXT NOT NULL UNIQUE,
    "password" TEXT NOT NULL
)
--BankAccount Table
CREATE TABLE "bankAccount" (
    id SERIAL NOT NULL PRIMARY KEY,
    "customerId" INTEGER NOT NULL,
    "accountNumber" INTEGER NOT NULL,
    agency TEXT NOT NULL,
    "openDate" DATE NOT NULL DEFAULT GETDATE(),
    "closeDate" DATE DEFAULT NULL
)
--Transactions Table
CREATE TYPE transaction AS ENUM('deposit','withdraw');

CREATE TABLE "transactions" (
    "id" SERIAL NOT NULL PRIMARY KEY,
    "bankAccountId" INTEGER NOT NULL,
    "amount" REAL NOT NULL,
    "type" TRANSACTION,
    "time" TIMESTAMP NOT NULL DEFAULT GETDATE(),
    "description" TEXT NOT NULL,
    "cancelled" BOOLEAN NOT NULL DEFAULT false
)
--CreditCards Table
CREATE TABLE "creditCards" (
	"id" SERIAL NOT NULL PRIMARY KEY,
	"bankAccountId" INTEGER NOT NULL REFERENCES "bankAccount"("id"),
	"name" TEXT NOT NULL,
    "number" varchar(16) NOT NULL UNIQUE,
	"securityCode" varchar(3) NOT NULL ,
	"expirationMont" varchar(2) NOT NULL,
	"expirationYear" varchar(4) NOT NULL,
	"password" varchar(4) NOT NULL,
	"limit" INTEGER NOT NULL
)