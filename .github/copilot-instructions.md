# GitHub Copilot Instructions for chef-winrm-elevated

## Repository Overview

This is the chef-winrm-elevated Ruby gem repository that enables running PowerShell commands as elevated over Windows Remote Management (WinRM) via scheduled tasks. The gem breaks out of WinRM constraints to reach network shares and perform elevated operations like installing Windows updates, .NET, SQL Server, etc.

## Repository Structure

```
chef-winrm-elevated/
├── .github/
│   ├── workflows/
│   │   ├── build.yml       # Main CI/CD pipeline (Windows 2019/2022, Ruby 3.1-3.4)
│   │   ├── unit.yml        # Unit test workflow
│   │   ├── lint.yml        # Code linting workflow
│   │   └── sonarqube.yml   # Code quality analysis
│   └── copilot-instructions.md
├── lib/
│   ├── chef-winrm-elevated.rb              # Main entry point
│   ├── chef-winrm/
│   │   └── shells/
│   │       └── elevated.rb                 # Core elevated shell implementation
│   └── chef-winrm-elevated/
│       └── scripts/
│           └── elevated_shell.ps1          # PowerShell script for task execution
├── spec/
│   ├── config-example.yml                  # Example test configuration
│   ├── matchers.rb                         # RSpec custom matchers
│   ├── powershell_elevated_spec.rb         # Main test suite
│   └── spec_helper.rb                      # RSpec configuration
├── appveyor.yml                            # Legacy CI configuration
├── changelog.md                            # Release notes and changes
├── chef-winrm-elevated.gemspec            # Gem specification
├── Gemfile                                 # Bundler dependencies
├── LICENSE                                 # Apache-2.0 license
├── Rakefile                                # Build and test tasks
├── README.md                               # Project documentation
└── VERSION                                 # Current version string
```

## Technology Stack

- **Language**: Ruby (>= 3.1)
- **Primary Dependencies**: chef-winrm (~> 2.4), chef-winrm-fs (~> 1.4), erubi (~> 1.8)
- **Testing**: RSpec (~> 3.2)
- **Code Quality**: Cookstyle (~> 8.1) for Ruby linting
- **Build System**: GitHub Actions workflows
- **Platform**: Windows (Windows 2019, Windows 2022)

## Jira Integration Workflow

When a Jira ID is provided in a task request:

1. **Fetch Jira Issue Details**: Use the atlassian-mcp-server MCP server to retrieve the complete Jira issue information
2. **Read and Analyze**: Carefully read the story description, acceptance criteria, and any technical requirements
3. **Implementation Planning**: Break down the task into actionable steps based on the Jira requirements
4. **Execute Implementation**: Follow the complete workflow outlined below

## Testing Requirements

- **Minimum Coverage**: Maintain test coverage above 80% at all times
- **Test Types**: Create both unit tests and integration tests for new implementations
- **Test Execution**: Run `bundle exec rake spec` for unit tests, `bundle exec rake integration` for integration tests
- **Test Location**: Place test files in the `spec/` directory following existing naming patterns
- **Test Standards**: Use RSpec framework with descriptive test descriptions and proper assertions

## Branch and PR Creation Workflow

When prompted to create a PR for changes:

1. **Branch Creation**: Use the Jira ID as the branch name (e.g., `JIRA-123`)
2. **Authentication**: Use GitHub CLI for all operations 
3. **Local Operations**: All tasks are performed on the local repository
4. **Branch Management**: 
   ```bash
   gh auth status  # Verify authentication
   git checkout -b <jira-id>
   # Make changes...
   git add .
   git commit -m "feat: <descriptive commit message>"
   git push origin <jira-id>
   ```
5. **PR Creation**: 
   ```bash
   gh pr create --title "<Jira ID>: <Brief Title>" --body "<HTML formatted description>"
   ```

## PR Description Format

Use HTML tags for proper formatting in PR descriptions:

```html
<h2>Summary</h2>
<p>Brief description of changes made</p>

<h2>Changes Made</h2>
<ul>
  <li>Specific change 1</li>
  <li>Specific change 2</li>
</ul>

<h2>Testing</h2>
<ul>
  <li>Unit tests added/updated</li>
  <li>Integration tests verified</li>
  <li>Coverage maintained above 80%</li>
</ul>

<h2>Jira Reference</h2>
<p>Closes: <a href="[jira-link]">[Jira ID]</a></p>
```

## Prompt-Based Task Execution

- **Step-by-Step Execution**: All tasks should be broken down into individual steps
- **Progress Updates**: After each step, provide a summary of what was completed
- **Next Step Indication**: Clearly state what the next step will be and what steps remain
- **User Confirmation**: Always ask "Do you want to continue with the next step?" before proceeding
- **Transparency**: Keep the user informed of progress and any blockers encountered

## Complete Implementation Workflow

1. **Task Analysis**
   - Parse the request and identify if Jira ID is provided
   - If Jira ID exists, fetch issue details using atlassian-mcp-server
   - Break down requirements into actionable steps

2. **Planning Phase**
   - Create implementation plan based on requirements
   - Identify files that need modification/creation
   - Plan test coverage strategy
   - Confirm approach with user before proceeding

3. **Implementation Phase**
   - Follow Ruby and gem development best practices
   - Implement changes incrementally
   - Ensure code follows Cookstyle guidelines
   - Add comprehensive documentation

4. **Testing Phase**
   - Create/update unit tests for all new functionality
   - Run existing test suite to ensure no regressions
   - Verify coverage remains above 80%
   - Test integration scenarios where applicable

5. **Quality Assurance**
   - Run `bundle exec rake style` for linting
   - Execute `bundle exec rake spec` for unit tests
   - Validate all GitHub Actions workflows pass
   - Ensure no prohibited files are modified

6. **Documentation Phase**
   - Update README.md if public API changes
   - Update changelog.md with new features/fixes
   - Add inline code documentation where needed

7. **PR Creation Phase**
   - Create feature branch using Jira ID
   - Commit changes with DCO compliance
   - Push branch to remote repository
   - Create PR with proper HTML formatting

## DCO Compliance Requirements

All commits must include Developer Certificate of Origin (DCO) sign-off:

- **Commit Format**: Use `git commit -s` or add `Signed-off-by: Your Name <your.email@example.com>`
- **Purpose**: Ensures legal compliance for open source contributions
- **Requirement**: Mandatory for all commits in this repository
- **Verification**: GitHub Actions will verify DCO compliance

## GitHub Actions Build System

The repository uses GitHub Actions for CI/CD:

### Available Workflows
- **build.yml**: Main CI pipeline testing on Windows 2019/2022 with Ruby 3.1, 3.2, 3.4
- **unit.yml**: Focused unit test execution
- **lint.yml**: Code style and linting checks
- **sonarqube.yml**: Code quality analysis and security scanning

### Workflow Triggers
- Pull requests to any branch
- Pushes to master branch
- Manual workflow dispatch (where configured)

## Available GitHub Labels

Use these labels when creating issues or PRs:

- **bug**: Something isn't working
- **documentation**: Improvements or additions to documentation
- **duplicate**: This issue or pull request already exists
- **enhancement**: New feature or request
- **good first issue**: Good for newcomers
- **help wanted**: Extra attention is needed
- **invalid**: This doesn't seem right
- **oss-standards**: Related to OSS Repository Standardization
- **question**: Further information is requested
- **wontfix**: This will not be worked on

## Prohibited Modifications

Do not modify these files unless explicitly required:
- `.github/workflows/` files (unless workflow changes are specifically requested)
- `VERSION` file (unless version bump is explicitly requested)
- `LICENSE` file
- Core gem specification files without clear justification

## File-Specific Guidelines

### Ruby Code (`lib/` directory)
- Follow Cookstyle Ruby style guidelines
- Maintain compatibility with Ruby >= 3.1
- Use proper error handling and logging
- Document public methods and classes

### Tests (`spec/` directory)
- Use RSpec syntax and best practices
- Create descriptive test descriptions
- Mock external dependencies appropriately
- Ensure tests are deterministic and reliable

### Configuration Files
- Maintain existing formatting and structure
- Validate syntax after modifications
- Consider backward compatibility impact

## MCP Server Integration

For Atlassian/Jira integration, use the atlassian-mcp-server:
- Fetch issue details using appropriate MCP server tools
- Parse Jira requirements into actionable implementation tasks
- Reference Jira issues in commit messages and PR descriptions
- Ensure implementation matches Jira acceptance criteria

## Additional Guidelines

- **Code Review Ready**: Ensure all changes are ready for peer review
- **Incremental Changes**: Make small, focused commits with clear messages
- **Documentation**: Update relevant documentation for any API changes
- **Backward Compatibility**: Maintain compatibility unless breaking change is explicitly required
- **Performance**: Consider performance implications of changes, especially for WinRM operations

## AI-Assisted Development & Compliance

- ✅ Create PR with `ai-assisted` label (if label doesn't exist, create it with description "Work completed with AI assistance following Progress AI policies" and color "9A4DFF")
- ✅ Include "This work was completed with AI assistance following Progress AI policies" in PR description

### Jira Ticket Updates (MANDATORY)

- ✅ **IMMEDIATELY after PR creation**: Update Jira ticket custom field `customfield_11170` ("Does this Work Include AI Assisted Code?") to "Yes"
- ✅ Use atlassian-mcp tools to update the Jira field programmatically
- ✅ **CRITICAL**: Use correct field format: `{"customfield_11170": {"value": "Yes"}}`
- ✅ Verify the field update was successful

### Documentation Requirements

- ✅ Reference AI assistance in commit messages where appropriate
- ✅ Document any AI-generated code patterns or approaches in PR description
- ✅ Maintain transparency about which parts were AI-assisted vs manual implementation

### Workflow Integration

This AI compliance checklist should be integrated into the main development workflow Step 4 (Pull Request Creation):

```
Step 4: Pull Request Creation & AI Compliance
- Step 4.1: Create branch and commit changes WITH SIGNED-OFF COMMITS
- Step 4.2: Push changes to remote
- Step 4.3: Create PR with ai-assisted label
- Step 4.4: IMMEDIATELY update Jira customfield_11170 to "Yes"
- Step 4.5: Verify both PR labels and Jira field are properly set
- Step 4.6: Provide complete summary including AI compliance confirmation
```

- **Never skip Jira field updates** - This is required for Progress AI governance
- **Always verify updates succeeded** - Check response from atlassian-mcp tools
- **Treat as atomic operation** - PR creation and Jira updates should happen together
- **Double-check before final summary** - Confirm all AI compliance items are completed

### Audit Trail

All AI-assisted work must be traceable through:

1. GitHub PR labels (`ai-assisted`)
2. Jira custom field (`customfield_11170` = "Yes")
3. PR descriptions mentioning AI assistance
4. Commit messages where relevant
