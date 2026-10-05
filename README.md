# Organização Terreiro

Painel com **Calendário**, **Insumos**, **Mensalidade** e **Café**, em um único arquivo (`index.html`). Não usa banco de dados nem serviços externos.

> **Importante:** os dados ficam salvos **no navegador de cada pessoa**, neste aparelho. Eles **não são compartilhados** entre celulares e computadores: o que uma pessoa preenche não aparece para as outras. Limpar os dados do navegador também apaga as informações.

## Publicar

### 1. GitHub
1. Crie um repositório e envie o `index.html` (**Add file > Upload files**), solto na primeira tela, sem pasta.
2. Confirme em **Commit changes**.

### 2. Vercel
1. Em vercel.com, entre com o GitHub e clique em **Add New > Project**.
2. Escolha o repositório, deixe **Framework Preset** em **Other** e clique em **Deploy**.
3. A Vercel mostra o link do site.

### 3. Domínio próprio (opcional)
No projeto da Vercel, abra **Settings > Domains**, adicione o domínio e siga as instruções de DNS.

## Primeiro uso
O site começa vazio. Cadastre direto nas abas: insumos, atividades do calendário, membros e pagamentos da mensalidade, valor e chave PIX, pessoas e meses do café.

## Atualizando
Ao editar o `index.html` no GitHub, a Vercel publica a nova versão sozinha, em cerca de 1 minuto. Os dados salvos em cada aparelho continuam lá.
