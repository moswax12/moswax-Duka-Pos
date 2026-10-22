# Moswax POS - User Stories & Backlog (v1.0)

## Epic 1: Authentication & Access Control
| ID | Role | Story | Acceptance Criteria |
|----|------|-------|---------------------|
| US-01 | All | As a user, I want to log in securely so that I can access the system. | - Email/Pass validation<br>- JWT Token generation<br>- Error handling for invalid creds |
| US-02 | Admin | As an Admin, I want to assign roles to users so that permissions are enforced. | - Dropdown for role selection<br>- Role saves to DB<br>- Permissions update immediately |
| US-03 | GM | As a GM, I want to switch between stores so that I can manage multiple locations. | - Store dropdown in header<br>- Data refreshes on switch<br>- Permission check per store |

## Epic 2: POS Checkout
| ID | Role | Story | Acceptance Criteria |
|----|------|-------|---------------------|
| US-04 | Cashier | As a Cashier, I want to scan barcodes so that items are added to the cart quickly. | - Scanner input adds item<br>- Duplicate SKUs increase quantity<br>- Sound feedback on scan |
| US-05 | Cashier | As a Cashier, I want to process cash payments so that I can complete sales. | - Input tendered amount<br>- Auto-calculate change<br>- Print receipt option |
| US-06 | Cashier | As a Cashier, I want to work offline so that sales continue during internet outages. | - LocalStorage saves cart<br>- Sync queue created<br>- Visual "Offline" indicator |
| US-07 | Supervisor | As a Supervisor, I want to void a transaction so that errors can be corrected. | - Requires PIN entry<br>- Logs reason for void<br>- Restores inventory |

## Epic 3: Inventory Management
| ID | Role | Story | Acceptance Criteria |
|----|------|-------|---------------------|
| US-08 | Inv. Mgr | As an Inventory Manager, I want to add new products so that they can be sold. | - Form with SKU, Price, Cost<br>- Barcode generation/input<br>- Initial stock level set |
| US-09 | Inv. Mgr | As an Inventory Manager, I want to adjust stock manually so that counts remain accurate. | - Select Product & Store<br>- Input adjustment (+/-)<br>- Select reason (Damaged, Lost) |
| US-10 | System | As the System, I want to decrement stock on sale so that inventory is real-time. | - Triggered on payment success<br>- Prevents negative stock (configurable)<br>- Updates low stock alerts |

## Epic 4: Reporting & Shifts
| ID | Role | Story | Acceptance Criteria |
|----|------|-------|---------------------|
| US-11 | Cashier | As a Cashier, I want to open/close a shift so that my cash drawer is reconciled. | - Enter opening float<br>- Enter closing count<br>- Generate Z-Report |
| US-12 | GM | As a GM, I want to view sales reports so that I can track performance. | - Filter by Date/Store<br>- View Gross/Net sales<br>- Export to CSV |

## Epic 5: Settings & Configuration
| ID | Role | Story | Acceptance Criteria |
|----|------|-------|---------------------|
| US-13 | Admin | As an Admin, I want to configure tax rates so that receipts are compliant. | - Set % per store<br>- Apply to product categories<br>- Update reflects in checkout |
| US-14 | Admin | As an Admin, I want to customize receipts so that branding is consistent. | - Upload Logo<br>- Edit Header/Footer text<br>- Preview print layout |
