module.exports = {
  writerOpts: {
    transform: (commit) => commit,
    groupBy: 'type',
    commitGroupsSort: 'title',
    commitsSort: ['scope', 'subject'],
    noteGroupsSort: 'title',
    headerPartial:
      'Changelog for v{{version}}\n---------------------------\n\n',
    commitPartial:
      '* {{type}}: {{#if scope}}`{{scope}}` - {{/if}}{{subject}}\n',
    mainTemplate:
      '{{> header}}\n\n🔥 CUSTOM TEMPLATE WORKS\n\n{{#each commitGroups}}\n### {{title}}\n\n{{#each commits}}\n{{> commit}}\n{{/each}}\n{{/each}}\n'
  }
};