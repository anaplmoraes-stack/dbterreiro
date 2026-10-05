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

-- 3) Dados iniciais (insumos, café e eventos do painel atual)
insert into registros (colecao, id, data) values
('insumos','a101','{"categoria": "Alimentos", "nome": "Feijão fradinho", "ordem": 101, "qtd": "1", "status": "ok"}'::jsonb),
('insumos','a102','{"categoria": "Alimentos", "nome": "Milho de pipoca", "ordem": 102, "qtd": "", "status": "ok"}'::jsonb),
('insumos','a103','{"categoria": "Alimentos", "nome": "Farinha de mandioca", "ordem": 103, "qtd": "", "status": "ok"}'::jsonb),
('insumos','a104','{"categoria": "Alimentos", "nome": "Farinha de acaçá branco", "ordem": 104, "qtd": "", "status": "falta"}'::jsonb),
('insumos','a105','{"categoria": "Alimentos", "nome": "Flocão de milho", "ordem": 105, "qtd": "3 un", "status": "ok"}'::jsonb),
('insumos','a106','{"categoria": "Alimentos", "nome": "Feijão preto", "ordem": 106, "qtd": "1", "status": "falta"}'::jsonb),
('insumos','a107','{"categoria": "Alimentos", "nome": "Feijão vermelho", "ordem": 107, "qtd": "1", "status": "ok"}'::jsonb),
('insumos','a108','{"categoria": "Alimentos", "nome": "Mel", "ordem": 108, "qtd": "1", "status": "ok"}'::jsonb),
('insumos','a109','{"categoria": "Alimentos", "nome": "Melado", "ordem": 109, "qtd": "1", "status": "ok"}'::jsonb),
('insumos','a110','{"categoria": "Alimentos", "nome": "Groselha", "ordem": 110, "qtd": "1", "status": "ok"}'::jsonb),
('insumos','a111','{"categoria": "Alimentos", "nome": "Canjica", "ordem": 111, "qtd": "", "status": "ok"}'::jsonb),
('insumos','a112','{"categoria": "Alimentos", "nome": "Camarão seco", "ordem": 112, "qtd": "metade", "status": "ok"}'::jsonb),
('insumos','a115','{"categoria": "Alimentos", "nome": "Copo descartável", "ordem": 115, "qtd": "2 pacotes", "status": "ok"}'::jsonb),
('insumos','b201','{"categoria": "Bebidas", "nome": "Cachaça", "ordem": 201, "qtd": "2", "status": "ok"}'::jsonb),
('insumos','b202','{"categoria": "Bebidas", "nome": "Gin", "ordem": 202, "qtd": "1", "status": "ok"}'::jsonb),
('insumos','b203','{"categoria": "Bebidas", "nome": "Vodka", "obs": "", "ordem": 203, "qtd": "", "status": "ok"}'::jsonb),
('insumos','b208','{"categoria": "Bebidas", "nome": "Cigarro", "obs": "", "ordem": 208, "qtd": "", "status": "ok"}'::jsonb),
('insumos','e301','{"categoria": "Elementos", "nome": "Vela palito", "ordem": 301, "qtd": "", "status": "ok"}'::jsonb),
('insumos','e302','{"categoria": "Elementos", "nome": "Algodão", "ordem": 302, "qtd": "2 pct", "status": "ok"}'::jsonb),
('insumos','e303','{"categoria": "Elementos", "nome": "Pemba branca", "ordem": 303, "qtd": "4", "status": "ok"}'::jsonb),
('insumos','e304','{"categoria": "Elementos", "nome": "Pemba vermelha", "ordem": 304, "qtd": "1", "status": "falta"}'::jsonb),
('insumos','e305','{"categoria": "Elementos", "nome": "Pemba preta", "ordem": 305, "qtd": "2 un", "status": "falta"}'::jsonb),
('insumos','e306','{"categoria": "Elementos", "nome": "Pemba azul", "ordem": 306, "qtd": "1", "status": "ok"}'::jsonb),
('insumos','e307','{"categoria": "Elementos", "nome": "Banda de Ori", "ordem": 307, "qtd": "2 un", "status": "falta"}'::jsonb),
('insumos','e308','{"categoria": "Elementos", "nome": "TNT preto", "ordem": 308, "qtd": "4 m", "status": "ok"}'::jsonb),
('insumos','e309','{"categoria": "Elementos", "nome": "TNT branco", "ordem": 309, "qtd": "", "status": "ok"}'::jsonb),
('insumos','e310','{"categoria": "Elementos", "nome": "TNT rosa", "ordem": 310, "qtd": "", "status": "ok"}'::jsonb),
('insumos','e311','{"categoria": "Elementos", "nome": "TNT verde", "ordem": 311, "qtd": "2 m", "status": "ok"}'::jsonb),
('insumos','e312','{"categoria": "Elementos", "nome": "TNT azul", "ordem": 312, "qtd": "2 m", "status": "ok"}'::jsonb),
('insumos','e313','{"categoria": "Elementos", "nome": "TNT vermelho", "ordem": 313, "qtd": "", "status": "ok"}'::jsonb),
('insumos','e314','{"categoria": "Elementos", "nome": "Pólvora", "ordem": 314, "qtd": "5", "status": "ok"}'::jsonb),
('insumos','e315','{"categoria": "Elementos", "nome": "Carvão de narguilé", "ordem": 315, "qtd": "metade", "status": "ok"}'::jsonb),
('insumos','e316','{"categoria": "Elementos", "nome": "Pimenta da ataré", "ordem": 316, "qtd": "", "status": "ok"}'::jsonb),
('insumos','e317','{"categoria": "Elementos", "nome": "Dendê", "obs": "", "ordem": 317, "qtd": "2 un", "status": "ok"}'::jsonb),
('insumos','e318','{"categoria": "Elementos", "nome": "Incenso", "ordem": 318, "qtd": "10 pacotes", "status": "ok"}'::jsonb),
('insumos','e319','{"categoria": "Elementos", "nome": "Ervas de defumação", "obs": "", "ordem": 319, "qtd": "", "status": "ok"}'::jsonb),
('insumos','l401','{"categoria": "Limpeza", "nome": "Alfazema", "ordem": 401, "qtd": "1 un", "status": "falta"}'::jsonb),
('insumos','l402','{"categoria": "Limpeza", "nome": "Anil", "ordem": 402, "qtd": "2 un", "status": "ok"}'::jsonb),
('insumos','l403','{"categoria": "Limpeza", "nome": "Água sanitária", "ordem": 403, "qtd": "1 un", "status": "ok"}'::jsonb),
('insumos','l404','{"categoria": "Limpeza", "nome": "Desinfetante", "ordem": 404, "qtd": "1 un", "status": "ok"}'::jsonb),
('insumos','l405','{"categoria": "Limpeza", "nome": "Sabão em pó", "ordem": 405, "qtd": "1 un", "status": "ok"}'::jsonb),
('insumos','l406','{"categoria": "Limpeza", "nome": "Limpador de vidros", "ordem": 406, "qtd": "1 un", "status": "ok"}'::jsonb),
('insumos','l407','{"categoria": "Limpeza", "nome": "Álcool", "ordem": 407, "qtd": "1 un", "status": "ok"}'::jsonb),
('insumos','l408','{"categoria": "Limpeza", "nome": "Pano de Chão", "obs": "", "ordem": 408, "qtd": "", "status": "ok"}'::jsonb),
('insumos','l409','{"categoria": "Limpeza", "nome": "Multiuso", "ordem": 409, "qtd": "1 un", "status": "ok"}'::jsonb),
('insumos','l410','{"categoria": "Limpeza", "nome": "Papel higiênico", "ordem": 410, "qtd": "4 un", "status": "falta"}'::jsonb),
('insumos','l411','{"categoria": "Limpeza", "nome": "Sabão em barra", "ordem": 411, "qtd": "2 un", "status": "ok"}'::jsonb),
('insumos','l412','{"categoria": "Limpeza", "nome": "Coala", "ordem": 412, "qtd": "", "status": "ok"}'::jsonb),
('insumos','x3w9onycm189lk4errnm','{"categoria": "Alimentos", "nome": "Arroz Branco", "ordem": 113, "qtd": "1 Kg", "status": "falta"}'::jsonb),
('cafe','2026-10','{"semanas": ["Pamela", "Felipe", "GR", "Gladson Lima"]}'::jsonb),
('cafe','2026-11','{"semanas": ["Ana", "Pamela", "Felipe", "GR"]}'::jsonb),
('cafe','2026-12','{"semanas": ["", "", "", ""]}'::jsonb),
('eventos','ary7uqko8kkcax3fkqw9','{"data": "2026-10-17", "hora": "19:30", "obs": "Quebra de Preceito Kailayne + Suspendida Felipe & Pamela", "titulo": "Gira de Exu"}'::jsonb),
('eventos','t1m32odp5m7fuiou98gb','{"data": "2026-10-19", "hora": "19:30", "obs": "Semana de camarinha TODOS DE PRECEITO", "titulo": "Orô de Exu"}'::jsonb)
on conflict (colecao, id) do nothing;
