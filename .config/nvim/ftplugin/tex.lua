-- Latex code snippets
local function latex_binding(suffix, vimCommand, mode)
  vim.api.nvim_set_keymap(mode or "n", "<space>l" .. suffix, vimCommand, {})
end

local function latex_command(suffix, command, insertOp)
  latex_binding(suffix, (insertOp or 'o') .. '\\' .. command .. '{}<left>')
end

local function latex_wrap(suffix, command)
  latex_binding(suffix, 'c' .. '\\' .. command .. '{<c-r>"}<esc>', "v")
end

local function latex_command_and_wrap(suffix, command)
  latex_command(suffix, command, "a")
  latex_wrap(suffix, command)
end

local function latex_environment(suffix, env)
  latex_binding(suffix, 'o\\begin{' .. env .. '}<CR><CR>\\end{' .. env .. '}<CR><up><up><tab>')
end

-- Compile with latexmk
latex_binding("m", ':!latexmk<CR>')

-- Text modifiers
latex_command_and_wrap("tb", "textbf")
latex_command_and_wrap("ti", "textit")
latex_command_and_wrap("tt", "texttt")
latex_command_and_wrap("ts", "say")

-- Sections
latex_command("ch", "chapter")
latex_command("se", "section")
latex_command("ss", "subsection")
latex_command("sS", "subsubsection")
latex_command("sp", "paragraph")
latex_command("sP", "subparagraph")

-- Lists
latex_environment("li", "itemize")
latex_environment("le", "enumerate")
latex_environment("ld", "description")

-- Math
latex_environment("eq", "equation")
latex_binding("es", 'o\\begin{equation}<CR>\\begin{aligned}<CR><CR>\\end{aligned}<CR>\\end{equation}<CR><ESC>4kV3j<ji<tab>')
latex_environment("et", "theorem")
latex_environment("ep", "proof")

-- Figure
latex_binding("fg", 'o\\begin{figure}[H]<CR>\\centering<CR>\\includegraphics[width=\\textwidth]{<++>}<CR>\\caption{<++>}<CR>\\label{fig:<++>}<CR>\\end{figure}<CR><ESC>4k0')
latex_binding("fn", 'o\\begin{figure}[H]<CR>\\centering<CR><++><CR>\\caption{<++>}<CR>\\label{fig:<++>}<CR>\\end{figure}<CR><ESC>4k0')
