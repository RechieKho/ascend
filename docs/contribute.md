# Stuffs to know to contribute
Here you will find the guidelines to contribute to this project.

### Workflow
This is how we work: 

1. I turn tasks to be done as [issues](https://github.com/RechieKho/ascend/issues).
2. You (a kind person) check out the issues and deal with the issues with the tag `deal with me first`.
3. After completing the issue, send a pull request. 
4. I will review it. If cool, I accept. If not, I'll tell you why.

This is it! Do be patient when waiting for my respond. Note that pull request that is not directly link to an issue *won't be prioritized*.

### Code style and best practices
#### Codes
For codes, I would like to emphasize these things: 

- **KISS**, **Keep it super simple**.
- Don't add unnecessary nodes.
- [Single-responsibility principle](https://en.m.wikipedia.org/wiki/Single-responsibility_principle).
- Reduce the usage of `connect` and instead connect signal in the scene.
- Be a never-nester, utilize early return.

#### Naming things
For naming things:

| Entity type | Naming style |
| ----- | ----- |
| files and folders | In `kebab-case`.|
| methods | In `snake_case`. Start with a verb unless it is a callback |
| signal | In `snake_case`. Start with `on` and the event happend in past tense. (`on_player_healed`) |
| variable | In `snake_case`. |
| class name | In `PascalCase`.|

#### Project structure
For project structure & where to store what:

| Folder | File stored |
| ----- | ----- |
| prefabs | Scenes that will be reused across scenes. The scripts that are only for that particular scene should be stored together. |
| scenes | The main scenes for the game. The scripts that are only for that particular scene should be stored together. |
| graphics | All the graphical assets. |
| scripts | Script that will be reused across scenes. It usually either will have its class name or an autoload. |
| docs | Stores all the documentations in markdown format. |
