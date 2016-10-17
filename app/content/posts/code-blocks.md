title: Code blocks with python markdown in Flask
display_date: September 25, 2016
sort_date: 20160925
tags: markdown, python, css, html

There are several different kinds of code blocks available for markdown.

1. Github flavored markdown (GFM)
2. Indented text (4 spaces)

Here are examples of this.

```
This is a GFM style code block. I cannot have spaces between lines and all lines will be combined into a single line. My setup doesn't add a gray background, but it does wrap the text. The text is rather small. It inherits the text-indent property because it does not live in a <codehilite> block.
```

    This is an indented code block. I can add spaces between lines and I've made the font larger.

    Another line.

There are a few variations with the indented method. The first line can be used as metadata to explicitly use a particular language and to add line numbers. There are two ways of doing this that I'm aware of. The first is the colon method `:::<language>`. This method will have the code block rendered with highlighting for the specified language.

    :::python
    def some_func():
        foo = 1 + 2
        return True

That was `:::python`. This is `:::rust`.

    :::rust
    fn main() {
        println!("Hello, world!");
    }

We can also emphasize lines with `:::python hl_lines="1 4"` check it out.

    :::python hl_lines="1 4"
    def foo(bar):
        msg = """
        A programming genius called Hank
        wrote a system to access his bank
        when his memory failed him
        they nailed him and jailed him
        now his storage is basic and dank.
            --W E Sword, Barningham Suffolk"""
        return msg

I'm not sure why the rust code is adding white lines where there should be transparent spaces. But I don't do a lot of `rust` anyway. Another thing I can do is add line numbers. This time I'm still going to use the indented method but I'm going to use a shebang line `#!python` and `#!javascript`.

    #!python
    def foo():
        print 'hello world'

And check that out, they have line numbers.

    #!javascript
    function foo() {
        alert('hello world');
    }

A couple of things to note here. With my setup the gray background does not strech to the full width of the `<div>` that contains the article text. This is easy to fix with a little css. The other issue is a little more difficult to fix. I don't have the frontend chops to do it at the moment. Check this out.

    #!python
    import numpy as np
    data = ['foo', 'bar', 'bar', 'foo', 'baz', 'spam', 'spam', 'spam', 'spam', 'spam', 'spam', 'foo', 'bar', 'eggs', 'bacon', 'spam']

    arr1 = np.array(data)

    boolean = arr1 == 'foo'

The line numbers are not accounting for the wrapped line. This style of indented code then, must adhere to a strict sub 80 columns.

##The verdict

I'll be using the `:::python` code blocks the most because they look nice and they wrap long lines without screwing up the line numbers. If I really need the line numbers then I might use the shebang method (`#!python`) but for the most part I think I can get away with the colon method. If I need to call attention to a particlar line I can just highlight it.
