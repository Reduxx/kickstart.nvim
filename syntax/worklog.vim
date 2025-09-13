" Vim syntax file
" Language: worklog (custom format)

if exists("b:current_syntax")
  finish
endif

" === Patterns ===

" ID definitions at line start (e.g. FOO-123 as FooAlias)
syntax match worklogID /^[A-Za-z]\{2,}-\?\d*/ contained
"
"" The keyword 'as'
syntax keyword worklogAs as

"" Alias definition (right after 'as')
syntax match worklogAlias /[a-zA-Z0-9_]\+$/ contained

" Dates (01.09.2025) on their own line
syntax match worklogDate /^\d\{2}\.\d\{2}\.\d\{4}$/

" Times (09:00) on their own line
syntax match worklogTime /^\d\{2}:\d\{2}$/

" Done marker: line ending with 'x'
syntax match worklogDone /\s\zsx$/

" === Regions ===

" Alias region
syntax region worklogAliasDefinition start=/^[A-Z]\{2,}-\d\{1,5}\s\+as\s\+/ end=/$/ contains=worklogID,worklogAs,worklogAlias keepend

" Worklog Entry Region
syntax region worklogEntryDefinition start=/^\([A-Z]\{2,}-\d\{1,5}\|[A-Z][a-zA-Z0-9_]\+\)\s\+\(as\s\)\@!/ end=/$/ contains=worklogID,worklogDone keepend

" === Highlight groups ===
hi def link worklogID Identifier
hi def link worklogAs Keyword
hi def link worklogAlias Type
hi def link worklogDate Constant
hi def link worklogTime Number
hi def link worklogEntryDefinition String
hi def link worklogDone Comment

let b:current_syntax = "worklog"
