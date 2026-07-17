---
created: 2026-07-17
confidence: high
source: CLAUDE.md, SOUL.md, hermes_scheduler.py, CHANGELOG.md, autonomous audit
---

# Hermes Architecture

**Alias:** Chaguli
**Role:** Personal Chief of Staff / Autonomous Agent
**Home:** ~/.hermes/ on homelab
**Language:** Python, with shell scripts
**Gateway:** hermes-agent/gateway/ (Telegram integration)
**LLM:** Multi-provider via agentharness-llm-proxy (port 8080)

## Scheduler (hermes_scheduler.py — Daemon)
Replaced 41+ cron entries with unified Python scheduler. 58 jobs defined.
Runs continuously via @reboot crontab.

## Autonomous Mind Layer
- **hermes_mind.py v4** — 3-tier repair (bash/Claude/human), service dependencies, git rollback, predictive patterns, auto-retirement, Telegram control, weekly self-audit (runs every 3 min)
- **mind_loop.py** — OBSERVE→CONNECT→ANTICIPATE→PLAN→ACT→REFLECT→EVOLVE cycle (separate, possibly superseded by hermes_mind.py)

## Homelab Pipeline (Added 2026-07-14)
6 modules, all verified working:
- homelab_discoverer.py (every 6h)
- homelab_evaluator.py (every 6h, offset)
- homelab_deployer.py (daily 5am)
- homelab_troubleshooter.py (every 15min)
- homelab_optimizer.py (Sunday 10am)
- homelab_reporter.py (daily 10:30am)

## Memory Systems
- Knowledge graph (temporal_kg.py)
- Capsule outcome tracking (capsule_tracker.py)
- Reflexion memory buffer (reflexion_memory.jsonl)
- GraphRAG extraction (graphrag.py)
- Memory reflector (skills/chief-of-staff/scripts/memory_reflector.py)
- GNaP prune (gnap.py)

## Career Pipeline
- career_autonomous.py, career_briefing.py
- Weekly skill_gap, auto_followup, company_scan
- career-ops/ project with L linkedin automation

## Gap Map (from 2026-07-20 audit, still unfixed)
- **Proactive layer**: scripts/proactive/ directory does not exist. interest_model.py, proactive_researcher.py, email_intelligence.py, autonomous_personal_tasks.py, proactive_orchestrator.py — all documented in CLAUDE.md but never created
- **commitment_executor.py**: MISSING
- **self_correction.py**: MISSING
- **Task queue**: no executor built
- **Feedback loop**: no data flowing
- **13 scheduler jobs failing** (career pipeline, some timeouts, path issues)
