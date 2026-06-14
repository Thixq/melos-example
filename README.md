# 📦 Melos Monorepo Boilerplate

*Bu dokümanı [Türkçe](README.tr.md) okuyun.*

This project is an enterprise-standard monorepo architecture boilerplate prepared using **Melos (v7)** for managing large-scale applications in the Dart and Flutter ecosystem.

Instead of a traditional `melos.yaml`, all configurations are managed via the `pubspec.yaml` in the root directory, and it features **FVM (Flutter Version Management)** integration for isolated SDK management.

## ✨ Core Capabilities (Scenarios)

This architecture is built on 3 fundamental smart scenarios to minimize costs and time loss in CI/CD (Continuous Integration) processes:

### 1. Autonomous Factory (Automatic Code Generation)
When a new developer clones the project and runs the `melos bootstrap` command, the system works smartly in the background. It finds only the packages that have a `build_runner` dependency in their `pubspec.yaml` file and automatically starts code generation (`.g.dart`, `.freezed.dart`) for those packages.

### 2. Smart Surgical Intervention (Filtered Tests)
Testing all packages for a minor change in a monorepo is a huge waste of time. Thanks to the **Smart Test** script added to the project, only the packages you are working on (with changed files) and their dependent packages are identified and tested. The process is immediately stopped upon an error (`--fail-fast`).

### 3. Version Orchestrator (Automatic Versioning & Changelog)
Version numbers in the project are not changed manually. Developers use Conventional Commits standards for their commit messages, such as `feat:`, `fix:`, `chore:`. The `melos version` command reads this Git history, automatically updates the Minor or Major versions of the packages (e.g., `user_api`), creates tags, and generates a professional `CHANGELOG.md` with clickable GitHub commit links.

---

## 🚀 Getting Started & Installation

After cloning the project to your computer, follow these steps:

**1. Prepare the Flutter SDK with FVM:**
```bash
fvm install

```

**2. Activate Melos globally (If not installed):**

```bash
dart pub global activate melos

```

**3. Synchronize the Workspace:**

```bash
melos bootstrap

```

*(This command will download dependencies for all packages and automatically generate code in required packages via the `post` hook.)*

---

## 🛠️ Available Commands

You can use the custom commands added to the main `pubspec.yaml` file for Melos as follows:

| Command | Description |
| --- | --- |
| `melos bootstrap` | Sets up the entire workspace, links packages, and triggers autonomous code generation. |
| `melos run test:smart` | Runs tests only for packages that have changed relative to the `main` branch in Git history, and the dependent packages that use them. |
| `melos version` | Analyzes Git logs to automatically increment version (SemVer) and generates a linked `CHANGELOG.md`. |

---

## 📁 Project Structure

```text
melos-example/
├── .fvmrc                 # FVM (Flutter Version Management) configuration
├── pubspec.yaml           # Melos Workspace settings and main configuration
├── packages/              # Modules / packages within the monorepo
│   ├── user_api/          # Example Dart Package (code generation with json_serializable and test example)

```

## 🤝 Contributing

For version management, please format your commit messages according to **Conventional Commits** standards. Otherwise, the `melos version` command will not be able to generate release notes correctly.

* **feat:** A new feature
* **fix:** A bug fix
* **docs:** Documentation changes
* **chore:** Infrastructure/package updates

---

*This architecture was developed by Kaan EFE (@Thixq) to learn and apply modern monorepo standards.*