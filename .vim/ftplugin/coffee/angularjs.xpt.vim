" Move me to your own fptlugin/_common and config your personal information.
"
" Here is the place to set personal preferences; "priority=personal" is the
" highest which overrides any other XPTvar setting.
"
" You can also set personal variables with 'g:xptemplate_vars' in your .vimrc.
XPTemplate priority=personal


" XPTvar $author       you have not yet set $author variable
" XPTvar $email        you have not yet set $email variable

"XPT yoursnippet " tips here
"bla bla
"for`$SPcmd^(`$SParg^``i^`$SPop^=`$SPop^`0^; `i^`$SPop^<`$SPop^`len^; `i^++`$SParg^)`$BRloop^{
    "`cursor^
"}

XPTinclude
	    \ jquery
      \ _common/common
      \ _comment/doubleSign
      \ _condition/ecma


XPT ctrl
XSET args*|post=ExpandIfNotEmpty( "', '", 'args*', "" )
XSET crgs*|post=ExpandIfNotEmpty( ", ", 'crgs*', "" )
app.controller '`name^Ctrl', ['$scope', '`args*^',
  ($scope, `crgs*^)->
      console.info '`name^Ctrl'
      `cursor^
]

XPT factory
XSET args*|post=ExpandIfNotEmpty( "', '", 'args*', "" )
XSET crgs*|post=ExpandIfNotEmpty( ", ", 'crgs*', "" )
factory('`name^', ['`args*^',
  (`crgs*^)->
      `cursor^
])

XPT service
app.factory('`name^', ['$resource',
  ($resource)->
    index:  $resource '/`name^s.json'               # .get
    show:   $resource '/`name^s/:`name^_id.json'      # .get
    edit:   $resource '/`name^s/:`name^_id/edit.json' # .get
    create: $resource '/`name^s.json'                  # .save
    update: $resource('/`name^s/:`name^_id.json', {}, # .save
      save: { method: 'PUT' }
    )
])


XPT rest
.when('/`name^s',
    { templateUrl: '/tp/`name^s/index',
    controller: '`name^IndexCtrl'})
.when('/`name^s/:`name^_id',
    { templateUrl: '/tp/`name^s/show',
    controller: '`name^ShowCtrl'})
.when('/`name^s/new',
    { templateUrl: '/tp/`name^s/edit',
    controller: '`name^NewCtrl'})
.when('/`name^s/:`name^_id/edit',
    { templateUrl: '/tp/`name^s/edit',
    controller: '`name^EditCtrl'})
`cursor^
