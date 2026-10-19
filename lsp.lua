vim.lsp.enable("clangd");

vim.diagnostic.config({
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = "┃",
            [vim.diagnostic.severity.WARN]  = "┃",
            [vim.diagnostic.severity.INFO]  = "┃",
            [vim.diagnostic.severity.HINT]  = "┃",
        },
        numhl = {
            [vim.diagnostic.severity.ERROR] = "DiagnosticError",
            [vim.diagnostic.severity.WARN]  = "DiagnosticWarn",
            [vim.diagnostic.severity.INFO]  = "DiagnosticInfo",
            [vim.diagnostic.severity.HINT]  = "DiagnosticHint",
        },
    },
});

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(ev)
        vim.keymap.set("n", "[d", function() vim.diagnostic.jump({count=-1,float=true}) end, { buf = ev.buf });
        vim.keymap.set("n", "]d", function() vim.diagnostic.jump({count= 1,float=true}) end, { buf = ev.buf });
        vim.keymap.set("n", "cv", vim.lsp.buf.rename, { buf = ev.buf });
        vim.keymap.set("n", "<leader>ld", vim.diagnostic.setqflist, { buf = ev.buf });
        vim.keymap.set("i", "<c-l>", "<c-x><c-o>", { buf = ev.buf });
        vim.lsp.completion.enable(true, ev.data.client_id, ev.buf, { autotrigger = true });
    end
});

vim.api.nvim_create_autocmd("LspDetach", {
    callback = function(ev)
        vim.keymap.del("n", "[d", { buf = ev.buf });
        vim.keymap.del("n", "]d", { buf = ev.buf });
        vim.keymap.del("n", "cv", { buf = ev.buf });
        vim.keymap.del("n", "<leader>ld", { buf = ev.buf });
        vim.keymap.del("i", "<c-l>", { buf = ev.buf });
        vim.lsp.completion.enable(false, ev.data.client_id, ev.buf);
    end
});
