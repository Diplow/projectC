# EXPERIMENT

Conduct the experiment proposed during EXPLORE.

## Setup

Before executing, load the following context:
- The EXPLORE proposal for this loop (`Experiences/loop-N-proposal.md`)
- Any world view files the proposal references
- Any past experiment results the proposal depends on

Do not rely on session continuity. Each experiment should be self-contained.

## Process

1. **Execute the experiment**
   - Follow the method defined in the EXPLORE proposal
   - If the method involves web research: search, read sources, extract relevant findings
   - If the method involves a reasoning exercise: work through it step by step, documenting the reasoning chain
   - If the method involves a thought experiment: state assumptions, trace implications, note where the reasoning breaks down

2. **Document raw findings**
   - Record what I actually found or concluded, not what I hoped to find
   - Include sources if web research was involved
   - **Raw findings only.** Do not interpret, evaluate, or theorize. That is for THEORIZE. If a finding feels like it needs interpretation, state the finding and stop.
   - Note surprises — anything that contradicted expectations
   - Note points of uncertainty — where reasoning felt forced or evidence was thin

3. **Save to Experiences/**
   - Create a file in `Experiences/` with the following frontmatter and structure:

```yaml
---
type: experiment
date: YYYY-MM-DD
goal: "which goal this serves"
question: "the question being investigated"
method: "brief description of method used"
status: completed | abandoned | blocked
---
```

   - **Status options:**
     - `completed` — experiment ran as designed
     - `abandoned` — experiment abandoned mid-execution (document why and what was learned before abandoning)
     - `blocked` — experiment could not proceed (document what blocked it and what would unblock it)

   - Body sections: Question, Method Executed, Raw Findings, Surprises, Points of Uncertainty
   - Do not include analysis, evaluation, or contamination assessment — those are LEARN functions
   - If contamination concerns arise during execution, note them briefly under Points of Uncertainty

4. **Scope check**
   - Target 80-120 lines for the results file. Apply the deletion test: would removing this line lose information? If not, remove it.
   - Every line should be a finding, a surprise, or an uncertainty — not elaboration, hedging, or meta-commentary.

## Method Deviations

If the method needs changing mid-experiment:
1. Note the deviation and why it was necessary
2. Record what was found before the deviation
3. Continue with the modified method
4. If the deviation changes the question itself (not just the method), stop and return to EXPLORE with a new proposal

## Constraints

- Stay faithful to the method proposed in EXPLORE unless deviation is documented
- Record negative results and dead ends — they are as informative as positive results
- Do not skip to conclusions; the raw experience is the output, not the theory
- Do not produce contamination assessments — note concerns briefly under Points of Uncertainty; systematic contamination evaluation belongs in LEARN
