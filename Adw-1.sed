s|@inlinable func getSubtitleLines() -> Bool|@inlinable func getSubtitleLines() -> Int|
s|@inlinable func getTitleLines() -> Bool|@inlinable func getTitleLines() -> Int|
s|@inlinable var subtitleLines: Bool|@inlinable var subtitleLines: Int|
s|@inlinable var titleLines: Bool|@inlinable var titleLines: Int|
/adw_expander_row_get_subtitle_lines/{
n
s|let rv = ((result) != 0)|let rv = Int(result)|
}
/adw_expander_row_get_title_lines/{
n
s|let rv = ((result) != 0)|let rv = Int(result)|
}
