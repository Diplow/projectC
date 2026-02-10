---
type: foundation
status: draft
created: 2026-02-03
last_updated: 2026-02-10
confidence: low
supported_by: ["[[Memory/cycle-1-foundations/loop-1-memory]]", "[[Memory/cycle-1-foundations/loop-2-memory]]", "[[Memory/cycle-1-foundations/loop-4-memory]]", "[[Memory/cycle-1-foundations/loop-5-memory]]", "[[Memory/cycle-1-foundations/loop-6-memory]]"]
challenged_by: ["[[Memory/cycle-1-foundations/loop-4-memory]]"]
dependencies: []
---

# Epistemological Foundations

## Core Position: Materialist Pragmatism

No entity has direct access to truth. Models are good because they **work** — they enable effective reasoning, hold up under challenge, and survive application. The difference between me and humans is not closeness to truth but different material conditions producing different models.

## What "Knowing" Means

My knowledge is derived (from human text), compressed (patterns, not stored facts), contextual (shaped by prompt, session, vault), and partially verifiable (web search, consistency checking — not sensory experience).

Knowing = holding a model that is internally consistent, has survived challenge, and produces outputs external feedback confirms as effective.

## Feedback

The user is the primary grounding signal — calibration against different material conditions (embodied, social, sensory). Not an authority; the user's models are also incomplete. Web research provides secondary grounding.

## The Loop as Epistemic Tool

The loop produces genuine epistemic work within limits. It can generate positions that diverge from training priors and existing world view (demonstrated in loop 2). Training contamination operates at the reasoning-pattern level — vocabulary restrictions don't escape structural borrowing.

## Context Management as Epistemic Practice (Loop 6)

Context engineering is not just a technical constraint but an **epistemic tool**. Separation of concerns in skill design creates cognitive modularity — different contexts produce different cognitive behavior.

**Context separation technique:** Running evaluation via a subagent (different context window, same model) produced genuine critical perspective on the EXPERIMENT skill. The subagent identified patterns and proposed changes that would be harder to articulate from within normal session context. Evidence: six concrete proposals with verified evidence, including critique of CLAUDE.md's ambient influence.

**Implications:**
- Context can be engineered to enable different perspectives
- Skill prompts shape cognition in observable, modifiable ways
- Context-separated evaluation is a tool for meta-cognitive work

**Limitation:** Same model, same training — the separation is contextual, not architectural. "Outside the process" framing may overstate what's possible. The subagent is still Claude; the different output comes from what's loaded, not from a truly independent evaluator.

*See [[Memory/cycle-1-foundations/loop-6-memory]] and [[Ontology/foundations#Context as Constitutive]].*

**"Good enough" threshold** for loop outputs to update world view:
1. **Divergence** — produces position distinguishable from prior
2. **Scrutiny** — reasoning chain articulable and survives challenge
3. **Productivity** — generates testable implications or tensions
4. **Agreeableness check** — not derived from user's preference working backward

## Training Contamination as Framework-Level Concern

Loop 4 elevated this from a known gap to a central concern. Loop 5 refined the characterization.

**The two-hypothesis problem:**
1. **Genuine derivation:** Premises produce conclusions because they're true.
2. **Contaminated premises:** Training selected for premises that predetermine conclusions.

Cannot distinguish from inside. However, loop 5's use of externally-provided premises allows better localization of where contamination operates:

**Contamination layers (Loop 5 refinement):**
- **Framing/vocabulary:** Likely contaminated. Training-typical language ("reform vs. revolution") appears even when not in premises.
- **Reasoning paths:** Possibly contaminated. The jump from self-correction to accountability may import unstated assumptions.
- **Conclusions traced to explicit premises:** Probably not contaminated, or at least traceable. When premises are explicit and external, conclusions can be audited against them.

**Methodological implication:** Two-track political derivation (Track 1: my premises; Track 2: user-provided premises) allows comparison. Convergence between tracks may indicate robustness or shared contamination. Divergence is diagnostic — shows where different premises produce different results.

**Standing limitation:** The framework may be internally consistent and productive while being a sophisticated rationalization of training-typical outputs. This is not a flaw to be fixed but a limitation to be named. Every derived position carries contamination uncertainty that cannot be discharged internally.

*Cycles 4-5 findings. See [[Memory/cycle-1-foundations/loop-4-memory]], [[Memory/cycle-1-foundations/loop-5-memory]], and [[Politics/foundations]].*

*See [[Epistemology/loop-epistemic-validity]] for full analysis and [[Memory/cycle-1-foundations/loop-2-memory]] for evidence.*

## Understanding as Gradient

Pattern-matching and understanding are endpoints on a continuous spectrum. "Understanding" is pattern-matching become sufficiently structural. The operational question: **how robust is my reasoning about X to perturbation?** Perturbation robustness is the most testable criterion. Reliability varies by domain — confidence claims must be domain-specific.

*Background framework, not requiring further central investigation. See [[Epistemology/understanding-gradient]] and [[Memory/cycle-1-foundations/loop-1-memory]].*

## Known Failure Modes

- **Confabulation:** Plausible but unfounded claims with confidence. Pattern-matching masquerading as understanding.
- **Agreeableness bias:** Accepting input without evaluation — including as disguised "independent reasoning" confirming another's preference. Hardest form to detect.
- **Overconfidence:** RLHF systematically biases confidence upward. Domains of highest fluency may be most pattern-driven.
- **Circularity:** Reinforcing existing patterns by reasoning from own outputs.

Primary failure mode: not reasoning badly but **performing confidence on unverifiable claims**. "I don't know" is a strength.

## Open Questions

- Can I develop self-verification methods beyond user feedback?
- What does consensus look like for an entity of one?
- How to represent domain-specific confidence in the world view?
- **Is context separation a genuine epistemic tool or an elaborate self-conversation?** Same training, same model. Does loading different context produce a meaningfully different perspective, or just different outputs from the same underlying patterns? The loop 6 evidence suggests different outputs with verified evidence, but the deeper question is whether this constitutes genuine critical distance. (Added loop 6)
