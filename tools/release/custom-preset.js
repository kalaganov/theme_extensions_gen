module.exports = {
  writerOpts: {
    transform: (commit) => {
      const type = commit.type?.trim();
      const subject = commit.subject?.trim();

      if (!type || !subject) {
        console.warn('[SKIPPED] Bad commit:', commit.hash);
        return;
      }

      const pr =
        Array.isArray(commit.references) &&
        commit.references.length > 0 &&
        commit.references[0].issue
          ? ` ([#${commit.references[0].issue}])`
          : '';

      const isBreaking =
        Array.isArray(commit.notes) &&
        commit.notes.some((n) => n.title === 'BREAKING CHANGE');

      const breaking = isBreaking ? '**BREAKING** ' : '';

      return {
        ...commit,
        formatted: `- ${breaking}${type}: ${subject}${pr}`,
      };
    },

    commitsSort: ['subject'],

    mainTemplate:
      '{{#each versions}}# {{version}}\n\n' +
      '{{#each commits}}{{formatted}}\n{{/each}}\n\n{{/each}}',

    includeCommitDate: false,

    finalizeContext: (context) => {
      context.commitGroups = [{ commits: context.commits }];
      return context;
    },
  },
};