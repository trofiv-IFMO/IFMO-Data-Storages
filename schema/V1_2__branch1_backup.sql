-- DECLARE
--   CURSOR CUSTOMERS_CUR_TYPE
--   IS
--     SELECT
--       CUSTOMER_ID,
--       FIRST_NAME,
--       LAST_NAME,
--       MIDDLE_NAME,
--       EMAIL,
--       PHONE_NUMBER
--     FROM CUSTOMERS@BRANCH_1
--     ORDER BY CUSTOMER_ID ASC;
--
--   CUSTOMERS_CUR CUSTOMERS_CUR_TYPE%ROWTYPE;
-- BEGIN
--   DBMS_OUTPUT.PUT_LINE('YEP');
-- END;