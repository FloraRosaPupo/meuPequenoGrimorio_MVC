# Meu Pequeno Grimório

## Descrição

Aplicativo Flutter para buscar livros e organizar uma biblioteca pessoal, com consulta HTTP e armazenamento local em SQLite. O código organiza a funcionalidade de biblioteca em modelos, acesso a dados, controllers e telas.

## Stack e bibliotecas

Flutter/Dart, http, SQLite e componentes de interface.

Dependências e versões declaradas: [pubspec.yaml](pubspec.yaml).

## Funcionalidades

- Busca de livros.
- Biblioteca pessoal.
- Criação e edição de registros.

## Licença

Não há uma licença de distribuição definida para este repositório. Nenhuma licença MIT, Apache ou equivalente é concedida por este README. As atribuições e os direitos dos materiais de terceiros permanecem preservados.

## Validação e limites

Modelos e serviço HTTP com sucesso, erro e ausência de itens. Persistência e autenticação precisam de testes no ambiente alvo.

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

## Organização e manutenção

Biblioteca reúne models, serviço, DAO, controller e telas em `features/library`; autenticação fica em `features/auth` e widgets reutilizados em shared. Mantido MVC existente: controller coordena a apresentação, serviço consulta API e DAO persiste dados. Não foi duplicado com MVVM.

Veja [a revisão de desenvolvimento](docs/REVISAO.md) para decisões, testes e limites, e [o guia de contribuição](CONTRIBUTING.md) para o fluxo de manutenção.
