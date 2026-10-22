# Policy Compliance

This project follows the ASF
[Generative Tooling Guidance](https://www.apache.org/legal/generative-tooling.html#include-in-contributions).
The full obligations are in [AI Contribution Guide §3](ai-contribution.md); this
page is the fast checklist. **Read the guide — this is a reminder, not a
substitute.**

## Every AI-assisted contribution must

- [ ] **Have a human contributor** who read and understood the output and can
      defend it in review. Prompts do not create authorship.
- [ ] **Satisfy your ICLA obligations** — you are entitled to grant the license
      (ICLA §4), the work is your original creation / third-party material is
      disclosed (§5), and you will notify `legal-private@apache.org` if a
      representation later proves inaccurate (§8). Do **not** route AI output
      through §7.
- [ ] **Meet Condition 1** — the AI tool's terms of use grant you sufficient
      rights in the output and impose no restrictions inconsistent with the
      [Open Source Definition](https://opensource.org/osd/).
- [ ] **Meet Condition 2** — at least one of:
    - 2.1 output is not copyrightable *(legally unsettled — don't rely on alone)*
    - **2.2 no third-party material** *(preferred)*
    - **2.3 third-party material is compatibly licensed and compliant** *(preferred)*
- [ ] **Disclose provenance** in the commit trailer:
      `Generated-by: <Tool> <Version>` or `Co-authored-by: <Tool> <Version>`.
- [ ] **License-check dependencies** against the
      [3rd Party Licensing Policy](https://www.apache.org/legal/resolved.html)
      and record them in the [SBOM](sbom.md).
- [ ] **Human-review before public publication** (EU AI Act): this docs site and
      any announcement/release note must be reviewed by a committer/PMC member
      before it publishes, **or** carry a clear AI-generated label.

## How this repo satisfies the publishing rule

The docs site is **built locally from the default branch after human-reviewed
merges**, and the generated `site/` directory is what gets published. The
reviewer who merges takes responsibility for the published text, which is
exactly what the EU AI Act path requires — no extra labeling is needed as long
as the review gate holds. If content is ever auto-published without review, it
must be labeled AI-generated.

## Tooling

The ASF maintains **no approved-tools list** — use any tool that lets you meet
the above. Don't second-guess a vendor's terms of use; your usage is bound by
the totality of their ToU.
