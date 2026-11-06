-- Ranking online do jogo "O Mistério da Tabela Perdida"
-- Cole no Supabase: projeto "Plataforma de Estudos" -> SQL Editor -> New query -> Run.
-- Só cria objetos novos (dtp_ranking, dtp_ranking_admin, função dtp_ranking_apagar); não altera nada existente.

create table if not exists public.dtp_ranking (
  rid text primary key check (char_length(rid) between 6 and 40),
  nome text not null check (char_length(nome) between 1 and 60),
  turma text not null default '' check (char_length(turma) <= 40),
  caso text not null default 'tabela' check (char_length(caso) <= 40),
  pontos int not null check (pontos between 0 and 5000),
  max int not null check (max between 1 and 5000),
  tempo int not null default 0 check (tempo between 0 and 86400),
  fim timestamptz not null default now()
);
alter table public.dtp_ranking enable row level security;
drop policy if exists dtp_ranking_leitura on public.dtp_ranking;
drop policy if exists dtp_ranking_envio on public.dtp_ranking;
create policy dtp_ranking_leitura on public.dtp_ranking for select to anon, authenticated using (true);
create policy dtp_ranking_envio on public.dtp_ranking for insert to anon, authenticated with check (true);
revoke all on public.dtp_ranking from anon, authenticated;
grant select, insert on public.dtp_ranking to anon, authenticated;
create index if not exists dtp_ranking_ord on public.dtp_ranking (caso, pontos desc, tempo asc);

-- chave do professor (guardada só como hash; a chave em si está na mensagem do Claude)
create table if not exists public.dtp_ranking_admin (chave_hash text not null);
alter table public.dtp_ranking_admin enable row level security;
revoke all on public.dtp_ranking_admin from anon, authenticated;
delete from public.dtp_ranking_admin;
insert into public.dtp_ranking_admin values ('e9caf0cd8c4a481d8a1ceb8aee426f9a8378eb12806b65c10cbb8fcfa092d6ce');

create or replace function public.dtp_ranking_apagar(p_chave text, p_rid text)
returns int language plpgsql security definer set search_path = public, extensions as $$
declare n int;
begin
  if not exists (select 1 from public.dtp_ranking_admin where chave_hash = encode(extensions.digest(coalesce(p_chave,''), 'sha256'), 'hex')) then
    raise exception 'chave invalida';
  end if;
  if p_rid = '*' then delete from public.dtp_ranking where true; else delete from public.dtp_ranking where rid = p_rid; end if;
  get diagnostics n = row_count; return n;
end $$;
revoke all on function public.dtp_ranking_apagar(text, text) from public;
grant execute on function public.dtp_ranking_apagar(text, text) to anon, authenticated;
