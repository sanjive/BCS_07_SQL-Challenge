-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/OQdyd7
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


-- Departments
-- Table Departments
CREATE TABLE "departments" (
    -- Department No
    "dept_no" varchar(4)   NOT NULL,
    -- Department Name
    "dept_name" varchar(30)   NOT NULL,
    CONSTRAINT "pk_departments" PRIMARY KEY (
        "dept_no"
     )
);

-- Titles
-- Table Titles
CREATE TABLE "titles" (
    -- Title ID
    "title_id" varchar(5)   NOT NULL,
    -- Title
    "title" varchar(30)   NOT NULL,
    CONSTRAINT "pk_titles" PRIMARY KEY (
        "title_id"
     )
);

-- Employees
-- Table Employees
CREATE TABLE "employees" (
    -- Employee No
    "emp_no" int   NOT NULL,
    -- Employee title ID
    "emp_title_id" varchar(5)   NOT NULL,
    -- Employee Birth Date
    "birth_date" date   NOT NULL,
    -- Employee First Name
    "first_name" varchar(30)   NOT NULL,
    -- Employee Last Name
    "last_name" varchar(30)   NOT NULL,
    -- Employee Gender (M/F)
    "sex" varchar(1)   NOT NULL,
    -- Employee Hire Date
    "hire_date" date   NOT NULL,
    CONSTRAINT "pk_employees" PRIMARY KEY (
        "emp_no"
     )
);

-- Department-Employee
-- Table Department-Employee (Intersection table) holds only IDs
CREATE TABLE "dept_emp" (
    -- Employee department No
    "dept_no" varchar(4)   NOT NULL,
    -- Employee No
    "emp_no" int   NOT NULL,
    CONSTRAINT "pk_dept_emp" PRIMARY KEY (
        "dept_no","emp_no"
     )
);

-- Department-Managers
-- Table Department-Managers (Intersection Table)
CREATE TABLE "dept_manager" (
    -- Manager Department No
    "dept_no" varchar(4)   NOT NULL,
    -- Employee No of the Manager
    "emp_no" int   NOT NULL,
    CONSTRAINT "pk_dept_manager" PRIMARY KEY (
        "dept_no","emp_no"
     )
);

-- Salaries
-- Table Employee Salary
CREATE TABLE "salaries" (
    -- Employee No
    "emp_no" int   NOT NULL,
    -- Employee Salary
    "salary" int   NOT NULL,
    CONSTRAINT "pk_salaries" PRIMARY KEY (
        "emp_no"
     )
);

ALTER TABLE "employees" ADD CONSTRAINT "fk_employees_emp_title_id" FOREIGN KEY("emp_title_id")
REFERENCES "titles" ("title_id");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "salaries" ADD CONSTRAINT "fk_salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

CREATE INDEX "idx_departments_dept_name"
ON "departments" ("dept_name");

CREATE INDEX "idx_titles_title"
ON "titles" ("title");

CREATE INDEX "idx_employees_emp_title_id"
ON "employees" ("emp_title_id");

CREATE INDEX "idx_employees_birth_date"
ON "employees" ("birth_date");

CREATE INDEX "idx_employees_first_name"
ON "employees" ("first_name");

CREATE INDEX "idx_employees_last_name"
ON "employees" ("last_name");

CREATE INDEX "idx_employees_sex"
ON "employees" ("sex");

CREATE INDEX "idx_employees_hire_date"
ON "employees" ("hire_date");

CREATE INDEX "idx_salaries_salary"
ON "salaries" ("salary");

