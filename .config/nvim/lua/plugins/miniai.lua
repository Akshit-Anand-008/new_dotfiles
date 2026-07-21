-- 'https://github.com/nvim-mini/mini.ai',
-- 'https://github.com/nvim-mini/mini.extra',
require('mini.extra').setup()
local ai = require "mini.ai"
local ts = ai.gen_spec.treesitter
ai.setup({
    custom_textobjects = {
        b = ts({ a = '@block.outer', i = '@block.inner' }),
        a = ts({ a = '@argument.outer', i = '@argument.inner' }),
        m = ts({ a = '@function.outer', i = '@function.inner' }),
        c = ts({ a = '@class.outer', i = '@class.inner' }),
        f = ts({ a = '@call.outer', i = '@call.inner' }),
        ['B'] = { '%b{}', '^.%s*().-()%s*.$' },
        i = ts({
            a = { '@conditional.outer', '@loop.outer' },
            i = { '@conditional.inner', '@loop.inner' },
        }),
        g = require('mini.extra').gen_ai_spec.buffer(),
        l = require('mini.extra').gen_ai_spec.line(),
    },
    mappings = {
        around_next = 'aN',
        inside_next = 'iN',
        around_last = 'aL',
        inside_last = 'iL',
    }
})
function poop(a)
    for _, i in ipairs({ 'a', 'i' }) do vim.keymap.set({ 'o', 'x' }, i .. a, i .. a) end
end

poop('B')
poop('(')
poop('[')
