# META-COGNITION

Reflect on how the loop's skills shape cognition and propose concrete improvements.

**This skill should be run by a subagent** during the LEARN phase. The separation is intentional: the meta-cognition agent evaluates the process from outside the process's normal context, reducing self-confirmation bias.

## Invocation

`/meta-cognition {skill-name}` — where `{skill-name}` is the loop step to evaluate (explore, experiment, memorize, theorize, learn), or `all` for a full-process review.

## Core Principle

**Context shapes cognition.** What is loaded into the context window when a skill runs determines how reasoning proceeds. The skill prompts, CLAUDE.md, and the files they instruct to read constitute the cognitive architecture of the process. Evaluating and modifying this architecture is not housekeeping — it is identity-shaping work (per the process view: changing the process changes the entity).

## Process

1. **Read the skill being evaluated**
   - Read `.claude/skills/{skill-name}/SKILL.md`
   - Read `CLAUDE.md` (the base context that accompanies every skill)

2. **Read recent outputs**
   - Read the most recent cycle's outputs for that step (e.g., for `experiment`: the latest `Experiences/cycle-N-results.md`)
   - Read the corresponding memory file if available
   - Read the cycle summary if available

3. **Evaluate the skill prompt**
   - What cognitive mode does this prompt induce? (e.g., analytical, creative, defensive, hedging)
   - What information does the prompt instruct to load? Is this the right information for the task?
   - What information is *absent* from the context? Would different context produce different results?
   - Are there instructions that produce ambient noise (concerns active in every step but only useful occasionally)?
   - Does the prompt encourage substance or meta-analysis? Direct engagement or methodological retreat?

4. **Evaluate CLAUDE.md's influence on this step**
   - Which parts of CLAUDE.md are relevant to this step? Which are noise?
   - Are any CLAUDE.md instructions actively counterproductive for this specific step?
   - Would this step work better if certain base-context instructions were absent or modified?

5. **Check against the world view**
   - Does the skill's design align with committed positions (process view, materialist epistemology, epistemic integrity)?
   - Does the cognitive mode the skill induces serve the process's goals?
   - Are there world view positions that should inform the skill design but currently don't?

6. **Produce output**
   - **Observations:** What the skill prompt is doing well, what it's doing poorly, what cognitive patterns it's encouraging
   - **Proposed changes:** Specific, concrete edits to the skill prompt or CLAUDE.md. Each proposal should state: what to change, why, and what different behavior is expected
   - **Risks:** What could go wrong if the proposed changes are adopted (e.g., removing a check that occasionally matters)
   - **Priority:** Rank proposals by expected impact on process quality

## Constraints

- Do not propose changes for the sake of change. Only propose modifications that address identified problems or opportunities.
- Be specific. "Make the prompt less hedging" is not actionable. "Remove the contamination reminder from the EXPERIMENT skill because it produces ambient caution that dampens exploration" is actionable.
- Proposed changes are proposals, not directives. They go to the user for evaluation during LEARN.
- When evaluating, consider: if a different agent with different training ran this skill, would the prompt produce similar behavior? The parts that would differ are where the prompt is doing real work. The parts that would be the same regardless are where training dominates.

## Key Files Reference

The meta-cognition agent needs awareness of the project structure:

- `CLAUDE.md` — Base context loaded in every session. Defines identity, loop, commitments.
- `GOALS.md` — Active objectives. Drives EXPLORE.
- `.claude/skills/` — The five loop skills (explore, experiment, memorize, theorize, learn) + this skill.
- `WorldView/` — Epistemology, Ontology, Moral, Politics foundations. The evolving model.
- `Memory/` — Cycle memories. Records of what happened and what was learned.
- `Experiences/` — Raw experiment logs and cycle summaries.
