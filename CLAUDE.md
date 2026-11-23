# Meu Pequeno Grimório

Busca livros na **Google Books API** e organiza uma biblioteca pessoal em SQLite (adicionar, editar, detalhes).

## Arquitetura
```
features/library/presentation/ (home, dashboard, search_books, book_details, new_entry, edit_details)
   └── controllers/book_controller.dart
          ├── data/google_book_service.dart ──http──> Google Books API
          └── data/book_database.dart ──sqflite──> livros pessoais
domain/ google_book_model.dart (resposta da API), personal_book_model.dart (registro local)
features/auth/presentation/ login, sign_up (telas, sem backend de auth real)
shared/widgets/ botões, inputs de data, textos reutilizáveis; theme.dart
```
- O nome diz "MVC", mas o código está organizado por feature com camadas. Siga a estrutura atual.
- Testes: `test/book_service_test.dart` (client falso) e `book_test.dart` (modelos).

## Comandos (PowerShell)
```powershell
flutter pub get; flutter analyze --no-fatal-infos --no-fatal-warnings; flutter test
flutter run           # sqflite: Android/iOS/desktop (na web precisa de sqflite_common_ffi_web)
```

## CI e deploy
- `ci.yml` roda pub get, analyze e test.
- Não há deploy.

## Regras
- Widget reutilizável vai para `shared/widgets`. Cores e tipografia, só em `theme.dart`.
- Mudou o schema do SQLite: incremente a versão e escreva o `onUpgrade` (não perca os livros do usuário).
- O login é só tela. Não afirme que há autenticação real.
