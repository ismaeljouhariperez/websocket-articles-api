# Configuration Cursor pour Rails 8 Articles API

Ce projet utilise les règles suivantes :

- **Linting** : RuboCop
- **Formatage** : StandardRB
- **WebSockets** : Solid Cable (canal `articles_channel`)
- **Jobs en arrière-plan** : Solid Queue
- **Cache** : Solid Cache (expiration de 1 heure)

## Instructions

1. Assurez-vous que Cursor détecte automatiquement le dossier `.cursor`.
2. Modifiez `rules.json` pour adapter les règles si nécessaire.
3. Utilisez RSpec pour tester l'API.
