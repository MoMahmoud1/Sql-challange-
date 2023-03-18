use my_guitar_shop;
/* Write a SELECT statement that returns four columns from the Products table:
product_code, product_name, list_price, and discount_percent. Then, run
this statement to make sure it works correctly.
 Add an ORDER BY clause to this statement that sorts the result set by list
price in descending sequence. Then, run this statement again to make sure it
works correctly. This is a good way to build and test a statement, one clause
 at a time.*/

select  product_code, product_name, list_price,  discount_percent
from products
order by list_price desc;


 /* Write a SELECT statement that returns one column from the Customers table
 named full_name that joins the last_name and first_name columns.
Format this column with the last name, a comma, a space, and the first name
like this:
 Doe, John
Sort the result set by the last_name column in ascending sequence.
 Return only the customers whose last name begins with letters from M to Z.
 NOTE: When comparing strings of characters,  comes before any string of
 characters that begins with . For example.*/


select  concat(last_name , ',  ',first_name) as full_name 
from customers 
where last_name REGEXP '^[M-Z]'
order by last_name asc;

 /*Write a SELECT statement that returns these columns from the Products
table:
product_name The product_name column
list_price The list_price column
date_added The date_added column
Return only the rows with a list price that’s greater than 500 and less than
2000. Sort the result set by the date_added column in descending sequence.*/

select product_name, list_price, date_added
from Products
where list_price > 500 and  list_price < 2000
order by date_added desc;

/*. Write a SELECT statement that returns these column names and data from
the Products table:
product_name The product_name column
list_price The list_price column
discount_percent The discount_percent column
discount_amount A column that’s calculated from the
previous two columns
discount_price A column that’s calculated from the
previous three columns
und the discount_amount and discount_price columns to 2 decimal places. 
Sort the result set by the discount_price column in descending sequence. 
Use the LIMIT clause so the result set contains only the first 5 rows*/
 
select product_name, list_price, discount_percent,
    round(list_price * discount_percent / 100, 2) as discount_amount, 
    round(list_price * (1 - (discount_percent / 100)), 2) as discount_price
from products
order by discount_price desc
limit 1,5;
/* Write a SELECT statement that returns these column names and data from
the Order_Items table: item_id The item_id column item_price The item_price column,
discount_amount The discount_amount column
quantity The quantity column,price_total A column that’s calculated by,
multiplying the item price by the,quantity
discount_total A column that’s calculated by,multiplying the discount amount by the,quantity
item_total A column that’s calculated by,subtracting the discount amount from,
the item price and then multiplying by
the quantity,Only return rows where the item_total is greater than 500.
 Sort the result set by the item_total column in descending sequence.*/
 
 select item_id, item_price , discount_amount, quantity,
 item_price *  quantity as  price_total,
 discount_amount * quantity as discount_total,
  (discount_amount-item_price ) * quantity as item_total
 from  Order_Items
 where i(item_price -discount_amount) * quantity > 500
 order by  item_total desc;
/* Write a SELECT statement that returns these columns from the Orders table:
order_id The order_id column
order_date The order_date column
ship_date The ship_date column
Return only the rows where the ship_date column contains a null value. */

select order_id, order_date , ship_date 
from orders
where ship_date is null;

/* Write a SELECT statement without a FROM clause that uses the NOW
function to create a row with these columns:
today_unformatted The NOW function unformatted
today_formatted The NOW function in this format:
DD-Mon-YYYY
This displays a number for the day, an abbreviation for the month, and a
four-digit year*/

select now() as today_unformatted,
 date_format(NOW(), '%m/%d/%Y') as today_formatted;
 
/*Write a SELECT statement without a FROM clause that creates a row with
these columns:
price 100 (dollars)
tax_rate .07 (7 percent)
tax_amount The price multiplied by the tax
total The price plus the tax
To calculate the fourth column, add the expressions you used for the first
and third columns*/
select 
    100 AS price, 0.07 AS tax_rate,
    100 * 0.07 AS tax_amount,
    (100) + (100 * .07) AS total;
 




