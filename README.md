# Cubi12 Infrastructure

Infraestructura como código (IaC) para Cubi12 usando Terraform y Render.

## 📋 Arquitectura

- **Database**: PostgreSQL 16 en Render
- **Backend**: API REST con Node.js (Docker)
- **Frontend**: React + Nginx (Docker)

## 🚀 Prerequisitos

1. Terraform >= 1.0 instalado
2. Cuenta en Render
3. API Key de Render
4. Imágenes Docker publicadas en Docker Hub

## 📁 Estructura
```
terraform/
├── modules/
│   ├── database/       # Módulo PostgreSQL
│   ├── backend/        # Módulo Backend API
│   └── frontend/       # Módulo Frontend React
├── main.tf            # Configuración principal
├── variables.tf       # Variables
├── outputs.tf         # Outputs
└── terraform.tfvars   # Valores (NO subir a Git)
```

## 🔧 Instalación

### 1. Clonar repositorio
```bash
git clone <tu-repo>
cd cubi12-infrastructure/terraform
```

### 2. Configurar variables
```bash
# Copiar ejemplo y editar
cp terraform.tfvars.example terraform.tfvars
nano terraform.tfvars
```

Configurar:
- `render_api_key`: Tu API key de Render
- `backend_docker_image`: Tu imagen de backend
- `frontend_docker_image`: Tu imagen de frontend
- `jwt_secret`: Un secret seguro para JWT

### 3. Inicializar Terraform
```bash
terraform init
```

### 4. Validar configuración
```bash
terraform validate
```

### 5. Ver plan de ejecución
```bash
terraform plan
```

### 6. Aplicar infraestructura
```bash
terraform apply
```

Escribe `yes` cuando lo solicite.

## 📊 Ver recursos creados
```bash
# Ver todos los outputs
terraform output

# Ver URL del frontend
terraform output frontend_url

# Ver URL del backend
terraform output backend_url

# Ver string de conexión de BD (sensible)
terraform output -raw database_connection_string
```

## 🔄 Actualizar servicios

### Actualizar imagen de Docker
```bash
# 1. Editar terraform.tfvars con la nueva imagen
nano terraform.tfvars

# 2. Aplicar cambios
terraform apply
```

### Actualizar variables de entorno
```bash
# Editar main.tf en la sección de env_vars
nano main.tf

# Aplicar cambios
terraform apply
```

## 🗑️ Destruir infraestructura
```bash
terraform destroy
```

⚠️ **CUIDADO**: Esto eliminará TODOS los recursos incluyendo la base de datos.

## 📝 Comandos útiles
```bash
# Ver estado actual
terraform show

# Listar recursos
terraform state list

# Ver detalles de un recurso
terraform state show module.database.render_postgres.database

# Formatear archivos
terraform fmt -recursive

# Refrescar estado
terraform refresh

# Crear gráfico de dependencias
terraform graph | dot -Tpng > graph.png
```

## 🔐 Seguridad

- **NUNCA** subir `terraform.tfvars` a Git
- Usar variables sensibles para secrets
- Rotar API keys regularmente
- Usar `.gitignore` adecuadamente

## 🐛 Troubleshooting

### Error: "API key invalid"
- Verifica tu API key en Render dashboard
- Asegúrate de no tener espacios extras

### Error: "Image not found"
- Verifica que las imágenes estén publicadas en Docker Hub
- Asegúrate de usar el formato correcto: `usuario/imagen:tag`

### Error: "Database connection failed"
- Espera unos minutos, la BD tarda en inicializarse
- Verifica que el backend use `internal_connection_string`

## 📚 Recursos

- [Terraform Render Provider](https://registry.terraform.io/providers/render-oss/render/latest/docs)
- [Render Documentation](https://render.com/docs)
- [Terraform Documentation](https://www.terraform.io/docs)