# CYSY-social Backend

Este é o backend do CYSY-social, um aplicativo de mensagens instantâneas e rede social, construído com **Node.js**, **TypeScript**, **NestJS**, e utilizando **PostgreSQL**, **Redis** e **MinIO** para persistência e tempo real.

## Stack Tecnológica

| Tecnologia | Propósito |
| :--- | :--- |
| **NestJS** + **TypeScript** | Framework robusto e escalável para o backend. |
| **PostgreSQL** | Banco de dados principal para dados relacionais. |
| **Redis** | Cache, Pub/Sub para mensagens em tempo real e filas (BullMQ). |
| **MinIO** | Armazenamento de objetos compatível com S3 para mídias (fotos, vídeos). |
| **Prisma ORM** | Acesso ao banco de dados e migrações. |
| **Socket.io** | Comunicação em tempo real (mensagens, status online). |
| **Docker** + **Docker Compose** | Ambiente de desenvolvimento e produção isolado e fácil de configurar. |

## Estrutura do Projeto

A estrutura de pastas segue as melhores práticas do NestJS, com módulos bem definidos.

### Árvore de Arquivos

```
.
├── .dockerignore
├── .env
├── .gitignore
├── .prettierrc
├── Dockerfile
├── README.md
├── docker-compose.yml
├── eslint.config.mjs
├── nest-cli.json
├── package-lock.json
├── package.json
├── prisma
│   └── schema.prisma
├── prisma.config.ts
├── src
│   ├── app.controller.spec.ts
│   ├── app.controller.ts
│   ├── app.module.ts
│   ├── app.service.ts
│   ├── common
│   │   ├── guards
│   │   ├── interceptors
│   │   └── pipes
│   ├── config
│   │   └── configuration.ts
│   ├── main.ts
│   ├── modules
│   │   ├── auth
│   │   │   ├── auth.controller.ts
│   │   │   ├── auth.module.ts
│   │   │   ├── auth.service.ts
│   │   │   ├── dto
│   │   │   │   ├── login.dto.ts
│   │   │   │   └── register.dto.ts
│   │   │   ├── jwt.strategy.ts
│   │   │   └── local.strategy.ts
│   │   ├── chats
│   │   │   ├── chats.controller.ts
│   │   │   ├── chats.gateway.ts
│   │   │   ├── chats.module.ts
│   │   │   ├── chats.service.ts
│   │   │   ├── dto
│   │   │   │   ├── create-chat.dto.ts
│   │   │   │   └── send-message.dto.ts
│   │   │   └── entities
│   │   └── users
│   │       ├── dto
│   │       │   └── create-user.dto.ts
│   │       ├── profiles
│   │       ├── users.controller.ts
│   │       ├── users.module.ts
│   │       └── users.service.ts
│   ├── prisma
│   │   ├── prisma.module.ts
│   │   ├── prisma.service.spec.ts
│   │   └── prisma.service.ts
│   └── workers
├── tsconfig.build.json
└── tsconfig.json
```

## Passo a Passo para Configuração e Execução (Com Docker)

O projeto foi configurado para ser executado facilmente usando Docker Compose, que gerencia o NestJS, PostgreSQL, Redis e MinIO.

### Pré-requisitos

Você precisa ter o **Docker** e o **Docker Compose** instalados em sua máquina.

### 1. Clonar o Repositório

```bash
git clone [URL_DO_SEU_REPOSITORIO]
cd cysy-social-backend
```

### 2. Configurar Variáveis de Ambiente

O arquivo `.env` já está configurado com as variáveis padrão para o ambiente Docker Compose. Você pode revisá-lo:

```bash
# Conteúdo do .env
DATABASE_URL="postgresql://postgres:password@postgres:5432/cysy"
REDIS_URL="redis://redis:6379"
JWT_SECRET="some-secret-key"
MINIO_ROOT_USER="minioadmin"
MINIO_ROOT_PASSWORD="minioadmin"
```

### 3. Iniciar os Serviços com Docker Compose (Passo Crítico)

Este é o passo que não pôde ser executado no ambiente de sandbox, mas é o coração da configuração do projeto.

```bash
# Constrói a imagem do NestJS e inicia todos os serviços (Postgres, Redis, MinIO, API)
docker-compose up -d --build
```

**O que este comando faz:**

1.  **Postgres, Redis, MinIO:** Inicia os contêineres de banco de dados, cache/pubsub e armazenamento de objetos.
2.  **API:** Constrói a imagem Docker do NestJS e inicia o servidor da API.

### 4. Executar as Migrações do Prisma

Após os serviços subirem, você precisa aplicar o esquema do banco de dados definido em `prisma/schema.prisma`.

```bash
# Executa o comando dentro do contêiner da API
docker-compose exec api npx prisma migrate dev --name init
```

Este comando:
*   Gera o cliente Prisma.
*   Cria a tabela de migrações.
*   Aplica o esquema ao banco de dados PostgreSQL.

### 5. Acessar os Serviços

| Serviço | Endereço Local | Credenciais |
| :--- | :--- | :--- |
| **API NestJS** | `http://localhost:3000` | - |
| **PostgreSQL** | `localhost:5432` | user: `postgres`, pass: `password`, db: `cysy` |
| **Redis** | `localhost:6379` | - |
| **MinIO Console** | `http://localhost:9001` | user: `minioadmin`, pass: `minioadmin` |
| **MinIO API** | `http://localhost:9000` | - |

### 6. Execução Local (Sem Docker)

Se preferir executar o NestJS diretamente na sua máquina (assumindo que você tenha Node.js e os serviços externos rodando separadamente):

1.  **Instalar dependências:** `npm install`
2.  **Gerar o cliente Prisma:** `npx prisma generate`
3.  **Rodar a aplicação:** `npm run start:dev`

## Estrutura de Código (Simulada)

A estrutura de código foi criada para as funcionalidades principais, seguindo o plano original:

*   **`src/prisma/`**: Módulo para encapsular o `PrismaService`.
*   **`src/config/`**: Configurações da aplicação.
*   **`src/common/`**: Diretórios para Guards, Pipes, Interceptors, etc.
*   **`src/modules/auth/`**: Lógica de Autenticação (Login, Registro, JWT).
*   **`src/modules/users/`**: Gerenciamento de Usuários e Perfis.
*   **`src/modules/chats/`**: Lógica de Mensagens e Realtime (Socket.io Gateway).

O código dentro dos arquivos (`.ts`) foi deixado como *boilerplate* para que você possa implementar a lógica de negócios específica.
