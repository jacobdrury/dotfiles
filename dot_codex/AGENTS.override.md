@/Users/jacobdrury/.config/agents/AGENTS.md

## FRM migration context

When a task involves FRM or Gen2, treat these as related repositories:

- **FRM:** `/Users/jacobdrury/Dev/frm`
- **Gen2:** `/Users/jacobdrury/Dev/fatiguemeter/worktrees/main`
- **AWS infrastructure:** `/Users/jacobdrury/Dev/aws-infra`
- **Argo CD:** `/Users/jacobdrury/Dev/argocd`
- **Integrations:** `/Users/jacobdrury/Dev/integration`
- The `integration` repository connects customer systems to our system and brings in their data. It is the counterpart to Gen2's ingestion data exchange queues for wearables, schedules, and personnel, and the primary client of Gen2's private REST API.
- The DevOps team manages company-wide infrastructure in `aws-infra` and `argocd`, including infrastructure used to deploy FRM and Gen2.
- “FatigueMeter,” “FM,” and “Gen2” all refer to the legacy Gen2 codebase above.
- Work is being migrated from Gen2 into FRM.
- FRM exposes gRPC and Restate handlers. Gen2 integrates with them through protoc-generated clients. Direct Restate invocation is possible, but the generated clients are the normal integration path.
- Gen2’s GraphQL gateway remains the primary API gateway until the corresponding functionality is built in FRM.
- For cross-repository work, inspect the relevant repositories and read each repository’s local `AGENTS.md` before modifying it. If the local history is out of date, it might be nessacary to pull latest main.
