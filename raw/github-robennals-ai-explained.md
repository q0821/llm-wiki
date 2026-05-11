<!-- source-url: https://github.com/robennals/ai-explained -->
<!-- title: robennals/ai-explained — Learn AI Layer by Layer -->
<!-- fetched: 2026-05-11 -->
<!-- note: 因 fetch-url.sh 超時，改用 gh api 萃取 README + curriculum -->

# Learn AI Layer by Layer

An interactive, visual tutorial site for understanding AI from first principles. Tinker with real models, break things on purpose, and discover why neural networks work the way they do.

- 🌐 Live site: https://ai-explained.com （beta: https://ai-explained-beta.vercel.app）
- 📨 New chapter notifications: messyprogress.substack.com
- 作者: Rob Ennals
- Repo: https://github.com/robennals/ai-explained
- Stars: 6（2026-05-11，新專案）
- 技術棧: Next.js + MDX + React widgets；每章配 Jupyter notebook（PyTorch / Google Colab）

## What's here

The site walks through the big ideas behind modern AI — neural networks, embeddings, attention, transformers — using interactive widgets you can play with. Each chapter is a standalone article with playgrounds inline. A companion Jupyter notebook for each chapter lets you run real PyTorch code in Google Colab.

目標：a real, intuitive understanding, with no math or computer science background assumed.

## 章節列表（curriculum.ts）

標 ✅ 的為 `ready: true`：

| # | slug | 標題 | 主題 | 狀態 |
|---|------|------|------|------|
| 0 | introduction | Introduction | What this is and how to use it | ✅ |
| 1 | computation | Everything Is Numbers | Computation | ✅ |
| 2 | optimization | The Power of Incremental Improvement | Optimization（演化/A-B testing/gradient descent 是同一個演算法）| ✅ |
| 3 | neurons | Building a Brain | Neural networks（neuron = smooth logic gate；backpropagation）| ✅ |
| 4 | vectors | Describing the World with Numbers | Vectors（dot product 量相似度；單一 neuron = pattern detector）| ✅ |
| 5 | embeddings | From Words to Meanings | Embeddings（one-hot → learned representations；word analogies；meaning 的幾何）| ✅ |
| 6 | next-word-prediction | Understanding by Predicting | Next-word prediction | ✅ |
| 7 | attention | Paying Attention | Attention | ✅ |
| 8 | positions | Where Am I? | Positional encoding | ✅ |
| 9 | transformers | One Architecture to Rule Them All | Transformers | ✅ |
| - | matrix-math | Thinking by Rotating | Matrix math | （開發中）|
| - | training | Why Training Almost Doesn't Work | Making training work | （開發中）|
| - | mixture-of-experts | Only Wake the Specialists You Need | Mixture of experts | （開發中）|
| - | long-context | Remembering a Million Words | Long context | （開發中）|
| - | inference | Running Models Fast | Inference and hardware | （開發中）|
| - | interpretability | Looking Inside the Mind | Interpretability | （開發中）|
| - | reinforcement-learning | Learning from Experience | Reinforcement learning | （開發中）|
| - | self-play | Getting Better by Beating Yourself | Self-play | （開發中）|
| - | reasoning | Thinking by Talking to Yourself | Reasoning models | （開發中）|
| - | alignment | Teaching AI Right from Wrong | Alignment | （開發中）|
| - | synthetic-data | Models Teaching Models | Distillation and synthetic data | （開發中）|
| - | vision | Teaching Machines to See | Image comprehension | （開發中）|
| - | image-generation | （標題未取得）| Image generation | （開發中）|

## Develop

```bash
pnpm install
pnpm dev              # dev server at localhost:3000
pnpm build            # production build
pnpm lint             # ESLint + MDX validation
pnpm test:notebooks   # execute all Jupyter notebooks (needs Python + torch)
npx playwright test   # E2E tests (needs dev server running)
```

## Project structure

- `src/app/(tutorial)/{slug}/` — chapter pages (`page.tsx` + `content.mdx` + `widgets.tsx`)
- `src/components/widgets/{topic}/` — interactive React widgets, one folder per chapter
- `src/components/mdx/` — custom MDX components (`<Callout>`, `<KeyInsight>`, `<TryIt>`, etc.)
- `src/lib/curriculum.ts` — chapter metadata (titles, slugs, prerequisites)
- `notebooks/` — companion Jupyter notebooks, one per chapter
- `docs/plans/` — design and planning docs

## License

See LICENSE.
