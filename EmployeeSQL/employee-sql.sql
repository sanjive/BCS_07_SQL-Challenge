--1. List the following details of each employee: employee number, last name, 
--   first name, sex, and salary.
    select  e.emp_no as "Employee Number"
           ,e.last_name as "Last Name"
           ,e.first_name as "First Name"
           ,e.sex as "Gender"
           ,s.salary as "Salary"
      from  public.employees as e
            left join public.salaries as s on (e.emp_no = s.emp_no)
  order by  e.emp_no;
  
--2. List first name, last name, and hire date for employees who were hired in 1986.
    select  e.first_name as "First Name"
           ,e.last_name as "Last Name"
           ,e.hire_date as "Hire Date"
      from  public.employees as e
     where  e.hire_date between '01/01/1986' and '12/31/1986' -- The boundary condition is inclusive
  order by  e.hire_date;

--3. List the manager of each department with the following information: 
--   department number, department name, the manager's employee number, last name, first name.
    select  d.dept_no as "Deparment Number"
           ,d.dept_name as "Department Name"
           ,dm.emp_no "Manager Employee Number"
           ,e.last_name as "Manager Last Name"
           ,e.first_name as "Manager First Name"
      from  public.departments as d
            left join public.dept_manager as dm on (d.dept_no = dm.dept_no)
                left join public.employees as e on (dm.emp_no = e.emp_no)
  order by  d.dept_no;

--4. List the department of each employee with the following information: 
--   employee number, last name, first name, and department name.
    select  e.emp_no as "Employee Number"
           ,e.last_name as "Last Name"
           ,e.first_name as "First Name"
           ,d.dept_name as "Department Name"
      from  public.employees as e
            left join public.dept_emp as de on (e.emp_no = de.emp_no)
                left join public.departments as d on (de.dept_no = d.dept_no)
  order by  e.emp_no;

--5. List first name, last name, and sex for employees whose first name is 
--   "Hercules" and last names begin with "B."
    select  e.first_name as "First Name"
           ,e.last_name as "Last Name"
           ,e.sex as "Gender"
      from  public.employees as e
     where  e.first_name = 'Hercules' 
       and  e.last_name like ('B%')
  order by  e.emp_no;

--6. List all employees in the Sales department, including their employee number,
--   last name, first name, and department name.
    select  de.emp_no as "Employee Number"
           ,e.last_name as "Last Name"
           ,e.first_name as "First Name"
           ,d.dept_name as "Department" 
      from  public.dept_emp as de
            -- Outer join as the employee has to be in the "Sales" Department
            join public.departments as d on (de.dept_no = d.dept_no)
            -- Outer join as the employee has to exist in the "Employees" table.
            join public.employees as e on (de.emp_no = e.emp_no)
     where  d.dept_name = 'Sales'
  order by  de.emp_no;

--7. List all employees in the Sales and Development departments, including their 
--   employee number, last name, first name, and department name.
    select  de.emp_no as "Employee Number"
           ,e.last_name as "Last Name"
           ,e.first_name as "First Name"
           ,d.dept_name as "Department" 
      from  public.dept_emp as de
            -- Outer join as the employee has to be in the "Sales" or "Development" Departments
            join public.departments as d on (de.dept_no = d.dept_no)
            -- Outer join as the employee has to exist in the "Employees" table.
            join public.employees as e on (de.emp_no = e.emp_no)
     where  d.dept_name in ('Sales', 'Development')
  order by  de.emp_no;

--8. In descending order, list the frequency count of employee last names, i.e., 
--   how many employees share each last name.
    select  count(e.last_name) as "Frequency Count"
           ,e.last_name as "Last Name"
      from  public.employees as e
  group by  e.last_name
  order by  count(e.last_name) desc;
