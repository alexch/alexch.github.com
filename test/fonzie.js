var msg = "Fonzie says: \"Ayy! "; 
var sel = window.getSelection();
var n = sel.anchorNode;
if (n) {
  msg += sel + '"\n';
  var s = getComputedStyle(n.parentNode);
  atts = [
    "font-family",
    "font-size",
    "font-style",
    "font-variant",
    "font-weight",
    "line-height",
    "text-align",
    "text-decoration",
    "text-indent",
    "text-rendering",
    "text-shadow",
    "text-overflow",
    "text-transform",
    "outline-color",
    "outline-style",
    "outline-width",
    "color",
    "background-color"
  ];
  for (var i=0;i<atts.length;++i) {
    var a=atts[i];
    v = s.getPropertyValue(a);
    if (v != "auto" && v != 'normal' && v != 'none')
      msg += a + ": " + v + "\n";
  }
} else {
  msg += "If you select some text, I'll tell you what font it is.\"";
}
alert(msg);
