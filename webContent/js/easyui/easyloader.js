/**
 * easyloader
 * @author ZL
 * @since 2013-7-28
 */
(function(){
var _1={validate_extend:{js:"jquery.validate_extend.js"},draggable:{js:"jquery.draggable.js"},droppable:{js:"jquery.droppable.js"},resizable:{js:"jquery.resizable.js"},linkbutton:{js:"jquery.linkbutton.js",css:"linkbutton.css"},progressbar:{js:"jquery.progressbar.js",css:"progressbar.css"},pagination:{js:"jquery.pagination.js",css:"pagination.css",dependencies:["linkbutton"]},datagrid:{js:"jquery.datagrid.js",css:"datagrid.css",dependencies:["panel","resizable","linkbutton","pagination"]},treegrid:{js:"jquery.treegrid.js",css:"tree.css",dependencies:["datagrid"]},propertygrid:{js:"jquery.propertygrid.js",css:"propertygrid.css",dependencies:["datagrid"]},panel:{js:"jquery.panel.js",css:"panel.css"},window:{js:"jquery.window.js",css:"window.css",dependencies:["resizable","draggable","panel"]},dialog:{js:"jquery.dialog.js",css:"dialog.css",dependencies:["linkbutton","window"]},messager:{js:"jquery.messager.js",css:"messager.css",dependencies:["linkbutton","window","progressbar"]},layout:{js:"jquery.layout.js",css:"layout.css",dependencies:["resizable","panel"]},form:{js:"jquery.form.js"},menu:{js:"jquery.menu.js",css:"menu.css"},tabs:{js:"jquery.tabs.js",css:"tabs.css",dependencies:["panel","linkbutton"]},splitbutton:{js:"jquery.splitbutton.js",css:"splitbutton.css",dependencies:["linkbutton","menu"]},menubutton:{js:"jquery.menubutton.js",css:"menubutton.css",dependencies:["linkbutton","menu"]},accordion:{js:"jquery.accordion.js",css:"accordion.css",dependencies:["panel"]},calendar:{js:"jquery.calendar.js",css:"calendar.css"},combo:{js:"jquery.combo.js",css:"combo.css",dependencies:["panel","validatebox"]},combobox:{js:"jquery.combobox.js",css:"combobox.css",dependencies:["combo"]},combotree:{js:"jquery.combotree.js",dependencies:["combo","tree"]},combogrid:{js:"jquery.combogrid.js",dependencies:["combo","datagrid"]},validatebox:{js:"jquery.validatebox.js",css:"validatebox.css"},numberbox:{js:"jquery.numberbox.js",dependencies:["validatebox"]},searchbox:{js:"jquery.searchbox.js",css:"searchbox.css",dependencies:["menubutton"]},spinner:{js:"jquery.spinner.js",css:"spinner.css",dependencies:["validatebox"]},numberspinner:{js:"jquery.numberspinner.js",dependencies:["spinner","numberbox"]},timespinner:{js:"jquery.timespinner.js",dependencies:["spinner"]},tree:{js:"jquery.tree.js",css:"tree.css",dependencies:["draggable","droppable"]},datebox:{js:"jquery.datebox.js",css:"datebox.css",dependencies:["calendar","combo"]},datetimebox:{js:"jquery.datetimebox.js",dependencies:["datebox","timespinner"]},slider:{js:"jquery.slider.js",css:"slider.css",dependencies:["draggable"]},parser:{js:"jquery.parser.js"}};
var _2={"af":"easyui-lang-af.js","bg":"easyui-lang-bg.js","ca":"easyui-lang-ca.js","cs":"easyui-lang-cs.js","cz":"easyui-lang-cz.js","da":"easyui-lang-da.js","de":"easyui-lang-de.js","en":"easyui-lang-en.js","es":"easyui-lang-es.js","fr":"easyui-lang-fr.js","it":"easyui-lang-it.js","nl":"easyui-lang-nl.js","pt_BR":"easyui-lang-pt_BR.js","ru":"easyui-lang-ru.js","tr":"easyui-lang-tr.js","zh_CN":"easyui-lang-zh_CN.js","zh_TW":"easyui-lang-zh_TW.js"};
easyloader={modules:_1,locales:_2,base:$WEB_ROOT_PATH+'/js/easyui/',theme:"metro-blue",css:true,locale:null};
if(window.jQuery){
jQuery(function(){
easyloader.includeM('parser');
jQuery.parser.parse();
});
}
easyloader.includeM = easyloader.load = function(_d,_c9){
var _lm = [];
var _valiext = false;
if('string'===typeof(_d)){
add(_d);
if(_d==='validatebox') _valiext=true;
}else{
for(var i=0;i<_d.length;i++){
add(_d[i]);
if(_d[i]==='validatebox') _valiext=true;
}
}
function add(_f,_fc){
if (!_1[_f])
return;
var d0 = _1[_f]["dependencies"];
if (d0 && d0.length){
for ( var i = 0; i < d0.length; i++){
add(d0[i]);
if(d0[i]==='validatebox') _valiext=true;
}
}
_lm.push(_1[_f]);
}
function includeF(mm){
if (mm&&mm.css){
includeCSS('/js/easyui/themes/'+easyloader.theme+'/'+mm.css);
}
if (mm&&mm.js){
includeJS('/js/easyui/plugins/'+mm.js);
}
}
if (_lm && _lm.length){
for ( var i = 0; i < _lm.length; i++){
includeF(_lm[i]);
}
}
if('undefined'!=typeof(easyloader.locales[easyloader.locale]) 
&& easyloader.locales[easyloader.locale]){
includeJS('/js/easyui/locale/'+easyloader.locales[easyloader.locale],1);
}
if(_valiext){
includeF(_1['validate_extend']);
}
_lm = null;
if(_c9) _c9();
};
})();