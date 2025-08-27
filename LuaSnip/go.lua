local ls = require 'luasnip'
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
  -- Start Transaction
  s('starttx', {
    t '\ttransaction, err := ',
    i(1, 'service'),
    t '.Repository.NewTransaction(ctx)',
    t { '', '\tif err != nil {', '\t\tlog.Error().Err(err).Send()', '', '\t\treturn ' },
    i(2, 'nil'),
    t ', ErrDatabaseFailure',
    t { '', '\t}', '', '', '\tdefer transaction.Cleanup(ctx)' },
  }),

  -- Commit Transaction
  s('committx', {
    t '\tif err = transaction.Commit(ctx); err != nil {',
    t { '', '\t\tlog.Error().Err(err).Send()', '', '\t\treturn ' },
    i(1, 'nil'),
    t ', ErrDatabaseFailure',
    t { '', '\t}' },
  }),
}
