" Vim syntax file
" Language:	C
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last Change:	2008 Mar 19

" Quit when a (custom) syntax file was already loaded
if exists("b:current_syntax")
  finish
endif

" A bunch of useful C keywords
syn keyword	pdeStatement	goto break return continue asm
syn keyword	pdeLabel		case default
syn keyword	pdeConditional	if else switch
syn keyword	pdeRepeat		while for do
syn keyword	pdeBuiltinVariableFunctions
			\ pinMode analogWrite analogRead digitalWrite digitalRead delay Serial 
			\ begin println print
			\ map constrain
syn keyword	pdePin	OUTPUT INPUT HIGH LOW

syn keyword	pdeTodo		contained TODO FIXME XXX

" pdeCommentGroup allows adding matches for special things in comments
syn cluster	pdeCommentGroup	contains=pdeTodo

" String and Character constants
" Highlight special characters (those which have a backslash) differently
syn match	pdeSpecial	display contained "\\\(x\x\+\|\o\{1,3}\|.\|$\)"
if !exists("c_no_utf")
  syn match	pdeSpecial	display contained "\\\(u\x\{4}\|U\x\{8}\)"
endif
if exists("c_no_cformat")
  syn region	pdeString		start=+L\="+ skip=+\\\\\|\\"+ end=+"+ contains=pdeSpecial,@Spell
  " pdeCppString: same as pdeString, but ends at end of line
  syn region	pdeCppString	start=+L\="+ skip=+\\\\\|\\"\|\\$+ excludenl end=+"+ end='$' contains=pdeSpecial,@Spell
else
  if !exists("c_no_c99") " ISO C99
    syn match	pdeFormat		display "%\(\d\+\$\)\=[-+' #0*]*\(\d*\|\*\|\*\d\+\$\)\(\.\(\d*\|\*\|\*\d\+\$\)\)\=\([hlLjzt]\|ll\|hh\)\=\([aAbdiuoxXDOUfFeEgGpdeCsSpn]\|\[\^\=.[^]]*\]\)" contained
  else
    syn match	pdeFormat		display "%\(\d\+\$\)\=[-+' #0*]*\(\d*\|\*\|\*\d\+\$\)\(\.\(\d*\|\*\|\*\d\+\$\)\)\=\([hlL]\|ll\)\=\([bdiuoxXDOUfeEgGpdeCsSpn]\|\[\^\=.[^]]*\]\)" contained
  endif
  syn match	pdeFormat		display "%%" contained
  syn region	pdeString		start=+L\="+ skip=+\\\\\|\\"+ end=+"+ contains=pdeSpecial,pdeFormat,@Spell
  " pdeCppString: same as pdeString, but ends at end of line
  syn region	pdeCppString	start=+L\="+ skip=+\\\\\|\\"\|\\$+ excludenl end=+"+ end='$' contains=pdeSpecial,pdeFormat,@Spell
endif

syn match	pdeCharacter	"L\='[^\\]'"
syn match	pdeCharacter	"L'[^']*'" contains=pdeSpecial
if exists("c_gnu")
  syn match	pdeSpecialError	"L\='\\[^'\"?\\abefnrtv]'"
  syn match	pdeSpecialCharacter "L\='\\['\"?\\abefnrtv]'"
else
  syn match	pdeSpecialError	"L\='\\[^'\"?\\abfnrtv]'"
  syn match	pdeSpecialCharacter "L\='\\['\"?\\abfnrtv]'"
endif
syn match	pdeSpecialCharacter display "L\='\\\o\{1,3}'"
syn match	pdeSpecialCharacter display "'\\x\x\{1,2}'"
syn match	pdeSpecialCharacter display "L'\\x\x\+'"

"when wanted, highlight trailing white space
if exists("c_space_errors")
  if !exists("c_no_trail_space_error")
    syn match	pdeSpaceError	display excludenl "\s\+$"
  endif
  if !exists("c_no_tab_space_error")
    syn match	pdeSpaceError	display " \+\t"me=e-1
  endif
endif

" This should be before pdeErrInParen to avoid problems with #define ({ xxx })
if exists("c_curly_error")
  syntax match pdeCurlyError "}"
  syntax region	pdeBlock		start="{" end="}" contains=ALLBUT,pdeCurlyError,@pdeParenGroup,pdeErrInParen,pdeCppParen,pdeErrInBracket,pdeCppBracket,pdeCppString,@Spell fold
else
  syntax region	pdeBlock		start="{" end="}" transparent fold
endif

"catch errors caused by wrong parenthesis and brackets
" also accept <% for {, %> for }, <: for [ and :> for ] (C99)
" But avoid matching <::.
syn cluster	pdeParenGroup	contains=pdeParenError,pdeIncluded,pdeSpecial,pdeCommentSkip,pdeCommentString,pdeComment2String,@pdeCommentGroup,pdeCommentStartError,pdeUserCont,pdeUserLabel,pdeBitField,pdeOctalZero,pdeCppOut,pdeCppOut2,pdeCppSkip,pdeFormat,pdeNumber,pdeFloat,pdeOctal,pdeOctalError,pdeNumbersCom
if exists("c_no_curly_error")
  syn region	pdeParen		transparent start='(' end=')' contains=ALLBUT,@pdeParenGroup,pdeCppParen,pdeCppString,@Spell
  " pdeCppParen: same as pdeParen but ends at end-of-line; used in pdeDefine
  syn region	pdeCppParen	transparent start='(' skip='\\$' excludenl end=')' end='$' contained contains=ALLBUT,@pdeParenGroup,pdeParen,pdeString,@Spell
  syn match	pdeParenError	display ")"
  syn match	pdeErrInParen	display contained "^[{}]\|^<%\|^%>"
elseif exists("c_no_bracket_error")
  syn region	pdeParen		transparent start='(' end=')' contains=ALLBUT,@pdeParenGroup,pdeCppParen,pdeCppString,@Spell
  " pdeCppParen: same as pdeParen but ends at end-of-line; used in pdeDefine
  syn region	pdeCppParen	transparent start='(' skip='\\$' excludenl end=')' end='$' contained contains=ALLBUT,@pdeParenGroup,pdeParen,pdeString,@Spell
  syn match	pdeParenError	display ")"
  syn match	pdeErrInParen	display contained "[{}]\|<%\|%>"
else
  syn region	pdeParen		transparent start='(' end=')' contains=ALLBUT,@pdeParenGroup,pdeCppParen,pdeErrInBracket,pdeCppBracket,pdeCppString,@Spell
  " pdeCppParen: same as pdeParen but ends at end-of-line; used in pdeDefine
  syn region	pdeCppParen	transparent start='(' skip='\\$' excludenl end=')' end='$' contained contains=ALLBUT,@pdeParenGroup,pdeErrInBracket,pdeParen,pdeBracket,pdeString,@Spell
  syn match	pdeParenError	display "[\])]"
  syn match	pdeErrInParen	display contained "[\]{}]\|<%\|%>"
  syn region	pdeBracket	transparent start='\[\|<::\@!' end=']\|:>' contains=ALLBUT,@pdeParenGroup,pdeErrInParen,pdeCppParen,pdeCppBracket,pdeCppString,@Spell
  " pdeCppBracket: same as pdeParen but ends at end-of-line; used in pdeDefine
  syn region	pdeCppBracket	transparent start='\[\|<::\@!' skip='\\$' excludenl end=']\|:>' end='$' contained contains=ALLBUT,@pdeParenGroup,pdeErrInParen,pdeParen,pdeBracket,pdeString,@Spell
  syn match	pdeErrInBracket	display contained "[);{}]\|<%\|%>"
endif

"integer number, or floating point number without a dot and with "f".
syn case ignore
syn match	pdeNumbers	display transparent "\<\d\|\.\d" contains=pdeNumber,pdeFloat,pdeOctalError,pdeOctal
" Same, but without octal error (for comments)
syn match	pdeNumbersCom	display contained transparent "\<\d\|\.\d" contains=pdeNumber,pdeFloat,pdeOctal
syn match	pdeNumber		display contained "\d\+\(u\=l\{0,2}\|ll\=u\)\>"
"hex number
syn match	pdeNumber		display contained "0x\x\+\(u\=l\{0,2}\|ll\=u\)\>"
" Flag the first zero of an octal number as something special
syn match	pdeOctal		display contained "0\o\+\(u\=l\{0,2}\|ll\=u\)\>" contains=pdeOctalZero
syn match	pdeOctalZero	display contained "\<0"
syn match	pdeFloat		display contained "\d\+f"
"floating point number, with dot, optional exponent
syn match	pdeFloat		display contained "\d\+\.\d*\(e[-+]\=\d\+\)\=[fl]\="
"floating point number, starting with a dot, optional exponent
syn match	pdeFloat		display contained "\.\d\+\(e[-+]\=\d\+\)\=[fl]\=\>"
"floating point number, without dot, with exponent
syn match	pdeFloat		display contained "\d\+e[-+]\=\d\+[fl]\=\>"
if !exists("c_no_c99")
  "hexadecimal floating point number, optional leading digits, with dot, with exponent
  syn match	pdeFloat		display contained "0x\x*\.\x\+p[-+]\=\d\+[fl]\=\>"
  "hexadecimal floating point number, with leading digits, optional dot, with exponent
  syn match	pdeFloat		display contained "0x\x\+\.\=p[-+]\=\d\+[fl]\=\>"
endif

" flag an octal number with wrong digits
syn match	pdeOctalError	display contained "0\o*[89]\d*"
syn case match

if exists("c_comment_strings")
  " A comment can contain pdeString, pdeCharacter and pdeNumber.
  " But a "*/" inside a pdeString in a pdeComment DOES end the comment!  So we
  " need to use a special type of pdeString: pdeCommentString, which also ends on
  " "*/", and sees a "*" at the start of the line as comment again.
  " Unfortunately this doesn't very well work for // type of comments :-(
  syntax match	pdeCommentSkip	contained "^\s*\*\($\|\s\+\)"
  syntax region pdeCommentString	contained start=+L\=\\\@<!"+ skip=+\\\\\|\\"+ end=+"+ end=+\*/+me=s-1 contains=pdeSpecial,pdeCommentSkip
  syntax region pdeComment2String	contained start=+L\=\\\@<!"+ skip=+\\\\\|\\"+ end=+"+ end="$" contains=pdeSpecial
  syntax region  pdeCommentL	start="//" skip="\\$" end="$" keepend contains=@pdeCommentGroup,pdeComment2String,pdeCharacter,pdeNumbersCom,pdeSpaceError,@Spell
  if exists("c_no_comment_fold")
    " Use "extend" here to have preprocessor lines not terminate halfway a
    " comment.
    syntax region pdeComment	matchgroup=pdeCommentStart start="/\*" end="\*/" contains=@pdeCommentGroup,pdeCommentStartError,pdeCommentString,pdeCharacter,pdeNumbersCom,pdeSpaceError,@Spell extend
  else
    syntax region pdeComment	matchgroup=pdeCommentStart start="/\*" end="\*/" contains=@pdeCommentGroup,pdeCommentStartError,pdeCommentString,pdeCharacter,pdeNumbersCom,pdeSpaceError,@Spell fold extend
  endif
else
  syn region	pdeCommentL	start="//" skip="\\$" end="$" keepend contains=@pdeCommentGroup,pdeSpaceError,@Spell
  if exists("c_no_comment_fold")
    syn region	pdeComment	matchgroup=pdeCommentStart start="/\*" end="\*/" contains=@pdeCommentGroup,pdeCommentStartError,pdeSpaceError,@Spell extend
  else
    syn region	pdeComment	matchgroup=pdeCommentStart start="/\*" end="\*/" contains=@pdeCommentGroup,pdeCommentStartError,pdeSpaceError,@Spell fold extend
  endif
endif
" keep a // comment separately, it terminates a preproc. conditional
syntax match	pdeCommentError	display "\*/"
syntax match	pdeCommentStartError display "/\*"me=e-1 contained

syn keyword	pdeOperator	sizeof
if exists("c_gnu")
  syn keyword	pdeStatement	__asm__
  syn keyword	pdeOperator	typeof __real__ __imag__
endif
syn keyword	pdeType		byte int long short char void
syn keyword	pdeType		signed unsigned float double
if !exists("c_no_ansi") || exists("c_ansi_typedefs")
  syn keyword   pdeType		size_t ssize_t off_t wchar_t ptrdiff_t sig_atomic_t fpos_t
  syn keyword   pdeType		clock_t time_t va_list jmp_buf FILE DIR div_t ldiv_t
  syn keyword   pdeType		mbstate_t wctrans_t wint_t wctype_t
endif
if !exists("c_no_c99") " ISO C99
  syn keyword	pdeType		bool complex
  syn keyword	pdeType		int8_t int16_t int32_t int64_t
  syn keyword	pdeType		uint8_t uint16_t uint32_t uint64_t
  syn keyword	pdeType		int_least8_t int_least16_t int_least32_t int_least64_t
  syn keyword	pdeType		uint_least8_t uint_least16_t uint_least32_t uint_least64_t
  syn keyword	pdeType		int_fast8_t int_fast16_t int_fast32_t int_fast64_t
  syn keyword	pdeType		uint_fast8_t uint_fast16_t uint_fast32_t uint_fast64_t
  syn keyword	pdeType		intptr_t uintptr_t
  syn keyword	pdeType		intmax_t uintmax_t
endif
if exists("c_gnu")
  syn keyword	pdeType		__label__ __complex__ __volatile__
endif

syn keyword	pdeStructure	struct union enum typedef 
syn keyword	pdeStorageClass	static register auto volatile extern const
if exists("c_gnu")
  syn keyword	pdeStorageClass	inline __attribute__
endif
if !exists("c_no_c99")
  syn keyword	pdeStorageClass	inline restrict
endif

if !exists("c_no_ansi") || exists("c_ansi_constants") || exists("c_gnu")
  if exists("c_gnu")
    syn keyword pdeConstant __GNUC__ __FUNCTION__ __PRETTY_FUNCTION__ __func__
  endif
  syn keyword pdeConstant __LINE__ __FILE__ __DATE__ __TIME__ __STDC__
  syn keyword pdeConstant __STDC_VERSION__
  syn keyword pdeConstant CHAR_BIT MB_LEN_MAX MB_CUR_MAX
  syn keyword pdeConstant UCHAR_MAX UINT_MAX ULONG_MAX USHRT_MAX
  syn keyword pdeConstant CHAR_MIN INT_MIN LONG_MIN SHRT_MIN
  syn keyword pdeConstant CHAR_MAX INT_MAX LONG_MAX SHRT_MAX
  syn keyword pdeConstant SCHAR_MIN SINT_MIN SLONG_MIN SSHRT_MIN
  syn keyword pdeConstant SCHAR_MAX SINT_MAX SLONG_MAX SSHRT_MAX
  if !exists("c_no_c99")
    syn keyword pdeConstant __func__
    syn keyword pdeConstant LLONG_MIN LLONG_MAX ULLONG_MAX
    syn keyword pdeConstant INT8_MIN INT16_MIN INT32_MIN INT64_MIN
    syn keyword pdeConstant INT8_MAX INT16_MAX INT32_MAX INT64_MAX
    syn keyword pdeConstant UINT8_MAX UINT16_MAX UINT32_MAX UINT64_MAX
    syn keyword pdeConstant INT_LEAST8_MIN INT_LEAST16_MIN INT_LEAST32_MIN INT_LEAST64_MIN
    syn keyword pdeConstant INT_LEAST8_MAX INT_LEAST16_MAX INT_LEAST32_MAX INT_LEAST64_MAX
    syn keyword pdeConstant UINT_LEAST8_MAX UINT_LEAST16_MAX UINT_LEAST32_MAX UINT_LEAST64_MAX
    syn keyword pdeConstant INT_FAST8_MIN INT_FAST16_MIN INT_FAST32_MIN INT_FAST64_MIN
    syn keyword pdeConstant INT_FAST8_MAX INT_FAST16_MAX INT_FAST32_MAX INT_FAST64_MAX
    syn keyword pdeConstant UINT_FAST8_MAX UINT_FAST16_MAX UINT_FAST32_MAX UINT_FAST64_MAX
    syn keyword pdeConstant INTPTR_MIN INTPTR_MAX UINTPTR_MAX
    syn keyword pdeConstant INTMAX_MIN INTMAX_MAX UINTMAX_MAX
    syn keyword pdeConstant PTRDIFF_MIN PTRDIFF_MAX SIG_ATOMIC_MIN SIG_ATOMIC_MAX
    syn keyword pdeConstant SIZE_MAX WCHAR_MIN WCHAR_MAX WINT_MIN WINT_MAX
  endif
  syn keyword pdeConstant FLT_RADIX FLT_ROUNDS
  syn keyword pdeConstant FLT_DIG FLT_MANT_DIG FLT_EPSILON
  syn keyword pdeConstant DBL_DIG DBL_MANT_DIG DBL_EPSILON
  syn keyword pdeConstant LDBL_DIG LDBL_MANT_DIG LDBL_EPSILON
  syn keyword pdeConstant FLT_MIN FLT_MAX FLT_MIN_EXP FLT_MAX_EXP
  syn keyword pdeConstant FLT_MIN_10_EXP FLT_MAX_10_EXP
  syn keyword pdeConstant DBL_MIN DBL_MAX DBL_MIN_EXP DBL_MAX_EXP
  syn keyword pdeConstant DBL_MIN_10_EXP DBL_MAX_10_EXP
  syn keyword pdeConstant LDBL_MIN LDBL_MAX LDBL_MIN_EXP LDBL_MAX_EXP
  syn keyword pdeConstant LDBL_MIN_10_EXP LDBL_MAX_10_EXP
  syn keyword pdeConstant HUGE_VAL CLOCKS_PER_SEC NULL
  syn keyword pdeConstant LC_ALL LC_COLLATE LC_CTYPE LC_MONETARY
  syn keyword pdeConstant LC_NUMERIC LC_TIME
  syn keyword pdeConstant SIG_DFL SIG_ERR SIG_IGN
  syn keyword pdeConstant SIGABRT SIGFPE SIGILL SIGHUP SIGINT SIGSEGV SIGTERM
  " Add POSIX signals as well...
  syn keyword pdeConstant SIGABRT SIGALRM SIGCHLD SIGCONT SIGFPE SIGHUP
  syn keyword pdeConstant SIGILL SIGINT SIGKILL SIGPIPE SIGQUIT SIGSEGV
  syn keyword pdeConstant SIGSTOP SIGTERM SIGTRAP SIGTSTP SIGTTIN SIGTTOU
  syn keyword pdeConstant SIGUSR1 SIGUSR2
  syn keyword pdeConstant _IOFBF _IOLBF _IONBF BUFSIZ EOF WEOF
  syn keyword pdeConstant FOPEN_MAX FILENAME_MAX L_tmpnam
  syn keyword pdeConstant SEEK_CUR SEEK_END SEEK_SET
  syn keyword pdeConstant TMP_MAX stderr stdin stdout
  syn keyword pdeConstant EXIT_FAILURE EXIT_SUCCESS RAND_MAX
  " Add POSIX errors as well
  syn keyword pdeConstant E2BIG EACCES EAGAIN EBADF EBADMSG EBUSY
  syn keyword pdeConstant ECANCELED ECHILD EDEADLK EDOM EEXIST EFAULT
  syn keyword pdeConstant EFBIG EILSEQ EINPROGRESS EINTR EINVAL EIO EISDIR
  syn keyword pdeConstant EMFILE EMLINK EMSGSIZE ENAMETOOLONG ENFILE ENODEV
  syn keyword pdeConstant ENOENT ENOEXEC ENOLCK ENOMEM ENOSPC ENOSYS
  syn keyword pdeConstant ENOTDIR ENOTEMPTY ENOTSUP ENOTTY ENXIO EPERM
  syn keyword pdeConstant EPIPE ERANGE EROFS ESPIPE ESRCH ETIMEDOUT EXDEV
  " math.h
  syn keyword pdeConstant M_E M_LOG2E M_LOG10E M_LN2 M_LN10 M_PI M_PI_2 M_PI_4
  syn keyword pdeConstant M_1_PI M_2_PI M_2_SQRTPI M_SQRT2 M_SQRT1_2
endif
if !exists("c_no_c99") " ISO C99
  syn keyword pdeConstant true false
endif

" Accept %: for # (C99)
syn region	pdePreCondit	start="^\s*\(%:\|#\)\s*\(if\|ifdef\|ifndef\|elif\)\>" skip="\\$" end="$" end="//"me=s-1 contains=pdeComment,pdeCppString,pdeCharacter,pdeCppParen,pdeParenError,pdeNumbers,pdeCommentError,pdeSpaceError
syn match	pdePreCondit	display "^\s*\(%:\|#\)\s*\(else\|endif\)\>"
if !exists("c_no_if0")
  if !exists("c_no_if0_fold")
    syn region	pdeCppOut		start="^\s*\(%:\|#\)\s*if\s\+0\+\>" end=".\@=\|$" contains=pdeCppOut2 fold
  else
    syn region	pdeCppOut		start="^\s*\(%:\|#\)\s*if\s\+0\+\>" end=".\@=\|$" contains=pdeCppOut2
  endif
  syn region	pdeCppOut2	contained start="0" end="^\s*\(%:\|#\)\s*\(endif\>\|else\>\|elif\>\)" contains=pdeSpaceError,pdeCppSkip
  syn region	pdeCppSkip	contained start="^\s*\(%:\|#\)\s*\(if\>\|ifdef\>\|ifndef\>\)" skip="\\$" end="^\s*\(%:\|#\)\s*endif\>" contains=pdeSpaceError,pdeCppSkip
endif
syn region	pdeIncluded	display contained start=+"+ skip=+\\\\\|\\"+ end=+"+
syn match	pdeIncluded	display contained "<[^>]*>"
syn match	pdeInclude	display "^\s*\(%:\|#\)\s*include\>\s*["<]" contains=pdeIncluded
"syn match pdeLineSkip	"\\$"
syn cluster	pdePrePropdeGroup	contains=pdePreCondit,pdeIncluded,pdeInclude,pdeDefine,pdeErrInParen,pdeErrInBracket,pdeUserLabel,pdeSpecial,pdeOctalZero,pdeCppOut,pdeCppOut2,pdeCppSkip,pdeFormat,pdeNumber,pdeFloat,pdeOctal,pdeOctalError,pdeNumbersCom,pdeString,pdeCommentSkip,pdeCommentString,pdeComment2String,@pdeCommentGroup,pdeCommentStartError,pdeParen,pdeBracket,pdeMulti
syn region	pdeDefine		start="^\s*\(%:\|#\)\s*\(define\|undef\)\>" skip="\\$" end="$" end="//"me=s-1 keepend contains=ALLBUT,@pdePrePropdeGroup,@Spell
syn region	pdePreProc	start="^\s*\(%:\|#\)\s*\(pragma\>\|line\>\|warning\>\|warn\>\|error\>\)" skip="\\$" end="$" keepend contains=ALLBUT,@pdePrePropdeGroup,@Spell

" Highlight User Labels
syn cluster	pdeMultiGroup	contains=pdeIncluded,pdeSpecial,pdeCommentSkip,pdeCommentString,pdeComment2String,@pdeCommentGroup,pdeCommentStartError,pdeUserCont,pdeUserLabel,pdeBitField,pdeOctalZero,pdeCppOut,pdeCppOut2,pdeCppSkip,pdeFormat,pdeNumber,pdeFloat,pdeOctal,pdeOctalError,pdeNumbersCom,pdeCppParen,pdeCppBracket,pdeCppString
syn region	pdeMulti		transparent start='?' skip='::' end=':' contains=ALLBUT,@pdeMultiGroup,@Spell
" Avoid matching foo::bar() in C++ by requiring that the next char is not ':'
syn cluster	pdeLabelGroup	contains=pdeUserLabel
syn match	pdeUserCont	display "^\s*\I\i*\s*:$" contains=@pdeLabelGroup
syn match	pdeUserCont	display ";\s*\I\i*\s*:$" contains=@pdeLabelGroup
syn match	pdeUserCont	display "^\s*\I\i*\s*:[^:]"me=e-1 contains=@pdeLabelGroup
syn match	pdeUserCont	display ";\s*\I\i*\s*:[^:]"me=e-1 contains=@pdeLabelGroup

syn match	pdeUserLabel	display "\I\i*" contained

" Avoid recognizing most bitfields as labels
syn match	pdeBitField	display "^\s*\I\i*\s*:\s*[1-9]"me=e-1 contains=pdeType
syn match	pdeBitField	display ";\s*\I\i*\s*:\s*[1-9]"me=e-1 contains=pdeType

if exists("c_minlines")
  let b:c_minlines = c_minlines
else
  if !exists("c_no_if0")
    let b:c_minlines = 50	" #if 0 constructs can be long
  else
    let b:c_minlines = 15	" mostly for () constructs
  endif
endif
if exists("c_curly_error")
  syn sync fromstart
else
  exec "syn sync ccomment pdeComment minlines=" . b:c_minlines
endif

" Define the default highlighting.
" Only used when an item doesn't have highlighting yet
hi def link pdeFormat		pdeSpecial
hi def link pdeCppString		pdeString
hi def link pdeCommentL		pdeComment
hi def link pdeCommentStart	pdeComment
hi def link pdeLabel		Label
hi def link pdeUserLabel		Label
hi def link pdeConditional	Conditional
hi def link pdeRepeat		Repeat
hi def link pdeCharacter		Character
hi def link pdeSpecialCharacter	pdeSpecial
hi def link pdeNumber		Number
hi def link pdeOctal		Number
hi def link pdeOctalZero		PreProc	 " link this to Error if you want
hi def link pdeFloat		Float
hi def link pdeOctalError		pdeError
hi def link pdeParenError		pdeError
hi def link pdeErrInParen		pdeError
hi def link pdeErrInBracket	pdeError
hi def link pdeCommentError	pdeError
hi def link pdeCommentStartError	pdeError
hi def link pdeSpaceError		pdeError
hi def link pdeSpecialError	pdeError
hi def link pdeCurlyError		pdeError
hi def link pdeOperator		Operator
hi def link pdeStructure		Structure
hi def link pdeStorageClass	StorageClass
hi def link pdeInclude		Include
hi def link pdePreProc		PreProc
hi def link pdeDefine		Macro
hi def link pdeIncluded		pdeString
hi def link pdeError		Error
hi def link pdeStatement		Statement
hi def link pdePreCondit		PreCondit
hi def link pdeType		Type
hi def link pdeConstant		Constant
hi def link pdeCommentString	pdeString
hi def link pdeComment2String	pdeString
hi def link pdeCommentSkip	pdeComment
hi def link pdeString		String
hi def link pdeComment		Comment
hi def link pdeSpecial		SpecialChar
hi def link pdeTodo		Todo
hi def link pdeCppSkip		pdeCppOut
hi def link pdeCppOut2		pdeCppOut
hi def link pdeCppOut		Comment
hi def link pdePin		PreProc
hi def link pdeBuiltinVariableFunctions             Keyword

let b:current_syntax = "c"

" vim: ts=8
