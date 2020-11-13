CREATE TABLE "Department" (
    "dept_no" varchar   NOT NULL,
    "dept_name" varchar   NOT NULL,
    CONSTRAINT "pk_Department" PRIMARY KEY (
        "dept_no"
     )
);

CREATE TABLE "Title" (
    "title_id" varchar   NOT NULL,
    "title" varchar   NOT NULL,
    CONSTRAINT "pk_Title" PRIMARY KEY (
        "title_id"
     )
);

CREATE TABLE "Department_emp" (
    "emp_no" int   NOT NULL,
    "dept_no" varchar   NOT NULL,
    CONSTRAINT "pk_Department_emp" PRIMARY KEY (
        "emp_no","dept_no"
     )
);

CREATE TABLE "Employees" (
    "emp_no" int   NOT NULL,
    "title" varchar   NOT NULL,
    "birth_date" date   NOT NULL,
    "first_name" varchar   NOT NULL,
    "last_name" varchar   NOT NULL,
    "sex" varchar   NOT NULL,
    "hire_date" date   NOT NULL,
    CONSTRAINT "pk_Employees" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "Salaries" (
    "emp_no" int   NOT NULL,
    "salary" int   NOT NULL,
    CONSTRAINT "pk_Salaries" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "Department_manager" (
    "dept_no" varchar   NOT NULL,
    "emp_no" int   NOT NULL,
    CONSTRAINT "pk_Department_manager" PRIMARY KEY (
        "emp_no"
     )
);

ALTER TABLE "Department" ADD CONSTRAINT "fk_Department_dept_no" FOREIGN KEY("dept_no")
REFERENCES "Department_emp" ("dept_no");

ALTER TABLE "Department_emp" ADD CONSTRAINT "fk_Department_emp_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employees" ("emp_no");

ALTER TABLE "Employees" ADD CONSTRAINT "fk_Employees_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Salaries" ("emp_no");

ALTER TABLE "Employees" ADD CONSTRAINT "fk_Employees_title" FOREIGN KEY("title")
REFERENCES "Title" ("title_id");

ALTER TABLE "Salaries" ADD CONSTRAINT "fk_Salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Department_manager" ("emp_no");

ALTER TABLE "Department_manager" ADD CONSTRAINT "fk_Department_manager_dept_no" FOREIGN KEY("dept_no")
REFERENCES "Department" ("dept_no");

