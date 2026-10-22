-- N1 LAB: run once in Supabase SQL Editor
create table if not exists public.study_data (
 user_id uuid primary key references auth.users(id) on delete cascade,
 payload jsonb not null default '{}'::jsonb,
 updated_at timestamptz not null default now()
);
alter table public.study_data enable row level security;
drop policy if exists "read own study" on public.study_data;
drop policy if exists "insert own study" on public.study_data;
drop policy if exists "update own study" on public.study_data;
create policy "read own study" on public.study_data for select to authenticated using (auth.uid() = user_id);
create policy "insert own study" on public.study_data for insert to authenticated with check (auth.uid() = user_id);
create policy "update own study" on public.study_data for update to authenticated using (auth.uid() = user_id) with check (auth.uid() = user_id);
-- Accounts are created by project owner in Authentication > Users.
-- Disable public signups in Authentication > Providers > Email.
