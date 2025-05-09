transform: (commit) => {
  const type = commit.type?.trim();
  const subject = commit.subject?.trim();
  if (!type || !subject) return;

  const prRef =
    Array.isArray(commit.references) && commit.references.length
      ? ` ([#${commit.references[0].issue || commit.references[0].hash}])`
      : '';

  const isBreaking = Array.isArray(commit.notes)
    ? commit.notes.some((n) => n.title === 'BREAKING CHANGE')
    : false;

  const breakingPrefix = isBreaking ? '**BREAKING** ' : '';

  return {
    ...commit,
    formatted: `- ${breakingPrefix}${type}: ${subject}${prRef}`,
  };
}