# WeChatHelper

This repository contains a small Swift command line prototype used to parse
exported notes from WeChat Read. It demonstrates how highlights and reader
comments can be converted into a JSON structure that later can be consumed by a
full iOS application.

## Usage

Pipe the exported note text to the executable. Lines beginning with `#` are
considered chapter titles. Lines beginning with `-` are highlight entries and
an optional `>` line that follows a highlight is treated as the comment.

```bash
cat book.txt | swift run WeChatHelper
```

## Testing

Run the unit tests with:

```bash
swift test
```
