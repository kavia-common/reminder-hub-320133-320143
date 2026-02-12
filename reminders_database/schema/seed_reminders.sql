-- Optional seed data for local/dev
-- Apply ONE statement at a time via psql -c "...".
-- These INSERTs are idempotent by using ON CONFLICT DO NOTHING (requires the PK on id).

INSERT INTO public.reminders (id, title, description, due_date, notification_at, completed)
VALUES (
  1,
  'Buy groceries',
  'Milk, eggs, bread',
  '2026-02-13T12:59:27.527333+00:00',
  '2026-02-13T11:59:27.527333+00:00',
  false
)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.reminders (id, title, description, due_date, notification_at, completed)
VALUES (
  2,
  'Pay rent',
  'Schedule bank transfer',
  '2026-02-15T00:00:00+00:00',
  NULL,
  false
)
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.reminders (id, title, description, due_date, notification_at, completed)
VALUES (
  3,
  'Call mom',
  NULL,
  '2026-02-12T14:59:33.352925+00:00',
  '2026-02-12T14:29:33.352925+00:00',
  false
)
ON CONFLICT (id) DO NOTHING;
