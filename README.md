# CineGyn - App de Filmes em Flutter 🎬

Terceiro projeto da minha jornada de estudos em Flutter, criado para simular uma experiência de aplicativo real. O CineGyn consome a API do The Movie Database (TMDb) para listar filmes populares e permitir que o usuário explore detalhes sobre cada um.

## ✨ Visão Geral do App

A tela principal exibe uma lista rolável dos filmes mais populares do momento. Ao tocar em um filme, o usuário é levado a uma segunda tela, onde pode ver informações detalhadas como a sinopse completa, nota de avaliação e um pôster em tamanho maior.

![GIF do App](/assets/screens.gif)

---

## 🚀 Funcionalidades

- [x] Listagem de filmes populares a partir de uma API REST.
- [x] Exibição do pôster, título e nota de cada filme na lista.
- [x] Indicador de carregamento (`loading`) enquanto os dados são buscados.
- [x] Carregamento de imagens da internet com feedback de `loading` e `error`.
- [x] Navegação para uma tela de detalhes ao tocar em um filme.
- [x] Exibição de informações completas do filme (sinopse, título, nota) na tela de detalhes.
- [x] Estrutura de projeto organizada em múltiplos arquivos (models, services, views).

---

## 🛠️ Conceitos e Tecnologias Aplicadas

Este projeto foi um passo crucial para aprofundar meus conhecimentos em:

- **Consumo de API Avançado:** Lidar com uma resposta JSON que contém uma **lista de objetos**.
- **Modelagem de Dados:** Criação de classes Dart (`Movie`) com construtores `factory .fromJson` para parsear o JSON de forma segura e organizada.
- **Programação Assíncrona:** Uso intensivo do `FutureBuilder` para construir a UI de forma reativa baseada no estado da chamada de rede (carregando, com dados, com erro).
- **Exibição de Listas Dinâmicas:** Uso otimizado do `ListView.builder` para renderizar uma quantidade variável de itens sem sobrecarregar a memória do dispositivo.
- **Navegação Multi-telas (Master-Detail):** Implementação do `Navigator.push` para ir para uma nova tela e passagem de objetos complexos (a classe `Movie`) como argumento via construtor.
- **Carregamento de Imagens da Rede:** Utilização do widget `Image.network` com seus `loadingBuilder` e `errorBuilder` para uma melhor experiência do usuário.

---

### API Utilizada

Este projeto foi construído utilizando a fantástica API gratuita do [The Movie Database (TMDb)](https://www.themoviedb.org/).

---

## ⚙️ Como Executar o Projeto

**Importante:** Para executar este projeto, você precisará de uma chave de API (API Key) do TMDb.

1.  Obtenha sua chave gratuita em [TMDb Settings > API](https://www.themoviedb.org/settings/api).
2.  No arquivo `lib/api_service.dart`, substitua o placeholder `'SUA_CHAVE_DA_API_AQUI'` pela sua chave.
3.  Depois, siga os passos abaixo:

```bash
# Clone este repositório
$ git clone [https://github.com/MachadoJorgeH/movie_app_flutter](https://github.com/MachadoJorgeH/movie_app_flutter)

# Acesse a pasta do projeto
$ cd cine_gyn_flutter

# Instale as dependências
$ flutter pub get

# Execute o aplicativo
$ flutter run
```
