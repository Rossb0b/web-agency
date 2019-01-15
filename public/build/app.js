(window["webpackJsonp"] = window["webpackJsonp"] || []).push([["app"],{

/***/ "./assets/js/app.js":
/*!**************************!*\
  !*** ./assets/js/app.js ***!
  \**************************/
/*! no static exports found */
/***/ (function(module, exports) {

throw new Error("Module build failed (from ./node_modules/babel-loader/lib/index.js):\nSyntaxError: /var/www/html/Symfony/web-agency/assets/js/app.js: Invalid left-hand side in assignment expression (13:0)\n\n\u001b[0m \u001b[90m 11 | \u001b[39m\u001b[36mconst\u001b[39m $ \u001b[33m=\u001b[39m require(\u001b[32m'jquery'\u001b[39m)\u001b[33m;\u001b[39m\u001b[0m\n\u001b[0m \u001b[90m 12 | \u001b[39m\u001b[0m\n\u001b[0m\u001b[31m\u001b[1m>\u001b[22m\u001b[39m\u001b[90m 13 | \u001b[39m\u001b[33m+\u001b[39m \u001b[90m// create global $ and jQuery variables\u001b[39m\u001b[0m\n\u001b[0m \u001b[90m    | \u001b[39m\u001b[31m\u001b[1m^\u001b[22m\u001b[39m\u001b[0m\n\u001b[0m \u001b[90m 14 | \u001b[39m\u001b[33m+\u001b[39m global\u001b[33m.\u001b[39m$ \u001b[33m=\u001b[39m global\u001b[33m.\u001b[39mjQuery \u001b[33m=\u001b[39m $\u001b[33m;\u001b[39m\u001b[0m\n\u001b[0m \u001b[90m 15 | \u001b[39m\u001b[0m\n\u001b[0m \u001b[90m 16 | \u001b[39m\u001b[90m// this \"modifies\" the jquery module: adding behavior to it\u001b[39m\u001b[0m\n    at Parser.raise (/var/www/html/Symfony/web-agency/node_modules/@babel/parser/lib/index.js:4051:15)\n    at Parser.toAssignable (/var/www/html/Symfony/web-agency/node_modules/@babel/parser/lib/index.js:5545:18)\n    at Parser.parseMaybeAssign (/var/www/html/Symfony/web-agency/node_modules/@babel/parser/lib/index.js:5908:49)\n    at Parser.parseExpression (/var/www/html/Symfony/web-agency/node_modules/@babel/parser/lib/index.js:5840:21)\n    at Parser.parseStatementContent (/var/www/html/Symfony/web-agency/node_modules/@babel/parser/lib/index.js:7619:21)\n    at Parser.parseStatement (/var/www/html/Symfony/web-agency/node_modules/@babel/parser/lib/index.js:7505:17)\n    at Parser.parseBlockOrModuleBlockBody (/var/www/html/Symfony/web-agency/node_modules/@babel/parser/lib/index.js:8073:23)\n    at Parser.parseBlockBody (/var/www/html/Symfony/web-agency/node_modules/@babel/parser/lib/index.js:8060:10)\n    at Parser.parseTopLevel (/var/www/html/Symfony/web-agency/node_modules/@babel/parser/lib/index.js:7470:10)\n    at Parser.parse (/var/www/html/Symfony/web-agency/node_modules/@babel/parser/lib/index.js:8915:17)\n    at parse (/var/www/html/Symfony/web-agency/node_modules/@babel/parser/lib/index.js:10946:38)\n    at parser (/var/www/html/Symfony/web-agency/node_modules/@babel/core/lib/transformation/normalize-file.js:170:34)\n    at normalizeFile (/var/www/html/Symfony/web-agency/node_modules/@babel/core/lib/transformation/normalize-file.js:138:11)\n    at runSync (/var/www/html/Symfony/web-agency/node_modules/@babel/core/lib/transformation/index.js:44:43)\n    at runAsync (/var/www/html/Symfony/web-agency/node_modules/@babel/core/lib/transformation/index.js:35:14)\n    at process.nextTick (/var/www/html/Symfony/web-agency/node_modules/@babel/core/lib/transform.js:34:34)\n    at _combinedTickCallback (internal/process/next_tick.js:132:7)\n    at process._tickCallback (internal/process/next_tick.js:181:9)");

/***/ })

},[["./assets/js/app.js","runtime"]]]);



$(document).ready(function () {
  $('#edit-button').on('click', function () {
    if ($('#sidebar').hasClass('active'))
    {
      $('#sidebar').removeClass('active');
      $('#sidebar').toggleClass('desactive');
      $(this).toggleClass('desactive');
      $('#sidebar').hide();
    }
    else if ($('#sidebar').hasClass('desactive'))
    {
      $('#sidebar').removeClass('desactive');
      $('#sidebar').toggleClass('active');
      $(this).toggleClass('active');
      $('#sidebar').show();
    }
    else
    {
      $('#sidebar').toggleClass('active');
      $(this).toggleClass('active');
      $('#sidebar').show();
    }
  });
});

let val;
let borrowedBook;

$("td.bookNumber").each(function() { 
  let val = $.text([this]);
  let borrowedBook = 0;
  borrowedBook = parseInt(val);
  if (borrowedBook >= 10)
  {
    $(this).closest('tr').addClass("table-danger");
  }
  else if (borrowedBook >= 5)
  {
    $(this).closest('tr').addClass("table-warning");
  }
  else if (borrowedBook > 0)
  {
    $(this).closest('tr').addClass("table-info");
  }
});





//# sourceMappingURL=data:application/json;charset=utf-8;base64,eyJ2ZXJzaW9uIjozLCJzb3VyY2VzIjpbXSwibmFtZXMiOltdLCJtYXBwaW5ncyI6IiIsImZpbGUiOiJhcHAuanMiLCJzb3VyY2VSb290IjoiIn0=