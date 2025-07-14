import vim


def in_math():
    return vim.eval('vimtex#syntax#in_mathzone()') == '1'


def in_text():
    return vim.eval('vimtex#syntax#in_mathzone()') != '1'
