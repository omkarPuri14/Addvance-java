# E-Commerce Order Management APIs (Kiran Academy)

Spring Boot 3 + Spring Data JPA (Hibernate) + MySQL.

## 1. Dependencies (pom.xml)

Includes: `spring-boot-starter-web`, `spring-boot-starter-data-jpa`,
`spring-boot-starter-validation`, `mysql-connector-j`, `lombok`, and
**`spring-boot-devtools`** (added this round) — devtools auto-restarts the
app whenever a class changes, so you don't have to stop/re-run manually
between Postman tests. If you meant a different dependency, just say which
one and I'll add it.

## 2. Setup

1. Make sure MySQL is running.
2. Edit `src/main/resources/application.properties` with your MySQL
   username/password (`orders_db` is auto-created).
3. Run:
   ```bash
   mvn spring-boot:run
   ```
   App starts on `http://localhost:8080`. Hibernate creates the
   `customer_order` table automatically (`ddl-auto=update`), matching the
   DDL from the assignment exactly (same table/column names).
4. Optional: `src/main/resources/sample-data.sql` has the 5 sample rows
   from the assignment if you want to load them via MySQL Workbench/CLI.

## 3. Business logic (matches the spec exactly)

- `grossAmount = quantity * pricePerUnit`
- `discountAmount = grossAmount * discountPercent / 100`
- `finalAmount = grossAmount - discountAmount`
- `discountPercent` is **supplied by the client per order** (not a slab
  rule) and validated to be between 0 and 30.
- None of the three calculated amounts are ever stored — the entity only
  persists `quantity`, `pricePerUnit`, and `discountPercent`; everything
  else is computed at read time in `OrderService`.

### Validation on create (API 1)
- `customerName` cannot be empty
- `quantity` > 0
- `pricePerUnit` > 0
- `discountPercent` between 0 and 30
- `paymentMode` must be exactly `UPI`, `Card`, or `Cash`

A validation failure returns Spring's default `400` error response.
Updating a status for an `orderId` that doesn't exist returns `404` with
`{"message": "Order not found with id: <id>"}` (handled inline in the
controller — no separate exception package).

## 4. API 1 — Place Order

```
POST http://localhost:8080/api/orders
Content-Type: application/json

{
  "customerName": "Anjali",
  "productName": "Keyboard",
  "category": "Electronics",
  "quantity": 2,
  "pricePerUnit": 2000,
  "discountPercent": 10,
  "paymentMode": "UPI",
  "orderStatus": "Placed"
}
```
Response (`201 Created`):
```json
{
  "message": "Order placed successfully",
  "orderId": 6,
  "customerName": "Anjali",
  "grossAmount": 4000.00,
  "discountAmount": 400.00,
  "finalAmount": 3600.00
}
```

## 5. API 2 — Orders above an amount

```
GET http://localhost:8080/api/orders/above/20000
```
Returns every order (regardless of status) whose computed `finalAmount`
exceeds the given amount, e.g. Rahul's Laptop and Priya's Mobile Phone from
the sample data.

## 6. API 3 — Update order status

```
PUT http://localhost:8080/api/orders/2/status
Content-Type: application/json

{ "status": "Shipped" }
```
Success (`200`):
```json
{
  "message": "Order status updated successfully",
  "orderId": 2,
  "oldStatus": "Placed",
  "newStatus": "Shipped"
}
```
Invalid transition, e.g. `Placed -> Delivered` (`400`):
```json
{
  "message": "Invalid order status transition",
  "currentStatus": "Placed",
  "requestedStatus": "Delivered"
}
```
Allowed: `Placed -> Shipped`, `Shipped -> Delivered`, `Placed -> Cancelled`.
`Delivered` and `Cancelled` are terminal — any further change is rejected
the same way as an invalid transition.

## 7. API 4 — Category sales summary

```
GET http://localhost:8080/api/orders/summary/Electronics
```
Using the sample data (Rahul: Delivered ₹49,500; Priya: Placed ₹47,500;
Sneha: Cancelled — excluded):
```json
{
  "category": "Electronics",
  "totalOrders": 3,
  "deliveredOrders": 1,
  "placedOrders": 1,
  "cancelledOrders": 1,
  "totalQuantity": 5,
  "totalRevenue": 97000.00,
  "highestValueOrder": 49500.00,
  "highestValueCustomer": "Rahul"
}
```
`totalRevenue` and `highestValueOrder`/`highestValueCustomer` both exclude
`Cancelled` orders.

## 8. Postman testing checklist

1. Load the 5 sample rows (or POST a few orders via API 1, including
   Anjali's Keyboard example).
2. Call API 2 with a couple of different threshold amounts.
3. Call API 3: a valid transition, an invalid one (see the rejection JSON),
   and confirm a `Delivered`/`Cancelled` order can't be moved at all.
4. Call API 4 for both `Electronics` and `Furniture` and check the numbers
   against the raw sample data.
