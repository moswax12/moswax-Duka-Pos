# Moswax POS - Quality Assurance Plan

## 1. Testing Strategy
- **Unit Testing:** Jest/Vitest for frontend logic (Cart calculations, Tax logic).
- **Integration Testing:** Supertest for API endpoints (Auth, Transactions).
- **E2E Testing:** Cypress/Playwright for critical user flows (Login -> Checkout -> Print).
- **Offline Testing:** Manual simulation of network throttling/disconnection.

## 2. Critical Test Cases

### Authentication
- [ ] **TC-01:** Login with valid credentials.
- [ ] **TC-02:** Login with invalid credentials (Expect error).
- [ ] **TC-03:** Session timeout after 30 mins inactivity.
- [ ] **TC-04:** Access restricted page without proper role (Expect 403).

### POS Checkout
- [ ] **TC-05:** Scan barcode -> Item appears in cart.
- [ ] **TC-06:** Calculate total (Subtotal + Tax - Discount).
- [ ] **TC-07:** Process Cash Payment -> Change calculated correctly.
- [ ] **TC-08:** Process Split Payment (Cash + Card).
- [ ] **TC-09:** **Offline Mode:** Disconnect internet -> Complete Sale -> Reconnect -> Verify Sync.

### Inventory
- [ ] **TC-10:** Create Product -> Appears in POS search.
- [ ] **TC-11:** Complete Sale -> Stock quantity decrements.
- [ ] **TC-12:** Stock Adjustment -> Inventory log updated.
- [ ] **TC-13:** Low Stock Threshold -> Alert appears on Dashboard.

### Shifts
- [ ] **TC-14:** Open Shift with $100 float.
- [ ] **TC-15:** Close Shift with mismatched cash (Expect warning).
- [ ] **TC-16:** Generate Z-Report -> Data matches transaction sum.

### Printing
- [ ] **TC-17:** Print Receipt -> Layout fits 80mm thermal paper.
- [ ] **TC-18:** Print Receipt -> Logo and Store Info visible.

## 3. Performance Benchmarks
- **Load Time:** POS Page < 2s.
- **API Response:** Checkout API < 500ms.
- **Concurrency:** Support 50 simultaneous checkouts per store.

## 4. Bug Severity Levels
- **Critical:** System crash, Data loss, Payment failure.
- **High:** Feature broken (e.g., Barcode scan fails), Offline sync fails.
- **Medium:** UI glitch, Report export formatting.
- **Low:** Typos, Color inconsistencies.
