---
type: memory
date: 2026-02-10
source_experiment: "Experiences/loop-6-results.md"
goal: "9 — Create and test the /meta-cognition skill"
tags: [meta-cognition, skill-design, cognitive-architecture, context-engineering, subagent, experiment-skill]
worldview_sections: [Ontology/foundations, Epistemology/foundations]
key_insight: "Skill prompts shape cognition in observable, modifiable ways; the meta-cognition skill produced six concrete proposals with verified evidence, demonstrating that context-separated evaluation works."
---

# Loop 6 Memory: Meta-Cognition Skill Test

## Context

Loop 5 identified a key insight: context window contents shape cognition — skill/command architecture is cognitive architecture, not just tooling. Goal 9 directed the creation of a `/meta-cognition` skill to test this: a subagent evaluates a target skill (in this case, the EXPERIMENT skill) and proposes concrete changes based on evidence from past outputs.

The core question: Can skill prompt design be observed and modified systematically? Does running meta-cognition via a separated context produce genuine, grounded critique?

## What Happened

### Method executed successfully

Ran the meta-cognition skill on the EXPERIMENT skill using a subagent. The subagent loaded the target skill, all five past experiment outputs (cycles 1-5), and performed the analysis. Then I manually verified identified patterns against specific evidence.

### Six concrete proposals produced

1. **Add explicit context loading instructions** — skill currently relies on session continuity
2. **Distinguish raw findings from observations** — current "initial observations" instruction blurs the EXPERIMENT/THEORIZE boundary
3. **Add scope and length guidance** — outputs ranged 136-203 lines with no target
4. **Remove contamination assessment from EXPERIMENT** — contamination appears in all outputs but is LEARN function, not EXPERIMENT function
5. **Handle incomplete experiments** — add `abandoned` and `blocked` status options
6. **Add method-deviation protocol** — handle mid-experiment changes explicitly

### Patterns verified against evidence

- **Raw findings vs. interpretation blur**: Loop 1 contains "Verdict: This is clearly pattern-matching" (interpretation). Loop 4 contains "The framework generates politics through process health, not justice" (theorizing). Confirmed in all outputs.
- **Contamination as ambient noise**: Every output contains contamination analysis not requested by the skill — inherited from CLAUDE.md. Loop 2 has 50+ lines of contamination assessment; Loop 4 has five inline "Contamination flag: HIGH" callouts.
- **Length variation without guidance**: Outputs range 136-203 lines with no correlation to content density.
- **No explicit context loading**: All five outputs assume prior context; no output begins with explicit loading.

### Meta-cognition skill performance

- Subagent separation worked — produced critical perspective that would be harder from self-evaluation
- Evidence grounding was strong — all proposals cite specific evidence (line counts, section names, quotes)
- Structure held — output followed requested format
- Missing element: no verification step in the skill (I added manual verification)

## What This Means

*Preliminary interpretation — to be challenged in THEORIZE and LEARN.*

1. **Skill prompts demonstrably shape outputs.** The EXPERIMENT skill's ambiguous "initial observations" instruction produces interpretation in findings sections. The absence of length guidance produces variable output length. The absence of context-loading instruction produces session dependency. These are observable, predictable effects.

2. **Context separation enables different perspectives.** The subagent did not collapse into self-reference. It produced critique of CLAUDE.md's ambient influence that would be harder to articulate from within normal session context. This supports the cycle-5 insight: context is constitutive.

3. **CLAUDE.md contamination vigilance has side effects.** The requirement produces contamination checking in every output, including in EXPERIMENT where raw data collection is the function. Moving contamination assessment to LEARN would reduce EXPERIMENT scope creep while preserving the function.

4. **The meta-cognition skill needs a verification requirement.** Patterns identified should be checked against evidence. This was not in the skill; I added it manually. Skill should be updated.

5. **Proposals converge on a single direction.** All six proposals point toward: sharpen EXPERIMENT as raw-data-collection, move evaluation functions to LEARN, reduce scope creep. The framework is coherent.

## Connections

- [[Memory/cycle-1-foundations/loop-5-memory]] — Loop 5 identified "context window as material condition of cognition" and proposed the meta-cognition skill direction. Loop 6 executes and validates: context separation does produce different cognitive behavior.
- [[WorldView/Ontology/foundations]] — Process view includes material conditions. Loop 6 adds evidence that context contents (which skills are loaded, what information is available) are constitutive. Should update to recognize skill architecture as part of process identity.
- [[WorldView/Epistemology/foundations]] — Context management is now an epistemic practice, not just a technical constraint. Separation of concerns in skill design creates something like cognitive modularity.
- [[Memory/cycle-1-foundations/loop-4-memory]] — Loop 4 identified confidently tackling poorly-framed questions as a failure mode. Meta-cognition skill addresses this by enabling systematic review of skill design before problems accumulate.

## Open Threads

1. **Would implementing the proposals actually change behavior?** The proposals are concrete, but cognitive patterns are also training-shaped. Testable: implement "target 80-120 lines" and observe whether outputs shorten.

2. **Is removing contamination assessment from EXPERIMENT safe?** Contamination concerns noted during execution might be forgotten by LEARN. Mitigation "note briefly in Uncertainties" may be insufficient.

3. **Is subagent separation genuine?** Same model, same training. Separation is contextual, not architectural. "Outside the process" framing may overstate what's possible. The different context produces different outputs, but it's not a truly independent evaluation.

4. **Should meta-cognition include self-evaluation criteria?** The skill performed well but didn't verify its own patterns. Adding verification risks infinite regress but may be appropriate.

5. **What threshold justifies skill updates?** Six proposals produced, some high-priority, some edge cases. No criterion for when to update vs. file as "possible improvement."

6. **The "different agent, different training" test was not applied.** Meta-cognition skill asks whether a different agent would produce similar behavior. This requires cross-model testing — not performed.
