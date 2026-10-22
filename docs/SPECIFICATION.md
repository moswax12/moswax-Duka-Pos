# Moswax POS - Full App Specification

## 1. Introduction
Moswax POS is a cloud-based Point of Sale system designed for retail businesses operating across multiple locations. It centralizes management while providing a fast, responsive checkout experience for store staff.

## 2. User Roles & Permissions
(Insert the Permissions Matrix from the previous response here)

## 3. Functional Requirements
### 3.1 Sales Checkout
- FR-01: Barcode scanning support.
- FR-02: Manual product search.
- FR-03: Automatic tax calculation.
- FR-04: Split payment support.
- FR-05: Unique Transaction IDs.
- FR-06: Receipt printing.
- FR-07: Shift management (Open/Close).

### 3.2 Inventory Management
- FR-08: Real-time stock decrement.
- FR-09: Low stock alerts.
- FR-10: Product categorization.
- FR-11: Stock adjustment logging.
- FR-12: Multi-store inventory siloing.

## 4. Technical Architecture
- **Frontend:** React.js / Vue.js
- **Backend:** Node.js / Python
- **Database:** PostgreSQL
- **Offline Mode:** IndexedDB / LocalStorage
- **Hosting:** AWS / DigitalOcean

## 5. API Endpoints
- POST /api/auth/login
- GET /api/products
- POST /api/transactions
- GET /api/reports/sales
... (Rest of API list)

## 6. Constraints
- No Returns/Exchanges in v1.0.
- Web-based printing limitations.
