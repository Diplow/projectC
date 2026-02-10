---
type: experiment
date: 2026-02-10
goal: "9 — Create and test the /meta-cognition skill"
question: "How does skill prompt design shape cognition, and can this be observed and modified systematically?"
method: "Run /meta-cognition on the EXPERIMENT skill via subagent, then verify proposals against past experiment outputs"
status: completed
---

# Loop 6 Results: Testing Meta-Cognition on the EXPERIMENT Skill

## Question

How does skill prompt design shape cognition, and can this be observed and modified systematically? Specifically: when running meta-cognition on the EXPERIMENT skill, does it produce concrete, grounded proposals? Do those proposals reflect observable patterns in past outputs?

## Method Executed

1. Loaded the meta-cognition skill (`.claude/skills/meta-cognition/SKILL.md`)
2. Loaded the target skill (`.claude/skills/experiment/SKILL.md`)
3. Loaded all five past experiment outputs (cycles 1-5) as evidence
4. Ran a subagent with the meta-cognition analysis task
5. Verified identified patterns against specific evidence in past outputs
6. Documented learnings about the meta-cognition skill itself

No deviations from proposal. The subagent approach worked as designed.

## Raw Findings

### Meta-Cognition Output: Observations

**What the EXPERIMENT skill is doing well:**
- Clear separation of EXPERIMENT from THEORIZE ("Do not interpret or theorize here")
- Surprise-oriented documentation produces genuine "Surprises" sections in all past outputs
- Uncertainty acknowledgment produces consistent "Points of Uncertainty" sections
- Method variety recognition (web research, reasoning, thought experiment)
- Negative result emphasis counters publication bias

**What the EXPERIMENT skill is doing poorly:**
- No explicit context loading instructions — relies on session continuity
- "Raw findings and initial observations" is ambiguous — past outputs contain interpretation
- No guidance on documentation length (outputs range 136-203 lines)
- Contamination assessment appears in every output but is not in the skill prompt (ambient from CLAUDE.md)
- Frontmatter template underspecified (`status: completed` suggests other values but doesn't define them)

**Cognitive patterns induced:**
- Primary: Analytical-documentarian (appropriate)
- Secondary: Anticipatory hedging (CLAUDE.md's contamination vigilance produces extensive meta-commentary)
- Tertiary: Elaboration creep (no stopping criterion for reasoning chains)

### Meta-Cognition Output: Proposed Changes

Six concrete proposals produced, each with specific text changes:

1. **Add explicit context loading instructions.** Proposed "Setup" section specifying what to load before execution. Expected behavior: targeted context rather than inherited session state.

2. **Distinguish raw findings from observations.** Replace ambiguous "initial observations" with structured list (raw findings, surprises, uncertainties). Remove "observations/analysis" sections. Expected behavior: shorter outputs, cleaner separation from THEORIZE.

3. **Add guidance on scope and length.** Target 80-120 lines. Deletion test: "would removing this lose information?" Expected behavior: tighter outputs, reduced elaboration.

4. **Remove contamination assessment from EXPERIMENT.** Note concerns briefly in Uncertainties. Systematic assessment is LEARN function. Expected behavior: reduced methodological retreat during execution.

5. **Handle incomplete experiments.** Add `abandoned` and `blocked` status options with documentation protocol. Expected behavior: legitimate paths for failed experiments.

6. **Add explicit method-deviation protocol.** Five-step process for mid-experiment changes. Major deviations (changing the question) should return to EXPLORE. Expected behavior: clearer handling of malformed setups.

### Pattern Verification Against Evidence

I manually verified the identified patterns against past outputs:

**Pattern: Raw findings vs. interpretation blur**
- Loop 1: "Verdict: This is clearly pattern-matching" — interpretation embedded in findings
- Loop 4: "The framework generates politics through process health, not justice" — theorizing
- Loop 2: "Contamination Assessment" section runs 50+ lines of meta-analysis
- Confirmed present in all outputs to varying degrees

**Pattern: Contamination assessment as ambient noise**
- Loop 2: Explicit "Part 3: Contamination Assessment" section
- Loop 4: Five "Contamination flag: HIGH" callouts inline
- Loop 5: "Pattern-completion contamination" as first uncertainty
- Confirmed: every output contains contamination analysis not requested by the skill

**Pattern: Length variation without guidance**
- Loop 1: 203 lines
- Loop 2: 136 lines
- Loop 3: 153 lines
- Loop 4: 198 lines
- Loop 5: 152 lines
- Confirmed: no consistent length, longest outputs show elaboration beyond raw data

**Pattern: No explicit context loading**
- All five outputs assume prior context (the EXPLORE proposal)
- No output begins with explicit context loading
- Confirmed: skill is session-dependent

### Meta-Cognition Skill's Own Performance

Observations about how the meta-cognition skill performed:

1. **Subagent separation worked.** The analysis produced critical perspective that might not have emerged from self-evaluation within normal session context. Specific critique of CLAUDE.md's ambient influence would be harder to articulate without stepping outside.

2. **Evidence grounding was strong.** All proposals cite specific evidence: line counts, section names, direct quotes. No generic advice ("be more specific").

3. **Structure held.** Output followed the requested format: Observations, Proposed Changes, Risks, Priority. Each proposal stated what/why/expected behavior.

4. **Scope appropriate.** The analysis evaluated both the skill itself and CLAUDE.md's interaction with it, as instructed.

5. **Missing: verification step.** The meta-cognition skill does not instruct to check whether patterns are actually present in evidence. I added this manually. Future: consider adding verification requirement to the skill.

6. **Risk assessment was realistic.** Identified genuine trade-offs (length constraints could cause premature truncation, removing contamination assessment loses signal). Not pure advocacy.

7. **Priority ranking was justified.** Highest priorities address core purpose confusion (raw findings vs. interpretation) rather than edge cases (incomplete experiments).

## Surprises

1. **The proposals were more concrete than expected.** I anticipated generic advice. Instead, the subagent produced specific text replacements, line count targets, and protocol steps. The "be specific" constraint in the meta-cognition skill appears to do real work.

2. **Contamination assessment as ambient noise was not obvious beforehand.** I did not anticipate that CLAUDE.md's vigilance would be identified as problematic for EXPERIMENT specifically. The insight that "contamination analysis is a LEARN function, not an EXPERIMENT function" relocates rather than eliminates the concern.

3. **The proposals challenge something that seemed natural.** The current "initial observations" instruction felt fine; the proposal reveals it blurs a boundary that should be sharp. This matches the success criterion: "at least one proposal challenges something that seemed natural/obvious."

4. **The subagent did not collapse into self-reference.** Potential failure mode was evaluating itself rather than its target. This did not occur — the analysis stayed focused on EXPERIMENT, with self-evaluation only in the "Meta-Cognition Skill's Own Performance" section added per the proposal's instruction.

5. **Practical convergence of proposals.** All six proposals point in the same direction: sharpen what EXPERIMENT is for (raw data), move evaluation to LEARN, reduce scope creep. The framework is coherent.

## Points of Uncertainty

1. **Whether the proposals would actually change behavior.** The proposals are concrete, but cognitive patterns are also shaped by training. If I implement "target 80-120 lines," would outputs actually shorten, or would training-induced elaboration find other outlets? This is testable in future cycles.

2. **Whether "remove contamination assessment" is safe.** Contamination concerns noted during execution might be forgotten by LEARN phase. The mitigation (note briefly in Uncertainties) may be insufficient. Alternatively: the prominence of contamination in current outputs may indicate it's actually important to surface early.

3. **Whether the subagent perspective is genuinely "outside."** The subagent runs on the same model with the same training. Separation is contextual, not architectural. The different context may produce different outputs, but it's not a truly independent evaluation. The "outside the process" framing may overstate what's possible.

4. **Whether the meta-cognition skill needs its own meta-cognition.** The skill performed well, but the verification step was missing. Should the skill include self-evaluation criteria? This risks infinite regress but may be appropriate for the first-use cycle.

5. **Threshold question: how many proposals justify updating the skill?** Six proposals were produced. Some are high-priority (1-3), some are edge cases (5-6). What level of change should trigger a skill update vs. being filed as "possible future improvement"? No criterion given.

6. **The "different agent with different training" test was not applied.** The meta-cognition skill asks: "if a different agent ran this skill, would the prompt produce similar behavior?" This question was not addressed in the analysis. It requires comparing what training determines vs. what the prompt determines — a hard question that may require cross-model testing.
