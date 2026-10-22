-- Moswax POS Database Schema
-- Version: 1.0
-- Dialect: PostgreSQL

-- 1. Roles & Users
CREATE TABLE roles (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) UNIQUE NOT NULL, -- Admin, GM, Inventory Manager, Supervisor, Cashier
    permissions JSONB NOT NULL -- Stores permission flags
);

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    role_id INTEGER REFERENCES roles(id),
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 2. Stores & Locations
CREATE TABLE stores (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    code VARCHAR(20) UNIQUE NOT NULL, -- Short code for receipts
    address TEXT,
    tax_id VARCHAR(50),
    currency VARCHAR(3) DEFAULT 'USD',
    is_active BOOLEAN DEFAULT TRUE
);

-- Link users to specific stores (Multi-store access)
CREATE TABLE user_stores (
    user_id INTEGER REFERENCES users(id),
    store_id INTEGER REFERENCES stores(id),
    PRIMARY KEY (user_id, store_id)
);

-- 3. Products & Inventory
CREATE TABLE categories (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    parent_id INTEGER REFERENCES categories(id)
);

CREATE TABLE products (
    id SERIAL PRIMARY KEY,
    sku VARCHAR(50) UNIQUE NOT NULL,
    barcode VARCHAR(100),
    name VARCHAR(150) NOT NULL,
    description TEXT,
    category_id INTEGER REFERENCES categories(id),
    base_price DECIMAL(10, 2) NOT NULL,
    cost_price DECIMAL(10, 2),
    tax_rate DECIMAL(5, 2) DEFAULT 0.00,
    is_active BOOLEAN DEFAULT TRUE
);

-- Inventory is siloed per store
CREATE TABLE inventory (
    id SERIAL PRIMARY KEY,
    product_id INTEGER REFERENCES products(id),
    store_id INTEGER REFERENCES stores(id),
    quantity INTEGER DEFAULT 0,
    low_stock_threshold INTEGER DEFAULT 5,
    UNIQUE(product_id, store_id)
);

-- 4. Transactions (Sales)
CREATE TABLE transactions (
    id SERIAL PRIMARY KEY,
    transaction_ref VARCHAR(50) UNIQUE NOT NULL, -- Human readable receipt ID
    store_id INTEGER REFERENCES stores(id),
    user_id INTEGER REFERENCES users(id),
    subtotal DECIMAL(10, 2) NOT NULL,
    tax_total DECIMAL(10, 2) NOT NULL,
    discount_total DECIMAL(10, 2) DEFAULT 0.00,
    grand_total DECIMAL(10, 2) NOT NULL,
    payment_status VARCHAR(20) DEFAULT 'completed', -- completed, voided
    synced BOOLEAN DEFAULT TRUE, -- For offline mode tracking
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE transaction_items (
    id SERIAL PRIMARY KEY,
    transaction_id INTEGER REFERENCES transactions(id),
    product_id INTEGER REFERENCES products(id),
    quantity INTEGER NOT NULL,
    price_at_sale DECIMAL(10, 2) NOT NULL, -- Snapshot of price at time of sale
    tax_amount DECIMAL(10, 2) NOT NULL
);

CREATE TABLE payments (
    id SERIAL PRIMARY KEY,
    transaction_id INTEGER REFERENCES transactions(id),
    method VARCHAR(50) NOT NULL, -- Cash, Card, Wallet
    amount DECIMAL(10, 2) NOT NULL,
    tendered_amount DECIMAL(10, 2), -- For cash
    change_due DECIMAL(10, 2)
);

-- 5. Shifts
CREATE TABLE shifts (
    id SERIAL PRIMARY KEY,
    store_id INTEGER REFERENCES stores(id),
    user_id INTEGER REFERENCES users(id),
    opened_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    closed_at TIMESTAMP,
    opening_cash DECIMAL(10, 2) DEFAULT 0.00,
    closing_cash DECIMAL(10, 2),
    status VARCHAR(20) DEFAULT 'open' -- open, closed
);

-- 6. Audit Logs
CREATE TABLE audit_logs (
    id SERIAL PRIMARY KEY,
    user_id INTEGER REFERENCES users(id),
    action VARCHAR(100) NOT NULL,
    table_affected VARCHAR(50),
    record_id INTEGER,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
