# Running each stage with the user

How to move through a stage with the user without dumping a finished document on them or asking vague questions. The pattern for every section: short context, two to four concrete options with one marked as recommended, the user's decision, a draft, approval, write to file.

## General rules

- Ask about one section at a time. Never more than three questions in one message.
- Every option is concrete enough to picture: a palette with hex values and roles, a size in pixels, a duration in seconds, a reference image. "Warm" or "modern" alone is not an option.
- Mark one option as recommended and say why in one sentence.
- Show visuals whenever the question is visual: a mockup crop, a palette swatch, a side-by-side, a short frame sequence.
- After approval, write the section to its file at once and say which file and section changed.
- When the user rejects something, ask what specifically is wrong (size, color, shape, motion, mood) before redrawing. Record the reason in the document so it is not repeated.
- When the user says "you decide", decide, state the choice in one line, write it down as your decision, and continue.

## Stage 0: core loop prototype

1. The question: "Which single mechanic are we testing, and what result would make it a yes?"
2. The plan: what is built (gray boxes, one level), what is not, and the time cap.
3. After play: the user's verdict (proceed, pivot, kill) and the reasons, recorded in a short report.

## Stage 1: art direction

Order and the question for each section:

1. Visual identity: "Which one-line rule should settle visual questions?" Offer three rules, each with a mockup or reference crop.
2. Mood per state: present a table of states with one proposed mood each; ask only about the rows the user would change.
3. Shape language and color system together: two or three complete combinations (shapes, palette with roles, a UI sample). Ask which, then refine.
4. Characters and environment: silhouettes at real play size next to each other and against the background.
5. UI direction: one button family in all states, a panel, a counter, at real size on a device-sized canvas.
6. Motion and sound direction: describe the feel with durations ("panels open in 0.25 s with a slight overshoot"); for sound, name references or sample files.
7. Asset standards: propose sizes and formats from the target devices; ask only about conflicts with budgets.
8. References: for each, what to take and what to avoid; ask the user to strike any they dislike.

Then generate mockups from the written direction and show them as a set. Gate question: "Is this the direction for the whole game?"

## Stage 2: screen spec

1. Player need and navigation: one sentence each; ask for confirmation.
2. Layout: a labelled wireframe with sizes, or a mockup with measured boxes. Ask about positions and sizes, not colors (those are fixed by the art direction).
3. States: present the full list; ask "Is any state missing or unnecessary?"
4. Interactions, motion and sound: a table; ask only about rows with a real choice.
5. Acceptance criteria: present them; ask whether any would not count as done.

Then run the independent review and show its verdict before asking for approval.

## Stage 3: assets

1. Show the inventory grouped by category with reuse marked. Ask: "Anything missing, anything to cut?"
2. Show the first two or three specs in full; once their level of detail is approved, write the rest the same way and present them as a list.
3. Show delivered assets on a contact sheet at real play size, next to the approved mockup.

## Stage 4 and 5: UI shell and approval

When handing the shell to the user, give:

- The branch, how to open it (scene, menu item for the state switcher), and the Game view resolution to use.
- A checklist of states and interactions to try, in a sensible order.
- The evidence already checked (screenshots, timed frames) with links.

Collect feedback as a numbered list of defects, confirm the list back, fix, and hand over again with what changed. The gate question: "Is this screen approved as it is now?"

## Stage 6: logic wiring

Tell the user what changed (data source only), what was verified (tests, baseline comparison) and what to spot-check with real data.
