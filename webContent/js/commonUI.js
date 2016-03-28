/**
 * 公共UI组件
 * @author 张磊
 * @since 2013-7-18
 * @class
 */

function CommonUI(option){
	/**
	 * 选项
	 */
	this.option = option;
	
	/**
	 * 初始化完成标志
	 */
	this._INIT_COMPLETED = false;

	/**
	 * 对话框ID
	 */
	this._DIALOG_ID = "EASYUI_DIALOG";
	
	/**
	 * 默认语言
	 */
	this._LANG = "zh-CN";
	
	/**
	 * 是否开启ajax_debug功能
	 */
	this._AJAX_DEBUG = false;
	
	/**
	 * 是否开启AJAX成功提示
	 */
	this._AJAX_SUCC = false;
	
	/**
	 * 是否开启AJAX错误提示
	 */
	this._AJAX_ERROR = false;
	
	/**
	 * 字典服务的URL
	 */
	this._DICT_SERVICE_URL = '';

	/**
	 * 默认自动关闭时间(毫秒)
	 */
	this._DEFAULT_AUTO_CLOSE_TIME = 1500;

	/**
	 * 默认消息标题
	 */
	this._DEFAULT_TITLE_MESSAGE = "消息";

	/**
	 * 默认确认框标题
	 */
	this._DEFAULT_TITLE_CONFIRM = "请确认";

	/**
	 * 默认消息提示类型
	 */
	this._DEFAULT_ALERT_TYPE_MESSAGE = "info";

	/**
	 * 默认确认提示类型
	 */
	this._DEFAULT_CONFIRM_TYPE_MESSAGE = "question";

	/**
	 * 默认对话框提示类型
	 */
	this._DEFAULT_DIADIOG_TYPE_MESSAGE = "question";

	/**
	 * 默认ok按钮文本
	 */
	this._DEFAULT_OK_BUTTON_TEXT = "确定";

	/**
	 * 默认cancel按钮文本
	 */
	this._DEFAULT_CANCEL_BUTTON_TEXT = "取消";

	/**
	 * 日期格式
	 */
	this._DEFAULT_DATE_FORMAT = "yyyy-mm-dd";

	/**
	 * 默认日期选择器的class
	 */
	this._DEFAULT_DATEPICKER_CLASS = "datepicker";

	/**
	 * jqGrid的默认文本的class
	 */
	this._DEFAULT_TEXT_CLASS = "defaultText";
	
	/**
	 * 默认datagrid的选项
	 */
	this._DEFAULT_DATAGRID_OPTIONS = {
		title:'',      			// 标题
		autoRowHeight: false,   // 自动行高
	    // 翻页工具
	    pagePosition: 'bottom', // 翻页位置
	    pageList: [10,15,20,50,100], // 可选翻页列表
	    striped: true, // 行间是否条纹间隔
	    // 显示表信息
	    showHeader: true, 		// 显示表头
//	    showFooter: true, 		// 显示表脚
	    rownumbers: true, 		// 显示行号 
	    // 加载错误处理函数
		onLoadError: function(error){
			$CommonUI.autoCloseCenterMessage("加载数据失败");
		}
	};

	/**
	 * 默认colorbox的选项
	 */
	this._EASYUI_DEFAULT_THEMES = 'dhcc';//'metro-blue';

	/**
	 * 默认colorbox的选项
	 */
	this._DEFAULT_COLORBOX_OPTIONS = {
			
	};

	/**
	 * 默认poshytip选项
	 */
	this._DEFAULT_POSHYTIP_OPTIONS = {
		className: 'tip-yellow',
		showOn: 'focus',
		alignTo: 'target',
		alignX: 'top',
		offsetX: -125,
		offsetY: 5
	};
	
	this.isLoadingComplete = function(){
		return this._INIT_COMPLETED;
	};

	this.loadComplete = function(){
		this._INIT_COMPLETED = true;
	};

	this.getDialogId = function(){
		return this._DIALOG_ID;
	};

	/**
	 * 内部初始化
	 * @author 张磊
	 * @since 2013-7-18
	 */
	this._init = function(){
		if(!this.isLoadingComplete()){
			// 加载EasyUI框架
			includeCSS("/js/easyui/themes/main.css");
			includeCSS("/js/easyui/themes/icon.css");
			includeJS("/js/easyui/easyloader.js");
			includeJS("/js/jquery/jquery.json-2.4.min.js");
			// easyui 语言
			easyloader.locale = this._LANG.replace('-','_');
			// easyui 主题
			easyloader.theme = this._EASYUI_DEFAULT_THEMES;
			this.loadComplete();
		}
	};

	/**
	 * 消息提示框，用于替换原生alert
	 * @param message 消息
	 * @param alertType 提示图标类型（可选,应在下列值之间：error|question|info|warning）
	 * @param title 标题（可选，默认为消息）
	 * @param okText （可选，按钮文本）
	 * @param okFunc (可选，确定按钮处理函数)
	 * @param hasCloseCross 有关闭按钮（可选，默认true）
	 * @author 张磊
	 * @since 2013-7-18
	 */
	this.alert = function (message, alertType, title, okText, okFunc, hasCloseCross){
		this.loadUIM('messager');
		var _alertType = alertType ? alertType : this._DEFAULT_ALERT_TYPE_MESSAGE; 
		jQuery.messager.defaults.ok = this._DEFAULT_OK_BUTTON_TEXT;
		if(okText) {
			jQuery.messager.defaults.ok = okText;
		}
		var _title = title ? title : this._DEFAULT_TITLE_MESSAGE; 

		jQuery.messager.alert(_title, message, _alertType, okFunc);
		
		if(!hasCloseCross) {
			jQuery("body > .messager-window:last .panel-tool > .panel-tool-close").remove();
		}
	};

	/**
	 * 消息确认框，用于替换原生confirm
	 * @param message 消息
	 * @param alertType 提示图标类型（可选,应在下列值之间：error|question|info|warning）
	 * @param okText 确定按钮文本（可选，有默认）
	 * @param okFunc 确定按钮处理函数（可选）
	 * @param cancelText 取消按钮文本（可选，有默认）
	 * @param cancelFunc 取消按钮处理函数（可选）
	 * @param title 标题（可选，有默认）
	 * @param hasCloseCross 有关闭按钮（可选，默认true）
	 * @author 张磊
	 * @since 2013-7-20
	 */
	this.confirm = function (message, alertType, okText, okFunc, cancelText, cancelFunc, title, hasCloseCross){
		this.loadUIM('messager');
		var _alertType = alertType ? alertType : this._DEFAULT_CONFIRM_TYPE_MESSAGE; 
		var _title = null!=title ? title : this._DEFAULT_TITLE_CONFIRM;
		jQuery.messager.defaults.ok = this._DEFAULT_OK_BUTTON_TEXT;
		if(okText) {
			jQuery.messager.defaults.ok = okText;
		}
		jQuery.messager.defaults.cancel = this._DEFAULT_CANCEL_BUTTON_TEXT;
		if(cancelText) {
			jQuery.messager.defaults.cancel = cancelText;
		}
		jQuery.messager.confirm(_title, message, function(rlt){
			if (rlt) { // ok
				if(okFunc) okFunc();
			} else {  // cancel
				if(cancelFunc) cancelFunc();
			}
		});
		if(_alertType) {
			jQuery("body > .messager-window:last > .messager-body > .messager-icon")
				.removeClass("messager-question").addClass("messager-" + alertType);
		}
		if(!hasCloseCross) {
			jQuery("body > .messager-window:last > .panel-header > .panel-tool > .panel-tool-close").remove();
		}
	};

	/**
	 * 自动关闭的消息提示框（中间显示）
	 * @param message 消息
	 * @param alertType 提示图标类型（可选,应在下列值之间：error|question|info|warning）
	 * @param title 标题（可选）
	 * @param timeout 自动关闭时间（毫秒，默认1500）
	 * @author 张磊
	 * @since 2013-7-21
	 */
	this.autoCloseCenterMessage = function(message, alertType, title, timeout){
		var _timeout = timeout ? timeout : this._DEFAULT_AUTO_CLOSE_TIME;
		this.showMessage(message, alertType, title, _timeout, true);
	};

	/**
	 * 自动关闭的消息提示框（右下角显示）
	 * @param message 消息
	 * @param title 标题（可选）
	 * @param timeout 自动关闭时间（毫秒，默认1500）
	 * @param showType 显示方式（可选,应在下列值之间：fade|slide|show）
	 * @author 张磊
	 * @since 2013-7-21
	 */
	this.autoCloseRightBottomMessage = function(message, title, timeout, showType){
		this.loadUIM('messager');
		var _showType = showType ? showType : 'slide';
		var _timeout = timeout ? timeout : this._DEFAULT_AUTO_CLOSE_TIME;
		jQuery.messager.show({
			title: title,
			msg: message,
			timeout: _timeout,
	 		showType: _showType
		});
	};

	/**
	 * 显示模态消息
	 * @param message 消息
	 * @param alertType 提示图标类型（可选,应在下列值之间：error|question|info|warning）
	 * @param title 标题（可选，默认为消息）
	 * @param timeout 自动关闭时间（可选，默认为false）
	 * @param autoClose 是否自动关闭（可选，默认为false）
	 * @author 张磊
	 * @since 2013-7-21
	 */
	this.showModalMessage = function(message, alertType, title, timeout, autoClose){
		this.showMessage(message, alertType, title, timeout, autoClose, true);
	};
	
	/**
	 * 显示消息（提供高级选项，中间显示）
	 * @param message 消息
	 * @param alertType 提示图标类型（可选,应在下列值之间：error|question|info|warning）
	 * @param title 标题（可选，默认为消息）
	 * @param timeout 自动关闭时间（可选，毫秒，默认1500）
	 * @param autoClose 是否自动关闭（可选，默认为false）
	 * @param modal 是否是模态对话框（可选，默认为false）
	 * @param okText（可选，按钮1文本）
	 * @param okFunc（可选，按下按钮1后的回调函数）
	 * @param cancelText（可选，按钮2文本，设置此参数将创建2个按钮）
	 * @param cancelFunc（可选，按下按钮2后的回调函数，仅当设置了按钮2时才可用）
	 * @param hasCloseCross（可选，有关闭x按钮，默认true）
	 * @author 张磊
	 * @since 2013-7-21
	 */
	this.showMessage = function(message, alertType, title, timeout, autoClose, modal, okText, okFunc, cancelText, cancelFunc, hasCloseCross){
		this.loadUIM('messager');
		var _alertType = alertType ? alertType : this._DEFAULT_DIADIOG_TYPE_MESSAGE;
		var _title = title ? title : this._DEFAULT_TITLE_MESSAGE;
		var _timeout = parseInt(timeout)>0 ? parseInt(timeout) : this._DEFAULT_AUTO_CLOSE_TIME;
		var _modal = null != modal ? modal : false; 
		var _okText = okText ? okText : '';
		var _cancelText = cancelText ? cancelText : '';
		var _hasCloseCross = null != hasCloseCross ? hasCloseCross : true;
		jQuery.messager.defaults.ok = this._DEFAULT_OK_BUTTON_TEXT;
		jQuery.messager.defaults.cancel = this._DEFAULT_CANCEL_BUTTON_TEXT;
		if(cancelText) {
			// two button
			this.confirm(message, _alertType, _okText, okFunc, _cancelText, cancelFunc, _title);
		} else {
			// one button
			this.alert(message, _alertType, _title, _okText, okFunc);
		}
		var win = jQuery("body > .messager-window:last > .messager-body");
		win.window({"modal": _modal});     // 模式窗口, 
		win.window({"draggable" : false}); // 禁止拖动窗口
		win.window({"shadow" : false});    // 去掉阴影
		var msEffect = 200;                // 效果持续时间
		function destroyMsgWin() { win.window('destroy'); }
		function closeCustomWin(ms) {
			try {
				if(!win.window("window")) return;
				if(win) {
					win.window("window").fadeOut(ms);
					setTimeout(function(){ destroyMsgWin(); }, ms);
				}
			} catch (e) {}
		}
		if(null != autoClose && !!autoClose && parseInt(timeout)>0) {
			win.window({"onBeforeClose": function() {
				if(win.timer) {
					clearTimeout(win.timer);
				}
				closeCustomWin(msEffect);
				return false;
			}});
			win.timer=setTimeout(function(){ closeCustomWin(msEffect); }, _timeout);
			win.window('window').hover(function(){
					if(win.timer) {
						clearTimeout(win.timer);
					}
				},function() {
					win.timer=setTimeout(function(){ closeCustomWin(msEffect); }, _timeout);
				}
			);
		}
		if(!_hasCloseCross) {
			jQuery("body > .messager-window:last > .panel-header > .panel-tool > .panel-tool-close").remove();
		}
	};
	
	/**
	 * 显示用户无法关闭的对话框
	 * @param message 消息
	 * @param alertType 提示类型（可选，默认为""）
	 * @param title 标题(可选，默认为消息)
	 * @param buttonText 关闭按钮文字（可选，如果没有或为空字符串，则不创建此按钮）
	 * @param callback 关闭按钮回调事件
	 * @param buttonText2 非关闭按钮文字（可选，如果没有或为空字符串，则不创建此按钮）
	 * @param callback2 非关闭按钮回调函数
	 */
	this.showUnCloseDialog = function(message, alertType, title, okText, okFunc, cancelText, cancelFunc){
		this.showMessage(message, alertType, title, 0, false, false, okText, okFunc, cancelText, cancelFunc, false);
	},
	
	/**
	 * 构造日期控件
	 * @param obj dom对象，可以是：dom元素的id | jQuery选择器 | dom对象 | jQuery对象
	 * @param value 初始值
	 * @param required 是否必须（可选，默认为false）
	 * @param options 扩展选项（可选）
	 * @author 张磊
	 * @since 2013-7-20
	 */
	this.datebox = function(obj, value, required, options){
		this.loadUIM('datebox');
		if(obj){
			var jqobj = getJqueryDomElement(obj);
			var _options = {
				panelWidth: '280',
				panelHeight: '220'
			};
			if(null != required) {
				jQuery.extend(_options, { required: required });
			}
			options && jQuery.extend(_options, options);
			jqobj.datebox(_options); 
			jqobj.datebox('setValue', value);
		}
	};

	/**
	 * 获取日期对象
	 * @param obj dom对象，可以是：dom元素的id | jQuery选择器 | dom对象 | jQuery对象
	 */
	this.getDateBox = function(obj){
		this.loadUIM('datebox');
		if(obj){
			return getJqueryDomElement(obj);
		} else {
			return null;
		}
	};
	
	/**
	 * 构造时间控件
	 * @param obj dom对象，可以是：dom元素的id | jQuery选择器 | dom对象 | jQuery对象
	 * @param value 初始值
	 * @param required 是否必须（可选，默认为false）
	 * @param showSeconds 是否显示秒（可选，默认为false）
	 * @param min 最小值（可选）
	 * @param max 最大值（可选）
	 * @param options 扩展选项（可选）
	 * @author 张磊
	 * @since 2013-7-20
	 */
	this.timespinner = function(obj, value, required, showSeconds, min, max, options){
		this.loadUIM('timespinner');
		if(obj){
			var jqobj = getJqueryDomElement(obj);
			var _options = {
				highlight: 0  // 高亮“时”
			};
			if(null != required) {
				jQuery.extend(_options, {required: required});
			}
			if(null != showSeconds) {
				jQuery.extend(_options, {"showSeconds": showSeconds});
			}
			if(min) {
				jQuery.extend(_options, {"min": min});
			}
			if(max) {
				jQuery.extend(_options, {"max": max});
			}
			options && jQuery.extend(_options, options);
			jqobj.timespinner(_options);
			jqobj.timespinner('setValue', value); // 验证max&min
		}
	};
	
	/**
	 * 获取时间条对象
	 * @param obj dom对象，可以是：dom元素的id | jQuery选择器 | dom对象 | jQuery对象
	 */
	this.getTimeSpinner = function(obj){
		this.loadUIM('timespinner');
		if(obj){
			return getJqueryDomElement(obj);
		} else {
			return null;
		}
	};
	
	/**
	 * 构造日期时间控件
	 * @param obj dom对象，可以是：dom元素的id | jQuery选择器 | dom对象 | jQuery对象
	 * @param value 初始值
	 * @param required 是否必须（可选，默认为false）
	 * @param showSeconds 显示秒（可选，默认为false）
	 * @param options 扩展选项（可选）
	 * @author 张磊
	 * @since 2013-7-20
	 */
	this.datetimebox = function(obj, value, required, showSeconds, options){
		this.loadUIM('datetimebox');
		if(obj){
			var jqobj = getJqueryDomElement(obj);
			var _options = {
				width: 160,
				showSeconds: false,
				panelWidth: '320',
				panelHeight: '230'
			};
			if(null != required) {
				jQuery.extend(_options, {required: required});
			}
			if(null != showSeconds) {
				jQuery.extend(_options, {"showSeconds": showSeconds});
			}
			options && jQuery.extend(_options, options);
			jqobj.datetimebox(_options); 
			jqobj.datetimebox('setValue', value);
		}
	};
	
	/**
	 * 获取日期时间控件
	 * @param obj dom对象，可以是：dom元素的id | jQuery选择器 | dom对象 | jQuery对象
	 */
	this.getDateTimeBox = function(obj){
		this.loadUIM('datetimebox');
		if(obj){
			return getJqueryDomElement(obj);
		}else{
			return null;
		}
	};
	
	/**
	 * 动态加载easyui组件
	 * @param type 类型
	 * @author 张磊
	 * @since 2013-7-20
	 */
	this.loadUIM = function (type) {
		// 加载组件
		easyloader.includeM(type);
	};
	
	/**
	 * 取得linkbutton对象
	 * @param obj dom对象，可以是：dom元素的id | jQuery选择器 | dom对象 | jQuery对象
	 */
	this.getLinkButton = function (obj){
		this.loadUIM('linkbutton');
		if(obj) {
			return getJqueryDomElement(obj);
		}else {
			return null;
		}
	};
	
	/**
	 * 取得搜索框对象
	 * @param obj dom对象，可以是：dom元素的id | jQuery选择器 | dom对象 | jQuery对象
	 */
	this.getSearchBox = function(obj) {
		this.loadUIM('searchbox');
		if(obj) {
			return getJqueryDomElement(obj);
		}else {
			return null;
		}
	};
	
	/**
	 * 取得翻页UI对象
	 * @param obj dom对象，可以是：dom元素的id | jQuery选择器 | dom对象 | jQuery对象
	 */
	this.getPagination = function(obj) {
		this.loadUIM('pagination');
		if(obj) {
			return getJqueryDomElement(obj);
		}else {
			return null;
		}
	};
	
	/**
	 * 取得拖动UI对象
	 * @param obj dom对象，可以是：dom元素的id | jQuery选择器 | dom对象 | jQuery对象
	 */
	this.getDraggable = function(obj) {
		this.loadUIM('draggable');
		if(obj) {
			return getJqueryDomElement(obj);
		}else {
			return null;
		}
	};
	
	/**
	 * 取得放置UI对象
	 * @param obj dom对象，可以是：dom元素的id | jQuery选择器 | dom对象 | jQuery对象
	 */
	this.getDroppable = function(obj) {
		this.loadUIM('droppable');
		if(obj) {
			return getJqueryDomElement(obj);
		}else {
			return null;
		}
	};
	
	/**
	 * 取得重设大小UI对象
	 * @param obj dom对象，可以是：dom元素的id | jQuery选择器 | dom对象 | jQuery对象
	 */
	this.getResizable = function(obj) {
		this.loadUIM('resizable');
		if(obj) {
			return getJqueryDomElement(obj);
		}else {
			return null;
		}
	};

	/**
	 * 取得进度条对象
	 * @param obj dom对象，可以是：dom元素的id | jQuery选择器 | dom对象 | jQuery对象
	 */
	this.getProgressBar = function(obj) {
		this.loadUIM('progressbar');
		if(obj) {
			return getJqueryDomElement(obj);
		}else {
			return null;
		}
	};
	
	/**
	 * 取得panel对象
	 * @param obj dom对象，可以是：dom元素的id | jQuery选择器 | dom对象 | jQuery对象
	 */
	this.getPanel = function(obj) {
		this.loadUIM('panel');
		if(obj) {
			return getJqueryDomElement(obj);
		}else {
			return null;
		}
	};
	
	/**
	 * 取得tabs对象
	 * @param obj dom对象，可以是：dom元素的id | jQuery选择器 | dom对象 | jQuery对象
	 */
	this.getTabs = function(obj) {
		this.loadUIM('tabs');
		if(obj) {
			return getJqueryDomElement(obj);
		}else {
			return null;
		}
	};
	
	/**
	 * 取得accordion对象
	 * @param obj dom对象，可以是：dom元素的id | jQuery选择器 | dom对象 | jQuery对象
	 */
	this.getAccordion = function(obj) {
		this.loadUIM('accordion');
		if(obj) {
			return getJqueryDomElement(obj);
		}else {
			return null;
		}
	};
	
	/**
	 * 取得layout对象
	 * @param obj dom对象，可以是：dom元素的id | jQuery选择器 | dom对象 | jQuery对象
	 */
	this.getLayout = function(obj) {
		this.loadUIM('layout');
		if(obj) {
			return getJqueryDomElement(obj);
		}else {
			return null;
		}
	};
	
	/**
	 * 取得menu对象
	 * @param obj dom对象，可以是：dom元素的id | jQuery选择器 | dom对象 | jQuery对象
	 */
	this.getMenu = function(obj) {
		this.loadUIM('menu');
		if(obj) {
			return getJqueryDomElement(obj);
		}else {
			return null;
		}
	};
	
	/**
	 * 取得menubutton对象
	 * @param obj dom对象，可以是：dom元素的id | jQuery选择器 | dom对象 | jQuery对象
	 */
	this.getMenuButton = function(obj) {
		this.loadUIM('menubutton');
		if(obj) {
			return getJqueryDomElement(obj);
		}else {
			return null;
		}
	};
	
	/**
	 * 取得linkbutton对象
	 * @param obj dom对象，可以是：dom元素的id | jQuery选择器 | dom对象 | jQuery对象
	 */
	this.getLinkButton = function(obj) {
		this.loadUIM('linkbutton');
		if(obj) {
			return getJqueryDomElement(obj);
		}else {
			return null;
		}
	};
	
	/**
	 * 取得splitbutton对象
	 * @param obj dom对象，可以是：dom元素的id | jQuery选择器 | dom对象 | jQuery对象
	 */
	this.getSplitButton = function(obj) {
		this.loadUIM('splitbutton');
		if(obj) {
			return getJqueryDomElement(obj);
		}else {
			return null;
		}
	};
	
	/**
	 * 取得window对象
	 * @param obj dom对象，可以是：dom元素的id | jQuery选择器 | dom对象 | jQuery对象
	 */
	this.getWindow = function(obj) {
		this.loadUIM('window');
		if(obj) {
			return getJqueryDomElement(obj);
		}else {
			return null;
		}
	};
	
	/**
	 * 取得dialog对象
	 * @param obj dom对象，可以是：dom元素的id | jQuery选择器 | dom对象 | jQuery对象
	 */
	this.getDialog = function(obj) {
		this.loadUIM('dialog');
		if(obj) {
			return getJqueryDomElement(obj);
		}else {
			return null;
		}
	};
	
	/**
	 * 取得alert|confirm对象
	 * @param obj dom对象，可以是：dom元素的id | jQuery选择器 | dom对象 | jQuery对象
	 */
	this.getMessager = function(obj) {
		this.loadUIM('messager');
		if(obj) {
			return getJqueryDomElement(obj);
		}else {
			return null;
		}
	};
	
	/**
	 * 取得propertygrid对象
	 * @param obj dom对象，可以是：dom元素的id | jQuery选择器 | dom对象 | jQuery对象
	 */
	this.getPropertyGrid = function(obj) {
		this.loadUIM('propertygrid');
		if(obj) {
			return getJqueryDomElement(obj);
		}else {
			return null;
		}
	};
	
	/**
	 * 取得tree对象
	 * @param obj dom对象，可以是：dom元素的id | jQuery选择器 | dom对象 | jQuery对象
	 */
	this.getTree = function(obj) {
		this.loadUIM('tree');
		if(obj) {
			return getJqueryDomElement(obj);
		}else {
			return null;
		}
	};
	
	/**
	 * 取得treegrid对象
	 * @param obj dom对象，可以是：dom元素的id | jQuery选择器 | dom对象 | jQuery对象
	 */
	this.getTreeGrid = function(obj) {
		this.loadUIM('treegrid');
		if(obj) {
			return getJqueryDomElement(obj);
		}else {
			return null;
		}
	};
	
	/**
	 * 取得datagrid对象
	 * @param obj dom对象，可以是：dom元素的id | jQuery选择器 | dom对象 | jQuery对象
	 */
	this.getDataGrid = function(obj) {
		this.loadUIM('datagrid');
		if(obj) {
			return getJqueryDomElement(obj);
		}else {
			return null;
		}
	};
	
	/**
	 * 取得validatebox对象
	 * @param obj dom对象，可以是：dom元素的id | jQuery选择器 | dom对象 | jQuery对象
	 */
	this.getValidateBox = function(obj) {
		this.loadUIM('validatebox');
		if(obj) {
			return getJqueryDomElement(obj);
		}else {
			return null;
		}
	};
	
	/**
	 * 取得combo对象
	 * @param obj dom对象，可以是：dom元素的id | jQuery选择器 | dom对象 | jQuery对象
	 */
	this.getCombo = function(obj) {
		this.loadUIM('combo');
		if(obj) {
			return getJqueryDomElement(obj);
		}else {
			return null;
		}
	};
	
	/**
	 * 取得combogrid对象
	 * @param obj dom对象，可以是：dom元素的id | jQuery选择器 | dom对象 | jQuery对象
	 */
	this.getComboGrid = function(obj) {
		this.loadUIM('combogrid');
		if(obj) {
			return getJqueryDomElement(obj);
		}else {
			return null;
		}
	};
	
	/**
	 * 取得combotree对象
	 * @param obj dom对象，可以是：dom元素的id | jQuery选择器 | dom对象 | jQuery对象
	 */
	this.getComboTree = function(obj) {
		this.loadUIM('combotree');
		if(obj) {
			return getJqueryDomElement(obj);
		}else {
			return null;
		}
	};
	
	/**
	 * 取得numberbox对象
	 * @param obj dom对象，可以是：dom元素的id | jQuery选择器 | dom对象 | jQuery对象
	 */
	this.getNumberBox = function(obj) {
		this.loadUIM('numberbox');
		if(obj) {
			return getJqueryDomElement(obj);
		}else {
			return null;
		}
	};
	
	/**
	 * 取得calendar对象
	 * @param obj dom对象，可以是：dom元素的id | jQuery选择器 | dom对象 | jQuery对象
	 */
	this.getCalendar = function(obj) {
		this.loadUIM('calendar');
		if(obj) {
			return getJqueryDomElement(obj);
		}else {
			return null;
		}
	};
	
	/**
	 * 取得numberspinner对象
	 * @param obj dom对象，可以是：dom元素的id | jQuery选择器 | dom对象 | jQuery对象
	 */
	this.getNumberSpinner = function(obj) {
		this.loadUIM('numberspinner');
		if(obj) {
			return getJqueryDomElement(obj);
		}else {
			return null;
		}
	};
	
	/**
	 * 取得slider对象
	 * @param obj dom对象，可以是：dom元素的id | jQuery选择器 | dom对象 | jQuery对象
	 */
	this.getSlider = function(obj) {
		this.loadUIM('slider');
		if(obj) {
			return getJqueryDomElement(obj);
		}else {
			return null;
		}
	};
	
	/**
	 * 构造DataGrid组件
	 * @param obj dom对象，可以是：dom元素的id | jQuery选择器 | dom对象 | jQuery对象
	 * @param url 数据来源
	 * @param queryParams 参数(例：{page:1,rows:10})
	 * @param columns 表头选项
	 * @param pageOpts 分页选项（可选）
	 * @param sortOpts 排序选项（可选）
	 * @param options 扩展选项（可选）
	 * @author 张磊
	 * @since 2013-7-20
	 */
	this.datagrid = function(obj, url, queryParams, columns, pageOpts, sortOpts, options) {
		this.loadUIM('datagrid');
		if (!obj) return;
		var jqobj = getJqueryDomElement(obj);
		var _options = this._DEFAULT_DATAGRID_OPTIONS;
		jQuery.extend(_options, {
		    url: url,
		    queryParams: queryParams,
//			method: 'get',    // 提交方法
		    collapsible: true,// 可折叠表格
		    nowrap: true,     // inline
		    singleSelect: false, // 单选
		    pagination: false, // 翻页
		    pageNumber: 1, // 当前选中页
		    pageSize: 15 // 页包含的行数
//		    idField: '',  // id主键
//			iconCls:'icon-reload',
		    // 排序参数
//		    remoteSort: false, // 服务器端排序
//		    sortName: '',  //
//		    sortOrder: 'asc',  // 
		});
		columns && jQuery.extend(_options, {"columns": columns});
		if(pageOpts) {
			jQuery.extend(_options, pageOpts);
		}
		if(sortOpts) {
			jQuery.extend(_options, sortOpts);
		}
		if(options) {
			jQuery.extend(_options, options);
		}
		jqobj.datagrid(_options);
	};
	
	/**
	 * 按条件加载DataGrid数据
	 * @param obj dom对象，可以是：dom元素的id | jQuery选择器 | dom对象 | jQuery对象
	 * @param params 条件
	 * @author 张磊
	 * @since 2013-7-21
	 */
	this.queryForDataGrid = function(obj, params){
		this.loadUIM('datagrid');
		if(obj){
			var jqobj = getJqueryDomElement(obj);
			jqobj.datagrid('load', params);
		}
	};
	
	/**
	 * 构造DataGrid组件
	 * @param obj dom对象，可以是：dom元素的id | jQuery选择器 | dom对象 | jQuery对象
	 * @param url 数据来源
	 * @param queryParams 参数
	 * @param detailURL 取得详细内容URL（字符串|函数，函数传递index和record参数）
	 * @param columns 表头选项
	 * @param pageOpts 分页选项（可选）
	 * @param sortOpts 排序选项（可选）
	 * @param options 扩展选项（可选）
	 * @author 张磊
	 * @since 2013-7-20
	 */
	this.datagriddetail = function(obj, url, queryParams, detailURL, columns, pageOpts, sortOpts, options) {
		this.loadUIM('datagrid');
		if(!obj) return;
		var jqobj = getJqueryDomElement(obj);
		includeJS("/js/easyui/extension/datagrid-detailview.js");
		var _options = jQuery.extend({}, options, {
			onExpandRow: function(index, row){ 
				jQuery(jqobj.selector + '#ddv-'+index).panel({ 
		            border:false, 
		            cache:false, 
		            href: function() { if('function'==typeof(detailURL)) return detailURL(index, row); else return detailURL;}(), 
		            onLoad:function(){ 
		            	jqobj.datagrid('fixDetailRowHeight',index); 
		            } 
		        }); 
				jqobj.datagrid('fixDetailRowHeight',index); 
		    }, 
		    detailFormatter: function(index,row){ 
		        return '<div id="ddv-' + index + '" style="padding:5px 0"></div>'; 
		    },
		    view: detailview
		});
		this.datagrid(obj, url, queryParams, columns, pageOpts, sortOpts, _options);
	};
	
	/**
	 * 构造树组件
	 * @param obj dom对象，可以是：dom元素的id | jQuery选择器 | dom对象 | jQuery对象
	 * @param options 扩展选项（可选）
	 * @author 张磊
	 * @since 2013-7-21
	 */
	this.tree = function(obj, url, data, onClick, onDblClick, checkbox, onlyLeafCheck, options){
		this.loadUIM('tree');
		if(obj){
			var jqobj = getJqueryDomElement(obj);
			var _options = {
				dnd: false, 		// 不能拖动
				cascadeCheck: true, // checkbox选择时联动
				lines: true 		// 导航虚线
			};
			if (url) {
				jQuery.extend(_options, {"url": url});
			}
			if (null!=data) {
				if('string'===typeof(data) && data) {
					jQuery.extend(_options, {"data": jQuery.parseJSON(data)});
				} else if('object'===typeof(data) && data) {
					jQuery.extend(_options, {"data": data});
				}
			}
			if (onClick) {
				jQuery.extend(_options, {"onClick": onClick});
			}
			if (onDblClick) {
				jQuery.extend(_options, {"onDblClick": onDblClick});
			}
			if (null != checkbox) {
				jQuery.extend(_options, {"checkbox": checkbox});
			}
			if (null != onlyLeafCheck) {
				jQuery.extend(_options, {"onlyLeafCheck": onlyLeafCheck});
			}
			options && jQuery.extend(_options, options);
			jqobj.tree(_options); 
		}
	};

	/**
	 * 提交form
	 * @param obj dom对象，可以是：dom元素的id | jQuery选择器 | dom对象 | jQuery对象
	 * @param async 是否异步提交
	 * @param url 提交url
	 * @param onSuccess 成功时调用函数
	 * @param onSubmit 提交时调用函数（可选）
	 */
	this.submitForm = function(obj, async, url, onSuccess, onSubmit){
		this.loadUIM('form');
		if(obj) {
			var jqobj = getJqueryDomElement(obj);
			var _options = {
				url: url,
				"success": onSuccess
			};
			onSubmit && jQuery.extend(_options, {"onSubmit": onSubmit});
			if (async) {
				// ajax submit
				jqobj.form(_options);
				jqobj.submit();
			} else {
				// direct submit
				jqobj.submit('submit', _options);
			}
		}
	};
	
	/**
	 * 取得form对象
	 * @param obj dom对象，可以是：dom元素的id | jQuery选择器 | dom对象 | jQuery对象
	 */
	this.getForm = function(obj){
		this.loadUIM('form');
		if(obj) {
			return getJqueryDomElement(obj);
		} else {
			return null;
		}
	};
	
	/**
	 * 取得指定id对象的类型
	 * @param obj dom对象，可以是：dom元素的id | jQuery选择器 | dom对象 | jQuery对象
	 * 
	 * @return string 
	 */
	this.getUIType = function(obj){
		var target = getJqueryDomElement(obj);
		if(!target || target.length==0) return '';
		
		var cbxCls = ['combobox','combotree','combogrid','datetimebox',
		              'datebox','combo','numberbox','numberspinner','timespinner'];

		for(var i=0; i<cbxCls.length; i++){
			var type = cbxCls[i];
			if (target.eq(0).hasClass(type+'-f')){
				return type;
			}
		}

		if(target.eq(0).hasClass('multiselect2side')) {
			return 'multiselect2side';
		}
		if(target.eq(0).hasClass('calendar')) {
			return 'calendar';
		}
		if(target.eq(0).hasClass('dhc-slider')) {
			return 'slider';
		}
		if(target.eq(0).hasClass('validatebox-text')) {
			return 'validatebox';
		}
		
		var tagName = target.eq(0).prop('tagName').toLowerCase();
		if('input' === tagName) {
			tagName = target.eq(0).attr('type').toLowerCase();
		}
		return tagName;
	};
	
	/**
	 * 取得指定对象值
	 * @param obj dom对象，可以是：dom元素的id | jQuery选择器 | dom对象 | jQuery对象
	 */
	this.getUIValue = function(obj) {
		var clsName = this.getUIType(obj);
		if(clsName) {
			var target = getJqueryDomElement(obj);
			if(!target || target.length==0) return null;

			var clses = ['combobox','combotree','combogrid','datetimebox','datebox','combo'];
			var idx = $.inArray(clsName, clses);
			if(-1 != idx) {
				if(target[clses[idx]]('options').multiple) {
					return target.eq(0)[clses[idx]]('getValues');
				} else {
					return target.eq(0)[clses[idx]]('getValue');
				}
			}
			
			clses = ['select', 'multiselect2side'];
			idx = $.inArray(clsName, clses);
			if(-1 != idx) {
				var rtnVal = [];
				$.each(target.children(':selected'), function(i,n){
					rtnVal.push($(this).val());
				});
				return rtnVal;
			}
			
			clses = ['radio'];
			idx = $.inArray(clsName, clses);
			if(-1 != idx) {
				var rtnVal = null;
				$.each(target.filter(':checked'), function(i,n){
					rtnVal=$(this).val();
					return false;
				});
				return rtnVal;
			}
			
			clses = ['checkbox'];
			idx = $.inArray(clsName, clses);
			if(-1 != idx) {
				var rtnVal = [];
				$.each(target.filter(':checked'), function(i,n){
					rtnVal.push($(this).val());
				});
				return rtnVal;
			}
			
			clses = ['numberbox'];
			idx = $.inArray(clsName, clses);
			if(-1 != idx) {
				return target.eq(0)[clses[idx]]('getValue');
			}
			
			clses = ['slider'];
			idx = $.inArray(clsName, clses);
			if(-1 != idx) {
				return target.eq(0)[clses[idx]]('getValue');
			}
			
			clses = ['calendar'];
			idx = $.inArray(clsName, clses);
			if(-1 != idx) {
				return target.eq(0)[clses[idx]]('options').current;				
			}
			
			clses = ['validatebox','input'];
			idx = $.inArray(clsName, clses);
			if(-1 != idx) {
				return target.eq(0).val();
			}
		}
	};
	
	/**
	 * 设置指定ID值
	 * @param obj dom对象，可以是：dom元素的id | jQuery选择器 | dom对象 | jQuery对象
	 */
	this.setUIValue = function(obj, value) {
		var clsName = this.getUIType(obj);
		if(clsName) {
			var target = getJqueryDomElement(obj);
			if(!target || target.length==0) return null;
			
			var clses = ['combobox','combotree','combogrid','datetimebox','datebox','combo'];
			var idx = $.inArray(clsName, clses);
			if(-1 != idx) {
				if(target[clses[idx]]('options').multiple) {
					target.eq(0)[clses[idx]]('setValues', value);
				} else {
					target.eq(0)[clses[idx]]('setValue', value);
				}
				return;
			}
			
			clses = ['multiselect2side', 'select'];
			idx = $.inArray(clsName, clses);
			if(-1 != idx) {
				target.children(':selected').prop('selected', false);
				target.eq(0).val(value);
				return;
			}
			
			clses = ['radio'];
			idx = $.inArray(clsName, clses);
			if(-1 != idx) {
				target.prop('cheched', false);
				target.each(function() {
					if($(this).val() == value) {
						$(this).prop('checked', true);
						return false;
					}
				})
				return;
			}
			
			clses = ['checkbox'];
			idx = $.inArray(clsName, clses);
			if(-1 != idx) {
				target.prop('cheched', false);
				target.each(function() {
					if(-1 !== $.inArray($(this).val(), value)) {
						$(this).prop('checked', true);
					}
				})
				return;
			}
			
			clses = ['numberbox'];
			idx = $.inArray(clsName, clses);
			if(-1 != idx) {
				var number = Number(value);
				if(!isNaN(number)) {
					target.eq(0)[clses[idx]]('setValue', number);
				}
				return;
			}
			
			clses = ['slider'];
			idx = $.inArray(clsName, clses);
			if(-1 != idx) {
				target.eq(0)[clses[idx]]('setValue', value);
				return;
			}
			
			clses = ['calendar'];
			idx = $.inArray(clsName, clses);
			if(-1 != idx) {
				target.eq(0)[clses[idx]]('options').current = value;
				return;
			}
			
			clses = ['validatebox','input'];
			idx = $.inArray(clsName, clses);
			if(-1 != idx) {
				target.eq(0).val(value);
				return;
			}
		}
	}
	
	/**
	 * 遍历区块数据组装成JSON对象
	 * @param container dom对象，可以是：dom元素的id | jQuery选择器 | dom对象 | jQuery对象
	 * @param url 提交url
	 * @param skipNames 跳过的name数组
	 * @param skipHidden 是否跳过HTML标准组件里的hidden字段
	 * @param skipDisabled 是否跳过disable字段
	 */
	this.loopBlock = function(container, skipNames, skipHidden, skipDisabled){
		var attrs = {}; // 返回的对象
		var gettedNames = []; // 需跳过的组件名数组
		if(!skipNames) {
			skipNames = [];   // 需跳过的name
		}
		var target = jQuery(document);
		if(container) {
			target = getJqueryDomElement(container);
		}
		// combo&datebox
		var cbxCls = ['combobox','combotree','combogrid','datetimebox','datebox','combo'];
		var ipts = jQuery('[comboName]', target);
		if (ipts.length){
			ipts.each(function(){
				for(var i=0; i<cbxCls.length; i++){
					var type = cbxCls[i];
					var name = jQuery(this).attr('comboName');
					if (jQuery(this).hasClass(type+'-f')){
						if(skipDisabled && jQuery(this)[type]('options').disabled) {
							return true;
						}
						if(skipNames && -1!==jQuery.inArray(name, skipNames)) {
							return true;
						}
						if (jQuery(this)[type]('options').multiple){
							var val = jQuery(this)[type]('getValues');
							extendJSON(name, val);
						} else {
							var val = jQuery(this)[type]('getValue');
							extendJSON(name, val);
						}
						break;
					}
				}
			});
		}
		// radio&checkbox
		var ipts = jQuery("input[name][type=radio], input[name][type=checkbox]", target);
		if(skipDisabled) ipts=ipts.not(":disabled");
		if(skipHidden) ipts=ipts.not(":hidden");
		if(ipts.length) {
			var iptsNames = [];
			ipts.each(function(){
				var name = jQuery(this).attr('name');
				if(skipNames && -1!==jQuery.inArray(name, skipNames)) {
					return true;
				}
				if(name!='' && name!=null && -1 === jQuery.inArray(name, iptsNames)) {
					iptsNames.push(name);
				}
			});
			for(var i=0;i<iptsNames.length;i++) {
				var iptsFlts = ipts.filter('[name='+iptsNames[i]+']');
				var type = iptsFlts.eq(0).attr('type');
				if(type === 'radio') {
					iptsFlts.each(function(){
						if(jQuery(this).prop('checked')) {
							extendJSON(iptsNames[i], jQuery(this).val());
							return false;
						}
					});
				} else if(type === 'checkbox') {
					var vals = [];
					iptsFlts.each(function(){
						if(jQuery(this).prop('checked')) {
							vals.push(jQuery(this).val());
						}
					});
					extendJSON(iptsNames[i], vals);
				}
			}
		}
		// numberbox&slider
		var cTypes = ['numberbox', 'slider'];
		for(var i=0;i<cTypes.length;i++) {
			ipts = jQuery("input["+cTypes[i]+"name]", target);
			if(skipDisabled) ipts=ipts.not(":disabled");
			if(ipts.length){
				ipts.each(function(){
					var name = jQuery(this).attr(cTypes[i]+'Name');
					if(skipNames && -1!==jQuery.inArray(name, skipNames)) {
						return true;
					}
					var val = jQuery(this)[cTypes[i]]('getValue');
					extendJSON(name, val);
				});
			}
		}
		// multiselect2side
		ipts = jQuery(".multiselect2side", target);
		if(ipts.length){
			ipts.each(function(){
				var name = jQuery(this).attr('name');
				if(skipDisabled && $(this).next('.ms2side__div').find(':disabled').length) {
					return true;
				}
				if(skipNames && -1!==jQuery.inArray(name, skipNames)) {
					return true;
				}
				var val = jQuery(this)['multiselect2side']('getValue');
				extendJSON(name, val);
			});
		}
		// select
		ipts = jQuery("select[name]", target);
		if(skipDisabled) ipts=ipts.not(":disabled");
		if(skipHidden) ipts=ipts.not(":hidden");
		if(ipts.length){
			ipts.each(function(){
				var name = jQuery(this).attr('name');
				if(skipNames && -1!==jQuery.inArray(name, skipNames)) {
					return true;
				}
				var val = jQuery(this).val();
				extendJSON(name, val);
			});
		}
		// validatebox&input&textarea
		ipts = jQuery("input[name], textarea[name]", target);
		if(skipDisabled) ipts=ipts.not(":disabled");
		if(skipHidden) ipts=ipts.not(":hidden");
		if(ipts.length){
			ipts.each(function(){
				var name = jQuery(this).attr('name');
				if(skipNames && -1!==jQuery.inArray(name, skipNames)) {
					return true;
				}
				var val = jQuery(this).val();
				extendJSON(name, val);
			});
		}
		// function
		function extendJSON(name, val) {
			if(!name) return;
			if(-1 !== $.inArray(name, gettedNames)) {
				// 只获取第一个name的值
				return;
			} else {
				gettedNames.push(name);
			}
			val = 'undefined'!==typeof(val)? val:'';
			var newObj = eval('({"'+name+'":'+jQuery.toJSON(val)+'})');
			jQuery.extend(attrs, newObj);
		}
		//console.log(attrs);
		//alert(jQuery.toJSON(attrs));
		return attrs;
	};
	
	/**
	 * 通过JSON设置区块数据
	 * @param container dom对象，可以是：dom元素的id | jQuery选择器 | dom对象 | jQuery对象
	 * @param data json字符串或JSON对象
	 */
	this.fillBlock = function(container, data){
		var json = data;
		if('string'===typeof(data)) json=$.parseJSON(data);
		if(!json) return;
		var target = $(document);
		if(container) {
			target = getJqueryDomElement(container);
		}
		
		// 遍历并加载数据
		var prefixs=[];
		loopJSON(json);
		
		function loopJSON(json) {
			if(!json) return;
			$.each(json, function(i, d){
				if(null === d) {
					
				} else if('object' === $.type(d)) {
					prefixs.push(i);
					loopJSON(d);
					prefixs.pop();
				} else {
					prefixs.push(i);
					setNameVal(prefixs.join('.'), d);
					prefixs.pop();
				}
			});
		}
		
		function setNameVal(name, val) {
			name = 'undefined'!==typeof(name)? ''+name:'';
			if('' === name) return;
			val = 'undefined'!==typeof(val)? val:'';
			
			// combobox combotree combogrid datetimebox datebox combo
			var cbxCls = ['combobox','combotree','combogrid','datetimebox','datebox','combo'];
			var ipts = $('[comboname="' + name + '"]', target);
			if (ipts.length){
				for(var i=0; i<cbxCls.length; i++){
					var type = cbxCls[i];
					if (ipts.hasClass(type+'-f')){
						if (ipts[type]('options').multiple){
							ipts[type]('setValues', val);
						} else {
							if(-1!=$.inArray(type, ['datetimebox','datebox']) && $.isNumeric(val)) {
								var valDate = new Date();valDate.setTime(val);
								val = $.fn.datebox.defaults.formatter(valDate);
							}
							ipts[type]('setValue', val);
						}
						return;
					}
				}
			}
			// numberbox slider
			var cTypes = ['numberbox', 'slider'];
			var f;
			for(var i=0;i<cTypes.length;i++) {
				f = $('input['+cTypes[i]+'name="'+name+'"]', target);
				if (f.length){
					f.eq(0)[cTypes[i]]('setValue', val);
					return;
				}
			}
			// timespinner
			f = $('input[name="'+name+'"].timespinner-f', target);
			if (f && f.length){
				f.eq(0)['timespinner']('setValue', val);
				return;
			}
			// radio checkbox
			var opts = $('input[name="'+name+'"][type=radio], input[name="'+name+'"][type=checkbox]', target);
			if(opts.length) {
				opts.prop('checked',false);
				opts.each(function(){
					var f = $(this);
					if ('array'==$.type(val) && val && -1!==$.inArray(f.val(), val)
							|| f.val() == String(val)){
						f.prop('checked', true);
					}
				});
				return;
			}
			// input
			f = $('input[name="'+name+'"]', target);
			if(f && f.length) {
				f.val(val);
				return;
			}
			// textarea
			f = $('textarea[name="'+name+'"]', target);
			if(f && f.length) {
				f.val(val);
				return;
			}
			// select
			f = $('select[name="'+name+'"]', target);
			if(f && f.length) {
				if(f.hasClass('multiselect2side')) {
					f['multiselect2side']('setValue',val);
				} else {
					f.val(val);
				}
				return;
			}
		}
	};

	/**
	 * 创建悬浮提示信息
	 * @param obj dom对象，可以是：dom元素的id | jQuery选择器 | dom对象 | jQuery对象
	 * @param message 提示消息
	 * @param options poshytip选项
	 */
	this.poshytip = function(obj, message, options){
		var jqObj = getJqueryDomElement(obj);
		if(jqObj && jqObj.length > 0){
			includeCSS("/js/poshytip/tip-yellow/tip-yellow.css");
			includeJS("/js/poshytip/jquery.poshytip.min.js");
			
			jqObj.poshytip('destroy');
			
			var _options = {showOn: "none"};
			var settings = null;
			
			if(message){
				_options.content = message;
			}
			if(options){
				settings  = jQuery.extend({}, this._DEFAULT_POSHYTIP_OPTIONS, _options, options);
			}else{
				settings  = jQuery.extend({}, this._DEFAULT_POSHYTIP_OPTIONS, _options);
			}
			
			jqObj.poshytip(settings);
			jqObj.poshytip("show");
		}
	};
	
	/**
	 * 取得悬浮提示框对象
	 * @param obj dom对象，可以是：dom元素的id | jQuery选择器 | dom对象 | jQuery对象
	 */
	this.getPoshytip = function(obj) {
		if(obj){
			includeCSS("/js/poshytip/tip-yellow/tip-yellow.css");
			includeJS("/js/poshytip/jquery.poshytip.min.js");
			return getJqueryDomElement(obj);
		} else {
			return null;
		}
	};

	/**
	 * 销毁悬浮提示信息
	 * @param obj dom对象，可以是：dom元素的id | jQuery选择器 | dom对象 | jQuery对象
	 */
	this.destoryPoshytip = function(obj){
		var jqObj = getJqueryDomElement(obj);
		if(jqObj && jqObj.length > 0 && jqObj.poshytip){
			jqObj.poshytip('destroy');
		}
	};

	
	
	/**
	 * 创建textarea组件
	 * @param obj dom对象，可以是：dom元素的id | jQuery选择器 | dom对象 | jQuery对象
	 * @param width textarea组件的宽度,默认为100
	 * @param height textarea组件的高度,默认为100
	 * @param required textarea组件是否为必填项,默认为false
	 * @author 聂文来
	 * @since 2013-8-14
	 */
	this.textarea = function(obj,width,height,required){
		var jqObj = getJqueryDomElement(obj);
		if(jqObj && jqObj.length > 0){
			
			width = width||100;
			jqObj.css("width",width);
			height = height||100;
			jqObj.css("height",height);
			
			if(required==null){
				required = false;
			}
			$CommonUI.getValidateBox(obj).validatebox({  
		        required: required 
		    });  
		}
	};
	/**
	 * 取得textarea对象
	 * @param obj dom对象，可以是：dom元素的id | jQuery选择器 | dom对象 | jQuery对象
	 * @author 聂文来
	 * @since 2013-8-14
	 */
	this.getTextarea = function(obj) {
		if(obj){
			return getValidateBox(obj);
		} else {
			return null;
		}
	};
	/**
	 * 创建图片查看组件
	 * @param obj dom对象，可以是：dom元素的id | jQuery选择器 | dom对象 | jQuery对象
	 * @param myWidth 悬浮层宽度,默认为600
	 * @param myHeight 悬浮层高度,默认为350
	 * @param url 当前页面与js的相对路径
	 * @param component 工具栏组件
	 * @param component.Vertical 垂直翻转，true显示，false不显示,默认为false
	 * @param component.Horizontal 水平翻转，true显示，false不显示,默认为false
	 * @param component.Left 左旋转，true显示，false不显示,默认为false
	 * @param component.Right 右旋转，true显示，false不显示,默认为false
	 * @param component.ZoomBig 放大，true显示，false不显示,默认为false
	 * @param component.ZoomSmall 缩小，true显示，false不显示,默认为false
	 * @param component.Reset 复位，true显示，false不显示,默认为false
	 * @param component.Close 关闭，true显示，false不显示,默认为true
	 * @author 聂文来
	 * @since 2013-8-16
	 */
	this.imageTransfer = function(obj,url,myWidth,myHeight,component){
		includeCSS("/js/imageTrans/css/imageTrans.css");
		includeJS("/js/imageTrans/CJL.0.1.min.js");
		includeJS("/js/imageTrans/ImageTrans.js");
		var jqObj = getJqueryDomElement(obj);
		if(jqObj && jqObj.length > 0){
			
			//判断图片是否存在
			var mySrc = jqObj.attr("src")||"";
			if(mySrc==""){
				return;
			}
			myWidth = myWidth||600;
			myHeight = myHeight||350;
			
			//添加悬浮层
			jqObj.after('<div id="idContainer"></div>');
			//添加工具栏
			jqObj.after('<div id="idToolbar"></div>');
			$("#idToolbar").bind("mouseover",function(){$("#idToolbar").css("opacity","1");});
			$("#idToolbar").bind("mouseleave",function(){$("#idToolbar").css("opacity","0.2");});
			
			//添加悬浮层样式
			$("#idContainer").addClass("idContainer");
			$("#idContainer").width(myWidth);
			$("#idContainer").height(myHeight);
			//添加工具栏样式
			$("#idToolbar").addClass("idToolbar");
			$("#idToolbar").css("opacity","0.2");
			$("#idToolbar").width(15);
			$("#idToolbar").height(myHeight);
			
			//悬浮层居中
			var top = ($(window).height() - $("#idContainer").height())/2;   
			var left = ($(window).width() - $("#idContainer").width())/2;   
			var scrollTop = $(document).scrollTop();   
			var scrollLeft = $(document).scrollLeft();   
			$("#idContainer").css({'top':top+scrollTop,'left':left+scrollLeft});
			//工具栏居中
			$("#idToolbar").css({'top':top+scrollTop,'left':left+scrollLeft-15});
			
			//加载工具栏组件
			component.Vertical = component.Vertical||false;
			component.Horizontal = component.Horizontal||false;
			component.Left = component.Left||false;
			component.Right = component.Right||false;
			component.ZoomBig = component.ZoomBig||false;
			component.ZoomSmall = component.ZoomSmall||false;
			component.Reset = component.Reset||false;
			component.Close = component.Close||true;
			(function(){
			    var container = $$("idContainer"), src = mySrc,
				options = {
					onPreLoad: function(){},
					onLoad: function(){},
					onError: function(err){}
				},
				it = new ImageTrans( container, options );
				it.load(src);
				//关闭
				if(component.Close){
					$("#idToolbar").append('<img id="idClose" class="imageTrans"/>');
	            	$("#idClose").attr({"src":url+"/imageTrans/css/images/delete.png","title":"关闭"});
	            	$("#idClose").bind("click",function(){
						$("#idContainer").remove();
						$("#idToolbar").remove();
					});
				}
				//垂直翻转
				if(component.Vertical){
					$("#idToolbar").append('<img id="idVertical" class="imageTrans"/>');
					$("#idVertical").attr({"src":url+"/imageTrans/css/images/20080527114101460.png","title":"垂直翻转"});
					$$("idVertical").onclick = function(){ it.vertical(); }
				}
				//水平翻转
	            if(component.Horizontal){
	            	$("#idToolbar").append('<img id="idHorizontal" class="imageTrans"/>');
	            	$("#idHorizontal").attr({"src":url+"/imageTrans/css/images/20080527114056870.png","title":"水平翻转"});
	            	$$("idHorizontal").onclick = function(){ it.horizontal(); }
				}
				//左旋转
				if(component.Left){
					$("#idToolbar").append('<img id="idLeft" class="imageTrans"/>');
	            	$("#idLeft").attr({"src":url+"/imageTrans/css/images/20080527114051997.png","title":"向左旋转"});
					$$("idLeft").onclick = function(){ it.left(); }
				}
				//右旋转
				if(component.Right){
					$("#idToolbar").append('<img id="idRight" class="imageTrans"/>');
	            	$("#idRight").attr({"src":url+"/imageTrans/css/images/20080527114059481.png","title":"向右旋转"});
					$$("idRight").onclick = function(){ it.right(); }
				}
				//放大
				if(component.ZoomBig){
					$("#idToolbar").append('<img id="idZoomBig" class="imageTrans"/>');
	            	$("#idZoomBig").attr({"src":url+"/imageTrans/css/images/20080615141652172.png","title":"放大"});
					$$("idZoomBig").onclick = function(){ it.zoomBig(); }
				}
				//缩小
				if(component.ZoomSmall){
					$("#idToolbar").append('<img id="idZoomSmall" class="imageTrans"/>');
	            	$("#idZoomSmall").attr({"src":url+"/imageTrans/css/images/20080615141652103.png","title":"缩小"});
					$$("idZoomSmall").onclick = function(){ it.zoomSmall(); }
				}
				//复位
				if(component.Reset){
					$("#idToolbar").append('<img id="idReset" class="imageTrans"/>');
	            	$("#idReset").attr({"src":url+"/imageTrans/css/images/reset.png","title":"复位"});
					$$("idReset").onclick = function(){ it.reset(); }
				}
			})()
		}
	}
	
	/**
	 * 创建图片放大镜组件
	 * @param obj dom对象，可以是：dom元素的id | jQuery选择器 | dom对象 | jQuery对象
	 * @param title 放大后的图片说明
	 * @param options.lens 放大位置阴影是否显示，true为显示，false为不显示,默认为true
	 * @param options.zoomWidth 放大位置阴影宽度，默认为200
	 * @param options.zoomHeight 放大位置阴影高度，默认为200
	 * @param options.alwaysOn 放大的图片是否一直显示，true为一直显示，false为鼠标触发显示,默认为false 
	 * @param options.xOffset 左右偏移量,默认为10
	 * @param options.yOffset 上下偏移量,默认为0
	 * @param options.position 偏移方位,可选值为'left','right','bottom','top',默认为'left'
	 * @author 聂文来
	 * @since 2013-8-16
	 */
	this.imageZoom = function(obj,title,options){
		includeCSS("/js/imageZoom/css/jquery.jqzoom.css");
		includeJS("/js/imageZoom/jquery.jqzoom-core.js");
		
		var jqObj = getJqueryDomElement(obj);
		if(jqObj && jqObj.length > 0){
			
			title = title||"图片说明";
			jqObj.attr("title",title);
			
			options.zoomType='standard';
			options.preloadImages=false;
			if(options.lens==null){
				options.lens = true;
			}
			if(options.zoomWidth==null){
				options.zoomWidth = 200;
			}
			if(options.zoomHeight==null){
				options.zoomHeight = 200;
			}
			if(options.alwaysOn==null){
				options.alwaysOn = false;
			}
			if(options.xOffset==null){
				options.xOffset = 10;
			}
			if(options.yOffset==null){
				options.yOffset = 0;
			}
			if(options.position==null){
				options.position="left";
			}
			
			jqObj.jqzoom(options);
		}
	}
	
	/**
	 * 取得左右选择框对象
	 * @param obj 进度条dom元素，可以是：dom元素的id | jQuery选择器 | dom对象 | jQuery对象(必须是select的)
	 */
	this.getMultiSelect2Side = function(obj) {
		includeCSS('/js/multiselect2side/css/jquery.multiselect2side.css');
		includeJS('/js/multiselect2side/jquery.multiselect2side.js');
		if(obj) {
			return getJqueryDomElement(obj);
		} else {
			return null;
		}
	};
	
	/**
	 * 左右选择框
	 * @param obj 进度条dom元素，可以是：dom元素的id | jQuery选择器 | dom对象 | jQuery对象(必须是select的)
	 * @param labelsx 源选择框头（可选，默认为空）
	 * @param labeldx 目标选择框头（可选，默认为空）
	 * @param options 扩展选项（可选）
	 */
	this.multiselect2side = function(obj, labelsx, labeldx, options) {
		includeCSS('/js/multiselect2side/css/jquery.multiselect2side.css');
		includeJS('/js/multiselect2side/jquery.multiselect2side.js');
		if(obj) {
			var jqobj = getJqueryDomElement(obj);
			var _options = {
				optGroupSearch: false, // 是否组选择
				selectedPosition: 'right', // 选择项位置，提交项
				minSize: 8, // 显示的行数
				moveOptions: true, // 显示选择项可操作按钮
				labelTop: '置顶', // 置顶文本
				labelBottom: '置底', // 置底文本
				labelUp: '向上', // 向上文本
				labelDown: '向下', // 向下文本
				labelSort: '排序', // 排序文本
				labelsx: '', // 源选择框头
				labeldx: '', // 目标选择框头
				maxSelected: -1, // 最多选择数
				search: false, // 是否有搜索框，有则填搜索框前Label信息
				autoSort: false, // 自动排序选择项
				autoSortAvailable: false, // 自动排序所有
				caseSensitive: false, // 大小写敏感
				delay: 300 // 输入文本过滤时需要多久显示效果
			};
			if(labelsx) $.extend(_options, {"labelsx": labelsx});
			if(labeldx) $.extend(_options, {"labeldx": labeldx});
			if(options) $.extend(_options, options);
			jqobj.multiselect2side(_options);
		}
	};
	
	/**
	 * 进度条
	 * @param obj 进度条dom元素，可以是：dom元素的id | jQuery选择器 | dom对象 | jQuery对象
	 * @param progressValue 进度值（参考范围[0-100]）
	 * @param text 显示文本（可选，默认{value}%）
	 * @param color 填充颜色（可选）
	 * @param bordercolor 边框颜色（可选）
	 * @param options 扩展选项（可选）
	 * @author 张磊
	 * @since 2013-7-20
	 */
	this.progressbar = function(obj, progressValue, text, color, bordercolor, options){
		this.loadUIM('progressbar');
		if(obj){
			var jqobj = getJqueryDomElement(obj);
			var _options = {
				
			};
			jQuery.extend(_options, { value: progressValue });
			if(text) {
				jQuery.extend(_options, { "text": text });
			}
			options && jQuery.extend(_options, options);
			jqobj.progressbar(_options);
			if(null != color) {
				jqobj.find(".progressbar-value").css("background-color", color);
			}
			if(null != bordercolor) {
				jqobj.css("border-color", bordercolor);
			}
		}
	};
	
	/**
	 * 弹窗
	 * @param obj dom元素，可以是：dom元素的id | jQuery选择器 | dom对象 | jQuery对象
	 * @param href 值（url|object）
	 * @param title 窗口标题（可选）
	 * @param mode 是否模式窗口（可选）
	 * @param closed 是否可手动关闭（可选）
	 * @param cache 是否缓存（可选）
	 * @param options 扩展选项（可选）
	 * @author 张磊
	 * @since 2013-7-22
	 */
	this.popWin = function(obj, href, title, mode, closed, cache, options){
		this.loadUIM('dialog');
		if(obj) {
			var jqobj = getJqueryDomElement(obj);
			var _options = { 
				width: 400,
				height: 300
			};
			if(href) jQuery.extend(_options, {'href':href});
			if(title) jQuery.extend(_options, {'title':title});
			if(mode) jQuery.extend(_options, {'mode':mode});
			if(closed) jQuery.extend(_options, {'closed':closed});
			if(cache) jQuery.extend(_options, {'cache':cache});
			if(options) jQuery.extend(_options, options);
			jqobj.dialog(_options);
		}
	};
	
	/**
	 * 下拉列表
	 * @param obj dom元素，可以是：dom元素的id | jQuery选择器 | dom对象 | jQuery对象
	 * @param value 值（url|object）
	 * @param textField 显示值（可选，textField）
	 * @param valueField 保存值（可选，valueField）
	 * @param options 扩展选项（可选）
	 * @author 张磊
	 * @since 2013-7-22
	 */
	this.combobox = function(obj, value, textField, valueField, options){
		this.loadUIM('combobox');
		if(obj){
			var jqobj = getJqueryDomElement(obj);
			var _options = {
				panelHeight:'auto'
			};
			if(null != textField) {
				jQuery.extend(_options, { "textField": textField });
			}
			if(null != valueField) {
				jQuery.extend(_options, { "valueField": valueField });
			}
			options && jQuery.extend(_options, options);
			if('object' == typeof(value)) {
				// data
				jQuery.extend(_options, {'data': value, 'mode': 'local'});
			} else {
				// url
				jQuery.extend(_options, {'url': value, 'mode': 'remote'});
			}
			jqobj.combobox(_options);
		}
	};
	
	/**
	 * 创建默认文本
	 * @author 边航鹰
	 * @since 2013-08-19
	 */
	this.placeholder = function(){
		includeJS("/js/placeholder/jquery.placeholder.js");
		$.fn.placeholder();
	};
	
	/**
	 * 取得combobox对象
	 * @param obj dom元素，可以是：dom元素的id | jQuery选择器 | dom对象 | jQuery对象
	 */
	this.getComboBox = function(obj) {
		this.loadUIM('combobox');
		if(obj){
			return getJqueryDomElement(obj);
		} else {
			return null;
		}
	};
	
	/**
	 * FusionCharts 初始化
	 * @author 张磊
	 * @since 2013-7-22
	 */
	this.initCharts = function() {
		includeJS('/js/FusionCharts/FusionCharts.js');
		includeJS('/js/FusionCharts/FusionCharts.jqueryplugin.js');
	};

	/**
	 * FusionCharts
	 * @param chartID 图表ID（唯一）
	 * @param type 图表类型
	 * @param wrapper 图表所在容器ID
	 * @param dataurl 数据或URL（数据或者指向数据的URL）
	 * @param format 数据格式（可选xml|xmlurl|json|jsonurl，默认json）
	 * @param width 宽（可选，默认值400）
	 * @param height 高（可选，默认值300）
	 * @param renderer 显示方式（可选flash|javascript，默认值flash）
	 * @param options 扩展选项（可选）
	 * @author 张磊
	 * @since 2013-7-22
	 */
	this.Charts = function(chartID, type, wrapper, dataurl, format, width, height, renderer, options) {
		this.initCharts();
		var _format = format? format : 'json';
		var _width = width? width : '400';
		var _height = height? height : '300';
		var _renderer = renderer? renderer : 'flash';
		var _type = (/[a-zA-Z0-9]+/.test(type))? type:'';
		if('' === _type) {
			return; // 图表类型错误
		}
		var _confs = {
			'PBarLoadingText' : '加载图表中……',
			'XMLLoadingText' : '加载数据中……',
			'ParsingDataText' : '加载数据中……',
			'ChartNoDataText' : '没有数据',
			'RenderingChartText' : '生成图表中……',
			'LoadDataErrorText' : '加载数据出错',
			'InvalidXMLText' : '无效数据'
		};
		var _options = { // 新生成
			swfUrl: $WEB_ROOT_PATH + "/js/FusionCharts/swf/"+ _type +".swf", 
		    dataSource: dataurl, 
		    dataFormat: _format, 
		    renderer: _renderer,
		    registerWithJS: true,
		    width: _width, 
		    height: _height, 
		    id: chartID.toString()
		};
		options && jQuery.extend(_options, options);
		var chart = new FusionCharts(_options);
		chart.configure(_confs);
        chart.render(wrapper);
	};
	
	/**
	 * 表单验证弹出对象
	 * @param obj dom元素，可以是：dom元素的id | jQuery选择器 | dom对象 | jQuery对象(表单id)
	 * @since 2013-8-21
	 */
	this.formValidation = function(obj){
		var isValid=true;
		if(obj){
			var jqobj = getJqueryDomElement(obj);
			isValid = jqobj.form('validate');
			if(!isValid){				
				jqobj.append("<div id='validationPanel'><div id='validationInfo'></div>");
				
				var obj = $("[class*=validatebox-invalid]", jqobj);
				$('#validationInfo').empty();
				obj.each(function(){
					var validInfo=$(this).prev().html();
					if(!validInfo){
						var validInfo=$(this).parent().prevAll('label').html();
					}
					var data = $(this).data('validatebox');
					$('#validationInfo').append(validInfo+data.message+'<br><br>');
				});
				
				$CommonUI.getDialog('#validationPanel').dialog({title: '提交错误',
					modal:true,closed:true,width:350,height:"auto",
					onClose:function(){$("#validationPanel").dialog('destroy');} });
				$("#validationPanel").dialog("open");				
				$(".window-mask").on('click', function() {
					var val=$("#validationPanel").parent().css("display");
					if(val=="block"){
						$("#validationPanel").dialog('destroy');
						$(".window-mask").off();
					}
				});
			}
			return isValid;
		}
		return isValid;
	};
	
	/**
	 * 取得图表对象
	 * @param id 生成的图表的ID（唯一）
	 */
	this.getCharts = function(id){
		this.initCharts();
		if(id){
			return FusionCharts.items[id];
		}
		return null;
	};

	/**
	 * 行图
	 * @param obj dom元素，可以是：dom元素的id | jQuery选择器 | dom对象 | jQuery对象(表单id)
	 * @param values 加载值
	 * @param options 选项
	 * @since 2013-9-24
	 */
	this.sparkline = function(obj, values, options) {
		includeJS('/js/sparkline/jquery.sparkline.min.js');
		if(obj){
			var jqobj = getJqueryDomElement(obj);
			var _options = {};
			var _values = [];
			values && (_values = values);
			options && jQuery.extend(_options, options);
			jqobj.sparkline(values, _options);
		}
	};

	/**
	 * 取得行图对象
	 * @param obj dom元素，可以是：dom元素的id | jQuery选择器 | dom对象 | jQuery对象(表单id)
	 * @since 2013-9-24
	 */
	this.getSparkLine = function(obj){
		includeJS('/js/sparkline/jquery.sparkline.min.js');
		if(obj){
			return getJqueryDomElement(obj);
		} else {
			return null;
		}
	};
	
	/**
	 * 局部打印
	 * @param obj dom元素，可以是：dom元素的id | jQuery选择器 | dom对象 | jQuery对象(表单id)
	 * @param options 选项 {mode:"",popTitle:""……}
	 * 		 *  @mode     | [string]  | ("iframe"),"popup"
	 *	 	 *  @popHt    | [number]  | (500)             
	 *	 	 *  @popWd    | [number]  | (400)             
	 *	 	 *  @popX     | [number]  | (500)             
	 *	 	 *  @popY     | [number]  | (500)             
	 *	 	 *  @popTitle | [string]  | ('')              
	 *	 	 *  @popClose | [boolean] | (false),true      
	 * @since 2013-11-1
	 */
	this.printArea = function(obj, options) {
		includeJS('/js/printarea/jquery.printarea.js');
		if(obj){
			var jqobj = getJqueryDomElement(obj);
			var _options = {};
			var _values = [];
			options && jQuery.extend(_options, options);
			jqobj.printArea(_options);
		}
	};
	
	/**
	 * 局部打印
	 * @param obj dom元素，可以是：dom元素的id | jQuery选择器 | dom对象 | jQuery对象(表单id)
	 * @param options 选项 {mode:"",popTitle:""……}
	 * 		 *  @mode     | [string]  | ("iframe"),"popup"
	 *	 	 *  @popHt    | [number]  | (500)             
	 *	 	 *  @popWd    | [number]  | (400)             
	 *	 	 *  @popX     | [number]  | (500)             
	 *	 	 *  @popY     | [number]  | (500)             
	 *	 	 *  @popTitle | [string]  | ('')              
	 *	 	 *  @popClose | [boolean] | (false),true      
	 * @since 2013-11-1
	 */
	this.printArea = function(obj, options) {
		includeJS('/js/printarea/jquery.printarea.js');
		if(obj){
			var jqobj = getJqueryDomElement(obj);
			var _options = {};
			var _values = [];
			options && jQuery.extend(_options, options);
			jqobj.printArea(_options);
		}
	};
	
	
	/**
	 * 初始化CommonUI
	 */
	this._init();
}

/**
 * 获取标签定义在class上的属性值
 * @param obj 对象（dom对象|jQuery对象|标签id）
 * @param propertyName
 * @returns
 */
CommonUI.getClassProperty = function(obj, propertyName){
	return getClassProperty(obj, propertyName);
};

/**
 * 在标签的class上自定义属性（class中添加表达式格式“[p=pvalue]”）
 * @param obj 对象（dom对象|jQuery对象|标签id）
 * @param propertyName 属性名
 * @param propertyValue 属性值
 * @returns
 */
CommonUI.setClassProperty = function(obj, propertyName, propertyValue){
	return setClassProperty(obj, propertyName, propertyValue);
};
/*====================================================================
								~CommonUI
======================================================================*/
/**
 * CommonUI默认实例
 */
var $CommonUI = new CommonUI();
$(function(){
	// 开启默认文本功能
	$CommonUI.placeholder();
	// DEBUG
	if($CommonUI._AJAX_DEBUG) {
		$('body').prepend('<table class="debugshow" style="display:none;"><tr><th>status</th><th>exception</th></tr></table>');
	}
	// 一次获取页面所有下拉列表
	autofillcombo(setPageDicts);
});

/**
 * Ajax的异常处理函数
 * @param status 当前状态码
 * @param error 错误信息
 * @param callback 出错处理事件
 */
function ajaxDebugHandler(xhr, status, error)
{
	if($CommonUI._AJAX_DEBUG) {
		$('.debugshow').append('<tr><td>'+status+'</td><td>'+xhr.status+"|"+error+"|"+xhr.responseText+'</td></tr>');
		$('.debugshow').show();
	}
}

/**
 * Ajax的成功提示函数
 * @param status 当前状态码
 * @param error 错误信息
 * @param callback 出错处理事件
 */
function ajaxSuccHandler()
{
	if($CommonUI._AJAX_SUCC) {
		$CommonUI.alert("请求成功","info");
	}
}

/**
 * Ajax的错误提示函数
 * @param status 当前状态码
 * @param error 错误信息
 * @param callback 出错处理事件
 */
function ajaxErrorHandler()
{
	if($CommonUI._AJAX_ERROR) {
		$CommonUI.alert("请求失败","error");
	}
}

/**
 * Ajax的Get方式请求
 * @param url 提交地址
 * @param container 数据所在的dom容器，可以是：dom元素的id | jQuery选择器 | dom对象 | jQuery对象
 * @param successHandler 成功处理事件 （可选，一般都要设置）
 * @param errorHandler 出错处理事件 （可选，一般都要设置）
 * @param options jQuery ajax选项，传入后将覆盖默认设置
 * 		（可选，扩展增加自定义属性，skipNames[default=[]],skipHidden[default=false],skipDisabled[default=true]）
 * @param dataSource 提交数据源（支持按优先级进行数据覆盖，优先级：dataSource > formData（container中获取的数据） > options.data）
 */
function getReq(url, container, successHandler, errorHandler, options, dataSource) {
	var _options = {
		url : url,
		async : true,
		dataType : "json", // text,html,script,json
		type : "GET",
		data : {},
		skipNames : [], // 跳过指定name
		skipHidden : false, // 提交hidden值
		skipDisabled : true // 跳过不可见域
	};
	$.extend(_options, options);
	if(container) {
		var backJSON = $CommonUI.loopBlock(container, _options.skipNames, _options.skipHidden, _options.skipDisabled);
		$.extend(_options.data, backJSON||{});
	}
	$.extend(_options.data, dataSource||{});
	//alert(_options)
	return $.ajax(_options).done(ajaxSuccHandler).done(successHandler).fail(ajaxDebugHandler).fail(ajaxErrorHandler).fail(errorHandler);
}

/**
 * Ajax的Post方式请求
 * @param url 提交地址
 * @param container 数据所在的dom容器，可以是：dom元素的id | jQuery选择器 | dom对象 | jQuery对象
 * @param successHandler 成功处理事件 （可选，一般都要设置）
 * @param errorHandler 出错处理事件 （可选，一般都要设置）
 * @param options jQuery ajax选项，传入后将覆盖默认设置
 * 		（可选，扩展增加自定义属性，skipNames[default=[]],skipHidden[default=false],skipDisabled[default=true]）
 * @param dataSource 提交数据源（支持按优先级进行数据覆盖，优先级：dataSource > formData（container中获取的数据） > options.data）
 */
function postReq(url, container, successHandler, errorHandler, options, dataSource)
{
	return getReq(url, container, successHandler, errorHandler, $.extend(options, {type: 'POST'}), dataSource);
}

/**
 * Ajax的方式请求（默认get）
 * @param url 提交地址
 * @param data 提交数据源
 * @param successHandler 成功处理事件 （可选，一般都要设置）
 * @param errorHandler 出错处理事件 （可选，一般都要设置）
 * @param options jQuery ajax选项，传入后将覆盖默认设置
 */
function ajaxReq(url, data, successHandler, errorHandler, options)
{
	var _options = {
		url : url,
		async : true,
		dataType : "json",
		type : "GET",
		data : data
	};
	$.extend(_options, options);
	return $.ajax(_options).done(ajaxSuccHandler).done(successHandler).fail(ajaxDebugHandler).fail(ajaxErrorHandler).fail(errorHandler);
}

/**
 * 批量获取页面字典数据
 */
function getPageDicts(callback)
{
	// 当前页面上所有下拉框
	var dicts = [];
	var pageCombos = $(document).data("pageCombos")||{};
	$.each(pageCombos, function(n){
		if($(this) && !$(this)['getted']) dicts.push(n);
	});
	if(dicts.length==0) return;
	// action
	var url = $CommonUI._DICT_SERVICE_URL;
	// 请求参数
	var params = '{"ids": "'+dicts.join(",")+'","dicts": "'+dicts.join(",")+'"}';
	// post request
	ajaxReq(url, params, '', '',{
		'type' : 'POST',
		'contentType':'application/json; charset=UTF-8'
	}).done(function(data){
		try {
			$.each(dicts, function(i,n){
				var pagecombo = pageCombos[n];
				if(pagecombo) {
					pagecombo['getted'] = true;
					pagecombo['data'] = data[n]||{};
				}
			});
			if(callback && $.isFunction(callback)) {
				callback();
			}
		} catch(e) {}
	});
}

/**
 * 设置页面上字典数据
 * @param dict（可选,字典类型）
 * @param container（可选）
 */
function setPageDicts(dict, container)
{
	var pageCombos = $(document).data("pageCombos")||{};
	var jqObj = container? getJqueryDomElement(container) : '';
	if(jqObj && jqObj['combobox']) {
		var dstr=jqObj.combobox('options').dict;
		if(!dstr || dstr && !pageCombos[pageCombos]) {
			getPageDicts();
		}
	}
	$.each(pageCombos, function(n){
		if(!dict || dict && n === dict) {
			var pagecombo = pageCombos[n];
			if(container) {
				if(jqObj) {
					// 更新页面combo
					jqObj.combobox('loadData', pagecombo['data']);
					return false;
				}
			} else {
				// batch set
				$.each(pagecombo.list, function(){
					// 更新页面combo
					$(this).combobox('loadData', pagecombo['data']);
				});
			}
		}
	});
}

/**
 * 一次设置页面上所有下拉列表
 */
function autofillcombo()
{
	getPageDicts(setPageDicts);
}

/*====================================================================
								~CommonUI
======================================================================*/
/**
 * CommonUI默认实例
 */
var $CommonUI = new CommonUI();
// CONFIG START
$CommonUI._DICT_SERVICE_URL = $WEB_ROOT_PATH + "/dhccApi/dictService/batchLoad";
$CommonUI._AJAX_DEBUG = false; // 开启AJAX的DEBUG提示功能
$CommonUI._AJAX_SUCC = false;  // 开启AJAX的默认成功提示
$CommonUI._AJAX_ERROR = false; // 开启AJAX的默认失败提示
// CONFIG END

$(function(){
	// 开启默认文本功能
	$CommonUI.placeholder();
	// DEBUG
	if($CommonUI._AJAX_DEBUG) {
		$('body').prepend('<table class="debugshow" style="display:none;"><tr><th>status</th><th>exception</th></tr></table>');
	}
	// 一次获取页面所有下拉列表
	autofillcombo(setPageDicts);
});