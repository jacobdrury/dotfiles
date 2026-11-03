# Domain docs

Use a single-context glossary layout: `GLOSSARY.md` at the repository root.
Before domain exploration, read it if present and use its defined vocabulary in
issues, proposals, and code. If absent, proceed silently without creating it or
suggesting its creation upfront.

FRM's repository instructions and docs remain authoritative for domain rules and
architecture decisions. FRM does not use ADRs; creating them requires explicit
team adoption. This personal setup does not adopt an ADR process or authorize
creating repository domain documents.

If a glossary term conflicts with production schemas or code, report the
conflict rather than inventing a resolution. Confirm domain invariants against
production code or schemas, not fixtures or samples.
