# Jurist — FOCUS

Источник правды для агента (`one-phase-focus`). Одна активная фаза, пока чеклист не зелёный.

## Сейчас

**P7 — Пилот: релевантность + оценки** — проверка «КСАК за 23» и запись feedback в БД

## Чеклист активной фазы (P7)

- [x] Feedback UI: кнопки на ответах (overlay, независимо от React)
- [x] Крестик на плашке + не всплывает каждый раз / после dismiss
- [x] Жёсткий name-filter после merge (КСАК ≠ КАС/CSS)
- [x] `score_haystack`: год+kind не спасают name-miss
- [ ] Пользователь подтвердил: «КСАК за 23» → только КСАК_* в выдаче
- [ ] Хотя бы одна оценка 👍/👎 ушла в `messages.feedback` (пилот)
- [ ] Краткий проход 3 типовых запросов пилота без чужих контрагентов

## Закрытые фазы

### P1 — Роутер диалога
- [x] Название контрагента → search, не «болталка»
- [x] Clarify без цели («где лежит?» без файла)

### P2 — Нормализация поиска
- [x] `queryparse`: marvel↔марвел, KAC↔КАС, улытау…
- [x] Score / aliases, RAG `search_meta` + merge в `/ask`

### P3 — Год + scope чата
- [x] Жёсткий year lock (Paperless tag + title)
- [x] `effective_slots` + scope continue / refine / fresh

### P4 — Grounding
- [x] SYSTEM_PROMPT + allowed_docs, temperature↓
- [x] Empty locate/fallback без LLM-фантазий
- [x] `looks_ungrounded` → отказ

### P5 — Ранг + дедуп
- [x] Договор ≫ спека / карта рисков; `(OLD)` тонет
- [x] Один ключ на номер / checksum после merge

### P6 — Feedback для пилота
- [x] `POST /messages/{id}/feedback` без обязательного knowledge_id
- [x] Live UI: overlay + sticky; deploy в `/var/www/jurist`

### Документация пайплайна
- [x] `docs/query-pipeline.drawio`

## Парковка

- Усилить деплой по flaky corp SSH (маленькие патчи / retry UX)
- Мониторинг: дашборд оценок feedback из `jurist.db`
- Подсказать, если в корпусе 0 хитов (Moore) — «нет в архиве», не пустая болтовня

## Бэклог (вне пилота)

- Клиент Teams как основной канал
- Исходники веб-UI (сейчас только `web/dist`)
- Git checkout на самом сервере
- Embeddings вместо FTS-заглушки в RAG
- Админ-отчёт по approve/reject знаний

## Правило

Новые идеи → парковка/бэклог. Следующую фазу — только после «готово / протестировал / дальше» или зелёного чеклиста P7.
