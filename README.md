# Organização Terreiro

Painel com **Calendário**, **Insumos**, **Mensalidade** e **Café**. Site de um arquivo só (`index.html`), com os dados no Supabase e compartilhados entre todos.

> **Acesso aberto:** não há login. Qualquer pessoa com o link do site vê e edita tudo, inclusive a Mensalidade.

## Arquivos
- `index.html`: o site.
- `supabase.sql`: cria a tabela do banco (vazia).

## Passo a passo
1. **Supabase:** crie um projeto, abra **SQL Editor**, cole o `supabase.sql` e clique em **Run**.
2. **Chaves:** em **Project Settings > API Keys**, copie a Project URL e a chave anon public (ou Publishable key). Cole no início do `index.html`, no lugar de `COLE_AQUI...`.
3. **GitHub:** envie o `index.html` solto na primeira tela do repositório.
4. **Vercel:** importe o repositório, deixe **Framework Preset** em **Other** e clique em **Deploy**.
5. **Domínio (opcional):** em **Settings > Domains** do projeto na Vercel.

O banco começa vazio. Cadastre tudo direto no site.

## Observações
- A chave anon foi feita para ficar no código. Não é segredo. Nunca use a service_role.
- Projetos gratuitos do Supabase podem pausar após cerca de uma semana sem uso. Reative no painel.
