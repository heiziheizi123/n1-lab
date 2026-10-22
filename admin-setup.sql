-- N1 LAB administrator RLS setup. Run statements separately if SQL Editor says "Only singular query allowed".
-- Administrator UID: a945f622-ce5a-45c8-93ee-1442c0a8e31f
drop policy if exists "admin read all questions" on public.questions;
create policy "admin read all questions" on public.questions for select to authenticated using (auth.uid() = 'a945f622-ce5a-45c8-93ee-1442c0a8e31f'::uuid);
drop policy if exists "admin insert questions" on public.questions;
create policy "admin insert questions" on public.questions for insert to authenticated with check (auth.uid() = 'a945f622-ce5a-45c8-93ee-1442c0a8e31f'::uuid);
drop policy if exists "admin update questions" on public.questions;
create policy "admin update questions" on public.questions for update to authenticated using (auth.uid() = 'a945f622-ce5a-45c8-93ee-1442c0a8e31f'::uuid) with check (auth.uid() = 'a945f622-ce5a-45c8-93ee-1442c0a8e31f'::uuid);
drop policy if exists "admin delete questions" on public.questions;
create policy "admin delete questions" on public.questions for delete to authenticated using (auth.uid() = 'a945f622-ce5a-45c8-93ee-1442c0a8e31f'::uuid);
-- Existing authenticated users still read only approved questions.
