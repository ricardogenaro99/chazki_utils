# Eliminacion logica y automatizada de registros MEL00

## Intalar dependencias

### Instalar globalmente pm2 para todoslos procesos de NodeJS

> - npm install pm2 -g

### Instalar todas las dependencias de la aplicación

> - npm install
> - yarn install

## Automatización

### Ejectuar el siguiente script correr la aplicación en segundo plano

> - pm2 start index.js --name MEL00

### Ejectuar el siguiente script para visualizar los logs del proceso de pm2

> - pm2 logs --name MEL00
