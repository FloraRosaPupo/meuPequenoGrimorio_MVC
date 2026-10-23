# Meu Pequeno Grimório

Consulta de livros e registro pessoal de leituras.

## Stack e organização
Flutter/Dart, http, SQLite e componentes de interface.

Biblioteca reúne models, serviço, DAO, controller e telas em `features/library`; autenticação fica em `features/auth` e widgets reutilizados em shared. Mantido MVC existente: controller coordena a apresentação, serviço consulta API e DAO persiste dados. Não foi duplicado com MVVM.

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


## Funcionalidades

- Busca de livros.
- biblioteca pessoal.
- criação e edição de registros.


## Organização e manutenção

Biblioteca reúne models, serviço, DAO, controller e telas em `features/library`; autenticação fica em `features/auth` e widgets reutilizados em shared. Mantido MVC existente: controller coordena a apresentação, serviço consulta API e DAO persiste dados. Não foi duplicado com MVVM.

Veja [a revisão de desenvolvimento](docs/REVISAO.md) para decisões, testes e limites, e [o guia de contribuição](CONTRIBUTING.md) para o fluxo de manutenção.
