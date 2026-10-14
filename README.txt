WEEKEND QUEST — GITHUB + SUPABASE

Files:
- index.html: the quest-themed voting page. It calls the Supabase RPC function submit_weekend_vote.
- setup.sql: matching SQL for public.weekend_votes and the submit_weekend_vote function.

IMPORTANT:
The page is configured with the Project URL and publishable key supplied in the chat. Publishable keys are intended for browser use, but database security still depends on correct RLS/function permissions. Never put a service_role or sb_secret key in this file.

GitHub upload:
1. Open https://github.com/OGG-com/weekend-quest
2. Add file > Upload files.
3. Upload index.html (and optionally README.txt / setup.sql) to the repository root.
4. Commit changes.

Supabase:
The project table and function were already created in SQL Editor. The page submits choices via POST /rest/v1/rpc/submit_weekend_vote. The choice values are meet and rest.

Deploy:
This repository alone does not create a public website. Connect the GitHub repository to a static hosting provider (for example Netlify or Vercel), or use another static host, then share the deployed HTTPS URL.

Votes can be viewed in Supabase Table Editor > weekend_votes. Anonymous submissions are not protected against repeat voting; anyone with the link could submit more than once. Do not treat this as a secure identity-verified poll.

Font note: the heading uses a fantasy-inspired web font, not the proprietary exact World of Warcraft title font.
