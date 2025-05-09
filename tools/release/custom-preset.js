module.exports = {
  writerOpts: {
    transform: (commit) => {
      if (!commit.type || !commit.subject) return;

      return {
        ...commit,
        shortSubject: commit.subject.trim(),
        header: commit.subject.trim()
      };
    },
    groupBy: 'type',
    commitGroupsSort: 'title',
    commitsSort: ['subject'],
    noteGroupsSort: 'title',
    headerPartial:
      '# {{version}}\n\n',
    commitPartial:
      '* {{header}}\n',
    mainTemplate:
      '{{> header}}' +
      '{{#each commitGroups}}- {{title}}\n' +
      '{{#each commits}}{{> commit}}{{/each}}\n\n{{/each}}',
    includeCommitDate: true,
    reverse: false
  }
};