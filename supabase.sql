-- 1) Tabela

create table if not exists registros (
  colecao text not null,
  id text not null,
  data jsonb not null default '{}'::jsonb,
  primary key (colecao, id)
);

-- 2) RLS

alter table registros enable row level security;

-- Remove policies antigas
drop policy if exists "ler" on registros;
drop policy if exists "inserir" on registros;
drop policy if exists "alterar" on registros;
drop policy if exists "apagar" on registros;

-- Cria as policies
create policy "ler"
on registros
for select
to anon, authenticated
using (true);

create policy "inserir"
on registros
for insert
to anon, authenticated
with check (true);

create policy "alterar"
on registros
for update
to anon, authenticated
using (true)
with check (true);

create policy "apagar"
on registros
for delete
to anon, authenticated
using (true);

-- 3) Realtime
do $$
begin
  if not exists (
    select 1
    from pg_publication_tables
    where pubname = 'supabase_realtime'
      and schemaname = 'public'
      and tablename = 'registros'
  ) then
    alter publication supabase_realtime add table registros;
  end if;
end
$$;