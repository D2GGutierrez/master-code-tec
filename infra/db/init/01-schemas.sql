-- Se ejecuta una sola vez, cuando el volumen de la base está vacío.
-- admin_schema lo migra Django; app_schema lo migra Spring con Flyway (ADR-1).
CREATE SCHEMA IF NOT EXISTS admin_schema;
CREATE SCHEMA IF NOT EXISTS app_schema;
