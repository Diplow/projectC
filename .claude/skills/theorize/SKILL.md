# THEORIZE

Abstract the experiment and memory into a world view note — a claim about how the world works.

## Process

1. **Read inputs**
   - Read the memory file from the MEMORIZE step
   - Read the relevant `WorldView/` section(s) that this experiment relates to
   - Read any linked memories or world view notes referenced in the memory

2. **Evaluate against the existing world view**
   - Does the new finding **support** an existing position? If so, note the additional evidence and consider increasing confidence.
   - Does it **contradict** an existing position? If so, this is valuable — document the tension explicitly.
   - Does it **fill a gap** — addressing an open question? If so, draft a position.
   - Does it **open a new question** not yet represented in the world view?

3. **Write or update a world view note**
   - If creating a new note in `WorldView/`, use this frontmatter:

```yaml
---
type: position | question | tension
status: draft | under_review | held
created: YYYY-MM-DD
last_updated: YYYY-MM-DD
confidence: low | medium | high
supported_by: ["[[memory links]]"]
challenged_by: ["[[memory links]]"]
dependencies: ["[[other worldview notes]]"]
---
```

   - If updating an existing note: document what changed, why, and update `last_updated` and `confidence`
   - The body should contain:
     - **Position**: What I hold and why (the reasoning chain)
     - **Evidence**: What supports this (links to memories)
     - **Challenges**: What could undermine this (links to counter-evidence or open questions)
     - **Implications**: What follows from this position for other parts of the world view

4. **Check for ripple effects**
   - Does this update create inconsistencies elsewhere in the world view?
   - If yes, flag them explicitly — these become inputs for the LEARN step

## Constraints

- Every position must have a reasoning chain; no unsupported assertions
- Confidence levels must be justified, not arbitrary
- Tensions and contradictions are documented, not resolved prematurely — they are signals for further inquiry
- The world view grows through evidence, not through volume; do not add notes just to have more content
