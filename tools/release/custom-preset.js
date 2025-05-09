module.exports = {
  writerOpts: {
    transform: (commit) => {
      if (!commit.type || !commit.subject) return;

      const pr = commit.references?.length
        ? ` ([#${commit.references[0].issue}])`
        : '';

      const breaking = commit.notes.some(
        (note) => note.title === 'BREAKING CHANGE'
      )
        ? '**BREAKING** '
        : '';

      return {
        ...commit,
        formatted: `- ${breaking}${commit.type}: ${commit.subject.trim()}${pr}`
      };
    },
    commitsSort: ['scope', 'subject'],
    mainTemplate:
      '{{#each versions}}# {{version}}\n\n' +
      '{{#each commits}}{{formatted}}\n{{/each}}\n\n{{/each}}',
    includeCommitDate: false,
    finalizeContext: (context) => {
      context.commitGroups = [
        { commits: context.commits }
      ];
      return context;
    }
  }
};