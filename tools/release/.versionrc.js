console.log('changelog.config.js loaded');
module.exports = {
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
  bumpFiles: [],
  skip: { tag: false },
  packageFiles: [],
  conventionalChangelog: {
    preset: 'conventionalcommits',
    linkCompare: false,
    linkReferences: false,
    writerOpts: {
      headerPartial:
        'Changelog for v{{version}}\\n' +
        '---------------------------\\n\\n',
      commitPartial:
        '* {{type}}: {{#if scope}}`{{scope}}` - {{/if}}{{subject}}' +
        '{{#if references}} ({{#each references}}#{{this.issue}}' +
        '{{#unless @last}}, {{/unless}}{{/each}}){{/if}}\\n'
    }
  }
};