# Stage 1: Build
FROM node:20-alpine AS builder

WORKDIR /app

# Copia package.json e package-lock.json
COPY package*.json ./

# Instala dependências de produção e desenvolvimento
RUN npm install

# Copia o restante do código
COPY . .

# Constrói o projeto NestJS
RUN npm run build

# Stage 2: Production
FROM node:20-alpine AS production

WORKDIR /app

# Copia package.json e package-lock.json
COPY package*.json ./

# Instala apenas dependências de produção
RUN npm install --omit=dev

# Copia os arquivos de build da etapa anterior
COPY --from=builder /app/dist ./dist

# Expõe a porta
EXPOSE 3000

# Comando para iniciar a aplicação
CMD ["node", "dist/main"]
