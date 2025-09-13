(heredoc
  (heredoc_start) @sql.start
  (heredoc_body) @sql
  (heredoc_end) @sql.end)

; Restrict only if the heredoc label is "SQL"
(#match? @sql.start "<<<SQL")
