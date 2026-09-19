CREATE SCHEMA IF NOT EXISTS SP_PRACTICE;




---1- 1. THEORY DEMO — SIMPLEST POSSIBLE PROCEDURE

CREATE OR REPLACE PROCEDURE SP_HELLO_SNOWFLAKE()
RETURNS VARCHAR
LANGUAGE SQL
AS
$$
BEGIN
    RETURN 'Hello from Cloudlearningyard Stored Procedure!';
END;
$$;

CALL SP_HELLO_SNOWFLAKE();


CREATE OR REPLACE PROCEDURE SP_HELLO_SNOWFLAKE2()
RETURNS INT
LANGUAGE SQL
AS
$$
BEGIN
      RETURN SUM(10+2);
END;
$$;

CALL SP_HELLO_SNOWFLAKE2();

--- input parameters  bit complex on mathemetical side along with variables  , ---> assigne value to these variable we use (:= )

CREATE OR REPLACE PROCEDURE calc_emp_bonus(
    base_salary FLOAT,
    bonus_percent FLOAT,
    tax_percent FLOAT
)
RETURNS VARCHAR
LANGUAGE SQL
AS
$$
DECLARE
    TOTAL_BONUS FLOAT;   
    GROSS_SALARY FLOAT;
    TAX FLOAT;
    NET_SALARY FLOAT;

BEGIN

    TOTAL_BONUS := base_salary * bonus_percent / 100;

    GROSS_SALARY := base_salary + TOTAL_BONUS;

    TAX := GROSS_SALARY * tax_percent / 100;

    NET_SALARY := GROSS_SALARY - TAX;

    RETURN
        'Base Salary = ' || base_salary ||
        ', Bonus = ' || TOTAL_BONUS ||
        ', Gross Salary = ' || GROSS_SALARY ||
        ', Net Salary = ' || NET_SALARY;

END;
$$;


CALL CALC_EMP_BONUS (200000, 10, 20);