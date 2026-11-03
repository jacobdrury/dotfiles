# Issue tracker

FRM issues live in Linear. Use the authenticated Linear connector to read and
write issues. GitLab hosts the repository and merge requests at
`pulsarinformatics/frm`.

Use the supplied Linear identifier or URL to resolve an issue. Read its
description, acceptance criteria, relevant comments, and linked context before
acting. Preserve existing metadata when making an authorized update.

Follow the repository's contribution docs for branches, commits, and merge
requests. When explicitly asked to implement a Linear issue end to end, use
`.agents/skills/shared-linear-issue-to-mr/SKILL.md`, including its authoritative
`Issue.branchName` rule and authorization boundaries.

For issue drafting, use `.agents/skills/shared-write-issue/SKILL.md`. Drafting an
issue does not itself authorize publishing it. When creating an issue, use the
team and project established by the request or existing context; ask if unclear.

Read the repository's `infra-glab` skill before GitLab operations. Merge requests
are excluded from automatic triage discovery; an explicitly requested MR can
still be reviewed.
