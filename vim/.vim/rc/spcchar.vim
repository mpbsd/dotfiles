function TableOfEquivalentNonAsciiCharacters() abort
  let l:table_of_equivalent_chars = {
        \  'à': 'a',
        \  'á': 'a',
        \  'â': 'a',
        \  'ã': 'a',
        \  'ç': 'c',
        \  'é': 'e',
        \  'ê': 'e',
        \  'í': 'i',
        \  'ó': 'o',
        \  'ô': 'o',
        \  'õ': 'o',
        \  'ú': 'u',
        \}
  return l:table_of_equivalent_chars
endfunction

" vim: set fileencoding=utf8: "
