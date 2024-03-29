" Vimball Archiver by Charles E. Campbell, Jr., Ph.D.
UseVimball
finish
doc/tcomment.txt	[[[1
776
*tcomment.txt*  An easily extensible & universal comment plugin
                Author: Thomas Link, micathom AT gmail com?subject=vim

tcomment provides easy to use, file-type sensible comments for Vim. It 
can handle embedded syntax.

TComment works like a toggle, i.e., it will comment out text that 
contains uncommented lines, and it will remove comment markup for 
already commented text (i.e. text that contains no uncommented lines).

If the file-type is properly defined, TComment will figure out which 
comment string to use. Otherwise you use |tcomment#DefineType()| to 
override the default choice.

TComment can properly handle an embedded syntax, e.g., ruby/python/perl 
regions in vim scripts, HTML or JavaScript in php code etc.

tcomment favours the use of line-wise comment styles. This implies that usually 
whole line will be commented out. tcomment also knows block-style and inline 
comments that can be used via special maps (see below) or the |:TCommentAs| 
command.

Demo:
http://vimsomnia.blogspot.com/2010/11/tcomment-vim-plugin.html


                                                    *tcomment-maps*
Key bindings~

Most of the time the default toggle keys will do what you want (or to be 
more precise: what I think you want it to do ;-).

                                                    *tcomment-operator*
As operator (the prefix can be customized via |g:tcommentMapLeaderOp1| 
and |g:tcommentMapLeaderOp2|):

    gc{motion}   :: Toggle comments (for small comments within one line 
                    the &filetype_inline style will be used, if 
                    defined)
    gc<Count>c{motion} :: Toggle comment text with count argument 
                    (see |tcomment#Comment()|)
    gcc          :: Toggle comment for the current line

Explicit commenting/uncommenting:

    g<{motion}   :: Uncomment region
    g<c          :: Uncomment the current line
    g<b          :: Uncomment the current region as block

    g>{motion}   :: Comment region
    g>c          :: Comment the current line
    g>b          :: Comment the current region as block

In visual mode:

    gc           :: Toggle comments
    gC           :: Comment selected text

CAVEAT: If you visually select text within a line, the visual mode map will 
comment out the selected text. If you selected text across several lines, the 
visual mode map will assume though that you wanted to comment out lines -- 
since this is how many vim maps work. In order to make tcomment use e.g. inline 
comments anyway, use the <c-_>i map -- see below.

By default the cursor stays put. If you want the cursor to the end of 
the commented text, set |g:tcommentOpModeExtra| to '>' (but this may not 
work properly with exclusive motions).

Primary key maps for normal and insert mode:

    <c-_><c-_>   :: :TComment
    <c-_><space> :: :TComment <QUERY COMMENT-BEGIN ?COMMENT-END>
    <c-_>b       :: :TCommentBlock
                    In insert mode, the cursor will be positioned inside 
                    the comment. In normal mode, the cursor will stay 
                    put.
    <c-_>a       :: :TCommentAs <QUERY COMMENT TYPE>
    <c-_>n       :: :TCommentAs &filetype <QUERY COUNT>
    <c-_>s       :: :TCommentAs &filetype_<QUERY COMMENT SUBTYPE>
    <c-_>i       :: :TCommentInline (in normal and insert mode, this map will 
                    create an empty inline comment, which isn't suitable for 
                    all filetypes though)
                    In insert mode, the cursor will be positioned inside 
                    the comment. In normal mode, the cursor will stay 
                    put.
    <c-_>r       :: :TCommentRight
    <c-_>p       :: Comment the current inner paragraph
    <c-_><Count> :: Set the count argument (a number from 1 to 9) for use with 
                    the subsequent tcomment map/command (see 
                    |tcomment#Comment()|)
                    E.g. in JavaScript, in order to get an empty /** */ 
                    comment for documentation purposes, in insert mode type 
                    <c-_>2<c-_>i
                    In order to get an empty block comment like >
                      /**
                       *
                       */
<                   type <c-_>2<c-_>b

Most of the above maps are also available in visual mode.

A secondary set of key maps is defined for normal and insert mode:

    <Leader>__       :: :TComment
    <Leader>_p       :: Comment the current inner paragraph
    <Leader>_<space> :: :TComment <QUERY COMMENT-BEGIN ?COMMENT-END>
    <Leader>_i       :: :TCommentInline
    <Leader>_r       :: :TCommentRight
    <Leader>_b       :: :TCommentBlock
    <Leader>_a       :: :TCommentAs <QUERY COMMENT TYPE>
    <Leader>_n       :: :TCommentAs &filetype <QUERY COUNT>
    <Leader>_s       :: :TCommentAs &filetype_<QUERY COMMENT SUBTYPE>

... and for select mode:

    <Leader>__       :: :TComment
    <Leader>_i       :: :TCommentInline


-----------------------------------------------------------------------
Install~

Edit the vba file and type: >

    :so %

See :help vimball for details. If you have difficulties or use vim 7.0, 
please make sure, you have the current version of vimball (vimscript 
#1502) installed or update your runtime.


========================================================================
Contents~

        g:tcommentMaps ................................ |g:tcommentMaps|
        g:tcommentMapLeader1 .......................... |g:tcommentMapLeader1|
        g:tcommentMapLeader2 .......................... |g:tcommentMapLeader2|
        g:tcommentMapLeaderOp1 ........................ |g:tcommentMapLeaderOp1|
        g:tcommentMapLeaderUncommentAnyway ............ |g:tcommentMapLeaderUncommentAnyway|
        g:tcommentMapLeaderCommentAnyway .............. |g:tcommentMapLeaderCommentAnyway|
        g:tcommentTextObjectInlineComment ............. |g:tcommentTextObjectInlineComment|
        :TComment ..................................... |:TComment|
        :TCommentAs ................................... |:TCommentAs|
        :TCommentRight ................................ |:TCommentRight|
        :TCommentBlock ................................ |:TCommentBlock|
        :TCommentInline ............................... |:TCommentInline|
        :TCommentMaybeInline .......................... |:TCommentMaybeInline|
        <Plug>TComment-<c-_><c-_> ..................... |<Plug>TComment-<c-_><c-_>|
        v_<Plug>TComment-<c-_><c-_> ................... |v_<Plug>TComment-<c-_><c-_>|
        i_<Plug>TComment-<c-_><c-_> ................... |i_<Plug>TComment-<c-_><c-_>|
        <Plug>TComment-<c-_>p ......................... |<Plug>TComment-<c-_>p|
        i_<Plug>TComment-<c-_>p ....................... |i_<Plug>TComment-<c-_>p|
        <Plug>TComment-<c-_><space> ................... |<Plug>TComment-<c-_><space>|
        i_<Plug>TComment-<c-_><space> ................. |i_<Plug>TComment-<c-_><space>|
        i_<Plug>TComment-<c-_>r ....................... |i_<Plug>TComment-<c-_>r|
        <Plug>TComment-<c-_>r ......................... |<Plug>TComment-<c-_>r|
        v_<Plug>TComment-<c-_>i ....................... |v_<Plug>TComment-<c-_>i|
        <Plug>TComment-<c-_>i ......................... |<Plug>TComment-<c-_>i|
        i_<Plug>TComment-<c-_>i ....................... |i_<Plug>TComment-<c-_>i|
        <Plug>TComment-<c-_>b ......................... |<Plug>TComment-<c-_>b|
        i_<Plug>TComment-<c-_>b ....................... |i_<Plug>TComment-<c-_>b|
        <Plug>TComment-<c-_>a ......................... |<Plug>TComment-<c-_>a|
        i_<Plug>TComment-<c-_>a ....................... |i_<Plug>TComment-<c-_>a|
        <Plug>TComment-<c-_>n ......................... |<Plug>TComment-<c-_>n|
        i_<Plug>TComment-<c-_>n ....................... |i_<Plug>TComment-<c-_>n|
        <Plug>TComment-<c-_>s ......................... |<Plug>TComment-<c-_>s|
        i_<Plug>TComment-<c-_>s ....................... |i_<Plug>TComment-<c-_>s|
        <Plug>TComment-<c-_>cc ........................ |<Plug>TComment-<c-_>cc|
        <Plug>TComment-<c-_>ca ........................ |<Plug>TComment-<c-_>ca|
        <Plug>TComment-<Leader>__ ..................... |<Plug>TComment-<Leader>__|
        x_<Plug>TComment-<Leader>__ ................... |x_<Plug>TComment-<Leader>__|
        <Plug>TComment-<Leader>_p ..................... |<Plug>TComment-<Leader>_p|
        <Plug>TComment-<Leader>_<space> ............... |<Plug>TComment-<Leader>_<space>|
        x_<Plug>TComment-<Leader>_i ................... |x_<Plug>TComment-<Leader>_i|
        <Plug>TComment-<Leader>_r ..................... |<Plug>TComment-<Leader>_r|
        <Plug>TComment-<Leader>_b ..................... |<Plug>TComment-<Leader>_b|
        <Plug>TComment-<Leader>_a ..................... |<Plug>TComment-<Leader>_a|
        <Plug>TComment-<Leader>_n ..................... |<Plug>TComment-<Leader>_n|
        <Plug>TComment-<Leader>_s ..................... |<Plug>TComment-<Leader>_s|
        n_<Plug>TComment-Uncomment .................... |n_<Plug>TComment-Uncomment|
        n_<Plug>TComment-Uncommentc ................... |n_<Plug>TComment-Uncommentc|
        n_<Plug>TComment-Uncommentb ................... |n_<Plug>TComment-Uncommentb|
        x_<Plug>TComment-Uncomment .................... |x_<Plug>TComment-Uncomment|
        n_<Plug>TComment-Comment ...................... |n_<Plug>TComment-Comment|
        n_<Plug>TComment-Commentc ..................... |n_<Plug>TComment-Commentc|
        n_<Plug>TComment-Commentb ..................... |n_<Plug>TComment-Commentb|
        x_<Plug>TComment-Comment ...................... |x_<Plug>TComment-Comment|
        v_<Plug>TComment-ic ........................... |v_<Plug>TComment-ic|
        <Plug>TComment-ic ............................. |<Plug>TComment-ic|
        n_<Plug>TComment-gcc .......................... |n_<Plug>TComment-gcc|
        n_<Plug>TComment-gcb .......................... |n_<Plug>TComment-gcb|
        x_<Plug>TComment-gc ........................... |x_<Plug>TComment-gc|
        n_<Plug>TComment-gc ........................... |n_<Plug>TComment-gc|
        g:tcomment#blank_lines ........................ |g:tcomment#blank_lines|
        g:tcomment#rstrip_on_uncomment ................ |g:tcomment#rstrip_on_uncomment|
        g:tcommentModeExtra ........................... |g:tcommentModeExtra|
        g:tcommentOpModeExtra ......................... |g:tcommentOpModeExtra|
        g:tcommentOptions ............................. |g:tcommentOptions|
        g:tcomment#options_comments ................... |g:tcomment#options_comments|
        g:tcomment#options_commentstring .............. |g:tcomment#options_commentstring|
        g:tcomment#ignore_char_type ................... |g:tcomment#ignore_char_type|
        g:tcommentGuessFileType ....................... |g:tcommentGuessFileType|
        g:tcommentGuessFileType_dsl ................... |g:tcommentGuessFileType_dsl|
        g:tcommentGuessFileType_php ................... |g:tcommentGuessFileType_php|
        g:tcommentGuessFileType_blade ................. |g:tcommentGuessFileType_blade|
        g:tcommentGuessFileType_html .................. |g:tcommentGuessFileType_html|
        g:tcommentGuessFileType_tskeleton ............. |g:tcommentGuessFileType_tskeleton|
        g:tcommentGuessFileType_vim ................... |g:tcommentGuessFileType_vim|
        g:tcommentGuessFileType_django ................ |g:tcommentGuessFileType_django|
        g:tcommentGuessFileType_eruby ................. |g:tcommentGuessFileType_eruby|
        g:tcommentGuessFileType_smarty ................ |g:tcommentGuessFileType_smarty|
        g:tcommentIgnoreTypes_php ..................... |g:tcommentIgnoreTypes_php|
        g:tcomment#syntax_substitute .................. |g:tcomment#syntax_substitute|
        g:tcommentSyntaxMap ........................... |g:tcommentSyntaxMap|
        g:tcomment#replacements_c ..................... |g:tcomment#replacements_c|
        g:tcommentInlineC ............................. |g:tcommentInlineC|
        g:tcommentBlockC2 ............................. |g:tcommentBlockC2|
        g:tcomment#replacements_xml ................... |g:tcomment#replacements_xml|
        g:tcommentBlockXML ............................ |g:tcommentBlockXML|
        g:tcommentInlineXML ........................... |g:tcommentInlineXML|
        g:tcomment#ignore_comment_def ................. |g:tcomment#ignore_comment_def|
        g:tcomment#must_escape_expression_backslash ... |g:tcomment#must_escape_expression_backslash|
        tcomment#DefineType ........................... |tcomment#DefineType()|
        tcomment#GetCommentDef ........................ |tcomment#GetCommentDef()|
        g:tcomment_types .............................. |g:tcomment_types|
        tcomment#Comment .............................. |tcomment#Comment()|
        tcomment#SetOption ............................ |tcomment#SetOption()|
        tcomment#Operator ............................. |tcomment#Operator()|
        tcomment#OperatorLine ......................... |tcomment#OperatorLine()|
        tcomment#OperatorAnyway ....................... |tcomment#OperatorAnyway()|
        tcomment#OperatorLineAnyway ................... |tcomment#OperatorLineAnyway()|
        tcomment#CommentAs ............................ |tcomment#CommentAs()|
        tcomment#GuessCommentType ..................... |tcomment#GuessCommentType()|
        tcomment#TextObjectInlineComment .............. |tcomment#TextObjectInlineComment()|


========================================================================
plugin/tcomment.vim~

                                                    *g:tcommentMaps*
g:tcommentMaps                 (default: 1)
    If true, set maps.

                                                    *g:tcommentMapLeader1*
g:tcommentMapLeader1           (default: '<c-_>')
    g:tcommentMapLeader1 should be a shortcut that can be used with 
    map, imap, vmap.

                                                    *g:tcommentMapLeader2*
g:tcommentMapLeader2           (default: '<Leader>_')
    g:tcommentMapLeader2 should be a shortcut that can be used with 
    map, xmap.

                                                    *g:tcommentMapLeaderOp1*
g:tcommentMapLeaderOp1         (default: 'gc')
    See |tcomment-operator|.

                                                    *g:tcommentMapLeaderUncommentAnyway*
g:tcommentMapLeaderUncommentAnyway (default: 'g<')
    See |tcomment-operator|.

                                                    *g:tcommentMapLeaderCommentAnyway*
g:tcommentMapLeaderCommentAnyway (default: 'g>')
    See |tcomment-operator|.

                                                    *g:tcommentTextObjectInlineComment*
g:tcommentTextObjectInlineComment (default: 'ic')

                                                    *:TComment*
:[range]TComment[!] ?ARGS...
    If there is a visual selection that begins and ends in the same line, 
    then |:TCommentInline| is used instead.
    The optional range defaults to the current line. With a bang '!', 
    always comment the line.

    ARGS... are either (see also |tcomment#Comment()|):
      1. a list of key=value pairs
      2. 1-2 values for: ?commentBegin, ?commentEnd

                                                    *:TCommentAs*
:[range]TCommentAs[!] commenttype ?ARGS...
    TCommentAs requires g:tcomment_{filetype} to be defined.
    With a bang '!', always comment the line.

    ARGS... are either (see also |tcomment#Comment()|):
      1. a list of key=value pairs
      2. 1-2 values for: ?commentBegin, ?commentEnd

                                                    *:TCommentRight*
:[range]TCommentRight[!] ?ARGS...
    Comment the text to the right of the cursor. If a visual selection was 
    made (be it block-wise or not), all lines are commented out at from 
    the current cursor position downwards.
    With a bang '!', always comment the line.

    ARGS... are either (see also |tcomment#Comment()|):
      1. a list of key=value pairs
      2. 1-2 values for: ?commentBegin, ?commentEnd

                                                    *:TCommentBlock*
:[range]TCommentBlock[!] ?ARGS...
    Comment as "block", e.g. use the {&ft}_block comment style. The 
    commented text isn't indented or reformated.
    With a bang '!', always comment the line.

    ARGS... are either (see also |tcomment#Comment()|):
      1. a list of key=value pairs
      2. 1-2 values for: ?commentBegin, ?commentEnd

                                                    *:TCommentInline*
:[range]TCommentInline[!] ?ARGS...
    Use the {&ft}_inline comment style.
    With a bang '!', always comment the line.

    ARGS... are either (see also |tcomment#Comment()|):
      1. a list of key=value pairs
      2. 1-2 values for: ?commentBegin, ?commentEnd

                                                    *:TCommentMaybeInline*
:[range]TCommentMaybeInline[!] ?ARGS...
    With a bang '!', always comment the line.

    ARGS... are either (see also |tcomment#Comment()|):
      1. a list of key=value pairs
      2. 1-2 values for: ?commentBegin, ?commentEnd

                                                    *<Plug>TComment-<c-_><c-_>*
<Plug>TComment-<c-_><c-_> ... :TComment<cr>

                                                    *v_<Plug>TComment-<c-_><c-_>*
v_<Plug>TComment-<c-_><c-_> ... :TCommentMaybeInline<cr>

                                                    *i_<Plug>TComment-<c-_><c-_>*
i_<Plug>TComment-<c-_><c-_> ... <c-o>:TComment<cr>

                                                    *<Plug>TComment-<c-_>p*
<Plug>TComment-<c-_>p ... m`vip:TComment<cr>``

                                                    *i_<Plug>TComment-<c-_>p*
i_<Plug>TComment-<c-_>p ... <c-o>:norm! m`vip<cr>:TComment<cr><c-o>``

                                                    *<Plug>TComment-<c-_><space>*
<Plug>TComment-<c-_><space> ... :TComment

                                                    *i_<Plug>TComment-<c-_><space>*
i_<Plug>TComment-<c-_><space> ... <c-o>:TComment

                                                    *i_<Plug>TComment-<c-_>r*
i_<Plug>TComment-<c-_>r ... <c-o>:TCommentRight<cr>

                                                    *<Plug>TComment-<c-_>r*
<Plug>TComment-<c-_>r ... :TCommentRight<cr>

                                                    *v_<Plug>TComment-<c-_>i*
v_<Plug>TComment-<c-_>i ... :TCommentInline<cr>

                                                    *<Plug>TComment-<c-_>i*
<Plug>TComment-<c-_>i ... v:TCommentInline mode=I#<cr>

                                                    *i_<Plug>TComment-<c-_>i*
i_<Plug>TComment-<c-_>i ... <c-\><c-o>v:TCommentInline mode=#<cr>

                                                    *<Plug>TComment-<c-_>b*
<Plug>TComment-<c-_>b ... :TCommentBlock<cr>

                                                    *i_<Plug>TComment-<c-_>b*
i_<Plug>TComment-<c-_>b ... <c-\><c-o>:TCommentBlock mode=#<cr>

                                                    *<Plug>TComment-<c-_>a*
<Plug>TComment-<c-_>a ... :TCommentAs

                                                    *i_<Plug>TComment-<c-_>a*
i_<Plug>TComment-<c-_>a ... <c-o>:TCommentAs

                                                    *<Plug>TComment-<c-_>n*
<Plug>TComment-<c-_>n ... :TCommentAs <c-r>=&ft<cr>

                                                    *i_<Plug>TComment-<c-_>n*
i_<Plug>TComment-<c-_>n ... <c-o>:TCommentAs <c-r>=&ft<cr>

                                                    *<Plug>TComment-<c-_>s*
<Plug>TComment-<c-_>s ... :TCommentAs <c-r>=&ft<cr>_

                                                    *i_<Plug>TComment-<c-_>s*
i_<Plug>TComment-<c-_>s ... <c-o>:TCommentAs <c-r>=&ft<cr>_

                                                    *<Plug>TComment-<c-_>cc*
<Plug>TComment-<c-_>cc ... :<c-u>call tcomment#SetOption("count", v:count1)<cr>

                                                    *<Plug>TComment-<c-_>ca*
<Plug>TComment-<c-_>ca ... :<c-u>call tcomment#SetOption("as", input("Comment as: ", &filetype, "customlist,tcomment#Complete"))<cr>

                                                    *<Plug>TComment-<Leader>__*
<Plug>TComment-<Leader>__ ... :TComment<cr>

                                                    *x_<Plug>TComment-<Leader>__*
x_<Plug>TComment-<Leader>__ ... :TCommentMaybeInline<cr>

                                                    *<Plug>TComment-<Leader>_p*
<Plug>TComment-<Leader>_p ... vip:TComment<cr>

                                                    *<Plug>TComment-<Leader>_<space>*
<Plug>TComment-<Leader>_<space> ... :TComment

                                                    *x_<Plug>TComment-<Leader>_i*
x_<Plug>TComment-<Leader>_i ... :TCommentInline<cr>

                                                    *<Plug>TComment-<Leader>_r*
<Plug>TComment-<Leader>_r ... :TCommentRight<cr>

                                                    *<Plug>TComment-<Leader>_b*
<Plug>TComment-<Leader>_b ... :TCommentBlock<cr>

                                                    *<Plug>TComment-<Leader>_a*
<Plug>TComment-<Leader>_a ... :TCommentAs

                                                    *<Plug>TComment-<Leader>_n*
<Plug>TComment-<Leader>_n ... :TCommentAs <c-r>=&ft<cr>

                                                    *<Plug>TComment-<Leader>_s*
<Plug>TComment-<Leader>_s ... :TCommentAs <c-r>=&ft<cr>_

                                                    *n_<Plug>TComment-Uncomment*
n_<Plug>TComment-Uncomment ... :<c-u>if v:count > 0 \| call tcomment#SetOption("count", v:count) \| endif \| call tcomment#SetOption("mode_extra", "U") \| let w:tcommentPos = getpos(".") \| set opfunc=tcomment#OperatorAnyway<cr>g@

                                                    *n_<Plug>TComment-Uncommentc*
n_<Plug>TComment-Uncommentc ... :<c-u>if v:count > 0 \| call tcomment#SetOption("count", v:count) \| endif \| call tcomment#SetOption("mode_extra", "U") \| let w:tcommentPos = getpos(".") \| set opfunc=tcomment#OperatorLineAnyway<cr>g@$

                                                    *n_<Plug>TComment-Uncommentb*
n_<Plug>TComment-Uncommentb ... :<c-u>if v:count > 0 \| call tcomment#SetOption("count", v:count) \| endif \| call tcomment#SetOption("mode_extra", "UB") \| let w:tcommentPos = getpos(".") \| set opfunc=tcomment#OperatorLine<cr>g@

                                                    *x_<Plug>TComment-Uncomment*
x_<Plug>TComment-Uncomment ... :<c-u>if v:count > 0 \| call tcomment#SetOption("count", v:count) \| endif \| call tcomment#SetOption("mode_extra", "U") \| '<,'>TCommentMaybeInline<cr>

                                                    *n_<Plug>TComment-Comment*
n_<Plug>TComment-Comment ... :<c-u>if v:count > 0 \| call tcomment#SetOption("count", v:count) \| endif \| let w:tcommentPos = getpos(".") \| set opfunc=tcomment#OperatorAnyway<cr>g@

                                                    *n_<Plug>TComment-Commentc*
n_<Plug>TComment-Commentc ... :<c-u>if v:count > 0 \| call tcomment#SetOption("count", v:count) \| endif \| let w:tcommentPos = getpos(".") \| set opfunc=tcomment#OperatorLineAnyway<cr>g@$

                                                    *n_<Plug>TComment-Commentb*
n_<Plug>TComment-Commentb ... :<c-u>if v:count > 0 \| call tcomment#SetOption("count", v:count) \| endif \| call tcomment#SetOption("mode_extra", "B") \| let w:tcommentPos = getpos(".") \| set opfunc=tcomment#OperatorLine<cr>g@

                                                    *x_<Plug>TComment-Comment*
x_<Plug>TComment-Comment ... :<c-u>if v:count > 0 \| call tcomment#SetOption("count", v:count) \| endif \| '<,'>TCommentMaybeInline!<cr>

                                                    *v_<Plug>TComment-ic*
v_<Plug>TComment-ic ... :<c-U>call tcomment#TextObjectInlineComment()<cr>

                                                    *<Plug>TComment-ic*
<Plug>TComment-ic ... :<c-U>call tcomment#TextObjectInlineComment()<cr>

                                                    *n_<Plug>TComment-gcc*
n_<Plug>TComment-gcc ... :<c-u>if v:count > 0 \| call tcomment#SetOption("count", v:count) \| endif \| let w:tcommentPos = getpos(".") \| set opfunc=tcomment#OperatorLine<cr>g@$

                                                    *n_<Plug>TComment-gcb*
n_<Plug>TComment-gcb ... :<c-u>if v:count > 0 \| call tcomment#SetOption("count", v:count) \| endif \| let w:tcommentPos = getpos(".") \| call tcomment#SetOption("mode_extra", "B") \| set opfunc=tcomment#OperatorLine<cr>g@

                                                    *x_<Plug>TComment-gc*
x_<Plug>TComment-gc ... :TCommentMaybeInline<cr>

                                                    *n_<Plug>TComment-gc*
n_<Plug>TComment-gc ... :<c-u>if v:count > 0 \| call tcomment#SetOption("count", v:count) \| endif \| let w:tcommentPos = getpos(".") \| set opfunc=tcomment#Operator<cr>g@


========================================================================
autoload/tcomment.vim~

                                                    *g:tcomment#blank_lines*
g:tcomment#blank_lines         (default: 2)
    If 1, comment blank lines too.
    If 2, also comment blank lines within indented code blocks 
    (requires mixedindent -- see |tcomment#Comment()|).

                                                    *g:tcomment#rstrip_on_uncomment*
g:tcomment#rstrip_on_uncomment (default: 1)
    If 1, remove right-hand whitespace on uncomment from empty lines.
    If 2, remove right-hand whitespace on uncomment from all lines.

                                                    *g:tcommentModeExtra*
g:tcommentModeExtra            (default: '')
    Modifies how commenting works.
      >  ... Move the cursor to the end of the comment
      >> ... Like above but move the cursor to the next line
      #  ... Move the cursor to the position of the commented text 
             (NOTE: this only works when creating empty comments using 
             |:TCommentInline| from normal or insert mode and should 
             not be set here as a global option.)

                                                    *g:tcommentOpModeExtra*
g:tcommentOpModeExtra          (default: '')
    Modifies how the operator works.
    See |g:tcommentModeExtra| for a list of possible values.

                                                    *g:tcommentOptions*
g:tcommentOptions              (default: {})
    Other key-value options used by |tcomment#Comment()|.

    Example: If you want to put the opening comment marker always in 
    the first column regardless of the block's indentation, put this 
    into your |vimrc| file: >
      let g:tcommentOptions = {'col': 1}
<

                                                    *g:tcomment#options_comments*
g:tcomment#options_comments    (default: {'whitespace': get(g:tcommentOptions, 'whitespace', 'both')})
    Additional args for |tcomment#Comment()| when using the 'comments' 
    option.

                                                    *g:tcomment#options_commentstring*
g:tcomment#options_commentstring (default: {'whitespace': get(g:tcommentOptions, 'whitespace', 'both')})
    Additional args for |tcomment#Comment()| when using the 
    'commentstring' option.

                                                    *g:tcomment#ignore_char_type*
g:tcomment#ignore_char_type    (default: 1)
    |text-objects| for use with |tcomment#Operator| can have different 
    types: line, block, char etc. Text objects like aB, it, at etc. 
    have type char but this may not work reliably. By default, 
    tcomment handles those text objects most often as if they were of 
    type line. Set this variable to 0 in order to change this 
    behaviour. Be prepared that the result may not always match your 
    intentions.

                                                    *g:tcommentGuessFileType*
g:tcommentGuessFileType        (default: 0)
    Guess the file type based on syntax names always or for some fileformat only
    If non-zero, try to guess filetypes.
    tcomment also checks g:tcommentGuessFileType_{&filetype} for 
    filetype specific values.

    Values:
      0        ... don't guess
      1        ... guess
      FILETYPE ... assume this filetype

                                                    *g:tcommentGuessFileType_dsl*
g:tcommentGuessFileType_dsl    (default: 'xml')
    For dsl documents, assume filetype = xml.

                                                    *g:tcommentGuessFileType_php*
g:tcommentGuessFileType_php    (default: 'html')
    In php documents, the php part is usually marked as phpRegion. We 
    thus assume that the buffers default comment style isn't php but 
    html.

                                                    *g:tcommentGuessFileType_blade*
g:tcommentGuessFileType_blade  (default: 'html')
    See |g:tcommentGuessFileType_php|.

                                                    *g:tcommentGuessFileType_html*
g:tcommentGuessFileType_html   (default: 1)

                                                    *g:tcommentGuessFileType_tskeleton*
g:tcommentGuessFileType_tskeleton (default: 1)

                                                    *g:tcommentGuessFileType_vim*
g:tcommentGuessFileType_vim    (default: 1)

                                                    *g:tcommentGuessFileType_django*
g:tcommentGuessFileType_django (default: 1)

                                                    *g:tcommentGuessFileType_eruby*
g:tcommentGuessFileType_eruby  (default: 1)

                                                    *g:tcommentGuessFileType_smarty*
g:tcommentGuessFileType_smarty (default: 1)

                                                    *g:tcommentIgnoreTypes_php*
g:tcommentIgnoreTypes_php      (default: 'sql')
    In php files, some syntax regions are wrongly highlighted as sql 
    markup. We thus ignore sql syntax when guessing the filetype in 
    php files.

                                                    *g:tcomment#syntax_substitute*
g:tcomment#syntax_substitute   (default: {...})

                                                    *g:tcommentSyntaxMap*
g:tcommentSyntaxMap            (default: {...})
    tcomment guesses filetypes based on the name of the current syntax 
    region. This works well if the syntax names match 
    /filetypeSomeName/. Other syntax names have to be explicitly 
    mapped onto the corresponding filetype.

                                                    *g:tcomment#replacements_c*
g:tcomment#replacements_c      (default: {...})
    Replacements for c filetype.

                                                    *g:tcommentInlineC*
g:tcommentInlineC              (default: {...})
    Generic c-like comments.

                                                    *g:tcommentBlockC2*
g:tcommentBlockC2              (default: {...})
    Generic c-like block comments (alternative markup).

                                                    *g:tcomment#replacements_xml*
g:tcomment#replacements_xml    (default: {...})
    Replacements for xml filetype.

                                                    *g:tcommentBlockXML*
g:tcommentBlockXML             (default: {...})
    Generic xml-like block comments.

                                                    *g:tcommentInlineXML*
g:tcommentInlineXML            (default: {...})
    Generic xml-like comments.

                                                    *g:tcomment#ignore_comment_def*
g:tcomment#ignore_comment_def  (default: [])
    A list of names or filetypes, which should be ignored by 
    |tcomment#DefineType()| -- no custom comment definition will be 
    stored for these names.

    This variable should be set before loading autoload/tcomment.vim.

                                                    *g:tcomment#must_escape_expression_backslash*
g:tcomment#must_escape_expression_backslash (default: 0)
    Users of vim earlier than 7.3 might have to set this variable to 
    true. Set this variable to 0, if you see unexpected "\r" char 
    sequences in comments.

    The reommended value was `!(v:version > 702 || (v:version == 702 && has('patch407')))`.
    It is now assumed though, that no unpatched versions of vim are in 
    use.

    References:
    Patch 7.2.407  when using :s with an expression backslashes are dropped
    https://github.com/tomtom/tcomment_vim/issues/102

                                                    *tcomment#DefineType()*
tcomment#DefineType(name, commentdef, ?cdef={}, ?anyway=0)
    If you don't explicitly define a comment style, |:TComment| will use 
    'commentstring' instead. We override the default values here in order 
    to have a blank after the comment marker. Block comments work only if 
    we explicitly define the markup.

    NAME usually is a 'filetype'. You can use special suffixes to define 
    special comment types. E.g. the name "FILETYPE_block" is used for 
    block comments for 'filetype'. The name "FILETYPE_inline" is used for 
    inline comments. If no specialized comment definition exists, the 
    normal one with name "FILETYPE" is used.

    The comment definition can be either a string or a dictionary.

    If it is a string:
    The format for block comments is similar to 'commentstrings' with the 
    exception that the format strings for blocks can contain a second line 
    that defines how "middle lines" (see :h format-comments) should be 
    displayed.

    Example: If the string is "--%s--\n-- ", lines will be commented as 
    "--%s--" but the middle lines in block comments will be commented as 
    "--%s".

    If it is a dictionary:
    See the help on the args argument of |tcomment#Comment| (see item 1, 
    args is a list of key=value pairs) to find out which fields can be 
    used.

                                                    *tcomment#GetCommentDef()*
tcomment#GetCommentDef(name, ...)
    Return the comment definition for NAME.
                                                          *b:tcomment_def_{NAME}*
    Return b:tcomment_def_{NAME} if the variable exists. Otherwise return 
    the comment definition as set with |tcomment#DefineType|.

                                                    *g:tcomment_types*
g:tcomment_types               (default: {})
    A dictionary of NAME => COMMENT DEFINITION (see |tcomment#DefineType|) 
    that can be set in vimrc to override tcomment's default comment 
    styles.



                                                    *tcomment#Comment()*
tcomment#Comment(beg, end, ...)
    tcomment#Comment(line1, line2, ?comment_mode, ?comment_anyway, ?args...)
    args... are either:
      1. a list of key=value pairs where known keys are (see also 
         |g:tcommentOptions|):
            as=STRING        ... Use a specific comment definition
            count=N          ... Repeat the comment string N times
            col=N            ... Start the comment at column N (in block 
                                 mode; must be smaller than |indent()|)
            mode=STRING      ... See the notes below on the "comment_mode" argument
            mode_extra=STRING ... Add to comment_mode
            begin=STRING     ... Comment prefix
            end=STRING       ... Comment postfix
            middle=STRING    ... Middle line comments in block mode
            rxbeg=N          ... Regexp to find the substring of "begin" 
                                 that should be multiplied by "count"
            rxend=N          ... The above for "end"
            rxmid=N          ... The above for "middle"
            mixedindent=BOOL ... If true, allow use of mixed 
                                 characters for indentation
            commentstring_rx ... A regexp format string that matches 
                                 commented lines (no new groups may be 
                                 introduced, the |regexp| is |\V|; % have 
                                 to be doubled); "commentstring", "begin" 
                                 and optionally "end" must be defined or 
                                 deducible.
            whitespace       ... Define whether commented text is 
                                 surrounded with whitespace; if
                                 both ... surround with whitespace (default)
                                 left ... keep whitespace on the left
                                 right... keep whitespace on the right
                                 no   ... don't use whitespace
            strip_whitespace ... Strip trailing whitespace: if 1 
                                 (default), strip from empty lines only, 
                                 if 2, always strip whitespace; if 0, 
                                 don't strip any whitespace
      2. 1-2 values for: ?commentPrefix, ?commentPostfix
      3. a dictionary (internal use only)

    comment_mode (see also ¦g:tcommentModeExtra¦):
      G ... guess the value of comment_mode
      B ... block (use extra lines for the comment markers)
      L ... lines
      i ... maybe inline, guess
      I ... inline
      R ... right (comment the line right of the cursor)
      v ... visual
      o ... operator
      C ... force comment
      U ... force uncomment (if U and C are present, U wins)
    By default, each line in range will be commented by adding the comment 
    prefix and postfix.

                                                    *tcomment#SetOption()*
tcomment#SetOption(name, arg)

                                                    *tcomment#Operator()*
tcomment#Operator(type, ...)

                                                    *tcomment#OperatorLine()*
tcomment#OperatorLine(type)

                                                    *tcomment#OperatorAnyway()*
tcomment#OperatorAnyway(type)

                                                    *tcomment#OperatorLineAnyway()*
tcomment#OperatorLineAnyway(type)

                                                    *tcomment#CommentAs()*
tcomment#CommentAs(beg, end, comment_anyway, filetype, ?args...)
    Where args is either:
      1. A count NUMBER
      2. An args list (see the notes on the "args" argument of 
         |tcomment#Comment()|)
    comment text as if it were of a specific filetype

                                                    *tcomment#GuessCommentType()*
tcomment#GuessFileType(?options={})
    A function that makes the s:GuessFileType() function usable for other 
    library developers.

    The argument is a dictionary with the following keys:

      beg ................ (default = line("."))
      end ................ (default = line("."))
      comment_mode ........ (default = "G")
      filetype ........... (default = &filetype)
      fallbackFiletype ... (default = "")

    This function return a dictionary that contains information about how 
    to make comments. The information about the filetype of the text 
    between lines "beg" and "end" is in the "filetype" key of the return 
    value. It returns the first discernible filetype it encounters.

                                                    *tcomment#TextObjectInlineComment()*
tcomment#TextObjectInlineComment()



vim:tw=78:fo=w2croql:isk=!-~,^*,^|,^":ts=8:ft=help:norl:
plugin/tcomment.vim	[[[1
258
" tComment.vim -- An easily extensible & universal comment plugin 
" @Author:      Tom Link (micathom AT gmail com)
" @License:     GPL (see http://www.gnu.org/licenses/gpl.txt)
" @Created:     27-Dez-2004.
" @Last Change: 2014-06-30.
" @Revision:    840
" GetLatestVimScripts: 1173 1 tcomment.vim

if &cp || exists('loaded_tcomment')
    finish
endif
let loaded_tcomment = 304

let s:save_cpo = &cpo
set cpo&vim


if !exists('g:tcommentMaps')
    " If true, set maps.
    let g:tcommentMaps = 1   "{{{2
endif

if !exists("g:tcommentMapLeader1")
    " g:tcommentMapLeader1 should be a shortcut that can be used with 
    " map, imap, vmap.
    let g:tcommentMapLeader1 = '<c-_>' "{{{2
endif

if !exists("g:tcommentMapLeader2")
    " g:tcommentMapLeader2 should be a shortcut that can be used with 
    " map, xmap.
    let g:tcommentMapLeader2 = '<Leader>_' "{{{2
endif

if !exists("g:tcommentMapLeaderOp1")
    " See |tcomment-operator|.
    let g:tcommentMapLeaderOp1 = 'gc' "{{{2
endif

if !exists("g:tcommentMapLeaderUncommentAnyway")
    " See |tcomment-operator|.
    let g:tcommentMapLeaderUncommentAnyway = 'g<' "{{{2
endif

if !exists("g:tcommentMapLeaderCommentAnyway")
    " See |tcomment-operator|.
    let g:tcommentMapLeaderCommentAnyway = 'g>' "{{{2
endif

if !exists('g:tcommentTextObjectInlineComment')
    let g:tcommentTextObjectInlineComment = 'ic'   "{{{2
endif


" :display: :[range]TComment[!] ?ARGS...
" If there is a visual selection that begins and ends in the same line, 
" then |:TCommentInline| is used instead.
" The optional range defaults to the current line. With a bang '!', 
" always comment the line.
"
" ARGS... are either (see also |tcomment#Comment()|):
"   1. a list of key=value pairs
"   2. 1-2 values for: ?commentBegin, ?commentEnd
command! -bar -bang -range -nargs=* -complete=customlist,tcomment#CompleteArgs TComment
            \ keepjumps call tcomment#Comment(<line1>, <line2>, 'G', "<bang>", <f-args>)

" :display: :[range]TCommentAs[!] commenttype ?ARGS...
" TCommentAs requires g:tcomment_{filetype} to be defined.
" With a bang '!', always comment the line.
"
" ARGS... are either (see also |tcomment#Comment()|):
"   1. a list of key=value pairs
"   2. 1-2 values for: ?commentBegin, ?commentEnd
command! -bar -bang -complete=customlist,tcomment#Complete -range -nargs=+ TCommentAs 
            \ call tcomment#CommentAs(<line1>, <line2>, "<bang>", <f-args>)

" :display: :[range]TCommentRight[!] ?ARGS...
" Comment the text to the right of the cursor. If a visual selection was 
" made (be it block-wise or not), all lines are commented out at from 
" the current cursor position downwards.
" With a bang '!', always comment the line.
"
" ARGS... are either (see also |tcomment#Comment()|):
"   1. a list of key=value pairs
"   2. 1-2 values for: ?commentBegin, ?commentEnd
command! -bar -bang -range -nargs=* -complete=customlist,tcomment#CompleteArgs TCommentRight
            \ keepjumps call tcomment#Comment(<line1>, <line2>, 'R', "<bang>", <f-args>)

" :display: :[range]TCommentBlock[!] ?ARGS...
" Comment as "block", e.g. use the {&ft}_block comment style. The 
" commented text isn't indented or reformated.
" With a bang '!', always comment the line.
"
" ARGS... are either (see also |tcomment#Comment()|):
"   1. a list of key=value pairs
"   2. 1-2 values for: ?commentBegin, ?commentEnd
command! -bar -bang -range -nargs=* -complete=customlist,tcomment#CompleteArgs TCommentBlock
            \ keepjumps call tcomment#Comment(<line1>, <line2>, 'B', "<bang>", <f-args>)

" :display: :[range]TCommentInline[!] ?ARGS...
" Use the {&ft}_inline comment style.
" With a bang '!', always comment the line.
"
" ARGS... are either (see also |tcomment#Comment()|):
"   1. a list of key=value pairs
"   2. 1-2 values for: ?commentBegin, ?commentEnd
command! -bar -bang -range -nargs=* -complete=customlist,tcomment#CompleteArgs TCommentInline
            \ keepjumps call tcomment#Comment(<line1>, <line2>, 'I', "<bang>", <f-args>)

" :display: :[range]TCommentMaybeInline[!] ?ARGS...
" With a bang '!', always comment the line.
"
" ARGS... are either (see also |tcomment#Comment()|):
"   1. a list of key=value pairs
"   2. 1-2 values for: ?commentBegin, ?commentEnd
command! -bar -bang -range -nargs=* -complete=customlist,tcomment#CompleteArgs TCommentMaybeInline
            \ keepjumps call tcomment#Comment(<line1>, <line2>, 'i', "<bang>", <f-args>)


noremap <Plug>TComment-<c-_><c-_> :TComment<cr>
vnoremap <Plug>TComment-<c-_><c-_> :TCommentMaybeInline<cr>
inoremap <Plug>TComment-<c-_><c-_> <c-o>:TComment<cr>
noremap <Plug>TComment-<c-_>p m`vip:TComment<cr>``
inoremap <Plug>TComment-<c-_>p <c-o>:norm! m`vip<cr>:TComment<cr><c-o>``
noremap <Plug>TComment-<c-_><space> :TComment 
inoremap <Plug>TComment-<c-_><space> <c-o>:TComment 
inoremap <Plug>TComment-<c-_>r <c-o>:TCommentRight<cr>
noremap <Plug>TComment-<c-_>r :TCommentRight<cr>
vnoremap <Plug>TComment-<c-_>i :TCommentInline<cr>
noremap <Plug>TComment-<c-_>i v:TCommentInline mode=I#<cr>
inoremap <Plug>TComment-<c-_>i <c-\><c-o>v:TCommentInline mode=#<cr>
noremap <Plug>TComment-<c-_>b :TCommentBlock<cr>
inoremap <Plug>TComment-<c-_>b <c-\><c-o>:TCommentBlock mode=#<cr>
noremap <Plug>TComment-<c-_>a :TCommentAs 
inoremap <Plug>TComment-<c-_>a <c-o>:TCommentAs 
noremap <Plug>TComment-<c-_>n :TCommentAs <c-r>=&ft<cr> 
inoremap <Plug>TComment-<c-_>n <c-o>:TCommentAs <c-r>=&ft<cr> 
noremap <Plug>TComment-<c-_>s :TCommentAs <c-r>=&ft<cr>_
inoremap <Plug>TComment-<c-_>s <c-o>:TCommentAs <c-r>=&ft<cr>_
noremap <Plug>TComment-<c-_>cc :<c-u>call tcomment#SetOption("count", v:count1)<cr>
noremap <Plug>TComment-<c-_>ca :<c-u>call tcomment#SetOption("as", input("Comment as: ", &filetype, "customlist,tcomment#Complete"))<cr>

noremap <Plug>TComment-<Leader>__ :TComment<cr>
xnoremap <Plug>TComment-<Leader>__ :TCommentMaybeInline<cr>
noremap <Plug>TComment-<Leader>_p vip:TComment<cr>
noremap <Plug>TComment-<Leader>_<space> :TComment 
xnoremap <Plug>TComment-<Leader>_i :TCommentInline<cr>
noremap <Plug>TComment-<Leader>_r :TCommentRight<cr>
noremap <Plug>TComment-<Leader>_b :TCommentBlock<cr>
noremap <Plug>TComment-<Leader>_a :TCommentAs 
noremap <Plug>TComment-<Leader>_n :TCommentAs <c-r>=&ft<cr> 
noremap <Plug>TComment-<Leader>_s :TCommentAs <c-r>=&ft<cr>_

nnoremap <silent> <Plug>TComment-Uncomment :<c-u>if v:count > 0 \| call tcomment#SetOption("count", v:count) \| endif \| call tcomment#SetOption("mode_extra", "U") \| let w:tcommentPos = getpos(".") \| set opfunc=tcomment#OperatorAnyway<cr>g@
nnoremap <silent> <Plug>TComment-Uncommentc :<c-u>if v:count > 0 \| call tcomment#SetOption("count", v:count) \| endif \| call tcomment#SetOption("mode_extra", "U") \| let w:tcommentPos = getpos(".") \| set opfunc=tcomment#OperatorLineAnyway<cr>g@$
nnoremap <silent> <Plug>TComment-Uncommentb :<c-u>if v:count > 0 \| call tcomment#SetOption("count", v:count) \| endif \| call tcomment#SetOption("mode_extra", "UB") \| let w:tcommentPos = getpos(".") \| set opfunc=tcomment#OperatorLine<cr>g@
xnoremap <silent> <Plug>TComment-Uncomment :<c-u>if v:count > 0 \| call tcomment#SetOption("count", v:count) \| endif \| call tcomment#SetOption("mode_extra", "U") \| '<,'>TCommentMaybeInline<cr>

nnoremap <silent> <Plug>TComment-Comment :<c-u>if v:count > 0 \| call tcomment#SetOption("count", v:count) \| endif \| let w:tcommentPos = getpos(".") \| set opfunc=tcomment#OperatorAnyway<cr>g@
nnoremap <silent> <Plug>TComment-Commentc :<c-u>if v:count > 0 \| call tcomment#SetOption("count", v:count) \| endif \| let w:tcommentPos = getpos(".") \| set opfunc=tcomment#OperatorLineAnyway<cr>g@$
nnoremap <silent> <Plug>TComment-Commentb :<c-u>if v:count > 0 \| call tcomment#SetOption("count", v:count) \| endif \| call tcomment#SetOption("mode_extra", "B") \| let w:tcommentPos = getpos(".") \| set opfunc=tcomment#OperatorLine<cr>g@
xnoremap <silent> <Plug>TComment-Comment :<c-u>if v:count > 0 \| call tcomment#SetOption("count", v:count) \| endif \| '<,'>TCommentMaybeInline!<cr>

vnoremap <Plug>TComment-ic :<c-U>call tcomment#TextObjectInlineComment()<cr>
noremap <Plug>TComment-ic :<c-U>call tcomment#TextObjectInlineComment()<cr>

nnoremap <silent> <Plug>TComment-gcc :<c-u>if v:count > 0 \| call tcomment#SetOption("count", v:count) \| endif \| let w:tcommentPos = getpos(".") \| set opfunc=tcomment#OperatorLine<cr>g@$
nnoremap <silent> <Plug>TComment-gcb :<c-u>if v:count > 0 \| call tcomment#SetOption("count", v:count) \| endif \| let w:tcommentPos = getpos(".") \| call tcomment#SetOption("mode_extra", "B") \| set opfunc=tcomment#OperatorLine<cr>g@
xnoremap <Plug>TComment-gc :TCommentMaybeInline<cr>

nnoremap <silent> <Plug>TComment-gc :<c-u>if v:count > 0 \| call tcomment#SetOption("count", v:count) \| endif \| let w:tcommentPos = getpos(".") \| set opfunc=tcomment#Operator<cr>g@

for s:i in range(1, 9)
    exec 'noremap <Plug>TComment-<c-_>' . s:i . ' :call tcomment#SetOption("count", '. s:i .')<cr>'
    exec 'inoremap <Plug>TComment-<c-_>' . s:i . ' <c-\><c-o>:call tcomment#SetOption("count", '. s:i .')<cr>'
    exec 'vnoremap <Plug>TComment-<c-_>' . s:i . ' :call tcomment#SetOption("count", '. s:i .')<cr>'
endfor
for s:i in range(1, 9)
    exec 'nnoremap <silent> <Plug>TComment-gc' . s:i .'c :let w:tcommentPos = getpos(".") \| call tcomment#SetOption("count", '. s:i .') \| set opfunc=tcomment#Operator<cr>g@'
endfor
unlet s:i


if g:tcommentMaps
    if g:tcommentMapLeader1 != ''
        exec 'map '. g:tcommentMapLeader1 . g:tcommentMapLeader1 .' <Plug>TComment-<c-_><c-_>'
        exec 'vmap '. g:tcommentMapLeader1 . g:tcommentMapLeader1 .' <Plug>TComment-<c-_><c-_>'
        exec 'imap '. g:tcommentMapLeader1 . g:tcommentMapLeader1 .' <Plug>TComment-<c-_><c-_>'
        exec 'map '. g:tcommentMapLeader1 .'p <Plug>TComment-<c-_>p'
        exec 'imap '. g:tcommentMapLeader1 .'p <Plug>TComment-<c-_>p'
        exec 'map '. g:tcommentMapLeader1 .'<space> <Plug>TComment-<c-_><space>'
        exec 'imap '. g:tcommentMapLeader1 .'<space> <Plug>TComment-<c-_><space>'
        exec 'imap '. g:tcommentMapLeader1 .'r <Plug>TComment-<c-_>r'
        exec 'map '. g:tcommentMapLeader1 .'r <Plug>TComment-<c-_>r'
        exec 'vmap '. g:tcommentMapLeader1 .'i <Plug>TComment-<c-_>i'
        exec 'map '. g:tcommentMapLeader1 .'i <Plug>TComment-<c-_>i'
        exec 'imap '. g:tcommentMapLeader1 .'i <Plug>TComment-<c-_>i'
        exec 'map '. g:tcommentMapLeader1 .'b <Plug>TComment-<c-_>b'
        exec 'imap '. g:tcommentMapLeader1 .'b <Plug>TComment-<c-_>b'
        exec 'map '. g:tcommentMapLeader1 .'a <Plug>TComment-<c-_>a'
        exec 'imap '. g:tcommentMapLeader1 .'a <Plug>TComment-<c-_>a'
        exec 'map '. g:tcommentMapLeader1 .'n <Plug>TComment-<c-_>n'
        exec 'imap '. g:tcommentMapLeader1 .'n <Plug>TComment-<c-_>n'
        exec 'map '. g:tcommentMapLeader1 .'s <Plug>TComment-<c-_>s'
        exec 'imap '. g:tcommentMapLeader1 .'s <Plug>TComment-<c-_>s'
        exec 'map '. g:tcommentMapLeader1 .'cc <Plug>TComment-<c-_>cc'
        exec 'map '. g:tcommentMapLeader1 .'ca <Plug>TComment-<c-_>ca'
        for s:i in range(1, 9)
            exec 'map '. g:tcommentMapLeader1 . s:i .' <Plug>TComment-<c-_>'.s:i
            exec 'imap '. g:tcommentMapLeader1 . s:i .' <Plug>TComment-<c-_>'.s:i
            exec 'vmap '. g:tcommentMapLeader1 . s:i .' <Plug>TComment-<c-_>'.s:i
        endfor
        unlet s:i
    endif
    if g:tcommentMapLeader2 != ''
        exec 'map '. g:tcommentMapLeader2 .'_ <Plug>TComment-<Leader>__'
        exec 'xmap '. g:tcommentMapLeader2 .'_ <Plug>TComment-<Leader>__'
        exec 'map '. g:tcommentMapLeader2 .'p <Plug>TComment-<Leader>_p'
        exec 'map '. g:tcommentMapLeader2 .'<space> <Plug>TComment-<Leader>_<space>'
        exec 'xmap '. g:tcommentMapLeader2 .'i <Plug>TComment-<Leader>_i'
        exec 'map '. g:tcommentMapLeader2 .'r <Plug>TComment-<Leader>_r'
        exec 'map '. g:tcommentMapLeader2 .'b <Plug>TComment-<Leader>_b'
        exec 'map '. g:tcommentMapLeader2 .'a <Plug>TComment-<Leader>_a'
        exec 'map '. g:tcommentMapLeader2 .'n <Plug>TComment-<Leader>_n'
        exec 'map '. g:tcommentMapLeader2 .'s <Plug>TComment-<Leader>_s'
    endif
    if g:tcommentMapLeaderOp1 != ''
        exec 'nmap <silent> '. g:tcommentMapLeaderOp1 .' <Plug>TComment-gc'
        for s:i in range(1, 9)
            exec 'nmap <silent> '. g:tcommentMapLeaderOp1 . s:i .' <Plug>TComment-gc'.s:i
        endfor
        unlet s:i
        exec 'nmap <silent> '. g:tcommentMapLeaderOp1 .'c <Plug>TComment-gcc'
        exec 'nmap <silent> '. g:tcommentMapLeaderOp1 .'b <Plug>TComment-gcb'
        exec 'xmap '. g:tcommentMapLeaderOp1 .' <Plug>TComment-gc'
    endif
   if g:tcommentMapLeaderUncommentAnyway != ''
        exec 'nmap <silent> '. g:tcommentMapLeaderUncommentAnyway .' <Plug>TComment-Uncomment'
        exec 'nmap <silent> '. g:tcommentMapLeaderUncommentAnyway .'c <Plug>TComment-Uncommentc'
        exec 'nmap <silent> '. g:tcommentMapLeaderUncommentAnyway .'b <Plug>TComment-Uncommentb'
        exec 'xmap '. g:tcommentMapLeaderUncommentAnyway .' <Plug>TComment-Uncomment'
    endif
   if g:tcommentMapLeaderCommentAnyway != ''
        exec 'nmap <silent> '. g:tcommentMapLeaderCommentAnyway .' <Plug>TComment-Comment'
        exec 'nmap <silent> '. g:tcommentMapLeaderCommentAnyway .'c <Plug>TComment-Commentc'
        exec 'nmap <silent> '. g:tcommentMapLeaderCommentAnyway .'b <Plug>TComment-Commentb'
        exec 'xmap '. g:tcommentMapLeaderCommentAnyway .' <Plug>TComment-Comment'
    endif
    if g:tcommentTextObjectInlineComment != ''
        exec 'vmap' g:tcommentTextObjectInlineComment ' <Plug>TComment-ic'
        exec 'omap' g:tcommentTextObjectInlineComment ' <Plug>TComment-ic'
    endif
endif


let &cpo = s:save_cpo
unlet s:save_cpo
" vi: ft=vim:tw=72:ts=4:fo=w2croql
autoload/tcomment.vim	[[[1
2049
" @Author:      Tom Link (mailto:micathom AT gmail com?subject=[vim])
" @Website:     http://www.vim.org/account/profile.php?user_id=4037
" @License:     GPL (see http://www.gnu.org/licenses/gpl.txt)
" @Created:     2007-09-17.
" @Last Change: 2014-06-25.
" @Revision:    1656

" call tlog#Log('Load: '. expand('<sfile>')) " vimtlib-sfile

if !exists("g:tcomment#blank_lines")
    " If 1, comment blank lines too.
    " If 2, also comment blank lines within indented code blocks 
    " (requires mixedindent -- see |tcomment#Comment()|).
    let g:tcomment#blank_lines = 2    "{{{2
endif

if !exists('g:tcomment#rstrip_on_uncomment')
    " If 1, remove right-hand whitespace on uncomment from empty lines.
    " If 2, remove right-hand whitespace on uncomment from all lines.
    let g:tcomment#rstrip_on_uncomment = 1   "{{{2
endif

if !exists("g:tcommentModeExtra")
    " Modifies how commenting works.
    "   >  ... Move the cursor to the end of the comment
    "   >> ... Like above but move the cursor to the next line
    "   #  ... Move the cursor to the position of the commented text 
    "          (NOTE: this only works when creating empty comments using 
    "          |:TCommentInline| from normal or insert mode and should 
    "          not be set here as a global option.)
    let g:tcommentModeExtra = ''   "{{{2
endif

if !exists("g:tcommentOpModeExtra")
    " Modifies how the operator works.
    " See |g:tcommentModeExtra| for a list of possible values.
    let g:tcommentOpModeExtra = ''   "{{{2
endif

if !exists('g:tcommentOptions')
    " Other key-value options used by |tcomment#Comment()|.
    "
    " Example: If you want to put the opening comment marker always in 
    " the first column regardless of the block's indentation, put this 
    " into your |vimrc| file: >
    "   let g:tcommentOptions = {'col': 1}
    let g:tcommentOptions = {}   "{{{2
endif

if !exists('g:tcomment#options_comments')
    " Additional args for |tcomment#Comment()| when using the 'comments' 
    " option.
    let g:tcomment#options_comments = {'whitespace': get(g:tcommentOptions, 'whitespace', 'both')}   "{{{2
endif

if !exists('g:tcomment#options_commentstring')
    " Additional args for |tcomment#Comment()| when using the 
    " 'commentstring' option.
    let g:tcomment#options_commentstring = {'whitespace': get(g:tcommentOptions, 'whitespace', 'both')}   "{{{2
endif

if !exists('g:tcomment#ignore_char_type')
    " |text-objects| for use with |tcomment#Operator| can have different 
    " types: line, block, char etc. Text objects like aB, it, at etc. 
    " have type char but this may not work reliably. By default, 
    " tcomment handles those text objects most often as if they were of 
    " type line. Set this variable to 0 in order to change this 
    " behaviour. Be prepared that the result may not always match your 
    " intentions.
    let g:tcomment#ignore_char_type = 1   "{{{2
endif

if !exists("g:tcommentGuessFileType")
    " Guess the file type based on syntax names always or for some fileformat only
    " If non-zero, try to guess filetypes.
    " tcomment also checks g:tcommentGuessFileType_{&filetype} for 
    " filetype specific values.
    "
    " Values:
    "   0        ... don't guess
    "   1        ... guess
    "   FILETYPE ... assume this filetype
    let g:tcommentGuessFileType = 0   "{{{2
endif
if !exists("g:tcommentGuessFileType_dsl")
    " For dsl documents, assume filetype = xml.
    let g:tcommentGuessFileType_dsl = 'xml'   "{{{2
endif
if !exists("g:tcommentGuessFileType_php")
    " In php documents, the php part is usually marked as phpRegion. We 
    " thus assume that the buffers default comment style isn't php but 
    " html.
    let g:tcommentGuessFileType_php = 'html'   "{{{2
endif
if !exists("g:tcommentGuessFileType_blade")
    " See |g:tcommentGuessFileType_php|.
    let g:tcommentGuessFileType_blade = 'html'   "{{{2
endif
if !exists("g:tcommentGuessFileType_html")
    let g:tcommentGuessFileType_html = 1   "{{{2
endif
if !exists("g:tcommentGuessFileType_tskeleton")
    let g:tcommentGuessFileType_tskeleton = 1   "{{{2
endif
if !exists("g:tcommentGuessFileType_vim")
    let g:tcommentGuessFileType_vim = 1   "{{{2
endif
if !exists("g:tcommentGuessFileType_django")
    let g:tcommentGuessFileType_django = 1   "{{{2
endif
if !exists("g:tcommentGuessFileType_eruby")
    let g:tcommentGuessFileType_eruby = 1   "{{{2
endif
if !exists("g:tcommentGuessFileType_smarty")
    let g:tcommentGuessFileType_smarty = 1   "{{{2
endif

if !exists("g:tcommentIgnoreTypes_php")
    " In php files, some syntax regions are wrongly highlighted as sql 
    " markup. We thus ignore sql syntax when guessing the filetype in 
    " php files.
    let g:tcommentIgnoreTypes_php = 'sql'   "{{{2
endif

if !exists('g:tcomment#syntax_substitute')
    " :read: let g:tcomment#syntax_substitute = {...}   "{{{2
    " Perform replacements on the syntax name.
    let g:tcomment#syntax_substitute = {
                \ '\C^javaScript\ze\(\u\|$\)': {'sub': 'javascript'},
                \ '\C^js\ze\(\u\|$\)': {'sub': 'javascript'}
                \ }
endif

if !exists('g:tcomment#filetype_map')
    " Keys must match the full |filetype|. Regexps must be |magic|. No 
    " regexp modifiers (like |\V|) are allowed.
    " let g:tcomment#filetype_map = {...}   "{{{2
    let g:tcomment#filetype_map = {
                \ 'rails-views': 'html',
                \ 'mkd': 'html',
                \ }
endif

if !exists('g:tcommentSyntaxMap')
    " tcomment guesses filetypes based on the name of the current syntax 
    " region. This works well if the syntax names match 
    " /filetypeSomeName/. Other syntax names have to be explicitly 
    " mapped onto the corresponding filetype.
    " :read: let g:tcommentSyntaxMap = {...}   "{{{2
    let g:tcommentSyntaxMap = {
            \ 'erubyExpression':   'ruby',
            \ 'vimMzSchemeRegion': 'scheme',
            \ 'vimPerlRegion':     'perl',
            \ 'vimPythonRegion':   'python',
            \ 'vimRubyRegion':     'ruby',
            \ 'vimTclRegion':      'tcl',
            \ 'Delimiter': {
            \     'filetype': {
            \         'php': 'php',
            \     },
            \ },
            \ 'phpRegionDelimiter': {
            \     'prevnonblank': [
            \         {'match': '<?php', 'filetype': 'php'},
            \         {'match': '?>', 'filetype': 'html'},
            \     ],
            \     'nextnonblank': [
            \         {'match': '?>', 'filetype': 'php'},
            \         {'match': '<?php', 'filetype': 'html'},
            \     ],
            \ },
            \ }
endif

if !exists('g:tcomment#replacements_c')
    " Replacements for c filetype.
    " :read: let g:tcomment#replacements_c = {...}   "{{{2
    let g:tcomment#replacements_c = {
                \     '/*': '#<{(|',
                \     '*/': '|)}>#',
                \ }
endif

if !exists("g:tcommentInlineC")
    " Generic c-like comments.
    " :read: let g:tcommentInlineC = {...}   "{{{2
    let g:tcommentInlineC = {
                \ 'commentstring': '/* %s */',
                \ 'rxbeg': '\*\+',
                \ 'rxend': '',
                \ 'rxmid': '',
                \ 'replacements': g:tcomment#replacements_c
                \ }
endif
if !exists("g:tcommentLineC")
    " Generic c-like block comments.
    let g:tcommentLineC = g:tcommentInlineC
endif
if !exists("g:tcommentBlockC")
    let g:tcommentBlockC = {
                \ 'commentstring': '/*%s */',
                \ 'middle': ' * ',
                \ 'rxbeg': '\*\+',
                \ 'rxend': '',
                \ 'rxmid': '',
                \ 'replacements': g:tcomment#replacements_c
                \ }
endif
if !exists("g:tcommentBlockC2")
    " Generic c-like block comments (alternative markup).
    " :read: let g:tcommentBlockC2 = {...}   "{{{2
    let g:tcommentBlockC2 = {
                \ 'commentstring': '/**%s */',
                \ 'middle': ' * ',
                \ 'rxbeg': '\*\+',
                \ 'rxend': '\*\+',
                \ 'rxmid': '\*\+',
                \ 'replacements': g:tcomment#replacements_c
                \ }
endif

if !exists('g:tcomment#replacements_xml')
    " Replacements for xml filetype.
    " :read: let g:tcomment#replacements_xml = {...}   "{{{2
    let g:tcomment#replacements_xml = {
                \     '-': '&#45;',
                \     '&': '&#38;',
                \ }
endif

if !exists("g:tcommentBlockXML")
    " Generic xml-like block comments.
    " :read: let g:tcommentBlockXML = {...}   "{{{2
    let g:tcommentBlockXML = {
                \ 'commentstring': "<!--%s-->\n  ",
                \ 'replacements': g:tcomment#replacements_xml
                \ }
endif
if !exists("g:tcommentInlineXML")
    " Generic xml-like comments.
    " :read: let g:tcommentInlineXML = {...}   "{{{2
    let g:tcommentInlineXML = {
                \ 'commentstring': "<!-- %s -->",
                \ 'replacements': g:tcomment#replacements_xml
                \ }
endif

if !exists('g:tcomment#ignore_comment_def')
    " A list of names or filetypes, which should be ignored by 
    " |tcomment#DefineType()| -- no custom comment definition will be 
    " stored for these names.
    "
    " This variable should be set before loading autoload/tcomment.vim.
    let g:tcomment#ignore_comment_def = []   "{{{2
endif

if !exists('g:tcomment#must_escape_expression_backslash')
    " Users of vim earlier than 7.3 might have to set this variable to 
    " true. Set this variable to 0, if you see unexpected "\r" char 
    " sequences in comments.
    "
    " The reommended value was `!(v:version > 702 || (v:version == 702 && has('patch407')))`.
    " It is now assumed though, that no unpatched versions of vim are in 
    " use.
    "
    " References:
    " Patch 7.2.407  when using :s with an expression backslashes are dropped
    " https://github.com/tomtom/tcomment_vim/issues/102
    let g:tcomment#must_escape_expression_backslash = 0   "{{{2
endif


let s:types_dirty = 1

let s:definitions = {}

" If you don't explicitly define a comment style, |:TComment| will use 
" 'commentstring' instead. We override the default values here in order 
" to have a blank after the comment marker. Block comments work only if 
" we explicitly define the markup.
"
" NAME usually is a 'filetype'. You can use special suffixes to define 
" special comment types. E.g. the name "FILETYPE_block" is used for 
" block comments for 'filetype'. The name "FILETYPE_inline" is used for 
" inline comments. If no specialized comment definition exists, the 
" normal one with name "FILETYPE" is used.
"
" The comment definition can be either a string or a dictionary.
"
" If it is a string:
" The format for block comments is similar to 'commentstrings' with the 
" exception that the format strings for blocks can contain a second line 
" that defines how "middle lines" (see :h format-comments) should be 
" displayed.
"
" Example: If the string is "--%s--\n-- ", lines will be commented as 
" "--%s--" but the middle lines in block comments will be commented as 
" "--%s".
"
" If it is a dictionary:
" See the help on the args argument of |tcomment#Comment| (see item 1, 
" args is a list of key=value pairs) to find out which fields can be 
" used.
" :display: tcomment#DefineType(name, commentdef, ?cdef={}, ?anyway=0)
function! tcomment#DefineType(name, commentdef, ...)
    let basename = matchstr(a:name, '^[^_]\+')
    let use = a:0 >= 2 ? a:2 : len(filter(copy(g:tcomment#ignore_comment_def), 'v:val == basename')) == 0
    " TLogVAR a:name, use
    if use
        if type(a:commentdef) == 4
            let cdef = copy(a:commentdef)
        else
            let cdef = a:0 >= 1 ? a:1 : {}
            let cdef.commentstring = a:commentdef
        endif
        let s:definitions[a:name] = cdef
    endif
    let s:types_dirty = 1
endf

" Return the comment definition for NAME.
"                                                       *b:tcomment_def_{NAME}*
" Return b:tcomment_def_{NAME} if the variable exists. Otherwise return 
" the comment definition as set with |tcomment#DefineType|.
function! tcomment#GetCommentDef(name, ...)
    if exists('b:tcomment_def_'. a:name)
        return b:tcomment_def_{a:name}
    else
        return get(s:definitions, a:name, a:0 >= 1 ? a:1 : '')
    endif
endf

" :nodoc:
" Return 1 if a comment type is defined.
function! tcomment#TypeExists(name, ...)
    let comment_mode = a:0 >= 1 ? a:1 : ''
    let name = a:name
    if comment_mode =~? 'b'
        let name .= '_block'
    elseif comment_mode =~? 'i'
        let name .= '_inline'
    endif
    return has_key(s:definitions, name) ? name : ''
endf

call tcomment#DefineType('aap',              '# %s'             )
call tcomment#DefineType('ada',              '-- %s'            )
call tcomment#DefineType('apache',           '# %s'             )
call tcomment#DefineType('asciidoc',         '// %s'            )
call tcomment#DefineType('asm',              '; %s'             )
call tcomment#DefineType('asterisk',         '; %s'             )
call tcomment#DefineType('blade',            '{{-- %s --}}'     )
call tcomment#DefineType('blade_block',      '{{-- %s --}}'     )
call tcomment#DefineType('blade_inline',     '{{-- %s --}}'     )
call tcomment#DefineType('c',                g:tcommentLineC    )
call tcomment#DefineType('c_block',          g:tcommentBlockC   )
call tcomment#DefineType('c_inline',         g:tcommentInlineC  )
call tcomment#DefineType('catalog',          '-- %s --'         )
call tcomment#DefineType('catalog_block',    "--%s--\n  "       )
call tcomment#DefineType('cfg',              '# %s'             )
call tcomment#DefineType('chromemanifest',   '# %s'             )
call tcomment#DefineType('clojure',          {'commentstring': '; %s', 'count': 2})
call tcomment#DefineType('clojure_inline',   '; %s'             )
call tcomment#DefineType('clojurescript',    ';; %s'            )
call tcomment#DefineType('clojurescript_inline', '; %s'         )
call tcomment#DefineType('cmake',            '# %s'             )
call tcomment#DefineType('coffee',           '# %s'             )
call tcomment#DefineType('conf',             '# %s'             )
call tcomment#DefineType('context',          '%% %s'            )
call tcomment#DefineType('conkyrc',          '# %s'             )
call tcomment#DefineType('cpp',              '// %s'            )
call tcomment#DefineType('cpp_block',        g:tcommentBlockC   )
call tcomment#DefineType('cpp_inline',       g:tcommentInlineC  )
call tcomment#DefineType('crontab',          '# %s'             )
call tcomment#DefineType('cs',               '// %s'            )
call tcomment#DefineType('cs_block',         g:tcommentBlockC   )
call tcomment#DefineType('cs_inline',        g:tcommentInlineC  )
call tcomment#DefineType('css',              '/* %s */'         )
call tcomment#DefineType('css_block',        g:tcommentBlockC   )
call tcomment#DefineType('css_inline',       g:tcommentInlineC  )
call tcomment#DefineType('debcontrol',       '# %s'             )
call tcomment#DefineType('debsources',       '# %s'             )
call tcomment#DefineType('desktop',          '# %s'             )
call tcomment#DefineType('dnsmasq',          '# %s'             )
call tcomment#DefineType('docbk',            g:tcommentInlineXML)
call tcomment#DefineType('docbk_block',      g:tcommentBlockXML )
call tcomment#DefineType('docbk_inline',     g:tcommentInlineXML)
call tcomment#DefineType('dosbatch',         'rem %s'           )
call tcomment#DefineType('dosini',           '; %s'             )
call tcomment#DefineType('dsl',              '; %s'             )
call tcomment#DefineType('dustjs',           '{! %s !}'         )
call tcomment#DefineType('dylan',            '// %s'            )
call tcomment#DefineType('eiffel',           '-- %s'            )
call tcomment#DefineType('elixir',           '# %s'             )
call tcomment#DefineType('erlang',           '%%%% %s'          )
call tcomment#DefineType('eruby',            '<%%# %s'          )
call tcomment#DefineType('esmtprc',          '# %s'             )
call tcomment#DefineType('expect',           '# %s'             )
call tcomment#DefineType('form',             {'commentstring': '* %s', 'col': 1})
call tcomment#DefineType('fstab',            '# %s'             )
call tcomment#DefineType('gitcommit',        '# %s'             )
call tcomment#DefineType('gitignore',        '# %s'             )
call tcomment#DefineType('gnuplot',          '# %s'             )
call tcomment#DefineType('go',               '// %s'            )
call tcomment#DefineType('go_block',         g:tcommentBlockC   )
call tcomment#DefineType('go_inline',        g:tcommentInlineC  )
call tcomment#DefineType('groovy',           '// %s'            )
call tcomment#DefineType('groovy_block',     g:tcommentBlockC   )
call tcomment#DefineType('groovy_doc_block', g:tcommentBlockC2  )
call tcomment#DefineType('groovy_inline',    g:tcommentInlineC  )
call tcomment#DefineType('gtkrc',            '# %s'             )
call tcomment#DefineType('haml',             '-# %s'            )
call tcomment#DefineType('haskell',          '-- %s'            )
call tcomment#DefineType('haskell_block',    "{-%s-}\n   "      )
call tcomment#DefineType('haskell_inline',   '{- %s -}'         )
call tcomment#DefineType('html',             g:tcommentInlineXML)
call tcomment#DefineType('html_block',       g:tcommentBlockXML )
call tcomment#DefineType('html_inline',      g:tcommentInlineXML)
call tcomment#DefineType('htmldjango',       '{# %s #}'     )
call tcomment#DefineType('htmldjango_block', "{%% comment %%}%s{%% endcomment %%}\n ")
call tcomment#DefineType('htmljinja',       '{# %s #}'     )
call tcomment#DefineType('htmljinja_block', "{%% comment %%}%s{%% endcomment %%}\n ")
call tcomment#DefineType('hy',               '; %s'             )
call tcomment#DefineType('ini',              '; %s'             ) " php ini (/etc/php5/...)
call tcomment#DefineType('io',               '// %s'            )
call tcomment#DefineType('jade',             '// %s'            )
call tcomment#DefineType('jasmine',          '# %s'             )
call tcomment#DefineType('java',             '/* %s */'         )
call tcomment#DefineType('java_block',       g:tcommentBlockC   )
call tcomment#DefineType('java_doc_block',   g:tcommentBlockC2  )
call tcomment#DefineType('java_inline',      g:tcommentInlineC  )
" call tcomment#DefineType('javaScript',       '// %s'            )
" call tcomment#DefineType('javaScript_block', g:tcommentBlockC   )
" call tcomment#DefineType('javaScript_inline', g:tcommentInlineC )
call tcomment#DefineType('javascript',       '// %s'            )
call tcomment#DefineType('javascript_block', g:tcommentBlockC   )
call tcomment#DefineType('javascript_inline', g:tcommentInlineC )
call tcomment#DefineType('jproperties',      '# %s'             )
call tcomment#DefineType('lisp',             '; %s'             )
call tcomment#DefineType('lua',              '-- %s'            )
call tcomment#DefineType('lua_block',        "--[[%s--]]\n"     )
call tcomment#DefineType('lua_inline',       '--[[%s --]]'      )
call tcomment#DefineType('lynx',             '# %s'             )
call tcomment#DefineType('m4',               'dnl %s'           )
call tcomment#DefineType('mail',             '> %s'             )
call tcomment#DefineType('matlab',           '%% %s'            )
call tcomment#DefineType('monkey',           ''' %s'            )
call tcomment#DefineType('msidl',            '// %s'            )
call tcomment#DefineType('msidl_block',      g:tcommentBlockC   )
call tcomment#DefineType('nginx',            '# %s'             )
call tcomment#DefineType('nroff',            '.\\" %s'          )
call tcomment#DefineType('noweb',            '%% %s'            )
call tcomment#DefineType('nsis',             '# %s'             )
call tcomment#DefineType('objc',             '/* %s */'         )
call tcomment#DefineType('objc_block',       g:tcommentBlockC   )
call tcomment#DefineType('objc_inline',      g:tcommentInlineC  )
call tcomment#DefineType('objcpp',           '// %s'            )
call tcomment#DefineType('ocaml',            '(* %s *)'         )
call tcomment#DefineType('ocaml_block',      "(*%s*)\n   "      )
call tcomment#DefineType('ocaml_inline',     '(* %s *)'         )
call tcomment#DefineType('pac',              '// %s'            )
call tcomment#DefineType('pascal',           '(* %s *)'         )
call tcomment#DefineType('pascal_block',     "(*%s*)\n   "      )
call tcomment#DefineType('pascal_inline',    '(* %s *)'         )
call tcomment#DefineType('perl',             '# %s'             )
call tcomment#DefineType('perl_block',       "=cut%s=cut"       )
call tcomment#DefineType('pfmain',           '# %s'             )
call tcomment#DefineType('php',              {'commentstring_rx': '\%%(//\|#\) %s', 'commentstring': '// %s'})
call tcomment#DefineType('php_2_block',      g:tcommentBlockC2  )
call tcomment#DefineType('php_block',        g:tcommentBlockC   )
call tcomment#DefineType('php_inline',       g:tcommentInlineC  )
call tcomment#DefineType('po',               '# %s'             )
call tcomment#DefineType('prolog',           '%% %s'            )
call tcomment#DefineType('puppet',           '# %s'             )
call tcomment#DefineType('purescript',       '-- %s'            )
call tcomment#DefineType('purescript_block', "{-%s-}\n   "      )
call tcomment#DefineType('purescript_inline','{- %s -}'         )
call tcomment#DefineType('python',           '# %s'             )
call tcomment#DefineType('qml',              '// %s'            )
call tcomment#DefineType('r',                '# %s'             )
call tcomment#DefineType('racket',           '; %s'             )
call tcomment#DefineType('racket_block',     '#|%s|#'           )
call tcomment#DefineType('rc',               '// %s'            )
call tcomment#DefineType('readline',         '# %s'             )
call tcomment#DefineType('remind',           {'commentstring_rx': '\[;#] %s', 'commentstring': '# %s'})
call tcomment#DefineType('resolv',           '# %s'             )
call tcomment#DefineType('robots',           '# %s'             )
call tcomment#DefineType('ruby',             '# %s'             )
call tcomment#DefineType('ruby_3',           '### %s'           )
call tcomment#DefineType('ruby_block',       "=begin rdoc%s=end")
call tcomment#DefineType('ruby_nodoc_block', "=begin%s=end"     )
call tcomment#DefineType('samba',            '# %s'             )
call tcomment#DefineType('sbs',              "' %s"             )
call tcomment#DefineType('scala',            '// %s'            )
call tcomment#DefineType('scala_block',      g:tcommentBlockC   )
call tcomment#DefineType('scala_inline',     g:tcommentInlineC  )
call tcomment#DefineType('scheme',           '; %s'             )
call tcomment#DefineType('scheme_block',     '#|%s|#'           )
call tcomment#DefineType('scss',             '// %s'            )
call tcomment#DefineType('scss_block',       g:tcommentBlockC   )
call tcomment#DefineType('scss_inline',      g:tcommentInlineC  )
call tcomment#DefineType('sed',              '# %s'             )
call tcomment#DefineType('sgml',             g:tcommentInlineXML)
call tcomment#DefineType('sgml_block',       g:tcommentBlockXML )
call tcomment#DefineType('sgml_inline',      g:tcommentInlineXML)
call tcomment#DefineType('sh',               '# %s'             )
call tcomment#DefineType('slim',             '/%s'              )
call tcomment#DefineType('sls',              '# %s'             )
call tcomment#DefineType('smarty',           '{* %s *}'         )
call tcomment#DefineType('spec',             '# %s'             )
call tcomment#DefineType('sps',              '* %s.'            )
call tcomment#DefineType('sps_block',        "* %s."            )
call tcomment#DefineType('spss',             '* %s.'            )
call tcomment#DefineType('spss_block',       "* %s."            )
call tcomment#DefineType('sql',              '-- %s'            )
call tcomment#DefineType('squid',            '# %s'             )
call tcomment#DefineType('sshconfig',        '# %s'             )
call tcomment#DefineType('sshdconfig',       '# %s'             )
call tcomment#DefineType('st',               '" %s "'           )
call tcomment#DefineType('tcl',              '# %s'             )
call tcomment#DefineType('tex',              '%% %s'            )
call tcomment#DefineType('tpl',              '<!-- %s -->'      )
call tcomment#DefineType('typoscript',       '# %s'             )
call tcomment#DefineType('upstart',          '# %s'             )
call tcomment#DefineType('vhdl',             '-- %s'            )
call tcomment#DefineType('verilog',          '// %s'            )
call tcomment#DefineType('verilog_inline',   g:tcommentInlineC  )
call tcomment#DefineType('verilog_block',    g:tcommentBlockC   )
call tcomment#DefineType('verilog_systemverilog',       '// %s' )
call tcomment#DefineType('verilog_systemverilog_block', g:tcommentBlockC)
call tcomment#DefineType('verilog_systemverilog_inline', g:tcommentInlineC)
call tcomment#DefineType('viki',             '%% %s'            )
call tcomment#DefineType('viki_3',           '%%%%%% %s'        )
call tcomment#DefineType('viki_inline',      '{cmt: %s}'        )
call tcomment#DefineType('vim',              '" %s'             )
call tcomment#DefineType('vim_3',            '""" %s'           )
call tcomment#DefineType('vimwiki',          '%%%% %s'          )
call tcomment#DefineType('websec',           '# %s'             )
call tcomment#DefineType('x86conf',          '# %s'             )
call tcomment#DefineType('xml',              g:tcommentInlineXML)
call tcomment#DefineType('xml_block',        g:tcommentBlockXML )
call tcomment#DefineType('xml_inline',       g:tcommentInlineXML)
call tcomment#DefineType('xs',               g:tcommentInlineC  )
call tcomment#DefineType('xs_block',         g:tcommentBlockC   )
call tcomment#DefineType('xslt',             g:tcommentInlineXML)
call tcomment#DefineType('xslt_block',       g:tcommentBlockXML )
call tcomment#DefineType('xslt_inline',      g:tcommentInlineXML)
call tcomment#DefineType('yaml',             '# %s'             )

" :doc:
" A dictionary of NAME => COMMENT DEFINITION (see |tcomment#DefineType|) 
" that can be set in vimrc to override tcomment's default comment 
" styles.
" :read: let g:tcomment_types = {} "{{{2
if exists('g:tcomment_types')
    for [s:name, s:def] in items(g:tcomment_types)
        call tcomment#DefineType(s:name, s:def)
    endfor
    unlet! s:name s:def
endif


function! s:DefaultValue(option)
    exec 'let '. a:option .' = &'. a:option
    exec 'set '. a:option .'&'
    exec 'let default = &'. a:option
    exec 'let &'. a:option .' = '. a:option
    return default
endf


let s:default_comments       = s:DefaultValue('comments')
let s:default_comment_string = s:DefaultValue('commentstring')
let s:null_comment_string    = '%s'

" tcomment#Comment(line1, line2, ?comment_mode, ?comment_anyway, ?args...)
" args... are either:
"   1. a list of key=value pairs where known keys are (see also 
"      |g:tcommentOptions|):
"         as=STRING        ... Use a specific comment definition
"         count=N          ... Repeat the comment string N times
"         col=N            ... Start the comment at column N (in block 
"                              mode; must be smaller than |indent()|)
"         mode=STRING      ... See the notes below on the "comment_mode" argument
"         mode_extra=STRING ... Add to comment_mode
"         begin=STRING     ... Comment prefix
"         end=STRING       ... Comment postfix
"         middle=STRING    ... Middle line comments in block mode
"         rxbeg=N          ... Regexp to find the substring of "begin" 
"                              that should be multiplied by "count"
"         rxend=N          ... The above for "end"
"         rxmid=N          ... The above for "middle"
"         mixedindent=BOOL ... If true, allow use of mixed 
"                              characters for indentation
"         commentstring_rx ... A regexp format string that matches 
"                              commented lines (no new groups may be 
"                              introduced, the |regexp| is |\V|; % have 
"                              to be doubled); "commentstring", "begin" 
"                              and optionally "end" must be defined or 
"                              deducible.
"         whitespace       ... Define whether commented text is 
"                              surrounded with whitespace; if
"                              both ... surround with whitespace (default)
"                              left ... keep whitespace on the left
"                              right... keep whitespace on the right
"                              no   ... don't use whitespace
"         strip_whitespace ... Strip trailing whitespace: if 1 
"                              (default), strip from empty lines only, 
"                              if 2, always strip whitespace; if 0, 
"                              don't strip any whitespace
"   2. 1-2 values for: ?commentPrefix, ?commentPostfix
"   3. a dictionary (internal use only)
"
" comment_mode (see also ¦g:tcommentModeExtra¦):
"   G ... guess the value of comment_mode
"   B ... block (use extra lines for the comment markers)
"   L ... lines
"   i ... maybe inline, guess
"   I ... inline
"   R ... right (comment the line right of the cursor)
"   v ... visual
"   o ... operator
"   C ... force comment
"   U ... force uncomment (if U and C are present, U wins)
" By default, each line in range will be commented by adding the comment 
" prefix and postfix.
function! tcomment#Comment(beg, end, ...)
    let comment_mode0  = s:AddModeExtra((a:0 >= 1 ? a:1 : 'G'), g:tcommentModeExtra, a:beg, a:end)
    let comment_mode   = comment_mode0
    let comment_anyway = a:0 >= 2 ? (a:2 == '!') : 0
    " TLogVAR a:beg, a:end, comment_mode, comment_anyway
    " save the cursor position
    if exists('w:tcomment_pos')
        let s:current_pos = copy(w:tcomment_pos)
    else
        let s:current_pos = getpos('.')
    endif
    " echom "DBG current_pos=" string(s:current_pos)
    let cursor_pos = getpos("'>")
    " TLogVAR cursor_pos
    let s:cursor_pos = []
    if comment_mode =~# 'i'
        let blnum = line("'<")
        if blnum == line("'>")
            if virtcol('.') <= indent(blnum)
                let i_mode = 'G'
            else
                let i_mode = 'I'
            endif
        else
            let i_mode = 'G'
        endif
        let comment_mode = substitute(comment_mode, '\Ci', i_mode, 'g')
        " TLogVAR 1, comment_mode
    endif
    let [lbeg, cbeg, lend, cend] = s:GetStartEnd(a:beg, a:end, comment_mode)
    " TLogVAR lbeg, cbeg, lend, cend, virtcol('$')
    if comment_mode ==? 'I' && comment_mode0 =~# 'i' && lbeg == lend && cend >= virtcol('$') - 1
        if cbeg <= 1
            let comment_mode = 'G'
        else
            let comment_mode = 'R'
        endif
        " TLogVAR comment_mode
    endif
    let mode_extra = s:GetTempOption('mode_extra', '')
    " TLogVAR mode_extra
    if !empty(mode_extra)
        let comment_mode = s:AddModeExtra(comment_mode, mode_extra, lbeg, lend)
        " TLogVAR "mode_extra", comment_mode
        unlet s:temp_options.mode_extra
    endif
    " get the correct commentstring
    let cdef = copy(g:tcommentOptions)
    " TLogVAR 1, cdef
    if exists('b:tcommentOptions')
        let cdef = extend(cdef, copy(b:tcommentOptions))
        " TLogVAR 2, cdef
    endif
    if a:0 >= 3 && type(a:3) == 4
        call extend(cdef, a:3)
        " TLogVAR 3, cdef
    else
        let cdef0 = s:GetCommentDefinition(lbeg, lend, comment_mode)
        " TLogVAR 4.1, cdef, cdef0
        call extend(cdef, cdef0)
        " TLogVAR 4.2, cdef
        let ax = 3
        if a:0 >= 3 && a:3 != '' && stridx(a:3, '=') == -1
            let ax = 4
            let cdef.begin = a:3
            if a:0 >= 4 && a:4 != '' && stridx(a:4, '=') == -1
                let ax = 5
                let cdef.end = a:4
            endif
        endif
        " TLogVAR ax, a:0, a:000
        if a:0 >= ax
            let cdef = extend(cdef, s:ParseArgs(lbeg, lend, comment_mode, a:000[ax - 1 : -1]))
            " TLogVAR 5, cdef
        endif
        if !empty(get(cdef, 'begin', '')) || !empty(get(cdef, 'end', ''))
            let cdef.commentstring = s:EncodeCommentPart(get(cdef, 'begin', ''))
                        \ . '%s'
                        \ . s:EncodeCommentPart(get(cdef, 'end', ''))
        endif
        let comment_mode = cdef.mode
        " TLogVAR 2, comment_mode
    endif
    if empty(comment_mode)
        echohl WarningMsg
        echo "TComment: Comment mode is not supported for the current filetype"
        echohl NONE
        return
    endif
    if exists('s:temp_options')
        let cdef = s:ExtendCDef(lbeg, lend, comment_mode, cdef, s:temp_options)
        " TLogVAR 6, cdef
        " echom "DBG s:temp_options" string(s:temp_options)
        unlet s:temp_options
    endif
    " TLogVAR 7, cdef
    if has_key(cdef, 'whitespace')
        call s:SetWhitespaceMode(cdef)
    endif
    if !empty(filter(['count', 'cbeg', 'cend', 'cmid'], 'has_key(cdef, v:val)'))
        call s:RepeatCommentstring(cdef)
    endif
    " echom "DBG" string(a:000)
    let cms0 = s:BlockGetCommentRx(cdef)
    " TLogVAR cms0
    "" make whitespace optional; this conflicts with comments that require some 
    "" whitespace
    let cmt_check = substitute(cms0, '\([	 ]\)', '\1\\?', 'g')
    "" turn commentstring into a search pattern
    " TLogVAR cmt_check
    let cmt_check = printf(cmt_check, '\(\_.\{-}\)')
    " TLogVAR cdef, cmt_check
    let s:cdef = cdef
    " set comment_mode
    let [lbeg, lend, uncomment] = s:CommentDef(lbeg, lend, cmt_check, comment_mode, cbeg, cend)
    " TLogVAR lbeg, lend, cbeg, cend, uncomment
    " echom "DBG" string(s:cdef)
    let cbeg = get(s:cdef, 'col', cbeg)
    " TLogVAR cbeg
    if mode_extra =~# 'U'
        let uncomment = 1
    elseif mode_extra =~# 'C' || comment_anyway
        let uncomment = 0
    endif
    " TLogVAR comment_anyway, mode_extra, uncomment
    " go
    " TLogVAR comment_mode
    if comment_mode =~# 'B'
        " We want a comment block
        call s:CommentBlock(lbeg, lend, cbeg, cend, comment_mode, uncomment, cmt_check, s:cdef)
    else
        " We want commented lines
        " final search pattern for uncommenting
        let cmt_check   = '\V\^\(\s\{-}\)'. cmt_check .'\$'
        " let cmt_check   = escape(cmt_check, '"/\')
        " final pattern for commenting
        let cmt_replace = s:GetCommentReplace(s:cdef, cms0)
        " TLogVAR cmt_replace
        " TLogVAR comment_mode, lbeg, cbeg, lend, cend
        let s:processline_lnum = lbeg
        let end_rx = s:EndPosRx(comment_mode, lend, cend)
        let postfix_rx = end_rx == '\$' ? '' : '\.\*\$'
        let prefix_rx = '\^\.\{-}' . s:StartPosRx(comment_mode, lbeg, cbeg)
        let comment_rx = '\V'
                    \ . '\('. prefix_rx . '\)'
                    \ .'\('
                    \ .'\(\_.\{-}\)'
                    \ . end_rx
                    \ .'\)'
                    \ .'\(' . postfix_rx . '\)'
        " TLogVAR comment_rx, prefix_rx, end_rx, postfix_rx
        " let @x = comment_rx " DBG
        for lnum in range(lbeg, lend)
            let line0 = getline(lnum)
            " TLogVAR line0
            let lmatch = matchlist(line0, comment_rx)
            " TLogVAR lmatch
            if empty(lmatch) && g:tcomment#blank_lines >= 2
                let lline0 = s:Strdisplaywidth(line0)
                " TLogVAR lline0, cbeg
                if lline0 < cbeg
                    let line0 = line0 . repeat(' ', cbeg - lline0)
                    let lmatch = [line0, line0, '', '', '']
                    " TLogVAR 'padded', line0, lmatch
                endif
            endif
            if !empty(lmatch)
                let part1 = s:ProcessLine(uncomment, lmatch[2], cmt_check, cmt_replace)
                " TLogVAR part1
                let line1 = lmatch[1] . part1 . lmatch[4]
                if uncomment && g:tcomment#rstrip_on_uncomment > 0
                    if g:tcomment#rstrip_on_uncomment == 2 || line1 !~ '\S'
                        let line1 = substitute(line1, '\s\+$', '', '')
                    endif
                endif
                " TLogVAR line1
                call setline(lnum, line1)
            endif
        endfor
    endif
    " reposition cursor
    " TLogVAR 3, comment_mode
    " echom "DBG s:cursor_pos" string(s:cursor_pos)
    if !empty(s:cursor_pos)
        let cursor_pos = s:cursor_pos
    endif
    if comment_mode =~ '>'
        call setpos('.', cursor_pos)
        if comment_mode !~ 'i' && comment_mode =~ '>>'
            norm! l^
        endif
    elseif comment_mode =~ '#'
        call setpos('.', cursor_pos)
        if exists('w:tcomment_pos')
            let w:tcomment_pos = cursor_pos
        endif
    else
        call setpos('.', s:current_pos)
    endif
    unlet! s:cursor_pos s:current_pos s:cdef
endf


if v:version >= 703
    function! s:Strdisplaywidth(...) "{{{3
        return call('strdisplaywidth', a:000)
    endf
else
    function! s:Strdisplaywidth(string, ...) "{{{3
        " NOTE: Col argument is ignored
        return strlen(substitute(a:string, ".", "x", "g"))
    endf
endif


function! s:GetTempOption(name, default) "{{{3
    if exists('s:temp_options') && has_key(s:temp_options, a:name)
        return s:temp_options[a:name]
    else
        return a:default
    endif
endf


function! tcomment#SetOption(name, arg) "{{{3
    " TLogVAR a:name, a:arg
    if !exists('s:temp_options')
        let s:temp_options = {}
    endif
    " if index(['count', 'as'], a:name) != -1
        if empty(a:arg)
            if has_key(s:temp_options, a:name)
                call remove(s:temp_options, a:name)
            endif
        else
            let s:temp_options[a:name] = a:arg
        endif
    " endif
endf


function! s:GetStartEnd(beg, end, comment_mode) "{{{3
    " TLogVAR a:beg, a:end, a:comment_mode
    if type(a:beg) == 3
        let [lbeg, cbeg] = a:beg
        let [lend, cend] = a:end
    else
        let lbeg = a:beg
        let lend = a:end
        let comment_mode = a:comment_mode
        " TLogVAR comment_mode
        if comment_mode =~# 'R'
            let cbeg = virtcol('.')
            let cend = virtcol('$')
            let comment_mode = substitute(comment_mode, '\CR', 'G', 'g')
            " TLogVAR 'R', cbeg, cend, comment_mode
        elseif comment_mode =~# 'I'
            let cbeg = virtcol("'<")
            if cbeg == 0
                let cbeg = virtcol('.')
            endif
            let cend = virtcol("'>")
            if cend < virtcol('$') && (comment_mode =~# 'o' || &selection == 'inclusive')
                let cend += 1
                " TLogVAR cend, virtcol('$')
            endif
            " TLogVAR 'I', cbeg, cend, comment_mode
        else
            let cbeg = -1
            let cend = 0
            for lnum in range(a:beg, a:end)
                if getline(lnum) =~ '\S'
                    let indentwidth = indent(lnum)
                    " TLogVAR cbeg, lnum, indentwidth, getline(lnum)
                    if cbeg == -1 || indentwidth < cbeg
                        let cbeg = indentwidth
                    endif
                endif
            endfor
            if cbeg == -1
                let cbeg = 0
            endif
        endif
    endif
    " TLogVAR lbeg, cbeg, lend, cend
    if lend < lbeg || (lend == lbeg && cend > 0 && cend < cbeg)
        return [lend, cend, lbeg, cbeg]
    else
        return [lbeg, cbeg, lend, cend]
    endif
endf


function! s:SetWhitespaceMode(cdef) "{{{3
    let mode = a:cdef.whitespace
    let cms = s:BlockGetCommentString(a:cdef)
    let mid = s:BlockGetMiddleString(a:cdef)
    let cms0 = cms
    let mid0 = mid
    " TLogVAR mode, cms, mid
    if mode =~ '^\(n\%[o]\|l\%[eft]\|r\%[ight]\)$'
        " Remove whitespace on the left
        if mode =~ '^n\%[o]$' || mode =~ '^r\%[ight]$'
            let cms = substitute(cms, '\s\+\ze%\@<!%s', '', 'g')
            let mid = substitute(mid, '\s\+\ze%\@<!%s', '', 'g')
        endif
        " Remove whitespace on the right
        if mode =~ '^n\%[o]$' || mode =~ '^l\%[eft]$'
            let cms = substitute(cms, '%\@<!%s\zs\s\+', '', 'g')
            let mid = substitute(mid, '%\@<!%s\zs\s\+', '', 'g')
        endif
        if mode =~ '^l\%[eft]$'
            if mid !~ '%s'
                let mid .= ' '
            endif
        endif
    elseif mode =~ '^\(b\%[oth]\)$'
        let cms = substitute(cms, '\S\zs\ze%\@<!%s', ' ', 'g')
        let cms = substitute(cms, '%\@<!%s\zs\ze\S', ' ', 'g')
        if mid =~ '%s'
            let mid = substitute(mid, '\S\zs\ze%\@<!%s', ' ', 'g')
            let mid = substitute(mid, '%\@<!%s\zs\ze\S', ' ', 'g')
        else
            let mid .= ' '
        endif
    endif
    if cms != cms0
        " TLogVAR cms
        let a:cdef.commentstring = cms
    endif
    if mid != mid0
        " TLogVAR mid
        let a:cdef.middle = mid
    endif
    " TLogVAR a:cdef
    return a:cdef
endf


function! s:RepeatCommentstring(cdef) "{{{3
    " TLogVAR a:cdef
    let cms = s:BlockGetCommentString(a:cdef)
    let mid = s:BlockGetMiddleString(a:cdef)
    let cms_fbeg = match(cms, '\s*%\@<!%s')
    let cms_fend = matchend(cms, '%\@<!%s\s*')
    let rxbeg = get(a:cdef, 'rxbeg', '^.*$')
    let rxend = get(a:cdef, 'rxend', '^.*$')
    let rpbeg = repeat('&', get(a:cdef, 'cbeg', get(a:cdef, 'count', 1)))
    let rpend = repeat('&', get(a:cdef, 'cend', get(a:cdef, 'count', 1)))
    let cmsbeg = cms[0 : cms_fbeg - 1]
    if !empty(rxbeg)
        let cmsbeg = substitute(cmsbeg, rxbeg, rpbeg, '')
    endif
    let cmsend = cms[cms_fend : -1]
    if !empty(rxend)
        let cmsend = substitute(cmsend, rxend, rpend, '')
    endif
    let a:cdef.commentstring = cmsbeg . cms[cms_fbeg : cms_fend - 1] . cmsend
    " TLogVAR cms, a:cdef.commentstring
    if !empty(mid)
        let rxmid = get(a:cdef, 'rxmid', '^.*$')
        if empty(rxmid)
            let a:cdef.middle = mid
        else
            let rpmid = repeat('&', get(a:cdef, 'cmid', get(a:cdef, 'count', 1)))
            let a:cdef.middle = substitute(mid, rxmid, rpmid, '')
            " TLogVAR mid, a:cdef.middle
        endif
    endif
    return a:cdef
endf


function! s:ParseArgs(beg, end, comment_mode, arglist) "{{{3
    let args = {}
    for arg in a:arglist
        let key = matchstr(arg, '^[^=]\+')
        let value = matchstr(arg, '=\zs.*$')
        if !empty(key)
            let args[key] = value
        endif
    endfor
    return s:ExtendCDef(a:beg, a:end, a:comment_mode, {}, args)
endf


function! s:ExtendCDef(beg, end, comment_mode, cdef, args)
    for [key, value] in items(a:args)
        if key == 'as'
            call extend(a:cdef, s:GetCommentDefinitionForType(a:beg, a:end, a:comment_mode, value))
        elseif key == 'mode'
            let a:cdef[key] = a:comment_mode . value
        elseif key == 'count'
            let a:cdef[key] = str2nr(value)
        else
            let a:cdef[key] = value
        endif
    endfor
    return a:cdef
endf


function! tcomment#Operator(type, ...) "{{{3
    let type = a:type
    let comment_mode = a:0 >= 1 ? a:1 : ''
    let bang = a:0 >= 2 ? a:2 : ''
    " TLogVAR type, comment_mode, bang
    if !exists('w:tcomment_pos')
        let w:tcomment_pos = getpos(".")
    endif
    let sel_save = &selection
    set selection=inclusive
    let reg_save = @@
    try
        if type == 'line'
            silent exe "normal! '[V']"
            let comment_mode1 = 'G'
        elseif type == 'block'
            silent exe "normal! `[\<C-V>`]"
            let comment_mode1 = 'I'
        elseif type == 'char'
            silent exe "normal! `[v`]"
            let comment_mode1 = 'I'
        else
            silent exe "normal! `[v`]"
            let comment_mode1 = 'i'
        endif
        if empty(comment_mode)
            let comment_mode = comment_mode1
        endif
        let lbeg = line("'[")
        let lend = line("']")
        let cend = virtcol("']")
        if type == 'char'
            if lbeg == lend && cend >= virtcol('$') - 1
                let comment_mode = 'R'
            elseif g:tcomment#ignore_char_type && lbeg != lend
                silent exe "normal! '[V']"
                let cend = virtcol("']")
                let comment_mode = 'G'
                let type = 'line'
            endif
        endif
        let cbeg = virtcol("'[")
        " TLogVAR comment_mode, comment_mode1, lbeg, lend, cbeg, cend, virtcol('$')
        " TLogVAR comment_mode
        " echom "DBG tcomment#Operator" lbeg virtcol("'[") virtcol("'<") lend virtcol("']") virtcol("'>")
        norm! 
        let comment_mode = s:AddModeExtra(comment_mode, g:tcommentOpModeExtra, lbeg, lend)
        " TLogVAR comment_mode, type
        "  if type =~ 'line\|block' || g:tcomment#ignore_char_type
        " if comment_mode =~# '[R]'
        "     call tcomment#Comment([lbeg, cbeg], [lend, cend], comment_mode.'o', bang)
        " elseif type =~ 'line\|block' || g:tcomment#ignore_char_type
        if type =~ 'line\|block'
            call tcomment#Comment(lbeg, lend, comment_mode.'o', bang)
        else
            call tcomment#Comment([lbeg, cbeg], [lend, cend], comment_mode.'o', bang)
        endif
    finally
        let &selection = sel_save
        let @@ = reg_save
        " TLogVAR g:tcommentOpModeExtra
        if g:tcommentOpModeExtra !~ '[#>]'
            if exists('w:tcomment_pos')
                " TLogVAR w:tcomment_pos
                if w:tcomment_pos != getpos('.')
                    call setpos('.', w:tcomment_pos)
                endif
                unlet! w:tcomment_pos
            else
                echohl WarningMsg
                echom "TComment: w:tcomment_pos wasn't set. Please report this to the plugin author"
                echohl NONE
            endif
        endif
    endtry
endf


function! tcomment#OperatorLine(type) "{{{3
    " TLogVAR a:type
    call tcomment#Operator('line', 'L')
endf


function! tcomment#OperatorAnyway(type) "{{{3
    " TLogVAR a:type
    call tcomment#Operator(a:type, '', '!')
endf


function! tcomment#OperatorLineAnyway(type) "{{{3
    " TLogVAR a:type
    call tcomment#Operator('line', 'L', '!')
endf


" :display: tcomment#CommentAs(beg, end, comment_anyway, filetype, ?args...)
" Where args is either:
"   1. A count NUMBER
"   2. An args list (see the notes on the "args" argument of 
"      |tcomment#Comment()|)
" comment text as if it were of a specific filetype
function! tcomment#CommentAs(beg, end, comment_anyway, filetype, ...)
    if a:filetype =~ '_block$'
        let comment_mode = 'B'
        let ft = substitute(a:filetype, '_block$', '', '')
    elseif a:filetype =~ '_inline$'
        let comment_mode = 'I'
        let ft = substitute(a:filetype, '_inline$', '', '')
    else 
        let comment_mode = 'G'
        let ft = a:filetype
    endif
    if a:0 >= 1
        if type(a:1) == 0
            let cdef = {'count': a:0 >= 1 ? a:1 : 1}
        else
            let cdef = s:ParseArgs(a:beg, a:end, comment_mode, a:000)
        endif
    else
        let cdef = {}
    endif
    " echom "DBG" string(cdef)
    call extend(cdef, s:GetCommentDefinitionForType(a:beg, a:end, comment_mode, ft))
    keepjumps call tcomment#Comment(a:beg, a:end, comment_mode, a:comment_anyway, cdef)
endf


" collect all known comment types
" :nodoc:
function! tcomment#CollectFileTypes()
    if s:types_dirty
        let s:types = keys(s:definitions)
        let s:types_rx = '\V\^\('. join(s:types, '\|') .'\)\(\u\.\*\)\?\$'
        let s:types_dirty = 0
    endif
endf

call tcomment#CollectFileTypes()


" return a list of filetypes for which a tcomment_{&ft} is defined
" :nodoc:
function! tcomment#Complete(ArgLead, CmdLine, CursorPos) "{{{3
    call tcomment#CollectFileTypes()
    let completions = copy(s:types)
    let filetype = s:Filetype()
    if index(completions, filetype) != -1
        " TLogVAR filetype
        call insert(completions, filetype)
    endif
    if !empty(a:ArgLead)
        call filter(completions, 'v:val =~ ''\V\^''.a:ArgLead')
    endif
    let completions += tcomment#CompleteArgs(a:ArgLead, a:CmdLine, a:CursorPos)
    return completions
endf


let s:first_completion = 0

" :nodoc:
function! tcomment#CompleteArgs(ArgLead, CmdLine, CursorPos) "{{{3
    if v:version < 703 && !s:first_completion
        redraw
        let s:first_completion = 1
    endif
    let completions = ['as=', 'col=', 'count=', 'mode=', 'begin=', 'end=', 'rxbeg=', 'rxend=', 'rxmid=']
    if !empty(a:ArgLead)
        if a:ArgLead =~ '^as='
            call tcomment#CollectFileTypes()
            let completions += map(copy(s:types), '"as=". v:val')
        endif
        call filter(completions, 'v:val =~ ''\V\^''.a:ArgLead')
    endif
    return completions
endf


function! s:EncodeCommentPart(string)
    return substitute(a:string, '%', '%%', 'g')
endf


function! s:GetCommentDefinitionForType(beg, end, comment_mode, filetype) "{{{3
    let cdef = s:GetCommentDefinition(a:beg, a:end, a:comment_mode, a:filetype)
    " TLogVAR cdef
    let cms  = cdef.commentstring
    let comment_mode = cdef.mode
    let pre  = substitute(cms, '%\@<!%s.*$', '', '')
    let pre  = substitute(pre, '%%', '%', 'g')
    let post = substitute(cms, '^.\{-}%\@<!%s', '', '')
    let post = substitute(post, '%%', '%', 'g')
    let cdef.begin = pre
    let cdef.end   = post
    return cdef
endf


" s:GetCommentDefinition(beg, end, comment_mode, ?filetype="")
function! s:GetCommentDefinition(beg, end, comment_mode, ...)
    let ft = a:0 >= 1 ? a:1 : ''
    " TLogVAR ft
    if ft != ''
        let cdef = s:GuessCustomCommentString(ft, a:comment_mode)
    else
        let cdef = {'mode': a:comment_mode}
    endif
    " TLogVAR cdef
    let cms = get(cdef, 'commentstring', '')
    if empty(cms)
        let filetype = s:Filetype(ft)
        if exists('b:commentstring')
            let cms = b:commentstring
            " TLogVAR 1, cms
            return s:GuessCustomCommentString(filetype, a:comment_mode, cms)
        elseif exists('b:commentStart') && b:commentStart != ''
            let cms = s:EncodeCommentPart(b:commentStart) .' %s'
            " TLogVAR 2, cms
            if exists('b:commentEnd') && b:commentEnd != ''
                let cms = cms .' '. s:EncodeCommentPart(b:commentEnd)
            endif
            return s:GuessCustomCommentString(filetype, a:comment_mode, cms)
        else
            let [use_guess_ft, altFiletype] = s:AltFiletype(ft)
            " TLogVAR use_guess_ft, altFiletype
            if use_guess_ft
                return s:GuessFileType(a:beg, a:end, a:comment_mode, filetype, altFiletype)
            else
                let guess_cdef = s:GuessVimOptionsCommentString(a:comment_mode)
                " TLogVAR guess_cdef
                return s:GuessCustomCommentString(filetype, a:comment_mode, guess_cdef.commentstring, guess_cdef)
            endif
        endif
        let cdef.commentstring = cms
    endif
    return cdef
endf


function! s:StartPosRx(comment_mode, line, col)
    " TLogVAR a:comment_mode, a:line, a:col
    " if a:comment_mode =~# 'I'
    "     return s:StartLineRx(a:line) . s:StartColRx(a:comment_mode, a:col)
    " else
        let rv = s:StartColRx(a:comment_mode, a:col)
    " endif
    " TLogVAR rv
    return rv
endf


function! s:EndPosRx(comment_mode, lnum, col)
    " TLogVAR a:comment_mode, a:lnum, a:col
    " if a:comment_mode =~# 'I'
    "     return s:EndLineRx(a:lnum) . s:EndColRx(a:col)
    " else
        return s:EndColRx(a:comment_mode, a:lnum, a:col)
    " endif
endf


function! s:StartLineRx(pos)
    return '\%'. a:pos .'l'
endf


function! s:EndLineRx(pos)
    return '\%'. a:pos .'l'
endf


function! s:StartColRx(comment_mode, col, ...)
    let mixedindent = a:0 >= 1 ? a:1 : get(s:cdef, 'mixedindent', 1)
    " TLogVAR a:comment_mode, a:col, mixedindent
    if a:comment_mode =~# '[IR]'
        let col = mixedindent ? a:col - 1 : a:col
        let c0 = 1
    else
        let col = a:col
        let c0 = 2
    endif
    " TLogVAR col, c0, mixedindent
    if col < c0
        return '\^'
    elseif mixedindent
        return '\%>'. col .'v'
    else
        return '\%'. col .'v'
    endif
endf


function! s:EndColRx(comment_mode, lnum, pos)
    " TLogVAR a:comment_mode, a:lnum, a:pos
    let line = getline(a:lnum)
    let cend = s:Strdisplaywidth(line)
    " TLogVAR cend
    if a:pos == 0 || a:pos >= cend
        return '\$'
    else
        if a:comment_mode =~? 'i' && a:comment_mode =~# 'o'
            let mod = '>'
        else
            let mod = ''
        endif
        " TLogVAR &selection, mod
        return '\%'. mod . a:pos .'v'
    endif
endf


function! s:CommentDef(beg, end, checkRx, comment_mode, cbeg, cend)
    " TLogVAR a:beg, a:end, a:checkRx, a:comment_mode, a:cbeg, a:cend
    let beg = a:beg
    let end = a:end
    if get(s:cdef, 'mixedindent', 1)
        let mdrx = '\V'. s:StartColRx(a:comment_mode, a:cbeg) .'\s\*'
        let mdrx .= s:StartColRx(a:comment_mode, a:cbeg + 1, 0) .'\s\*'
    else
        let mdrx = '\V'. s:StartColRx(a:comment_mode, a:cbeg) .'\s\*'
    endif
    let mdrx .= a:checkRx .'\s\*'. s:EndColRx(a:comment_mode, a:end, 0)
    " let mdrx = '\V'. s:StartPosRx(a:comment_mode, beg, a:cbeg) .'\s\*'. a:checkRx .'\s\*'. s:EndPosRx(a:comment_mode, end, 0)
    " TLogVAR mdrx
    let line = getline(beg)
    if a:cbeg != 0 && a:cend != 0
        let line = strpart(line, 0, a:cend - 1)
    endif
    let uncomment = (line =~ mdrx)
    " TLogVAR 1, uncomment, line
    let n  = beg + 1
    if a:comment_mode =~# 'G'
        if uncomment
            while n <= end
                if getline(n) =~ '\S'
                    if !(getline(n) =~ mdrx)
                        let uncomment = 0
                        " TLogVAR 2, uncomment
                        break
                    endif
                endif
                let n = n + 1
            endwh
        endif
    elseif a:comment_mode =~# 'B'
        let t = @t
        try
            silent exec 'norm! '. beg.'G1|v'.end.'G$"ty'
            if &selection == 'inclusive' && @t =~ '\n$' && len(@t) > 1
                let @t = @t[0 : -2]
            endif
            " TLogVAR @t, mdrx
            let uncomment = (@t =~ mdrx)
            " TLogVAR 3, uncomment
            if !uncomment && a:comment_mode =~ 'o'
                let mdrx1 = substitute(mdrx, '\\$$', '\\n\\$', '')
                " TLogVAR mdrx1
                if @t =~ mdrx1
                    let uncomment = 1
                    " TLogVAR 4, uncomment
                endif
            endif
        finally
            let @t = t
        endtry
    endif
    " TLogVAR 5, uncomment
    return [beg, end, uncomment]
endf


function! s:ProcessLine(uncomment, match, checkRx, replace)
    " TLogVAR a:uncomment, a:match, a:checkRx, a:replace
    try
        if !(g:tcomment#blank_lines > 0 || a:match =~ '\S')
            return a:match
        endif
        if a:uncomment
            let rv = substitute(a:match, a:checkRx, '\1\2', '')
            let rv = s:UnreplaceInLine(rv)
        else
            let ml = len(a:match)
            let rv = s:ReplaceInLine(a:match)
            let rv = printf(a:replace, rv)
            let strip_whitespace = get(s:cdef, 'strip_whitespace', 1)
            if strip_whitespace == 2 || (strip_whitespace == 1 && ml == 0)
                let rv = substitute(rv, '\s\+$', '', '')
            endif
        endif
        " TLogVAR rv
        " echom "DBG s:cdef.mode=" string(s:cdef.mode) "s:cursor_pos=" string(s:cursor_pos)
        if s:cdef.mode =~ '>'
            let s:cursor_pos = getpos('.')
            let s:cursor_pos[2] += len(rv)
        elseif s:cdef.mode =~ '#'
            if empty(s:cursor_pos) || s:current_pos[1] == s:processline_lnum
                let prefix = matchstr(a:replace, '^.*%\@<!\ze%s')
                let prefix = substitute(prefix, '%\(.\)', '\1', 'g')
                let prefix_len = s:Strdisplaywidth(prefix)
                " TLogVAR a:replace, prefix_len
                if prefix_len != -1
                    let s:cursor_pos = copy(s:current_pos)
                    if a:uncomment
                        let s:cursor_pos[2] -= prefix_len
                        if s:cursor_pos[2] < 1
                            let s:cursor_pos[2] = 1
                        endif
                    else
                        let s:cursor_pos[2] += prefix_len
                    endif
                    " echom "DBG s:current_pos=" string(s:current_pos) "s:cursor_pos=" string(s:cursor_pos)
                endif
            endif
        endif
        " TLogVAR rv
        if g:tcomment#must_escape_expression_backslash
            let rv = escape(rv, "\\r")
        else
            let rv = escape(rv, "\r")
        endif
        " TLogVAR rv
        " let rv = substitute(rv, '\n', '\\\n', 'g')
        " TLogVAR rv
        return rv
    finally
        let s:processline_lnum += 1
    endtry
endf


function! s:ReplaceInLine(text) "{{{3
    if has_key(s:cdef, 'replacements')
        let replacements = s:cdef.replacements
        return s:DoReplacements(a:text, keys(replacements), values(replacements))
    else
        return a:text
    endif
endf


function! s:UnreplaceInLine(text) "{{{3
    if has_key(s:cdef, 'replacements')
        let replacements = s:cdef.replacements
        return s:DoReplacements(a:text, values(replacements), keys(replacements))
    else
        return a:text
    endif
endf


function! s:DoReplacements(text, tokens, replacements) "{{{3
    if empty(a:tokens)
        return a:text
    else
        let rx = '\V\('. join(map(a:tokens, 'escape(v:val, ''\'')'), '\|') .'\)'
        let texts = split(a:text, rx .'\zs', 1)
        let texts = map(texts, 's:InlineReplacement(v:val, rx, a:tokens, a:replacements)')
        let text = join(texts, '')
        return text
    endif
endf


function! s:InlineReplacement(text, rx, tokens, replacements) "{{{3
    " TLogVAR a:text, a:rx, a:replacements
    let matches = split(a:text, '\ze'. a:rx .'\$', 1)
    if len(matches) == 1
        return a:text
    else
        let match = matches[-1]
        let idx = index(a:tokens, match)
        " TLogVAR matches, match, idx
        if idx != -1
            let matches[-1] = a:replacements[idx]
            " TLogVAR matches
            return join(matches, '')
        else
            throw 'TComment: Internal error: cannot find '. string(match) .' in '. string(a:tokens)
        endif
    endif
endf


function! s:CommentBlock(beg, end, cbeg, cend, comment_mode, uncomment, checkRx, cdef)
    " TLogVAR a:beg, a:end, a:cbeg, a:cend, a:uncomment, a:checkRx, a:cdef
    let indentStr = repeat(' ', a:cbeg)
    let t = @t
    let sel_save = &selection
    set selection=exclusive
    try
        silent exec 'norm! '. a:beg.'G1|v'.a:end.'G$"td'
        " TLogVAR @t
        let ms = s:BlockGetMiddleString(a:cdef)
        let mx = escape(ms, '\')
        let cs = s:BlockGetCommentString(a:cdef)
        let prefix = substitute(matchstr(cs, '^.*%\@<!\ze%s'), '%\(.\)', '\1', 'g')
        let postfix = substitute(matchstr(cs, '%\@<!%s\zs.*$'), '%\(.\)', '\1', 'g')
        " TLogVAR ms, mx, cs, prefix, postfix
        if a:uncomment
            let @t = substitute(@t, '\V\^\s\*'. a:checkRx .'\$', '\1', '')
            let tt = []
            " TODO: Correctly handle foreign comments with inconsistent 
            " whitespace around mx markers
            let rx = '\V'. s:StartColRx(a:comment_mode, a:cbeg) . '\zs'. mx
            " TLogVAR mx1, rx
            for line in split(@t, '\n')
                let line1 = substitute(line, rx, '', 'g')
                call add(tt, line1)
            endfor
            let @t = join(tt, "\n")
            " TLogVAR @t
            let @t = substitute(@t, '^\n', '', '')
            let @t = substitute(@t, '\n\s*$', '', '')
            if a:comment_mode =~ '#'
                let s:cursor_pos = copy(s:current_pos)
                let prefix_lines = len(substitute(prefix, "[^\n]", '', 'g')) + 1
                let postfix_lines = len(substitute(postfix, "[^\n]", '', 'g')) + 1
                " TODO: more precise solution (when cursor is placed on 
                " postfix or prefix
                if s:cursor_pos[1] > a:beg
                    let s:cursor_pos[1] -= prefix_lines
                    if s:cursor_pos[1] > a:end - postfix_lines
                        let s:cursor_pos[1] -= postfix_lines
                    endif
                    if s:cursor_pos[1] < 1
                        let s:cursor_pos[1] = 1
                    endif
                endif
                let prefix_len = s:Strdisplaywidth(mx)
                let s:cursor_pos[2] -= prefix_len
                if s:cursor_pos[2] < 1
                    let s:cursor_pos[2] = 1
                endif
            endif
        else
            let cs = indentStr . substitute(cs, '%\@<!%s', '%s'. indentStr, '')
            " TLogVAR cs, ms
            if ms != ''
                let lines = []
                let lnum = 0
                let indentlen = a:cbeg
                let rx = '^.\{-}\%>'. indentlen .'v\zs'
                " TLogVAR indentStr, indentlen, rx, @t, empty(@t)
                if @t =~ '^\n\?$'
                    let lines = [indentStr . ms]
                    let cs .= "\n"
                    " TLogVAR 1, lines
                else
                    for line in split(@t, '\n')
                        " TLogVAR 1, line
                        if lnum == 0
                            let line = substitute(line, rx, ms, '')
                        else
                            let line = substitute(line, rx, mx, '')
                        endif
                        " TLogVAR 2, line
                        call add(lines, line)
                        let lnum += 1
                    endfor
                    " TLogVAR 2, lines
                endif
                let @t = join(lines, "\n")
                " TLogVAR 3, @t
            endif
            let @t = printf(cs, "\n". @t ."\n")
            " TLogVAR 4, cs, @t, a:comment_mode
            if a:comment_mode =~ '#'
                let s:cursor_pos = copy(s:current_pos)
                let s:cursor_pos[1] += len(substitute(prefix, "[^\n]", '', 'g')) + 1
                let prefix_len = s:Strdisplaywidth(mx)
                let s:cursor_pos[2] += prefix_len
                " echom "DBG s:current_pos=" string(s:current_pos) "s:cursor_pos=" string(s:cursor_pos)
            endif
        endif
        silent norm! "tP
    finally
        let &selection = sel_save
        let @t = t
    endtry
endf


function! s:Filetype(...) "{{{3
    let ft = a:0 >= 1 && !empty(a:1) ? a:1 : &filetype
    let pos = a:0 >= 2 ? a:2 : 0
    " TLogVAR ft, pos
    let fts = split(ft, '^\@!\.')
    " TLogVAR fts
    " let ft = substitute(ft, '\..*$', '', '')
    let rv = get(fts, pos, ft)
    " TLogVAR fts, rv
    if !exists('s:filetype_map_rx')
        let fts_rx = '^'. join(map(keys(g:tcomment#filetype_map), 'escape(v:val, ''\'')'), '\|') .'$'
    endif
    " TLogVAR fts_rx
    if rv =~ fts_rx
        for [ft_rx, ftrv] in items(g:tcomment#filetype_map)
            " TLogVAR ft_rx, ftrv
            if rv =~ ft_rx
                let rv = substitute(rv, ft_rx, ftrv, '')
                " TLogVAR rv
                break
            endif
        endfor
    endif
    return rv
endf


function! s:AltFiletype(filetype) "{{{3
    let filetype = empty(a:filetype) ? &filetype : a:filetype
    " TLogVAR a:filetype, filetype
    if g:tcommentGuessFileType || (exists('g:tcommentGuessFileType_'. filetype) 
                \ && g:tcommentGuessFileType_{filetype} =~ '[^0]')
        if g:tcommentGuessFileType_{filetype} == 1
            if filetype =~ '^.\{-}\..\+$'
                let altFiletype = s:Filetype(filetype, 1)
            else
                let altFiletype = ''
            endif
        else
            let altFiletype = g:tcommentGuessFileType_{filetype}
        endif
        " TLogVAR 1, altFiletype
        return [1, altFiletype]
    elseif filetype =~ '^.\{-}\..\+$'
        let altFiletype = s:Filetype(filetype, 1)
        " TLogVAR 2, altFiletype
        return [1, altFiletype]
    else
        " TLogVAR 3, ''
        return [0, '']
    endif
endf


" A function that makes the s:GuessFileType() function usable for other 
" library developers.
"
" The argument is a dictionary with the following keys:
"
"   beg ................ (default = line("."))
"   end ................ (default = line("."))
"   comment_mode ........ (default = "G")
"   filetype ........... (default = &filetype)
"   fallbackFiletype ... (default = "")
"
" This function return a dictionary that contains information about how 
" to make comments. The information about the filetype of the text 
" between lines "beg" and "end" is in the "filetype" key of the return 
" value. It returns the first discernible filetype it encounters.
" :display: tcomment#GuessFileType(?options={})
function! tcomment#GuessCommentType(...) "{{{3
    let options = a:0 >= 1 ? a:1 : {}
    let beg = get(options, 'beg', line('.'))
    let end = get(options, 'end', line('.'))
    let comment_mode = get(options, 'comment_mode', '')
    let filetype = get(options, 'filetype', &filetype)
    let fallbackFiletype = get(options, 'filetype', '')
    return s:GuessFileType(beg, end, comment_mode, filetype, fallbackFiletype)
endf


" inspired by Meikel Brandmeyer's EnhancedCommentify.vim
" this requires that a syntax names are prefixed by the filetype name 
" s:GuessFileType(beg, end, comment_mode, filetype, ?fallbackFiletype)
function! s:GuessFileType(beg, end, comment_mode, filetype, ...)
    " TLogVAR a:beg, a:end, a:comment_mode, a:filetype, a:000
    " TLogVAR cdef
    let cdef0 = s:GuessCustomCommentString(a:filetype, a:comment_mode)
    if a:0 >= 1 && a:1 != ''
        let cdef = s:GuessCustomCommentString(a:1, a:comment_mode)
        " TLogVAR 0, cdef
        let cdef = extend(cdef, cdef0, 'keep')
        " TLogVAR 1, cdef
        if empty(get(cdef, 'commentstring', ''))
            let guess_cdef = s:GuessVimOptionsCommentString(a:comment_mode)
            call extend(cdef, guess_cdef)
        endif
        " TLogVAR 2, cdef
    else
        let cdef = cdef0
        " TLogVAR 3, cdef
        if !has_key(cdef, 'commentstring')
            let cdef = s:GuessVimOptionsCommentString(a:comment_mode)
        endif
        " TLogVAR 4, cdef
    endif
    let beg = a:beg
    let end = nextnonblank(a:end)
    if end == 0
        let end = a:end
        let beg = prevnonblank(a:beg)
        if beg == 0
            let beg = a:beg
        endif
    endif
    let n  = beg
    " TLogVAR n, beg, end
    while n <= end
        let m  = indent(n) + 1
        let text = getline(n)
        let le = len(text)
        " TLogVAR m, le
        while m <= le
            let syntax_name = s:GetSyntaxName(n, m)
            " TLogVAR syntax_name, n, m
            unlet! ftype_map
            let ftype_map = get(g:tcommentSyntaxMap, syntax_name, '')
            " TLogVAR ftype_map
            if !empty(ftype_map) && type(ftype_map) == 4
                if n < a:beg
                    let key = 'prevnonblank'
                elseif n > a:end
                    let key = 'nextnonblank'
                else
                    let key = ''
                endif
                if empty(key) || !has_key(ftype_map, key)
                    let ftypeftype = get(ftype_map, 'filetype', {})
                    " TLogVAR ftype_map, ftypeftype
                    unlet! ftype_map
                    let ftype_map = get(ftypeftype, a:filetype, '')
                else
                    let mapft = ''
                    for mapdef in ftype_map[key]
                        if strpart(text, m - 1) =~ '^'. mapdef.match
                            let mapft = mapdef.filetype
                            break
                        endif
                    endfor
                    unlet! ftype_map
                    if empty(mapft)
                        let ftype_map = ''
                    else
                        let ftype_map = mapft
                    endif
                endif
            endif
            if !empty(ftype_map)
                " TLogVAR ftype_map
                return s:GuessCustomCommentString(ftype_map, a:comment_mode, cdef.commentstring)
            elseif syntax_name =~ s:types_rx
                let ft = substitute(syntax_name, s:types_rx, '\1', '')
                " TLogVAR ft
                if exists('g:tcommentIgnoreTypes_'. a:filetype) && g:tcommentIgnoreTypes_{a:filetype} =~ '\<'.ft.'\>'
                    let m += 1
                else
                    return s:GuessCustomCommentString(ft, a:comment_mode, cdef.commentstring)
                endif
            elseif syntax_name == '' || syntax_name == 'None' || syntax_name =~ '^\u\+$' || syntax_name =~ '^\u\U*$'
                let m += 1
            else
                break
            endif
        endwh
        let n += 1
    endwh
    " TLogVAR cdef
    return cdef
endf


function! s:GetSyntaxName(lnum, col) "{{{3
    let syntax_name = synIDattr(synID(a:lnum, a:col, 1), 'name')
    if !empty(g:tcomment#syntax_substitute)
        for [rx, subdef] in items(g:tcomment#syntax_substitute)
            if !has_key(subdef, 'if') || eval(subdef.if)
                let syntax_name = substitute(syntax_name, rx, subdef.sub, 'g')
            endif
        endfor
    endif
    " TLogVAR syntax_name
    return syntax_name
endf


function! s:AddModeExtra(comment_mode, extra, beg, end) "{{{3
    if a:beg == a:end
        let extra = substitute(a:extra, '\C[B]', '', 'g')
    else
        let extra = substitute(a:extra, '\C[IR]', '', 'g')
    endif
    let comment_mode = a:comment_mode
    if extra =~# 'B'
        let comment_mode = substitute(comment_mode, '\c[gir]', '', 'g')
    endif
    if extra =~# '[IR]'
        let comment_mode = substitute(comment_mode, '\c[gb]', '', 'g')
    endif
    let rv = comment_mode . extra
    " TLogVAR a:comment_mode, a:extra, comment_mode, extra, rv
    return rv
endf


function! s:GuessCommentMode(comment_mode, supported_comment_modes) "{{{3
    " TLogVAR a:comment_mode, a:supported_comment_modes
    let cmode = tolower(a:comment_mode)
    let ccmodes = split(tolower(a:supported_comment_modes), '\zs')
    let ccmodes = filter(ccmodes, 'stridx(cmode, v:val) != -1')
    let guess = substitute(a:comment_mode, '\w\+', 'G', 'g')
    " TLogVAR ccmodes, guess
    if a:comment_mode =~# '[BR]'
        return !empty(ccmodes) ? a:comment_mode : guess
    elseif a:comment_mode =~# '[I]'
        return !empty(ccmodes) ? a:comment_mode : ''
    " elseif a:comment_mode =~# '[R]' && !empty(ccmodes)
    "     return a:comment_mode
    else
        return guess
    endif
endf


function! s:GuessVimOptionsCommentString(comment_mode)
    " TLogVAR a:comment_mode
    let valid_cms = (match(&commentstring, '%\@<!\(%%\)*%s') != -1)
    let ccmodes = 'r'
    if &commentstring =~ '\S\s*%s\s*\S'
        let ccmodes .= 'bi'
    endif
    let guess_comment_mode = s:GuessCommentMode(a:comment_mode, ccmodes)
    " TLogVAR guess_comment_mode
    if &commentstring != s:default_comment_string && valid_cms
        " The &commentstring appears to have been set and to be valid
        let cdef = copy(g:tcomment#options_commentstring)
        let cdef.mode = guess_comment_mode
        let cdef.commentstring = &commentstring
        return cdef
    endif
    if &comments != s:default_comments
        " the commentstring is the default one, so we assume that it wasn't 
        " explicitly set; we then try to reconstruct &cms from &comments
        let cdef = s:ConstructFromCommentsOption(a:comment_mode)
        " TLogVAR comments_cdef
        if !empty(cdef)
            call extend(cdef, g:tcomment#options_comments)
            return cdef
        endif
    endif
    if valid_cms
        " Before &commentstring appeared not to be set. As we don't know 
        " better we return it anyway if it is valid
        let cdef = copy(g:tcomment#options_commentstring)
        let cdef.mode = guess_comment_mode
        let cdef.commentstring = &commentstring
        return cdef
    else
        " &commentstring is invalid. So we return the identity string.
        let cdef = {}
        let cdef.mode = guess_comment_mode
        let cdef.commentstring = s:null_comment_string
        return cdef
    endif
endf


function! s:ConstructFromCommentsOption(comment_mode)
    " TLogVAR a:comment_mode
    let cdef = {}
    let comments = s:ExtractCommentsPart()
    " TLogVAR comments
    if a:comment_mode =~? '[bi]' && !empty(comments.s.string)
        let cdef.mode = a:comment_mode
        let cdef.commentstring = comments.s.string .' %s '. comments.e.string
        if a:comment_mode =~? '[b]' && !empty(comments.m.string)
            let mshift = str2nr(matchstr(comments.s.flags, '\(^\|[^-]\)\zs\d\+'))
            let mindent = repeat(' ', mshift)
            let cdef.middle = mindent . comments.m.string
        endif
        " TLogVAR cdef
        return cdef
    endif
    let ccmodes = 'r'
    if !empty(comments.e.string)
        let ccmodes .= 'bi'
    endif
    let comment_mode = s:GuessCommentMode(a:comment_mode, ccmodes)
    if !empty(comments.line.string)
        let cdef.mode = comment_mode
        let cdef.commentstring = comments.line.string .' %s'
    elseif !empty(comments.s.string)
        let cdef.mode = comment_mode
        let cdef.commentstring = comments.s.string .' %s '. comments.e.string
    endif
    return cdef
endf


function! s:ExtractCommentsPart()
    let comments = {
                \ 'line': {'string': '', 'flags': ''},
                \ 's':    {'string': '', 'flags': ''},
                \ 'm':    {'string': '', 'flags': ''},
                \ 'e':    {'string': '', 'flags': ''},
                \ }
    let rx = '\C\([nbfsmelrOx0-9-]*\):\(\%(\\,\|[^,]\)*\)'
    let comparts = split(&l:comments, rx .'\zs,')
    for part in comparts
        let ml = matchlist(part, '^'. rx .'$')
        let flags = ml[1]
        let string = substitute(ml[2], '\\,', ',', 'g')
        if flags !~# 'O'
            let flag = matchstr(flags, '^[sme]')
            if empty(flag)
                let flag = 'line'
            endif
            let string = substitute(string, '%', '%%', 'g')
            let comments[flag] = {'string': string, 'flags': flags}
        endif
    endfor
    return comments
endf


" s:GuessCustomCommentString(ft, comment_mode, ?default="", ?default_cdef={})
function! s:GuessCustomCommentString(ft, comment_mode, ...)
    " TLogVAR a:ft, a:comment_mode, a:000
    let comment_mode   = a:comment_mode
    let custom_comment = tcomment#TypeExists(a:ft)
    let custom_comment_mode = tcomment#TypeExists(a:ft, comment_mode)
    let supported_comment_mode = !empty(custom_comment_mode) ? comment_mode : ''
    " TLogVAR custom_comment, custom_comment_mode
    let default = a:0 >= 1 ? a:1 : ''
    let default_cdef = a:0 >= 2 ? a:2 : {}
    let default_supports_comment_mode = get(default_cdef, 'comment_mode', custom_comment_mode)
    " TLogVAR default, default_supports_comment_mode
    if comment_mode =~# '[ILB]' && !empty(custom_comment_mode)
        let def = tcomment#GetCommentDef(custom_comment_mode)
        " TLogVAR 1, def
    elseif !empty(custom_comment)
        let def = tcomment#GetCommentDef(custom_comment)
        let comment_mode = s:GuessCommentMode(comment_mode, supported_comment_mode)
        " TLogVAR 3, def, comment_mode
    elseif !empty(default)
        if empty(default_cdef)
            let def = {'commentstring': default}
        else
            let def = default_cdef
        endif
        let comment_mode = s:GuessCommentMode(comment_mode, default_supports_comment_mode)
        " TLogVAR 4, def, comment_mode
    else
        let def = {}
        let comment_mode = s:GuessCommentMode(comment_mode, '')
        " TLogVAR 5, def, comment_mode
    endif
    let cdef = copy(def)
    if !has_key(cdef, 'mode')
        let cdef.mode = comment_mode
    endif
    let cdef.filetype = a:ft
    " TLogVAR cdef
    return cdef
endf


function! s:GetCommentReplace(cdef, cms0)
    if has_key(a:cdef, 'commentstring_rx')
        let rs = s:BlockGetCommentString(a:cdef)
    else
        let rs = a:cms0
    endif
    return rs
    " return escape(rs, '"/')
endf


function! s:BlockGetCommentRx(cdef)
    if has_key(a:cdef, 'commentstring_rx')
        return a:cdef.commentstring_rx
    else
        let cms0 = s:BlockGetCommentString(a:cdef)
        let cms0 = escape(cms0, '\')
        return cms0
    endif
endf


function! s:BlockGetCommentString(cdef)
    if has_key(a:cdef, 'middle')
        return a:cdef.commentstring
    else
        return matchstr(a:cdef.commentstring, '^.\{-}\ze\(\n\|$\)')
    endif
endf


function! s:BlockGetMiddleString(cdef)
    if has_key(a:cdef, 'middle')
        return a:cdef.middle
    else
        return matchstr(a:cdef.commentstring, '\n\zs.*')
    endif
endf


function! tcomment#TextObjectInlineComment() "{{{3
    let cdef = tcomment#GuessCommentType({'comment_mode': 'I'})
    let cms  = escape(cdef.commentstring, '\')
    let pos  = getpos('.')
    let lnum = pos[1]
    let col  = pos[2]
    let cmtf = '\V'. printf(cms, '\.\{-}\%'. lnum .'l\%'. col .'c\.\{-}')
    " TLogVAR cmtf, search(cmtf,'cwn')
    if search(cmtf, 'cw') > 0
        let pos0 = getpos('.')
        if search(cmtf, 'cwe') > 0
            let pos1 = getpos('.')
            exec 'norm!'
                        \ pos0[1].'gg'.pos0[2].'|v'.
                        \ pos1[1].'gg'.pos1[2].'|'.
                        \ (&sel == 'exclusive' ? 'l' : '')
        endif
    endif
endf


" vi: ft=vim:tw=72:ts=4:fo=w2croql
