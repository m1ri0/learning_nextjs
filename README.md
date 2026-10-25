## Next.js App Router Course - Starter

This is the starter template for the Next.js App Router Course. It contains the starting code for the dashboard application.

For more information, see the [course curriculum](https://nextjs.org/learn) on the Next.js Website.

## PostgreSQL local com SSL

Mantenha `server.crt` e `server.key` na raiz do projeto e execute:

```bash
docker compose up -d --build db
docker compose logs --tail=50 db
docker compose exec db psql -U postgres -d nextjs-dashboard-postgres -c 'SHOW ssl;'
```

O resultado esperado é `on`. O volume existente com os dados é preservado.
O container inicia como root para copiar os certificados montados em modo somente
leitura para um diretório interno, ajustar o proprietário para `postgres` e aplicar
permissão `600` à chave. O entrypoint oficial inicia o banco como `postgres`.
Esse preparo ocorre em cada inicialização, inclusive com um banco já existente.
Os certificados não são incluídos na imagem e os arquivos no host não são alterados.
O daemon Docker precisa conseguir ler os arquivos montados; em Docker rootless ou
com remapeamento de usuários, pode ser necessário ajustar o proprietário no host.
