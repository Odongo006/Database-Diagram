/* create table patients */
create table patients(
id int generated always as identity primary key,
name varchar(250),
date_of_birth date);

/* create table medical_histories */
create table medical_histories(
id int generated always as identity primary key,
admitted_at timestamp,
patient_id int references patients(id),
status varchar(50));

/* create table invoices */
create table invoices(
id int generated always as identity primary key,
total_amount decimal,
generated_at timestamp,
payed_at timestamp,
medical_history_id int references medical_histories(id));

/* create table treatments */
create table treatments(
id int generated always as identity primary key,
type varchar(50),
name varchar(250));

/* create table invoice_items */
create table invoice_items(
id int generated always as identity primary key,
unit_price decimal,
quantity int,
total_price decimal,
invoice_id int references invoices(id),
treatment_id int references treatments(id));


CREATE INDEX patient_id_index ON medical_histories (patient_id);

CREATE INDEX invoice_index ON invoices (medical_history_id);

CREATE INDEX invoice_id_index ON invoices_items(invoice_id);

CREATE INDEX treatment_id_index ON invoices_items(treatment_id);

CREATE INDEX treatment_id_index ON treatments_histories(treatment_id);

CREATE INDEX medical_history_index ON treatments_histories(medical_history_id);