-- Tabla Person
CREATE TABLE Person (
    person_id INT PRIMARY KEY,
    dni VARCHAR(20),
    name VARCHAR(50),
    mail VARCHAR(50),
    number VARCHAR(20)
);

-- Tabla Employee
CREATE TABLE Employee (
    person_id INT PRIMARY KEY,
    age INT,
    role VARCHAR(50),
    FOREIGN KEY (person_id) REFERENCES Person(person_id)
);

-- Tabla Client
CREATE TABLE Client (
    person_id INT PRIMARY KEY,
    sale_id INT,
    client_code VARCHAR(50),
    discount DECIMAL(10,2),
    FOREIGN KEY (person_id) REFERENCES Person(person_id)
);

-- Tabla Sale
CREATE TABLE Sale (
    sale_id INT PRIMARY KEY,
    employee_person_id INT,
    client_person_id INT,
    total_price DECIMAL(10,2),
    date DATE,
    FOREIGN KEY (employee_person_id) REFERENCES Employee(person_id),
    FOREIGN KEY (client_person_id) REFERENCES Client(person_id)
);

-- Tabla Sale_Details
CREATE TABLE Sale_Details (
    sale_detail_id INT PRIMARY KEY,
    sale_id INT,
    quantity INT,
    unit_price DECIMAL(10,2),
    FOREIGN KEY (sale_id) REFERENCES Sale(sale_id)
);

-- Tabla Product
CREATE TABLE Product (
    product_id INT PRIMARY KEY,
    sale_id INT,
    company_number INT,
    product_name VARCHAR(50),
    price DECIMAL(10,2),
    expiration_date DATE,
    FOREIGN KEY (sale_id) REFERENCES Sale(sale_id),
    FOREIGN KEY (company_number) REFERENCES Store(company_number)
);

-- Tabla Store
CREATE TABLE Store (
    company_number INT PRIMARY KEY,
    product_id INT,
    capacity INT,
    m2 DECIMAL(10,2),
    FOREIGN KEY (product_id) REFERENCES Product(product_id)
);