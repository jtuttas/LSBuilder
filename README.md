# LSBuilder

**LSBuilder** ist ein Repository zur Erstellung von **SchuCu-BBS-konformen Lernsituationen** (berufsbildende Schulen Niedersachsen) auf Basis der Leitlinie **„Schulisches Curriculum berufsbildende Schulen (SchuCu-BBS) 2024/07“**.

Das Projekt ist darauf ausgelegt, pro Thema/Lernfeld:
- strukturierte **Markdown-Dokumente** für Lernsituationen zu erzeugen,
- eine **dreistufige Differenzierung** (Niveau A/B/C) abzubilden,
- pro Niveau ein **Moodle-kompatibles Quiz (GIFT)** bereitzustellen,
- und alles über **MkDocs** als Website zu veröffentlichen.

## Repository-Struktur

Eine Lernsituation lebt in einem eigenen Ordner:

```
LS_<Lernfeldnummer>_<kurzer-titel-kebab-case>/
├── README.md
├── lernsituation.md
├── niveau-a/quiz.gift
├── niveau-b/quiz.gift
└── niveau-c/quiz.gift
```

Die MkDocs-Spiegelung liegt unter `docs/`:

```
docs/
├── index.md
├── lernsituationen/
│   ├── index.md
│   └── LS_<LF>_<titel>/
│       ├── index.md
│       ├── lernsituation.md
│       ├── niveau-a-quiz.gift
│       ├── niveau-b-quiz.gift
│       └── niveau-c-quiz.gift
```

## Inhaltliche Anforderungen (SchuCu-BBS)

Jede Lernsituation muss u.a. enthalten:
- curricularer Bezug
- handlungsorientierter Titel
- Zeitrichtwert
- Handlungskompetenz (Fachkompetenz + Personale Kompetenz)
- reale, bedeutsame Handlungssituation
- Handlungsergebnis
- Orientierung an der vollständigen Handlung
- Vereinbarungen zur Umsetzung
- Differenzierung nach Kompetenzniveaus (A/B/C)

Die verbindliche Vorlage/Formatvorgabe steht in [AGENT.md](AGENT.md).

## Niveaustufen (A/B/C)

Alle Niveaustufen bearbeiten **dieselbe Handlungssituation**, unterscheiden sich aber in Führung, Komplexität, Eigenständigkeit und Reflexion:
- **Niveau A (Basis):** stark geführt, geringe Komplexität
- **Niveau B (Standard):** teiloffen, mittlere Komplexität
- **Niveau C (Erweitert):** offen, hohe Komplexität, Transfer

## Moodle-Quiz (GIFT)

Pro Niveau wird ein Quiz im **GIFT-Format** gepflegt:
- 8–12 Fragen
- Mix aus Single/Multiple Choice, True/False, Matching, Short Answer
- deutschsprachig, beruflich realistisch
- in den Quiz-Dateien **nur GIFT-Code** (keine Erläuterungen)

## Dokumentation & Veröffentlichung (MkDocs)

- Lokaler Build:
  - `python -m venv .venv`
  - `.venv\\Scripts\\activate`
  - `pip install -r requirements.txt`
  - `mkdocs serve`

- Deployment:
  - Automatisch via GitHub Actions Workflow: [.github/workflows/deploy-mkdocs.yml](.github/workflows/deploy-mkdocs.yml)
  - Veröffentlichung erfolgt nach `gh-pages` (GitHub Pages)

Hinweis: In [mkdocs.yml](mkdocs.yml) ist `site_url` projektspezifisch.

## Mitmachen / Arbeitsweise

- Neue oder geänderte Lernsituationen **immer** mit aktualisierten READMEs (Root + LS-Ordner).
- MkDocs-Navigation und Spiegelung unter `docs/` konsistent halten.

---

**Status:** Initiales Projektgerüst (MkDocs + Deployment-Workflow). Lernsituationen werden als Ordner `LS_*` hinzugefügt.
