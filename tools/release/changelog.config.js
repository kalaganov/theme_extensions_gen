// tools/release/changelog.config.js
module.exports = {
  infile: '../../packages/theme_extensions_gen/CHANGELOG.md',
  commitUrlFormat: '',
  compareUrlFormat: '',
  linkCompare: false,
  linkReferences: false,
  headerPartial: '+++++++++++++'
  context: { linkCompare: false, linkReferences: false },
  types: [
    { type: 'feat', section: 'Features' },
    { type: 'fix', section: 'Bug Fixes' },
    { type: 'perf', section: 'Performance Improvements' },
    { type: 'chore', section: 'Chores' },
    { type: 'refactor', section: 'Refactors' },
    { type: 'docs', section: 'Documentation' },
    { type: 'style', section: 'Styles' },
    { type: 'test', section: 'Tests' }
  ],
  writerOpts: {
    headerPartial: 'Changelog for v{{version}}\\n' +
                   '---------------------\\n\\n',
    commitPartial:
      '* {{type}}: {{#if scope}}`{{scope}}` - {{/if}}{{subject}}' +
      '{{#if references}} ({{#each references}}#{{this.issue}}' +
      '{{#unless @last}}, {{/unless}}{{/each}}){{/if}}\\n'
  }
};