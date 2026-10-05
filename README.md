# AIとベクトル埋め込みを使った4Dのセマンティックアイコン検索

Semantic Icon Search in 4D Using AI and Vector Embeddings (4D Technical Note 26-04): Japanese edition.

このテクニカルノートでは、4D AI KitとOpenAIの埋め込みAPIで生成したベクトル埋め込みを使い、4Dアプリケーションにセマンティック検索を実装する方法を紹介します。アイコンのタグとユーザーのクエリをベクトルに変換し、4D.Vector型とORDAのベクトルクエリ（コサイン類似度）を使って、キーワードが一致しなくても意味の近いアイコンを検索します。付属のデモでは、約1,500個のMaterial Design Iconsを自由なプロンプト、またはベクトル化済みのプロンプトで検索し、類似度の順に一覧表示できます。

This technical note shows how to implement semantic search in a 4D application with vector embeddings generated through 4D AI Kit and the OpenAI embedding API. The demo searches about 1,500 Material Design Icons by meaning and ranks them by cosine similarity.

## Download

| | |
|---|---|
| PDF (Japanese) | [26-04_SematicIconSearch_ja.pdf](https://github.com/miyako/SematicIconSearch/releases/latest/download/26-04_SematicIconSearch_ja.pdf) |
| 4D demo | [SematicIconSearch.zip](https://github.com/miyako/SematicIconSearch/releases/latest/download/SematicIconSearch.zip) |
| Original (English) | `document/26-04_SematicIconSearch.pdf` |

## Demo

- 4D version: 4D 21 R3 (compile-checked on 4D 21 LTS too)
- Open `demo/SematicIconSearch/Project/SematicIconSearch.4DProject`. The 4D AI Kit component is resolved from `dependencies.json`.
- Languages: Japanese, English. The UI follows the system language; the XLIFF files are in `Resources/<lang>.lproj/`.
- OpenAI API key: copy `Project/Sources/AIProviders.example.json` to `AIProviders.json` in the same folder and set your key, or add an OpenAI provider on the AI page of the Structure Settings. `AIProviders.json` is git-ignored. The three pre-vectorised prompts work without a key.

### Demo data

The icons and prompts ship as 4D export files (`Resources/Icon.4ie`, `Resources/Prompt.4ie`, with `.4si` import settings), vectors included. On startup, empty tables are filled with `IMPORT DATA`. The third pre-vectorised prompt is Japanese (「スポーツとレジャー」, replacing the Spanish "Deportes y Ocio").

## Differences from the original

- The demo reads the OpenAI API key from `AIProviders.json` instead of asking for it in a dialog and keeping it in `Storage`. The "Configure OpenAI API key" button is gone. A translator's note (訳注) explains this after the key-management section.
- The demo ships its data as 4D export files instead of the icon PNGs and `tags.json`. A second 訳注 explains this after the Phase 1 code.
- The demo UI is localised (XLIFF), starts without blocking (`CALL WORKER` + `DIALOG(;*)`), and uses CSS for the macOS Tahoe button heights.
- Figure 2 is a new screenshot of the Japanese demo. The text in figures 1, 3 and 4 is translated, including the rotated distance labels in figure 1.
- Example tags and queries stay in English, as in the original; code blocks are identical to the original.

## Editing and rebuilding

The PDF is generated from plain-text sources. Edit them and run `make`.

| File | What |
|---|---|
| `src/ja.md` | Translated body text. **Don't touch code blocks** (`make check` verifies them). |
| `figures/fig-NN.ja.txt` | Text drawn in figure NN. Line N corresponds to line N of `fig-NN.en.txt`: an identical line keeps the original, an empty line erases it. |
| `figures/layout/fig-NN.json` | Per-label overrides for size, weight, alignment and position; `"replace"` uses a ready-made image |
| `glossary.md` | Terminology |

```sh
make            # check → figures → build/26-04_SematicIconSearch_ja.pdf
make check      # code blocks unchanged, figure references complete
make review     # contact sheets of the figures (build/contact-N.png)
make release-assets
```

Requirements: Python 3, Google Chrome, CJK fonts, and Tesseract (only needed for re-extraction).
See the [localisation template](https://github.com/miyako/4d-technote-localisation-template) for the full workflow.

## Credits

- Original: Karim Meghraoui, Technical Services Engineer, 4D Morocco. 4D Technical Note 26-04.
- Produced with [4d-technote-localisation-template](https://github.com/miyako/4d-technote-localisation-template) and GitHub Copilot.
