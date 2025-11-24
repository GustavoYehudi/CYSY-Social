# CYSY-social Frontend (Flutter)

Este é o frontend do CYSY-social, um aplicativo de mensagens instantâneas e rede social, desenvolvido em **Flutter** para ser multiplataforma (Android, iOS, Web, Desktop).

## Stack Tecnológica

| Tecnologia | Propósito |
| :--- | :--- |
| **Flutter** + **Dart** | Framework para desenvolvimento de UI nativa e multiplataforma. |
| **Riverpod** | Gerenciamento de estado escalável e de nova geração. |
| **Freezed** | Geração de modelos de dados imutáveis. |
| **Dio** | Cliente HTTP para comunicação com o Backend (REST/GraphQL). |
| **Socket.io-client** | Comunicação em tempo real com o Backend. |
| **Hive** | Banco de dados NoSQL local para suporte offline. |
| **GoRouter** | Gerenciamento de rotas e navegação. |
| **flutter_webrtc** | Implementação de chamadas de voz e vídeo. |

## Estrutura do Projeto

O projeto segue a arquitetura baseada em Features (camadas de Presentation, Domain e Data) e a filosofia Clean Architecture, facilitando a manutenção e a escalabilidade.

### Árvore de Arquivos

```
.
├── lib
│   ├── core
│   │   ├── app
│   │   │   ├── app.dart
│   │   │   ├── flavor.dart
│   │   │   └── routes.dart
│   │   ├── constants
│   │   │   ├── app_constants.dart
│   │   │   └── assets.dart
│   │   ├── di
│   │   │   └── di.dart
│   │   ├── error
│   │   │   ├── error_handler.dart
│   │   │   └── failures.dart
│   │   ├── network
│   │   │   ├── api_client.dart
│   │   │   ├── endpoints.dart
│   │   │   └── websocket_service.dart
│   │   ├── theme
│   │   │   ├── app_theme.dart
│   │   │   ├── custom_colors.dart
│   │   │   ├── dark_theme.dart
│   │   │   └── light_theme.dart
│   │   └── utils
│   │       ├── date_utils.dart
│   │       ├── extensions.dart
│   │       ├── file_picker.dart
│   │       └── responsive.dart
│   ├── features
│   │   ├── auth
│   │   │   ├── data
│   │   │   ├── domain
│   │   │   └── presentation
│   │   │       ├── pages
│   │   │       │   ├── login_page.dart
│   │   │       │   ├── phone_verify_page.dart
│   │   │       │   ├── register_page.dart
│   │   │       │   └── welcome_onboarding.dart
│   │   │       └── widgets
│   │   ├── calls
│   │   │   └── presentation
│   │   │       ├── call_ui.dart
│   │   │       ├── incoming_call_page.dart
│   │   │       └── outgoing_call_page.dart
│   │   ├── chats
│   │   │   └── presentation
│   │   │       ├── pages
│   │   │       │   ├── channel_info_page.dart
│   │   │       │   ├── chat_detail_page.dart
│   │   │       │   ├── chat_list_page.dart
│   │   │       │   └── group_info_page.dart
│   │   │       └── widgets
│   │   ├── communities
│   │   │   └── presentation
│   │   │       └── pages
│   │   │           ├── communities_home.dart
│   │   │           ├── community_detail.dart
│   │   │           └── create_community.dart
│   │   ├── home
│   │   │   └── presentation
│   │   │       ├── home_page.dart
│   │   │       └── tabs
│   │   │           ├── chats_tab.dart
│   │   │           ├── communities_tab.dart
│   │   │           ├── profile_tab.dart
│   │   │           └── social_tab.dart
│   │   ├── notifications
│   │   │   └── notification_service.dart
│   │   ├── profile
│   │   │   └── presentation
│   │   │       ├── pages
│   │   │       │   ├── edit_profile_page.dart
│   │   │       │   ├── my_profile_page.dart
│   │   │       │   └── user_profile_page.dart
│   │   │       └── widgets
│   │   ├── settings
│   │   │   └── presentation
│   │   │       ├── appearance_page.dart
│   │   │       ├── privacy_page.dart
│   │   │       └── settings_page.dart
│   │   └── social
│   │       └── presentation
│   │           ├── pages
│   │           │   ├── create_post_page.dart
│   │           │   ├── feed_page.dart
│   │           │   ├── post_detail_page.dart
│   │           │   └── stories
│   │           │       ├── create_story_page.dart
│   │           │       └── stories_viewer.dart
│   │           └── widgets
│   ├── generated
│   ├── main.dart
│   └── shared
│       ├── models
│       │   ├── message_model.dart
│       │   ├── post_model.dart
│       │   └── user_model.dart
│       └── widgets
│           ├── animated_fab.dart
│           ├── custom_app_bar.dart
│           ├── empty_state.dart
│           ├── image_picker_sheet.dart
│           ├── loading_widget.dart
│           └── video_thumbnail.dart
├── pubspec.yaml
```

## Passo a Passo para Configuração e Execução

### Pré-requisitos

Você precisa ter o **Flutter SDK** instalado e configurado em sua máquina.

### 1. Clonar o Repositório

```bash
git clone [URL_DO_SEU_REPOSITORIO]
cd cysy-social-frontend
```

### 2. Instalar Dependências

O arquivo `pubspec.yaml` já contém todas as dependências necessárias.

```bash
flutter pub get
```

### 3. Gerar Arquivos de Código (Riverpod, Freezed)

O projeto utiliza geradores de código para modelos imutáveis (Freezed) e provedores de estado (Riverpod Generator).

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

### 4. Configurar o Backend

Este frontend foi projetado para se comunicar com o backend NestJS que implementamos anteriormente.

Você precisará configurar a URL base da API e do WebSocket no arquivo `lib/core/network/endpoints.dart` (ou similar) para apontar para o seu backend em execução (ex: `http://localhost:3000`).

### 5. Executar o Aplicativo

Você pode executar o aplicativo em qualquer plataforma suportada pelo Flutter.

```bash
# Para rodar em um dispositivo conectado ou emulador
flutter run

# Para rodar no Chrome (Web)
flutter run -d chrome
```

## Estrutura de Código (Simulada)

Todos os arquivos `.dart` foram criados como *placeholders* para que você possa começar a implementar a lógica de negócios e a UI imediatamente. A estrutura está pronta para a arquitetura **Clean Architecture** com **Riverpod**.
