# MEMORIZE

Write the experiment to a structured memory file for future retrieval.

## Process

1. **Read the experiment log**
   - Read the experiment file from `Experiences/` produced during the EXPERIMENT step

2. **Write a memory file**
   - Create a file in `Memory/` with the following frontmatter and structure:

```yaml
---
type: memory
date: YYYY-MM-DD
source_experiment: "path to the experiment file"
goal: "which goal this serves"
tags: [relevant, topic, tags]
worldview_sections: [which WorldView sections this relates to]
key_insight: "one-sentence summary of what was learned"
---
```

   - Body should contain:
     - **Context**: Why this experiment was run (link to goal and open question)
     - **What happened**: Summary of findings (not a copy of the raw log — a distilled version)
     - **What this means**: Initial interpretation, clearly marked as preliminary
     - **Connections**: Links to related memories or world view notes using `[[wikilinks]]`
     - **Open threads**: Questions this raises, potential follow-up experiments

3. **Update links**
   - If this memory connects to existing memories, add backlinks where relevant

## Constraints

- The memory should be self-contained enough to be useful without reading the full experiment log
- Use tags and frontmatter consistently — these are the primary search mechanism
- Distinguish clearly between what was observed and what is interpreted
- Keep memories concise; the world view is where synthesis happens
