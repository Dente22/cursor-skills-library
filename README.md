# cursor-skills-library

Личная библиотека **Cursor Agent Skills** из проектов Dente22.  
Сюда складываем скилы, пополняем и ставим в другие репозитории / на другие машины.

## Что внутри

| Путь | Содержимое |
|------|------------|
| `skills/` | Готовые Cursor skills (`SKILL.md` + доп. файлы). Формат: `~/.cursor/skills/<name>/` |
| `sources/corex/` | Оригинальное дерево из `CoreX-AI-code-free/core_x_skills` (для справки) |
| `agents/resona/` | Промпты-агенты из Resona (не формат Cursor Skill — опционально) |
| `SKILLS_INDEX.md` | Краткий список всех skills |

### Источники

- **MDM** (`C:\MDM\.cursor\skills`) — code-mentor, design, brand, slides, …
- **one-phase-focus** — из «День Х» (одна фаза до конца)
- **challenge-me** — https://github.com/Dente22/challenge-me
- **Spokes** — https://github.com/Dente22/Spokes (`skill/SKILL.md`)
- **CoreX-AI-code-free** — https://github.com/Dente22/CoreX-AI-code-free (`core_x_skills/`)

## Установка в Cursor (глобально)

Скопировать нужные папки из `skills/` в пользовательский каталог Cursor:

```bat
install-to-cursor.bat
```

Или вручную:

```bat
xcopy /E /I /Y skills\code-mentor %USERPROFILE%\.cursor\skills\code-mentor
```

После копирования перезапусти Agent / открой новый чат — скилы подхватятся.

## Установка в конкретный проект

```bat
xcopy /E /I /Y skills\code-mentor путь\к\проекту\.cursor\skills\code-mentor
```

## Как пополнять

1. Добавь папку `skills/<имя-скила>/SKILL.md` (frontmatter `name` + `description`).
2. Обнови `SKILLS_INDEX.md` (или пересобери скриптом).
3. `git add` → `commit` → `push`.

Шаблон: см. [Cursor create-skill](https://cursor.com) / локальный `~/.cursor/skills-cursor/create-skill`.

## Не кладём сюда

- Встроенные скилы Cursor (`~/.cursor/skills-cursor/*`) — это продукт Cursor, не наш бэклог.
- Секреты, `.env`, ключи API.

