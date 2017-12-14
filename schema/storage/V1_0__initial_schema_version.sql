CREATE TABLE CUSTOMERS_STORE (
  CHANGED_AT   TIMESTAMP NOT NULL,
  CUSTOMER_ID  RAW(32)   NOT NULL,
  STATUS       CHAR(1)   NOT NULL,
  FIRST_NAME   VARCHAR2(35) DEFAULT NULL,
  LAST_NAME    VARCHAR2(35) DEFAULT NULL,
  MIDDLE_NAME  VARCHAR2(35) DEFAULT NULL,
  EMAIL        VARCHAR2(45) DEFAULT NULL,
  PHONE_NUMBER VARCHAR2(15) DEFAULT NULL,
  PRIMARY KEY (CUSTOMER_ID, CHANGED_AT)
);

CREATE INDEX CUSTOMERS_STORE_STATUS_IDX
  ON CUSTOMERS_STORE (STATUS);

CREATE TABLE CUSTOMERS_STORE_TEMP AS
  SELECT *
  FROM CUSTOMERS_STORE;

CREATE TABLE PROCUREMENTS_STORE (
  CHANGED_AT     TIMESTAMP NOT NULL,
  PROCUREMENT_ID RAW(32)   NOT NULL,
  STATUS         CHAR(1)   NOT NULL,
  ITEM_ID        RAW(32)        DEFAULT NULL,
  PRICE          NUMERIC(15, 2) DEFAULT NULL,
  AMOUNT         NUMERIC(7, 0)  DEFAULT NULL,
  TIME           TIMESTAMP      DEFAULT NULL,
  PRIMARY KEY (PROCUREMENT_ID, CHANGED_AT)
);

CREATE INDEX PROCUREMENTS_STORE_STATUS_IDX
  ON PROCUREMENTS_STORE (STATUS);

CREATE TABLE PROCUREMENTS_STORE_TEMP AS
  SELECT *
  FROM PROCUREMENTS_STORE;

CREATE TABLE SALES_STORE (
  CHANGED_AT  TIMESTAMP NOT NULL,
  SALE_ID     RAW(32)   NOT NULL,
  STATUS      CHAR(1)   NOT NULL,
  ITEM_ID     RAW(32)        DEFAULT NULL,
  CUSTOMER_ID RAW(32)        DEFAULT NULL,
  AMOUNT      NUMERIC(4, 0)  DEFAULT NULL,
  TIME        TIMESTAMP      DEFAULT NULL,
  TOTAL_PRICE NUMERIC(15, 2) DEFAULT NULL,
  PRIMARY KEY (SALE_ID, CHANGED_AT)
);

CREATE INDEX SALES_STORE_STATUS_IDX
  ON SALES_STORE (STATUS);

CREATE TABLE SALES_STORE_TEMP AS
  SELECT *
  FROM SALES_STORE;

CREATE TABLE ITEMS_STORE (
  CHANGED_AT   TIMESTAMP     NOT NULL,
  ITEM_ID      RAW(32)       NOT NULL,
  STORE_NUMBER NUMERIC(1, 0) NOT NULL,
  STATUS       CHAR(1)       NOT NULL,
  VENDOR_CODE  NUMERIC(32, 0) DEFAULT NULL,
  NAME         VARCHAR2(255)  DEFAULT NULL,
  DESCRIPTION  VARCHAR2(4000) DEFAULT NULL,
  PRICE        NUMERIC(15, 2) DEFAULT NULL,
  PRIMARY KEY (ITEM_ID, STORE_NUMBER, CHANGED_AT)
);

CREATE INDEX ITEMS_STORE_IDX
  ON ITEMS_STORE (STATUS);

CREATE TABLE ITEMS_STORE_TEMP AS
  SELECT *
  FROM ITEMS_STORE;

CREATE TABLE PROMOTIONS_STORE (
  CHANGED_AT   TIMESTAMP NOT NULL,
  PROMOTION_ID RAW(32)   NOT NULL,
  STATUS       CHAR(1)   NOT NULL,
  VALID_FROM   TIMESTAMP     DEFAULT NULL,
  VALID_TO     TIMESTAMP     DEFAULT NULL,
  DISCOUNT_PCT NUMERIC(2, 0) DEFAULT NULL,
  PRIMARY KEY (PROMOTION_ID, CHANGED_AT)
);

CREATE INDEX PROMOTIONS_STORE_IDX
  ON PROMOTIONS_STORE (STATUS);

CREATE TABLE PROMOTIONS_STORE_TEMP AS
  SELECT *
  FROM PROMOTIONS_STORE;

CREATE TABLE REALIZATIONS_STORE (
  CHANGED_AT     TIMESTAMP NOT NULL,
  REALIZATION_ID RAW(32)   NOT NULL,
  STATUS         CHAR(1)   NOT NULL,
  GOOD_ID        RAW(32)        DEFAULT NULL,
  PROMOTION_ID   RAW(32)        DEFAULT NULL,
  PRICE          NUMERIC(15, 2) DEFAULT NULL,
  PRIMARY KEY (REALIZATION_ID, CHANGED_AT)
);

CREATE INDEX REALIZATIONS_STORE_IDX
  ON REALIZATIONS_STORE (STATUS);

CREATE TABLE REALIZATIONS_STORE_TEMP AS
  SELECT *
  FROM REALIZATIONS_STORE;

CREATE TABLE GOODS_TO_PROMOTIONS_STORE (
  CHANGED_AT   TIMESTAMP NOT NULL,
  LINK_ID      RAW(32)   NOT NULL,
  GOOD_ID      RAW(32)   NOT NULL,
  PROMOTION_ID RAW(32)   NOT NULL,
  STATUS       CHAR(1)   NOT NULL,
  PRIMARY KEY (GOOD_ID, PROMOTION_ID, CHANGED_AT)
);

CREATE INDEX GOODS_TO_PROMOTIONS_STORE_IDX
  ON GOODS_TO_PROMOTIONS_STORE (STATUS);

CREATE TABLE GOODS_TO_PROMOTIONS_STORE_TEMP AS
  SELECT *
  FROM GOODS_TO_PROMOTIONS_STORE;