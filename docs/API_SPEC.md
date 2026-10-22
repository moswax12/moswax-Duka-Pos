# Moswax POS - API Specification

## Authentication
### POST /api/auth/login
- **Body:** `{ "email": "string", "password": "string", "store_id": "int" }`
- **Response:** `{ "token": "jwt", "user": {...}, "permissions": [...] }`

## Products & Inventory
### GET /api/products
- **Params:** `?store_id=1&search=keyword&category_id=5`
- **Response:** `[{ "id": 1, "sku": "001", "name": "Item", "price": 10.00, "stock": 50 }]`

### POST /api/products
- **Access:** Admin, GM, Inventory Manager
- **Body:** `{ "sku": "002", "name": "New Item", "price": 20.00, "stock": 100 }`

### PUT /api/inventory/adjust
- **Access:** Admin, GM, Inventory Manager
- **Body:** `{ "product_id": 1, "store_id": 1, "adjustment": -5, "reason": "Damaged" }`

## Transactions (POS)
### POST /api/transactions
- **Access:** Cashier, Supervisor, GM, Admin
- **Body:**
  ```json
  {
    "store_id": 1,
    "items": [
      { "product_id": 1, "qty": 2, "price": 10.00 }
    ],
    "payments": [
      { "method": "cash", "amount": 50.00 }
    ],
    "shift_id": 101
  }
