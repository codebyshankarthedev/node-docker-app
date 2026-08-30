# ================================
# Stage 1: Dependencies
# ================================
FROM node:24-alpine AS dependencies

WORKDIR /app

COPY package*.json ./

RUN npm ci --omit=dev


# ================================
# Stage 2: Production Runtime
# ================================
FROM gcr.io/distroless/nodejs24-debian12:nonroot

WORKDIR /app

COPY --from=dependencies /app/node_modules ./node_modules
COPY package.json ./
COPY app.js ./

EXPOSE 3000

USER nonroot

CMD ["app.js"]
