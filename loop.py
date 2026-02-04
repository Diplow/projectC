"""Loop runner — Runs C's cognitive loop until LEARN or blocked."""

import json
import subprocess
import sys
from pathlib import Path

PROJECT_DIR = Path(__file__).parent
STATE_FILE = PROJECT_DIR / "current.json"
PROMPTS_DIR = PROJECT_DIR / "prompts"
STEPS = ["explore", "experiment", "memorize", "theorize", "learn"]


def read_state():
    return json.loads(STATE_FILE.read_text(encoding="utf-8"))


def write_state(state):
    STATE_FILE.write_text(json.dumps(state, indent=2) + "\n", encoding="utf-8")


def get_next_step(current_step):
    idx = STEPS.index(current_step)
    if idx >= len(STEPS) - 1:
        return None
    return STEPS[idx + 1]


def get_step_prompt(step, cycle):
    template_path = PROMPTS_DIR / f"{step}.md"
    if not template_path.exists():
        raise FileNotFoundError(f"No prompt template found for step: {step}")
    template = template_path.read_text(encoding="utf-8")
    return template.replace("{{CYCLE}}", str(cycle))


def run_step(prompt):
    """Run claude with the given prompt, streaming output to console."""
    result = subprocess.run(
        ["claude", "-p", "--verbose"],
        input=prompt,
        cwd=str(PROJECT_DIR),
        text=True,
    )
    return result.returncode


def main():
    print("=== C Loop Runner ===\n")

    while True:
        state = read_state()

        # Check blocked
        if state["status"] == "blocked":
            print(f"[BLOCKED] {state['blocked_reason']}")
            break

        # Check if LEARN step — needs user
        if state["step"] == "learn":
            cycle = state["cycle"]
            print(f"[LEARN] Cycle {cycle} reached LEARN step.")
            print(f"  Review: Experiences/cycle-{cycle}-summary.md")
            print(f"  Run a LEARN session with the user before advancing.")
            break

        step = state["step"]
        cycle = state["cycle"]

        print(f"[CYCLE {cycle}] Running step: {step.upper()}...")

        # Update state to running
        state["status"] = "running"
        write_state(state)

        # Get the prompt for this step
        try:
            prompt = get_step_prompt(step, cycle)
        except FileNotFoundError as e:
            state["status"] = "blocked"
            state["blocked_reason"] = str(e)
            write_state(state)
            print(f"[BLOCKED] {state['blocked_reason']}")
            break

        # Run claude with the step prompt
        exit_code = run_step(prompt)

        if exit_code != 0:
            state["status"] = "blocked"
            state["blocked_reason"] = f"Step {step} exited with code {exit_code}"
            write_state(state)
            print(f"[BLOCKED] {state['blocked_reason']}")
            break

        print(f"[CYCLE {cycle}] Step {step.upper()} completed.\n")

        # Advance to next step
        next_step = get_next_step(step)

        if next_step is None:
            state["cycle"] = cycle + 1
            state["step"] = "explore"
        else:
            state["step"] = next_step

        state["status"] = "pending"
        state["blocked_reason"] = None
        write_state(state)

    print("\n=== Loop stopped ===")


if __name__ == "__main__":
    main()
