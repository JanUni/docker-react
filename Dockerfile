#builder ist der NAME der Phase
FROM node:16-alpine as builder 
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx 
# Ich möchte etwas von der anderen Phase (BUILDER) rüber kopieren
COPY --from=builder /app/build /usr/share/nginx/html
