'use strict';

const Q = require('q');
const parserOpts = {
  headerPattern: /^(\w*)(?:\((.*)\))?!?: (.*)$/,
  headerCorrespondence: ['type', 'scope', 'subject'],
};

const writerOpts = {
  transform: (commit, context) => {
    const issues = [];
    commit.notes.forEach(note => {
      note.title = 'BREAKING CHANGES';
    });

    if (commit.type === 'feat') {
      commit.type = 'Features';
    } else if (commit.type === 'fix') {
      commit.type = 'Bug Fixes';
    } else if (commit.type === 'chore') {
      commit.type = 'Chores';
    } else {
      return;
    }

    if (commit.scope === '*') {
      commit.scope = '';
    }

    if (typeof commit.hash === 'string') {
      commit.shortHash = commit.hash.substring(0, 7);
    }

    if (typeof commit.subject === 'string') {
      const prMatch = commit.subject.match(/\(#(\d+)\)/);
      if (prMatch) {
        commit.pr = prMatch[1];
        issues.push(prMatch[1]);
      }
    }

    return commit;
  },
};

module.exports = Q.all([
  parserOpts,
  writerOpts
]).spread((parserOpts, writerOpts) => ({
  parserOpts,
  writerOpts,
}));