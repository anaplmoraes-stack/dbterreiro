# Organização Terreiro

Painel simples com **Calendário**, **Insumos**, **Mensalidade** e **Café**. É um site de um arquivo só (`index.html`) com os dados guardados no Supabase.

> **Acesso aberto:** não há login nem níveis de permissão. Qualquer pessoa com o link do site pode ver e editar tudo, inclusive a aba Mensalidade. Compartilhe o link só com quem precisa.

## Arquivos
- `index.html`: o site.
- `supabase.sql`: cria a tabela do banco e já traz os dados iniciais (insumos, café e eventos).
- `README.md`: este guia.

## Passo a passo

### 1. Criar o banco (Supabase, gratuito)
1. Acesse supabase.com e entre com o GitHub.
2. Clique em **New project**, dê o nome `terreiro`, crie e anote a senha do banco e escolha a região **South America (São Paulo)**.
3. Espere cerca de 2 minutos até o projeto ficar pronto.

### 2. Criar as tabelas
1. No menu da esquerda, abra **SQL Editor**.
2. Cole todo o conteúdo de `supabase.sql` e clique em **Run**.
3. Deve aparecer "Success".

### 3. Ligar o site ao banco
1. Abra **Project Settings > API** e copie o **Project URL** e a chave **anon public**.
2. No GitHub, abra o `index.html`, clique no lápis (Edit) e troque:
   - `COLE_AQUI_A_URL_DO_SUPABASE` pela URL;
   - `COLE_AQUI_A_CHAVE_ANON_PUBLIC` pela chave.
3. Clique em **Commit changes**.

### 4. Publicar na Vercel
1. Acesse vercel.com e entre com o GitHub.
2. Clique em **Add New > Project**, escolha este repositório e clique em **Deploy**, sem mudar nada.
3. A Vercel mostra o link do site quando terminar.

### 5. Domínio próprio (opcional)
No projeto da Vercel, vá em **Settings > Domains**, adicione o domínio comprado e siga as instruções de DNS.

## Atualizando o site
Sempre que você editar o `index.html` no GitHub, a Vercel publica a nova versão sozinha, em cerca de 1 minuto.

## Observações
- A chave anon do Supabase foi feita para ficar no código. Não é segredo.
- Como o acesso é aberto, qualquer pessoa com o link pode alterar ou apagar dados. Se isso virar problema, dá para exigir login.
- Projetos gratuitos do Supabase podem ser pausados após cerca de uma semana sem uso. É só reativar no painel.
- A chave PIX e o valor da mensalidade estão escritos direto no `index.html` e ficam visíveis a quem abrir o repositório público.
