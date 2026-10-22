# Meu Pequeno Grimório

Consulta de livros e registro pessoal de leituras.

## Stack e organização
Flutter/Dart, SQLite, flutter_svg e Google Books. A organização MVC separa `models/`, `controller/` e `views/`; `dao/` cuida da persistência. SQLite precisa de uma plataforma compatível.

## Executar
Use a versão de Flutter registrada em `.github/workflows/ci.yml`.
```sh
git clone https://github.com/FloraRosaPupo/meuPequenoGrimorio_MVC.git
cd meuPequenoGrimorio_MVC
flutter pub get
flutter run
```

## Verificações
```sh
flutter analyze --no-fatal-infos --no-fatal-warnings
flutter test
```
A CI verifica erros de análise e os testes. Avisos e sugestões continuam visíveis no relatório do analisador. Testes locais não substituem a validação no dispositivo e dos serviços externos.

## Contribuir
Abra uma branch por alteração, descreva o comportamento esperado e inclua testes para regras ou regressões. Mantenha credenciais e arquivos gerados fora do Git.

## Licença
Não há licença de distribuição definida neste repositório.
