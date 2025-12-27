# gcp-terraform-bigquery-pipeline
Proyecto de Ingeniería de Datos en GCP: Infraestructura como Código (Terraform) para datasets, tablas y roles de IAM en BigQuery. Incluye un pipeline E2E con carga incremental, y visualización en Looker

Infraestructura de Datos End-to-End en Google Cloud

Este proyecto implementa un flujo completo de datos utilizando un enfoque híbrido de automatización y gestión operativa:

Infraestructura como Código (IaC): Uso de Terraform para el despliegue de la arquitectura base, incluyendo la gestión de permisos (IAM), creación de datasets y la definición de tablas (externas y nativas particionadas).

Pipeline de Datos: Proceso de ingesta desde Cloud Storage hacia BigQuery.

Carga Incremental: Implementación de lógica de deduplicación mediante sentencias SQL MERGE programadas, asegurando la integridad de los datos.

Visualización: Entrega de datos  para análisis de negocio en Looker Studio
