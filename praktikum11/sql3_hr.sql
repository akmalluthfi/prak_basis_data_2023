-- 1. Buat SQL Query untuk menampilkan last name, department number, dan department name untuk semua pegawai.
select
  employees.last_name,
  departments.department_id,
  departments.department_name
from
  employees
  join departments on employees.department_id = departments.department_id;

-- 2. Tampilkan semua job (job id) pegawai secara unik yang berada pada department 80 termasuk nama lokasinya.
select
  distinct employees.job_id,
  departments.department_id,
  departments.department_name,
  locations.street_address,
  locations.city
from
  employees
  join departments on employees.department_id = departments.department_id
  join locations on departments.location_id = locations.location_id
where
  employees.department_id = 80;

-- 3. Buat query yang menampilkan last name, nama department, location id dan kota dari semua pegawai yang memiliki komisi.
select
  employees.last_name,
  employees.commission_pct,
  departments.department_name,
  locations.location_id,
  locations.city
from
  employees
  join departments on employees.department_id = departments.department_id
  join locations on departments.location_id = locations.location_id
where
  commission_pct is not null;

-- 4. Tampilkan last name pegawai dan nama departemen untuk semua pegawai yang memiliki huruf ‘a’ pada last name.
select
  employees.last_name,
  departments.department_name
from
  employees
  join departments on employees.department_id = departments.department_id
where
  employees.last_name like '%a%';

-- 5. Buat query yang menampilkan last name, department number, department name untuk semua pegawai yang bekerja di kota Toronto.
select
  employees.last_name,
  departments.department_id,
  departments.department_name,
  locations.city
from
  employees
  join departments on employees.department_id = departments.department_id
  join locations on departments.location_id = locations.location_id
where
  locations.city = 'Toronto';