-- Create the database (skip this if already created via POSTGRES_DB env variable)
-- CREATE DATABASE employee_onboarding;
-- \c employee_onboarding;

-- Table: employees
CREATE TABLE IF NOT EXISTS employees (
  id SERIAL PRIMARY KEY,
  full_name VARCHAR(100) NOT NULL,
  email VARCHAR(100) NOT NULL,
  phone_no VARCHAR(15) NOT NULL,
  alternate_number VARCHAR(15),
  guardian_name VARCHAR(100),
  guardian_contact VARCHAR(15),
  marital_status VARCHAR(20) NOT NULL,
  gender VARCHAR(10) NOT NULL,
  blood_group VARCHAR(10) NOT NULL,
  date_of_birth DATE NOT NULL,
  employment_status VARCHAR(20) NOT NULL
);

-- Table: government_ids
CREATE TABLE IF NOT EXISTS government_ids (
  id SERIAL PRIMARY KEY,
  employee_id INTEGER REFERENCES employees(id) ON DELETE CASCADE,
  aadhar_no VARCHAR(20) NOT NULL,
  aadhar_file TEXT NOT NULL,
  pan_no VARCHAR(20) NOT NULL,
  pan_file TEXT NOT NULL
);

-- Table: previous_employment
CREATE TABLE IF NOT EXISTS previous_employment (
  id SERIAL PRIMARY KEY,
  employee_id INTEGER REFERENCES employees(id) ON DELETE CASCADE,
  pf_no VARCHAR(30),
  uan_no VARCHAR(30)
);

-- Table: addresses
CREATE TABLE IF NOT EXISTS addresses (
  id SERIAL PRIMARY KEY,
  employee_id INTEGER REFERENCES employees(id) ON DELETE CASCADE,
  current_address TEXT NOT NULL,
  current_city VARCHAR(50) NOT NULL,
  current_state VARCHAR(50) NOT NULL,
  current_pincode VARCHAR(10) NOT NULL,
  permanent_address TEXT NOT NULL,
  permanent_city VARCHAR(50) NOT NULL,
  permanent_state VARCHAR(50) NOT NULL,
  permanent_pincode VARCHAR(10) NOT NULL
);

-- Table: bank_details
CREATE TABLE IF NOT EXISTS bank_details (
  id SERIAL PRIMARY KEY,
  employee_id INTEGER REFERENCES employees(id) ON DELETE CASCADE,
  bank_name VARCHAR(100) NOT NULL,
  account_no VARCHAR(30) NOT NULL,
  ifsc_code VARCHAR(20) NOT NULL,
  branch_name VARCHAR(100) NOT NULL
);

-- Table: education
CREATE TABLE IF NOT EXISTS education (
  id SERIAL PRIMARY KEY,
  employee_id INTEGER REFERENCES employees(id) ON DELETE CASCADE,
  level VARCHAR(50),
  stream VARCHAR(50),
  institution TEXT,
  year VARCHAR(10),
  score VARCHAR(10),
  doc_path TEXT
);

-- Table: employment_history
CREATE TABLE IF NOT EXISTS employment_history (
  id SERIAL PRIMARY KEY,
  employee_id INTEGER REFERENCES employees(id) ON DELETE CASCADE,
  company_name VARCHAR(100),
  designation VARCHAR(100),
  last_project TEXT,
  start_date DATE,
  end_date DATE,
  doc_path TEXT
);

-- Table: signatures
CREATE TABLE IF NOT EXISTS signatures (
  id SERIAL PRIMARY KEY,
  employee_id INTEGER REFERENCES employees(id) ON DELETE CASCADE,
  signature_file TEXT NOT NULL,
  consent BOOLEAN NOT NULL,
  status VARCHAR(20) DEFAULT 'pending'
);
