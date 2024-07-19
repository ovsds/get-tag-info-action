# Get Tag Info Action

[![CI](https://github.com/ovsds/get-tag-info-action/workflows/Check%20PR/badge.svg)](https://github.com/ovsds/get-tag-info-action/actions?query=workflow%3A%22%22Check+PR%22%22)
[![GitHub Marketplace](https://img.shields.io/badge/Marketplace-Get%20Tag%20Info-blue.svg)](https://github.com/marketplace/actions/get-tag-info)

Gets information for a tag.

## Usage

### Example

```yaml

```

### Action Inputs

| Name           | Description                                                        | Default                             |
| -------------- | ------------------------------------------------------------------ | ----------------------------------- |
| `github_token` | Github token used for API calls. Required scope - 'contents: read' | ${{ github.token }}                 |
| `owner`        | Repository owner.                                                  | ${{ github.repository_owner }}      |
| `repo`         | Repository name.                                                   | ${{ github.event.repository.name }} |
| `tag_name`     | Tag name.                                                          |                                     |

### Action Outputs

| Name          | Description   |
| ------------- | ------------- |
| `exists`      | Tag exists.   |
| `tag_name`    | Tag name.     |
| `tag_sha`     | Tag SHA.      |
| `tag_type`    | Tag type.     |
| `commit_sha`  | Commit SHA.   |
| `tag_message` | Tag message.  |
| `verified`    | Tag verified. |

## Development

### Global dependencies

- nvm
- node

### Taskfile commands

For all commands see [Taskfile](Taskfile.yaml) or `task --list-all`.

## License

[MIT](LICENSE)
