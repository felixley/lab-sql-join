use sakila; 
-- List number of films per category.
select a.category_id as Category, b.name as Name, count(a.film_id) as NumberFilms
from sakila.film_category as a
join sakila.category as b
on a.category_id = b.category_id
group by Category, Name
order by NumberFilms desc;


-- Display the first and last names, as well as the address, of each staff member.
select a.first_name, a.last_name, b.address
from sakila.staff as a
join sakila.address as b
on a.address_id = b.address_id;

-- Display the total amount rung up by each staff member in August of 2005.
select a.staff_id, b.first_name, b.last_name, sum(a.amount) as Amount
from sakila.payment as a
join sakila.staff as b
on a.staff_id = b.staff_id
where payment_date regexp '2005-08-'
group by staff_id;

-- List each film and the number of actors who are listed for that film.
select a.film_id, a.title as Title, count(b.actor_id) As Actors
from sakila.film as a
left join sakila.film_actor as b
using (film_id)
group by a.film_id
order by Actors desc;

-- Using the tables payment and customer and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name.
select b.last_name, b.first_name, sum(a.amount) as TotalPaid
from sakila.payment as a
join sakila.customer as b
using(customer_id)
group by a.customer_id
order by b.last_name asc, b.first_name asc;
-- order by TotalPaid desc;