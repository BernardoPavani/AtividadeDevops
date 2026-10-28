# Pipeline DevSecOps - Trabalho Prático

Este repositório contém um pipeline CI/CD configurado com GitHub Actions que integra múltiplas ferramentas de DevSecOps.

## Ferramentas e Verificações
* **Gitleaks:** Analisa o histórico para detetar segredos e credenciais expostas.
* **SonarCloud:** Realiza Análise Estática de Segurança (SAST) e verifica o código novo contra o Quality Gate.
* **Trivy:** Faz o varrimento de vulnerabilidades (CVEs) na imagem Docker base e nas dependências da aplicação.
* **Syft:** Gera automaticamente o Software Bill of Materials (SBOM) da imagem construída.

## Regras de Bloqueio
O pipeline bloqueia a integração (Merge de Pull Requests) nas seguintes condições:
* Deteção de qualquer segredo pelo Gitleaks.
* Falha nos critérios de qualidade e segurança do SonarCloud.
* Identificação de vulnerabilidades classificadas como **CRITICAL** ou **HIGH** pelo Trivy. Vulnerabilidades menores (LOW/MEDIUM) são apenas registadas.
