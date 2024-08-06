Here's an example of three PostgreSQL functions to demonstrate the use of `IMMUTABLE`, `STABLE`, and `VOLATILE` function attributes.

### 1. **IMMUTABLE Function Example**

An `IMMUTABLE` function is one that always returns the same result when given the same input parameters and has no side effects (e.g., modifying the database or depending on any state that could change).

#### Example: Calculate the Area of a Circle

```sql
CREATE OR REPLACE FUNCTION calculate_circle_area(radius FLOAT)
RETURNS FLOAT
IMMUTABLE
LANGUAGE SQL
AS $$
    SELECT pi() * radius * radius;
$$;
```

- **Explanation**: This function calculates the area of a circle based on the given radius. The result is always the same for the same input value, making it `IMMUTABLE`. PostgreSQL can cache the result of this function if it's called multiple times with the same input, optimizing performance.

### 2. **STABLE Function Example**

A `STABLE` function is one that does not modify the database and returns consistent results within a single transaction but might return different results across different transactions. These functions can depend on the state that remains constant during a query but might change between queries (e.g., values from a table that might not change within the transaction).

#### Example: Get the Current Day's Exchange Rate

```sql
CREATE OR REPLACE FUNCTION get_usd_to_eur_exchange_rate()
RETURNS FLOAT
STABLE
LANGUAGE SQL
AS $$
    SELECT rate FROM exchange_rates WHERE currency_pair = 'USD/EUR' AND rate_date = CURRENT_DATE;
$$;
```

- **Explanation**: This function retrieves the exchange rate for USD to EUR for the current day. The rate is likely to remain the same during a single transaction but could change day by day or even within the same day, so it's marked as `STABLE`.

### 3. **VOLATILE Function Example**

A `VOLATILE` function can return different results even when called with the same input parameters and within the same transaction. This is often used for functions that rely on system states like random numbers, time-based data, or functions that modify the database.

#### Example: Generate a Random Number

```sql
CREATE OR REPLACE FUNCTION generate_random_number(min INT, max INT)
RETURNS INT
VOLATILE
LANGUAGE SQL
AS $$
    SELECT floor(random() * (max - min + 1) + min)::int;
$$;
```

- **Explanation**: This function generates a random integer between the specified `min` and `max` values. Since the result can vary each time the function is called, it is marked as `VOLATILE`.

### **Summary of Differences**

- **IMMUTABLE**: Function results are consistent for the same input across all calls, allowing PostgreSQL to cache results.
- **STABLE**: Results are consistent within a single query execution but might change between queries, making it less predictable than `IMMUTABLE`.
- **VOLATILE**: Function results can vary across calls even within the same query, often used for functions relying on system states or performing database modifications.

These attributes help PostgreSQL's query planner optimize the execution of queries that include functions by understanding the expected behavior of each function.