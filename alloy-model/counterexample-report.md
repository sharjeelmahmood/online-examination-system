# Counterexample Analysis Report

The Alloy Analyzer detected a counterexample when the OneSubmissionRule constraint was removed.

Without the constraint, a student was able to submit the examination multiple times.

This violated the system invariant:
"A student can submit only once."

The issue was fixed by enforcing the OneSubmissionRule fact.
