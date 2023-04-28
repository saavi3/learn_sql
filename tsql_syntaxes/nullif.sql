/*
NULLIF ( expr1 , expr2 )

expr1, expr2    Required. The two expressions to be compared

Return Types    Returns the same type as the first expression.
                NULLIF returns the first expression if the two expressions are not equal. 
                If the expressions are equal, NULLIF returns a null value of the type of the first expression.
*/


SELECT NULLIF('2017-08-25', '2017-08-25'); --NULL
SELECT NULLIF('Hello', NULL); -- 'Hello'