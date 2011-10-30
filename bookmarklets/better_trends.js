function item(name, promoted){return "<li class='trend-item'><a href='/#!/search/" + name + "' class='trend-link-arrow trend-link pretty-link'><span class='trend-term'><s class='hash'>#</s><b>" + name + 

(promoted ? '<span class="icon-link tweet-context" original-title=""><i class="badge-tweet badge-tweet-promoted"></i><b>Promoted</b></span>' : '') +

"</b></span></a></li>"
}
$('.trends-inner ul.trends').html(item("wilw") + item("feliciaday") + item("jonathancoulton") + item("donttrythis") + item("scalzi") + item("jephjacques") + item("alexch", true) + item("psfr"));
