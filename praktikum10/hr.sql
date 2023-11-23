-- use database hr, import from file sql
-- 1. Tampilkan data nomor pegawai,nama depan, nama belakang dan gaji untuk pegawai dengan karakter kedua pada nama pertama mengandung “ar” dan berakhiran “n”.
select
  employee_id,
  first_name,
  last_name,
  salary
from
  employees
where
  first_name like '_ar%n';

-- 2. Tampilkan data nama belakang, jumlah gaji, rata-rata gaji dan banyaknya nama belakang pegawai, untuk tiap-tiap nama belakang pegawai tersebut yang bernama belakang “ Cambrault”, “Grant”, ”King”, “Taylor” atau “Smith”).
select
  last_name,
  sum(salary),
  avg(salary),
  count(last_name)
from
  employees
where
  last_name in ('Cambrault', 'Grant', 'King', 'Taylor', 'Smith')
group by
  last_name;

-- 3. Tampilkan data nomor pegawai,nama depan, nama belakang dan gaji dan gaji setahun untuk pegawai dengan nomor departemen = 10, 20 dan 30.
select
  employee_id,
  first_name,
  last_name,
  salary,
  (salary * 12) as salary_year
from
  employees
where
  department_id in (10, 20, 30);

-- 4. Tampilkan data no.1 diatas untuk pegawai yang bekerja pada departemen ‘Marketing’.
select
  employees.employee_id,
  employees.first_name,
  employees.last_name,
  employees.salary,
  departments.department_name
from
  employees
  join departments on employees.department_id = departments.department_id
where
  first_name like '_ar%n';

-- 5. Tampilkan no departmen dan rata-rata gaji setahun untuk tiap-tiap departemen.
select
  departments.department_id,
  avg(employees.salary * 12)
from
  employees
  join departments on employees.department_id = departments.department_id
group by
  departments.department_id;

-- 6. Tampilkan nomor pegawai, nama belakang, gaji, nama departemen, kota dan nama negara untuk pegawai yang bekerja pada departemen di negara “Canada”.
select
  employees.employee_id,
  employees.last_name,
  employees.salary,
  departments.department_name,
  locations.city,
  countries.country_name
from
  employees
  join departments on employees.department_id = departments.department_id
  join locations on departments.location_id = locations.location_id
  join countries on locations.country_id = countries.country_id
where
  countries.country_name = 'Canada';