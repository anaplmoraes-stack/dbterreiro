-- 1) Tabela
create table if not exists registros (
  colecao text not null,
  id text not null,
  data jsonb not null default '{}'::jsonb,
  primary key (colecao, id)
);

-- 2) Acesso liberado para todos (sem login)
alter table registros enable row level security;
create policy "ler"     on registros for select to anon, authenticated using (true);
create policy "inserir" on registros for insert to anon, authenticated with check (true);
create policy "alterar" on registros for update to anon, authenticated using (true) with check (true);
create policy "apagar"  on registros for delete to anon, authenticated using (true);

-- Atualização ao vivo
alter publication supabase_realtime add table registros;

-- 3) (Opcional) Modelos para cadastrar dados por aqui.
-- Normalmente você cadastra tudo direto no site. Se quiser inserir pelo SQL,
-- remova os dois traços "--" do começo das linhas e rode.

-- Insumo (categoria: Alimentos, Bebidas, Elementos ou Limpeza)
-- insert into registros (colecao, id, data) values
-- ('insumos', 'item001', '{"categoria":"Alimentos","nome":"Arroz","qtd":"1 kg","status":"ok","ordem":1}'::jsonb);

-- Mês do rodízio de café (cada texto é o nome de uma semana)
-- insert into registros (colecao, id, data) values
-- ('cafe', '2026-12', '{"semanas":["Ana","Pamela","Felipe","GR"]}'::jsonb);

-- Atividade do calendário
-- insert into registros (colecao, id, data) values
-- ('eventos', 'evento001', '{"titulo":"Gira","data":"2026-12-05","hora":"19:00","obs":""}'::jsonb);

-- Membro da mensalidade (pagos: mês -> true/false)
-- insert into registros (colecao, id, data) values
-- ('mensalidade', 'membro001', '{"nome":"Nome do membro","pagos":{"2026-12":true}}'::jsonb);
