return {
    "L3MON4D3/LuaSnip",
    config = function ()
        local ls = require("luasnip")
        local s = ls.snippet
        local t = ls.text_node
        local i = ls.insert_node
        local f = ls.function_node

        vim.keymap.set({"i"}, "<C-K>", function() ls.expand() end, {silent = true})
        vim.keymap.set({"i", "s"}, "<M-l>", function() ls.jump( 1) end, {silent = true})
        vim.keymap.set({"i", "s"}, "<M-h>", function() ls.jump(-1) end, {silent = true})

        vim.keymap.set({"i", "s"}, "<C-E>", function()
            if ls.choice_active() then
                ls.change_choice(1)
            end
        end, {silent = true})


        ls.add_snippets("javascript", {
            s("log", {
                t('console.log("'),
                i(1),
                t('")')
            })
        })

        local function fn(
            args,     -- text from i(2) in this example i.e. { { "456" } }
            parent,   -- parent snippet or parent node
            user_args -- user_args from opts.user_args 
            )
            print(args, parent, user_args)
            return '[' .. args[1][1] .. user_args .. ']'
        end

        ls.add_snippets("typescript", {
            s('func', {
                t({"/**", " * "}), i(4, "No description, assholish right"), t({"","*/", ''}),
                t('function '), i(1, 'name'), t('( '), i(2, 'params'), t(' ) : '), i(3, 'return_type'), t({'{', "\t"}),
                i(4, 'body'),
                t({"", "}", "", ""}),i(0)
            })
        })

        ls.add_snippets("all", {
            s("trig", {
                i(1), t '<-i(1) ',
                f(fn,  -- callback (args, parent, user_args) -> string
                {2}, -- node indice(s) whose text is passed to fn, i.e. i(2)
                { user_args = { "user_args_value" }} -- opts
                ),
                t ' i(2)->', i(2), t '<-i(2) i(0)->', i(0)
            })
        })
        ls.add_snippets("all", {
            s("ternary", {
                i(1, "cond"), t(" ? "), i(2, "then"), t(" : "), i(3, "else")
            })
        })
    end
}
