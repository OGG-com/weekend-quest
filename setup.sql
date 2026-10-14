-- This setup matches the table and function already created in Supabase.
-- Run only if you need to recreate the function; do not drop existing data.
create table if not exists public.weekend_votes (
  id uuid primary key default gen_random_uuid(),
  choice text not null check (choice in ('meet', 'rest')),
  created_at timestamptz not null default now()
);

alter table public.weekend_votes enable row level security;
revoke all on table public.weekend_votes from anon, authenticated;

create or replace function public.submit_weekend_vote(p_choice text)
returns void
language plpgsql
security definer
set search_path = ''
as $$
begin
  if p_choice not in ('meet', 'rest') then
    raise exception 'Invalid vote choice';
  end if;
  insert into public.weekend_votes (choice) values (p_choice);
end;
$$;
revoke all on function public.submit_weekend_vote(text) from public;
grant execute on function public.submit_weekend_vote(text) to anon, authenticated;
