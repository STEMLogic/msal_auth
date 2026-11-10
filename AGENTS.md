# AGENTS.md — msal_auth

## Branch naming

When an AI agent creates a branch in this repo, use:

`<type>/<agent>-<sl-#-if-applicable>-<descriptor>`

- `<type>`: the type of change, e.g. `feature`, `improvement`, `fix`, `chore`.
- `<agent>`: a short code for the agent doing the work:
  - Claude: `cld`
  - Codex: `cdx`
  - Gemini: `gem`
  - GitHub Copilot: `gcp`
  - Any other agent: a similar short, lowercase code for that agent.
- `<sl-#-if-applicable>`: the Linear issue key in lowercase (e.g. `sl-1234`) if the work has one. Leave this part out
  entirely if there is no Linear issue.
- `<descriptor>`: a short kebab-case description of the change, e.g. `add-new-config-endpoint` or `login-expiration`.

Examples:

- `feature/cld-sl-1234-add-new-config-endpoint`
- `fix/cdx-sl-2345-login-expiration`
- `chore/gcp-update-dotnet-sdk`
