module.exports = {
  writerOpts: {
    transform: (commit) => {
    if (!commit.type || !commit.subject) return;
      return {
        ...commit,
        shortSubject: commit.subject.trim()
      };
    }
    groupBy: 'type',
    commitGroupsSort: 'title',
    commitsSort: ['subject'],
    noteGroupsSort: 'title',
    headerPartial:
      'Changelog for v{{version}}\n---------------------------\n\n',
    commitPartial:
      '* {{shortSubject}}\n',
    mainTemplate:
      '{{> header}}' +
      '{{#each commitGroups}}\n### {{title}}\n' +
      '{{#each commits}}{{> commit}}{{/each}}\n{{/each}}\n',
    includeCommitDate: false
  }
};