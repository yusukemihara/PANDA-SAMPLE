/*******************************
 * not implement
 *******************************/

/*
 * GtkFileChooserButton
 */
$.widget('monsia.GtkFileChooserButton',{
  options: {
    // option
    state: 0,
    width: 100,
    height: 30,
    // signal callback
  },
  _create: function() {
    var widget = this;
    this.name = this.element[0].id;
    this.element
      .addClass("ui-widget gtk-file-chooser-button")
      .attr("klass","GtkFileChooserButton")
      ;
  },
  _setOption: function(key,value) {
    this.options[key] = value;
    switch(key) {
    case 'state':
      if (value==4){ 
        // GTK_STATE_INSENSITIVE = 4
        this.element.attr("disabled","disabled");
        this.disable();
      } else {
        this.element.removeAttr("disabled");
        this.enable();
      }
      break;
    case 'width':
      this.element.css({width:value});
      break;
    case 'height':
      this.element.css({height:value});
      break;
    }
    $.Widget.prototype._setOption.call(this,key,value);
  }
});

/*
 * GtkPandaFileEntry
 */
$.widget('monsia.GtkPandaFileEntry',{
  options: {
    // option
    state: 0,
    width: 100,
    height: 30,
    // signal callback
  },
  _create: function() {
    var widget = this;
    this.name = this.element[0].id;
    this.element
      .addClass("ui-widget gtk-panda-file-entry")
      .attr("klass","GtkPandaFileEntry")
      ;
  },
  _setOption: function(key,value) {
    this.options[key] = value;
    switch(key) {
    case 'state':
      if (value==4){ 
        // GTK_STATE_INSENSITIVE = 4
        this.disable();
      } else {
        this.enable();
      }
      break;
    case 'width':
      this.element.css({width:value});
      break;
    case 'height':
      this.element.css({height:value});
      break;
    }
    $.Widget.prototype._setOption.call(this,key,value);
  }
});

/*
 * GtkProgessBar
 */
$.widget('monsia.GtkProgressBar',{
  options: {
    // option
    state: 0,
    width: 100,
    height: 30,
    // signal callback
  },
  _create: function() {
    var widget = this;
    this.name = this.element[0].id;
    this.element
      .addClass("ui-widget gtk-progress-bar")
      .attr("klass","GtkProgressBar")
      ;
  },
  _setOption: function(key,value) {
    this.options[key] = value;
    switch(key) {
    case 'state':
      if (value==4){ 
        // GTK_STATE_INSENSITIVE = 4
        this.disable();
      } else {
        this.enable();
      }
      break;
    case 'width':
      this.element.css({width:value});
      break;
    case 'height':
      this.element.css({height:value});
      break;
    }
    $.Widget.prototype._setOption.call(this,key,value);
  }
});


/*
 * GtkPandaPixmap
 */
$.widget('monsia.GtkPandaPixmap',{
  options: {
    // option
    state: 0,
    width: 100,
    height: 30,
    // signal callback
  },
  _create: function() {
    var widget = this;
    this.name = this.element[0].id;
    this.element
      .addClass("ui-widget gtk-panda-pixmap")
      .attr("klass","GtkPandaPixmap")
      ;
  },
  _setOption: function(key,value) {
    this.options[key] = value;
    switch(key) {
    case 'state':
      if (value==4){ 
        // GTK_STATE_INSENSITIVE = 4
        this.disable();
      } else {
        this.enable();
      }
      break;
    case 'width':
      this.element.css({width:value});
      break;
    case 'height':
      this.element.css({height:value});
      break;
    }
    $.Widget.prototype._setOption.call(this,key,value);
  }
});

/*
 * GtkPandaPDF
 */
$.widget('monsia.GtkPandaPDF',{
  options: {
    // option
    state: 0,
    width: 100,
    height: 30,
    // signal callback
  },
  _create: function() {
    var widget = this;
    this.name = this.element[0].id;
    this.element
      .addClass("ui-widget gtk-panda-pdf")
      .attr("klass","GtkPandaPDF")
      ;
  },
  _setOption: function(key,value) {
    this.options[key] = value;
    switch(key) {
    case 'state':
      if (value==4){ 
        // GTK_STATE_INSENSITIVE = 4
        this.disable();
      } else {
        this.enable();
      }
      break;
    case 'width':
      this.element.css({width:value});
      break;
    case 'height':
      this.element.css({height:value});
      break;
    }
    $.Widget.prototype._setOption.call(this,key,value);
  }
});

/*
 * GtkPandaHTML
 */
$.widget('monsia.GtkPandaHTML',{
  options: {
    // option
    state: 0,
    width: 100,
    height: 30,
    // signal callback
  },
  _create: function() {
    var widget = this;
    this.name = this.element[0].id;
    this.element
      .addClass("ui-widget gtk-panda-html")
      .attr("klass","GtkPandaHTML");
  },
  _setOption: function(key,value) {
    this.options[key] = value;
    switch(key) {
    case 'state':
      if (value==4){ 
        // GTK_STATE_INSENSITIVE = 4
        this.disable();
      } else {
        this.enable();
      }
      break;
    case 'width':
      this.element.css({width:value});
      break;
    case 'height':
      this.element.css({height:value});
      break;
    }
    $.Widget.prototype._setOption.call(this,key,value);
  }
});

/*
 * GtkPandaTimer
 */
$.widget('monsia.GtkPandaTimer',{
  options: {
    // option
    state: 0,
    width: 100,
    height: 30,
    // signal callback
  },
  _create: function() {
    var widget = this;
    this.name = this.element[0].id;
    this.element
      .addClass("ui-widget gtk-panda-timer")
      .attr("klass","GtkPandaTimer");
  },
  _setOption: function(key,value) {
    this.options[key] = value;
    switch(key) {
    case 'state':
      if (value==4){ 
        // GTK_STATE_INSENSITIVE = 4
        this.disable();
      } else {
        this.enable();
      }
      break;
    case 'width':
      this.element.css({width:value});
      break;
    case 'height':
      this.element.css({height:value});
      break;
    }
    $.Widget.prototype._setOption.call(this,key,value);
  }
});


/*
 * GtkPandaDownload
 */
$.widget('monsia.GtkPandaDownload',{
  options: {
    // option
    state: 0,
    width: 100,
    height: 30,
    // signal callback
  },
  _create: function() {
    var widget = this;
    this.name = this.element[0].id;
    this.element
      .addClass("ui-widget gtk-panda-download")
      .attr("klass","GtkPandaDownload");
  },
  _setOption: function(key,value) {
    this.options[key] = value;
    switch(key) {
    case 'state':
      if (value==4){ 
        // GTK_STATE_INSENSITIVE = 4
        this.disable();
      } else {
        this.enable();
      }
      break;
    case 'width':
      this.element.css({width:value});
      break;
    case 'height':
      this.element.css({height:value});
      break;
    }
    $.Widget.prototype._setOption.call(this,key,value);
  }
});

/*
 * GtkPandaPrint
 */
$.widget('monsia.GtkPandaPrint',{
  options: {
    // option
    state: 0,
    width: 100,
    height: 30,
    // signal callback
  },
  _create: function() {
    var widget = this;
    this.name = this.element[0].id;
    this.element
      .addClass("ui-widget gtk-panda-print")
      .attr("klass","GtkPandaPrint");
  },
  _setOption: function(key,value) {
    this.options[key] = value;
    switch(key) {
    case 'state':
      if (value==4){ 
        // GTK_STATE_INSENSITIVE = 4
        this.disable();
      } else {
        this.enable();
      }
      break;
    case 'width':
      this.element.css({width:value});
      break;
    case 'height':
      this.element.css({height:value});
      break;
    }
    $.Widget.prototype._setOption.call(this,key,value);
  }
});

/*
 * GtkCalendar
 */

/*
datepickerはwidget factoryに対応していないため
そのままdatepickerとして使う他ない様子。jquery-1.8
http://bugs.jqueryui.com/ticket/6228
*/

/* Japanese initialisation for the jQuery UI date picker plugin. */
/* Written by Kentaro SATO (kentaro@ranvis.com). */
jQuery(function($){
	$.datepicker.regional['ja'] = {
		closeText: '閉じる',
		prevText: '&#x3c;前',
		nextText: '次&#x3e;',
		currentText: '今日',
		monthNames: ['1月','2月','3月','4月','5月','6月',
		'7月','8月','9月','10月','11月','12月'],
		monthNamesShort: ['1月','2月','3月','4月','5月','6月',
		'7月','8月','9月','10月','11月','12月'],
		dayNames: ['日曜日','月曜日','火曜日','水曜日','木曜日','金曜日','土曜日'],
		dayNamesShort: ['日','月','火','水','木','金','土'],
		dayNamesMin: ['日','月','火','水','木','金','土'],
		weekHeader: '週',
		dateFormat: 'yy/mm/dd',
		firstDay: 0,
		isRTL: false,
		showMonthAfterYear: true,
		yearSuffix: '年'};
	$.datepicker.setDefaults($.datepicker.regional['ja']);
});

$.widget('monsia.GtkCalendar',{
  options: {
    // option
    state: 0,
    width: 100,
    height: 30,
    // signal callback
  },
  _create: function() {
    var widget = this;
    this.name = this.element[0].id;
    this.element
      .addClass("ui-widget gtk-panda-print")
      .attr("klass","GtkCalendar");
  },
  _setOption: function(key,value) {
    switch(key) {
    case 'state':
      if (value==4){ 
        // GTK_STATE_INSENSITIVE = 4
        this.disable();
      } else {
        this.enable();
      }
      break;
    case 'width':
      this.element.css({width:value});
      break;
    case 'height':
      this.element.css({height:value});
      break;
    }
    $.Widget.prototype._setOption.call(this,key,value);
  }
});

/*******************************
 * implement
 *******************************/
/*
 * GtkWidget
 */

$.widget('monsia.GtkWidget', {
  //option
  options: {
    state: 0,
    style: "",
    visible: true,
    width: 100,
    height: 100,
  },
  _setOption: function(key,value) {
    switch(key) {
    case 'state':
      if (value==4){ 
        // GTK_STATE_INSENSITIVE = 4
        this.disable();
      } else {
        this.enable();
      }
      break;
    case 'style':
      break;
    case 'visible':
      if (value) {
        this.element.show();
      } else {
        this.element.hide();
      }
      break;
    case 'width':
      this.element.css({width:value});
      break;
    case 'height':
      this.element.css({height:value});
      break;
    }
    $.Widget.prototype._setOption.apply(this,arguments);
  },
  deserialize: function(data) {
    var widget = this;
    $.each(data,function(k,v) {
      switch(k) {
      case 'state':
      case 'style':
        widget._setOption(k,v);
        break;
      case 'visible':
        widget._setOption(k,v=="true");
        break;
      } 
    });
  },
  serialize: function(data) {
    return data;
  }
});

/*
 * GtkButton
 */
$.widget('monsia.GtkButton',$.monsia.GtkWidget,{
  options: {
    // option
    state: 0,
    style: "",
    width: 100,
    height: 30,
    // signal callback
    clicked: function(name){}
  },
  _create: function() {
    var widget = this;
    this.name = this.element[0].id;
    this.element
      .addClass("ui-widget gtk-button")
      .attr("klass","GtkButton")
      .click(function() {
        widget.options.clicked(widget.name);
      });
  },
  _setOption: function(key,value) {
    switch(key) {
    case 'state':
      if (value==4){ 
        // GTK_STATE_INSENSITIVE = 4
        this.element.attr("disabled","disabled");
      } else {
        this.element.removeAttr("disabled");
      }
      break;
    case 'label':
      this.setLabel(value);
      break;
    }
    $.monsia.GtkWidget.prototype._setOption.apply(this,arguments);
  },
  setLabel: function(text) {
    this.element.text(text);
  },
  deserialize: function(data) {
    $.monsia.GtkWidget.prototype.deserialize.apply(this,arguments);
    var widget = this;
    $.each(data,function(k,v) {
      switch(k) {
      case 'label':
        widget.setLabel(v);
        break;
      } 
    });
  }
});

/*
 * GtkCheckButton
 */
$.widget('monsia.GtkCheckButton',$.monsia.GtkWidget,{
  options: {
    state: 0,
    style: "",
    width: 100,
    height: 30,
    // signal callback
    clicked: function(name){console.log("default");}
  },
  _create: function() {
    var widget = this;
    this.name = this.element[0].id;
    this.check = $('<input type="checkbox">')
      .appendTo(this.element)
      .addClass("ui-widget-contents")
      .click(function() {
        widget.options.clicked(widget.name);
      });
    this.label = $('<span>')
      .appendTo(this.element)
      .addClass("ui-widget-contents")
      .click(function() {
        if (widget.options.disabled) {
          return;
        }
        widget.setState(!widget.getState());
        widget.options.clicked(widget.name);
      });
    this.element
      .addClass("ui-widget gtk-check-button")
      .attr("klass","GtkCheckButton");
  },
  _setOption: function(key,value) {
    this.options[key] = value;
    switch(key) {
    case 'state':
      if (value==4){ 
        // GTK_STATE_INSENSITIVE = 4
        this.check.attr("disabled","disabled");
      } else {
        this.check.removeAttr("disabled");
      }
      break;
    case 'label':
      this.setLabel(value);
      break;
    }
    $.monsia.GtkWidget.prototype._setOption.apply(this,arguments);
  },
  setLabel: function(text) {
    this.label.text(text);
  },
  setState: function(state) {
    this.check.attr("checked",state);
  },
  getState: function() {
    return !this.check.attr("checked") ? false : true;
  },
  deserialize: function(data) {
    $.monsia.GtkWidget.prototype.deserialize.apply(this,arguments);
    var widget = this;
    $.each(data,function(k,v) {
      switch(k) {
      case 'label':
        widget.setLabel(v);
        break;
      case 'state':
      case 'style':
      case 'visible':
        break;
      default:
        widget.boolName = k;
        widget.setState(v=="true");
      } 
    });
  },
  serialize: function(data) {
    if (this.boolName) {
      data[this.boolName] = this.getState();
    }
    return data;
  }
});

/*
 * GtkRadioButton
 */
$.widget('monsia.GtkRadioButton',$.monsia.GtkWidget,{
  options: {
    // option
    state: 0,
    style: "",
    width: 100,
    height: 30,
    // signal callback
    clicked: function(name){}
  },
  _create: function() {
    var widget = this;
    this.name = this.element[0].id;
    this.radio = $('<input type="radio">')
      .appendTo(this.element)
      .addClass("ui-widget-contents")
      .click(function() {
        widget.options.clicked(widget.name);
      });
    this.label = $('<span>')
      .appendTo(this.element)
      .addClass("ui-widget-contents")
      .click(function() {
        if (widget.options.disabled) {
          return;
        }
        widget.setState(!widget.getState());
        widget.options.clicked(widget.name);
      });
    this.element
      .addClass("ui-widget gtk-radio-button")
      .attr("klass","GtkRadioButton");
  },
  _setOption: function(key,value) {
    this.options[key] = value;
    switch(key) {
    case 'state':
      if (value==4){ 
        // GTK_STATE_INSENSITIVE = 4
        this.radio.attr("disabled","disabled");
      } else {
        this.radio.removeAttr("disabled");
      }
      break;
    case 'label':
      this.setLabel(value);
      break;
    }
    $.monsia.GtkWidget.prototype._setOption.apply(this,arguments);
  },
  setLabel: function(text) {
    this.label.text(text);
  },
  setState: function(state) {
    this.radio.attr("checked",state);
  },
  getState: function(state) {
    return !this.radio.attr("checked") ? false : true;
  },
  setGroup: function(group) {
    this.radio.attr("name",group);
  },
  deserialize: function(data) {
    $.monsia.GtkWidget.prototype.deserialize.apply(this,arguments);
    var widget = this;
    $.each(data,function(k,v) {
      switch(k) {
      case 'label':
        widget.setLabel(v);
        break;
      case 'state':
      case 'style':
      case 'visible':
        break;
      default:
        widget.boolName = k;
        widget.setState(v=="true");
      } 
    });
  },
  serialize: function(data) {
    if (this.boolName) {
      data[this.boolName] = this.getState();
    }
    return data;
  }
});

/*
 * GtkToggleButton
 */
$.widget('monsia.GtkToggleButton',$.monsia.GtkWidget,{
  options: {
    // option
    state: 0,
    style: "",
    width: 100,
    height: 30,
    // signal callback
    clicked: function(name){}
  },
  _create: function() {
    var widget = this;
    this.name = this.element[0].id;
    this.element
      .addClass("ui-widget gtk-toggle-button")
      .attr("klass","GtkToggleButton")
      .click(function() {
        widget.setState(!widget.state);
        widget.options.clicked(widget.name);
      });
    this.state = false;
  },
  _setOption: function(key,value) {
    this.options[key] = value;
    switch(key) {
    case 'state':
      if (value==4){ 
        // GTK_STATE_INSENSITIVE = 4
        this.element.attr("disabled","disabled");
      } else {
        this.element.removeAttr("disabled");
      }
      break;
    case 'label':
      this.setLabel(value);
      break;
    }
    $.monsia.GtkWidget.prototype._setOption.apply(this,arguments);
  },
  setLabel: function(text) {
    this.element.text(text);
  },
  setState: function(state) {
    this.state = state;
    if (this.state) {
      this.element.addClass("gtk-toggle-button-on");
    } else {
      this.element.removeClass("gtk-toggle-button-on");
    }
  },
  getState: function() {
    return this.state;
  },
  deserialize: function(data) {
    $.monsia.GtkWidget.prototype.deserialize.apply(this,arguments);
    var widget = this;
    $.each(data,function(k,v) {
      switch(k) {
      case 'label':
        widget.setLabel(v);
        break;
      case 'state':
      case 'style':
      case 'visible':
        break;
      default:
        widget.boolName = k;
        widget.setState(v=="true");
      } 
    });
  },
  serialize: function(data) {
    if (this.boolName) {
      data[this.boolName] = this.getState();
    }
    return data;
  }
});

/*
 * GtkLabel
 */
$.widget('monsia.GtkLabel',$.monsia.GtkWidget,{
  options: {
    // option
    state: 0,
    style: "",
    width: 100,
    height: 30,
    xalign: 0.5,
  },
  _create: function() {
    this.name = this.element[0].id;
    this.element
      .addClass("ui-widget gtk-label")
      .attr("klass","GtkLabel");
  },
  _setOption: function(key,value) {
    this.options[key] = value;
    switch(key) {
    case 'xalign':
      if (value == 0.0) {
        this.element.css({"text-align":"left"});
      } else if (value == 1.0) {
        this.element.css({"text-align":"right"});
      } else {
        this.element.css({"text-align":"center"});
      }
      break;
    case 'label':
      this.setLabel(value);
      break;
    }
    $.monsia.GtkWidget.prototype._setOption.apply(this,arguments);
  },
  setLabel: function(text) {
    this.element.text(text);
  },
  getLabel: function() {
    return this.element.text;
  },
  deserialize: function(data) {
    $.monsia.GtkWidget.prototype.deserialize.apply(this,arguments);
    var widget = this;
    $.each(data,function(k,v) {
      switch(k) {
      case 'state':
      case 'style':
      case 'visible':
        break;
      default:
        widget.setLabel(v);
        break;
      } 
    });
  },
});

/*
 * GtkFrame
 */
$.widget('monsia.GtkFrame',$.monsia.GtkWidget,{
  options: {
    // option
    state: 0,
    width: 100,
    height: 30,
  },
  _create: function() {
    this.name = this.element[0].id;
    this.element
      .addClass("ui-widget gtk-frame")
      .attr("klass","GtkFrame");
      ;
  },
  _setOption: function(key,value) {
    this.options[key] = value;
    switch(key) {
    case 'state':
      var child = $(this._child);
      if(child && child[child.attr("klass")]) {
        child[child.attr("klass")]("option",{state:value})
      }
      break;
    }
    $.monsia.GtkWidget.prototype._setOption.apply(this,arguments);
  },
  put: function(obj) {
    this._child = obj;
    this.element.append(obj);
    $(obj)
      .css({width:"100%",height:"100%"});
  }
});

/*
 * GtkScrolledWindow
 */
$.widget('monsia.GtkScrolledWindow',$.monsia.GtkWidget,{
  options: {
    // option
    state: 0,
    width: 100,
    height: 30,
  },
  _create: function() {
    this.name = this.element[0].id;
    this.element
      .addClass("ui-widget gtk-scrolled-window")
      .attr("klass","GtkScrolledWindow")
      ;
  },
  _setOption: function(key,value) {
    this.options[key] = value;
    switch(key) {
    case 'state':
      var child = $(this._child);
      if(child && child[child.attr("klass")]) {
        child[child.attr("klass")]("option",{state:value})
      }
      break;
    }
    $.monsia.GtkWidget.prototype._setOption.apply(this,arguments);
  },
  put: function(obj) {
    this.element.append(obj);
    this._child = obj;
  }
});

/*
 * GtkHSeparator
 */
$.widget('monsia.GtkHSeparator',$.monsia.GtkWidget,{
  options: {
    // option
    state: 0,
    width: 100,
    height: 30,
  },
  _create: function() {
    this.name = this.element[0].id;
    this.element
      .addClass("ui-widget gtk-hseparator")
      .attr("klass","GtkHSeparator")
      ;
  },
  _setOption: function(key,value) {
    this.options[key] = value;
    $.monsia.GtkWidget.prototype._setOption.apply(this,arguments);
    switch(key) {
    case 'width':
      this.element.css({width:value});
      break;
    case 'height':
      this.element.css({height:value/2});
      break;
    }
  }
});

/*
 * GtkVSeparator
 */
$.widget('monsia.GtkVSeparator',$.monsia.GtkWidget,{
  options: {
    // option
    state: 0,
    width: 100,
    height: 30,
  },
  _create: function() {
    this.name = this.element[0].id;
    this.element
      .addClass("ui-widget gtk-vseparator")
      .attr("klass","GtkVSeparator")
      ;
  },
  _setOption: function(key,value) {
    this.options[key] = value;
    $.monsia.GtkWidget.prototype._setOption.apply(this,arguments);
    switch(key) {
    case 'width':
      this.element.css({width:value/2});
      break;
    case 'height':
      this.element.css({height:value});
      break;
    }
  }
});

/*
 * GtkWindow
 */

$.widget('monsia.GtkWindow', $.ui.dialog, {
  options: {
    // overwrite
    width: 1024,
    height: 768,
    autoOpen: false,
    modal: false,
    beforeclose: function(e,ui) {
      // prevent close button
      if (!e.originalEvent) {
        return true;
      } else {
        return false;
      }
    },
    position: [0,0],

    state: 0,
    bgcolor: "",
    origTitle: ""
  },
  _base: $.ui.dialog.prototype,
  _create: function() {
    this.name = this.element[0].id;
    this._base._create.apply(this,arguments);
    this.element
      .addClass("gtk-window")
      .attr("klass","GtkWindow")
      .css({margin:0,padding:0,width:"100%",height:"100%",overflow:"hidden"})
      ;
  },
  _setOption: function(key,value) {
    this.options[key] = value;
    switch(key) {
    case 'state':
      var child = $(this._child);
      if(child && child[child.attr("klass")]) {
        child[child.attr("klass")]("option",{state:value})
      }
      if (value==4){ 
        // GTK_STATE_INSENSITIVE = 4
        this.disable();
      } else {
        this.enable();
      }
      break;
    case 'visible':
      if (value) {
        this.element.show();
      } else {
        this.element.hide();
      }
      break;
    }
    $.ui.dialog.prototype._setOption.call(this,key,value);
  },
  _notify: function(obj) {
  },
  put: function(obj) {
    this._child = obj;
    this.element.append(obj);
    $(obj)
      .css({width:"100%",height:"100%"});
  },
  deserialize: function(data) {
    var widget = this;
    var popup = {};
    $.each(data,function(k,v) {
      switch(k) {
      case 'state':
      case 'style':
        widget._setOption(k,v);
        break;
      case 'visible':
        widget._setOption(k,v=="true");
        break;
      case 'title':
        widget._setOption(k,widget.options.origTitle+" - "+v);
        break;
      case 'bgcolor':
        var color = GTKCOLOR[v];
        if (color) {
          //widget.element.css({background-color:color});
        } else {
          //widget.element.css({background-color:""});
        }
        break;
      case 'popup_summary':
        popup.summary = v;
        break;
      case 'popup_body':
        popup.body = v;
        break;
      case 'popup_icon':
        popup.icon = v;
        break;
      case 'popup_timeout':
        popup.timeout = v;
        break;
      } 
    });
    this._notify(popup);
  },
  serialize: function(data) {
    return data;
  }
});

/*
 * GtkNotebook
 */

$.widget('monsia.GtkNotebook', $.ui.tabs, {
  options: {
    // overwrite
    cache: false,
    colapsible: false,
    // option
    state: 0,
    width: 400,
    height: 400,
    // callback
    switchPage: function() {}
  },
  _base: $.ui.tabs.prototype,
  _create: function() {
    var widget = this;
    this._base._create.apply(this,arguments);
    this.element
      .addClass("gtk-notebook")
      .attr("klass","GtkNotebook")
      .css({margin:0,padding:0,width:"100%",height:"100%",overflow:"hidden"})
      ;
    this.name = this.element[0].id;
    this.selected = 0;
    this.options.select = function(e,u){
      for(var i=0;i<widget.panels.length;i++) {
        if (i == u.index) {
          $(widget.panels[i]).show();
        } else {
          $(widget.panels[i]).hide();
        }
      }
      widget.selected = u.index;
      widget.options.switchPage(widget.name);
    };
    this._children = [];
  },
  _setOption: function(key,value) {
    this.options[key] = value;
    switch(key) {
    case 'state':
      for(var i=0;i<this._children.length;i++) {
        var child = $(this._children[i]);
        if(child && child[child.attr("klass")]) {
          child[child.attr("klass")]("option",{state:value})
        }
      }
      for(var i=0;i<this.panels.length;i++) {
        if (value==4){ 
          this.disable(i);
          //$(this.panels[i]).hide();
        } else {
          this.enable(i);
          //$(this.panels[i]).show();
        }
      }
      break;
    case 'width':
      this.element.css({width:value});
      break;
    case 'height':
      this.element.css({height:value});
      break;
    }
    $.ui.tabs.prototype._setOption.call(this,key,value);
  },
  putTab: function(i,obj) {
    $(this.anchors[i])
      .append(obj);
  },
  putPage: function(i,obj) {
    $(this.panels[i])
      .append(obj);
    $(obj).css({width:"100%",height:"100%"});
    this._children.push(obj);
  },
  getSelected: function() {
    return this.selected;
  },
  deserialize: function(data) {
    var widget = this;
    var popup = {};
    $.each(data,function(k,v) {
      switch(k) {
      case 'state':
      case 'style':
        widget._setOption(k,v);
        break;
      case 'visible':
        widget._setOption(k,v=="true");
        break;
      case 'pageno':
        widget.select(v);
        break;
      } 
    });
  },
  serialize: function(data) {
    data.pageno = this.selected
    return data;
  }
});

/*
 * GtkFixed
 */
$.widget('monsia.GtkFixed',$.monsia.GtkWidget,{
  options: {
    state: 0,
    width: 0,
    height: 0
  },
  _create: function() {
    this.name = this.element[0].id;
    this._children = [];
    this.element
      .addClass("ui-widget ui-widget-content gtk-fixed")
      .attr("klass","GtkFixed")
      ;
  },
  _setOption: function(key,value) {
    this.options[key] = value;
    switch(key) {
    case 'state':
      $.each(this._children,function(i,c) {
        obj = $(c);
        if (obj && obj[obj.attr("klass")]) {
          obj[obj.attr("klass")]("option",{state:value});
        }
      });
      break;
    }
    $.monsia.GtkWidget.prototype._setOption.apply(this,arguments);
  },
  put: function(x,y,obj) {
    this.element.append(obj);
    this._children.push(obj);
    var offset = this.element.offset();
    var _x = offset.left + x;
    var _y = offset.top + y;
    $(obj).offset({left:_x,top:_y});
  }
});

/*
 * GtkTable
 */
$.widget('monsia.GtkTable',$.monsia.GtkWidget,{
  options: {
    state: 0,
    width: 0,
    height: 0,
    nrows: 3,
    ncolumns: 3
  },
  _create: function() {
    this.name = this.element[0].id;
    this._children = [];
    var tbody = this.tbody = $("<tbody>");
    this.element
      .addClass("ui-widget gtk-table")
      .attr("klass","GtkTable")
      .append(tbody)
      ;
    this._create_table();
  },
  _setOption: function(key,value) {
    this.options[key] = value;
    switch(key) {
    case 'state':
      for(var i=0;i<this._children.length;i++) {
        var obj = $(this._children[i]);
        if (obj && obj[obj.attr("klass")]) {
          obj[obj.attr("klass")]("option",{state:value});
        }
      }
      break;
    case 'ncolumns':
      this._createTable();
      break;
    case 'nrows':
      this._createTable();
      break;
    }
    $.monsia.GtkWidget.prototype._setOption.apply(this,arguments);
  },
  _createTable: function() {
    this.tbody.empty();
    for(var i=0;i<this.options.nrows;i++) {
      var tr = $("<tr>")
        .appendTo(this.tbody);
      for(var j=0;j<this.options.ncolumns;j++) {
        $("<td>").appendTo(tr);
      }
    }
  },
  put: function(x,y,obj) {
    if (x < 0 || x > (this.options.ncolumns - 1)) {
      return;
    }
    if (y < 0 || y > (this.options.nrows - 1)) {
      return;
    }
    this._children.push(obj);
    var cell = this.tbody[0].children[y].children[x];
    $(obj)
      .appendTo(cell)
      .css({width:"100%",height:"100%"})
      ;
  }
});

/*
 * GtkNumberEntry
 */ 
$.widget('monsia.GtkNumberEntry',$.monsia.GtkWidget,{
  options: {
    state: 0,
    style: "",
    width: 100,
    height: 30,
    // option
    format: "9999",
    // signal callback
    activate: function() {}
  },
  _create: function() {
    this.name = this.element[0].id;
    var widget = this;
    this.value = 0;
    this._parseFormat();
    this._applyFormat();
    this.editable = true;

    this.element
      .addClass("ui-widget ui-widget-content gtk-number-entry")
      .attr("autocomplete","off")
      .attr("klass","GtkNumberEntry")
      .keydown(function(e){
        if (e.shiftKey == false && 
            e.ctrlKey == false &&
            e.altKey == false) {
          var code = e.which;

          if(this.editable == false) {
            return;
          }

          if (code == 8 || code == 46) {
            // backspace or delete
            widget._parseFormat();
            widget._applyFormat();
            return;
          }
          if (code == 13) {
            // return
            widget.options.activate(widget.name);
            return;
          }
          if (code == 109 || code == 189) {
            // minus
            widget.value *= widget.minus_factor;
          }
          if (code == 190 || code == 110) {
            // dot
            widget.input_mode = "rs";
            widget._rs = 0;
          }

          var num = -1;
          if (48 <= code && code <= 57) {
            num = code - 48;
          }
          if (96 <= code && code <= 105) {
            num = code - 96;
          }
          if (num != -1) {
            if (widget.input_mode == "ls") {
              if (widget._ls < widget.ls) {
                if (widget._ls == 0) {
                  if (num == 0) {
                    return;
                  } else {
                    widget.value = num;
                  }
                } else {
                  widget.value = widget.value * 10 + num;
                }
                widget._ls++;
              }        
            } else {
              if (widget._rs < widget.rs) {
                widget.value += num / Math.pow(10,widget._rs+1);
                widget._rs++;
              }
            }
          }
        }
        setTimeout(function() {
          widget._applyFormat();
        },10);
      });
  },
  _setOption: function(key,value) {
    this.options[key] = value;
    switch(key) {
    case 'state':
      if (value==4){ 
        // GTK_STATE_INSENSITIVE = 4
        this.element.attr("disabled","disabled");
      } else {
        this.element.removeAttr("disabled");
      }
      break;
    case 'format':
      this._parseFormat();
      break;
    }
    $.monsia.GtkWidget.prototype._setOption.apply(this,arguments);
  },
  _parseFormat: function() {
    var fstr = this.options.format;
    if (fstr.match(/^[-+]/)) {
      this.minus_factor = -1;
    } else {
      this.minus_factor = 1;
    }
    this.prefix = "";
    if (fstr.match(/^[-]/)) {
      this.prefix = "minus";
    }
    if (fstr.match(/^[+]/)) {
      this.prefix = "plus";
    }
    fstr = fstr 
      .replace(/^[-+]/,"")
      .replace(/,/g,"");
    if (fstr.match(/^([-+,Z9]+)\.([-+Z9]+)$/)) {
      this.ls = RegExp.$1.length;
      this.rs = RegExp.$2.length;
    } else {
      this.ls = fstr.length;
      this.rs = 0;
    }
    this._ls = 0;
    this._rs = 0;
    this.input_mode = "ls";
    this.value = 0.0;
  },
  _applyFormat: function() {
    if (this.sc > 0) {
      var pow = Math.pow(10,this.sc) * 1.0;
      this.value = Math.round(this.value * pow) / pow;
    }
    var str = "" + Math.abs(this.value);
    if (str.match(/^(\d+)\.(\d+)$/)) {
      lstr = RegExp.$1;
      rstr = RegExp.$2;
    } else {
      lstr = str;
      rstr = "";
    }
    if (this.options.format.match(/^[-+]?([-+,Z9]+)\.([-+Z9]+)$/)) {
      lf = RegExp.$1;
      rf = RegExp.$2;
    } else {
      lf = this.options.format;
      rf = "";
    }
    var ret = "";
    var j = lf.length - 1;
    for (var i=lstr.length-1;i>=0;i--) {
      if (j < 0) {
        break;
      }
      if (lf[j] == ",") {
        ret = "," + ret;
        j--;
      }
      ret = lstr[i] + ret;
      j--;
    }
    for(;j>=0;j--) {
        switch(lf[j]){
        case "Z":
        case "-":
        case "+":
          ret = " " + ret;
          break;
        case ",":
          ret = "," + ret;
          break;
        case "9":
          ret = "0" + ret;
          break;
        }
    }
    for(var i=0;i<rf.length;i++) {
      if (i==0) {
        ret += ".";
      }
      if (i >= rstr.length) {
        ret += "0";
      } else {
        ret += rstr[i];
      }
    }
    if (this.prefix == "plus" && this.value > 0.0) {
      ret = "+" + ret;
    }
    if (this.prefix == "minus" && this.value < 0.0) {
      ret = "-" + ret;
    }
    this.element.attr("value",ret);
  },
  setValue: function(value) {
    this.value = value;
    this._applyFormat();
  },
  getValue: function() {
    return this.value;
  },
  deserialize: function(data) {
    $.monsia.GtkWidget.prototype.deserialize.apply(this,arguments);
    var widget = this;
    $.each(data,function(k,v) {
      switch(k) {
      case 'editable':
        if (v=="true") {
           widget.element.removeAttr("readonly");
           this.editable = true;
        } else {
           widget.element.attr("readonly","readonly");
           this.editable = false;
        }
        break;
      case 'state':
      case 'style':
      case 'visible':
        break;
      default:
        widget.anonName = k;
        widget.setValue(v);
      } 
    });
  },
  serialize: function(data) {
    if (this.anonName) {
      data[this.anonName] = this.getValue();
    }
    return data;
  }
});

/*
 * GtkPandaTable
 */
$.widget('monsia.GtkPandaTable',$.monsia.GtkWidget,{
  options: {
    // option
    state: 0,
    width: 200,
    height: 300,
    nrows: 3,
    ncolumns: 3,
    types: "",
    titles: "",
    column_widths: "",
    // signal
    cell_edited: function(row,column,data) {}
  },
  _create: function() {
    this.name = this.element[0].id;
    var thead = this.thead = $("<thead>");
    var tbody = this.tbody = $("<tbody>");
    var table = this.table = this.element
      .addClass("ui-widget gtk-panda-table")
      .attr("klass","GtkPandaTable")
      .append(thead)
      .append(tbody)
      ;
    this.trow = 0;
    this.tcolumn = 0;
    this.tvalue = "";
  },
  _setOption: function(key,value) {
    this.options[key] = value;
    switch(key) {
    case "state":
      if (value==4){ 
        // GTK_STATE_INSENSITIVE = 4
        this.disable();
        if (this.cells) {
          $.each(this.cells,function(){
            $.each(this,function(){
              $(this).attr("disabled","disabled");
            });
          });
        }
      } else {
        this.enable();
        if (this.cells) {
          $.each(this.cells,function(){
            $.each(this,function(){
              $(this).removeAttr("disabled");
            });
          });
        }
      }
      break;
    case 'width':
      this.element.css({width:value});
      break;
    case 'height':
      break;
    case 'ncolumns':
      this.setColumns(value);
      break;
    case 'nrows':
      this.setRows(value);
      break;
    case 'types':
      this.setTypes(value);
      break;
    case 'titles':
      this.setTitles(value);
      break;
    case 'column_widths':
      this.setColumnWidths(value);
      break;
    case 'mode':
      if (value == "single") {
        this.mode = 0;
      } else {
        this.mode = 1;
      }
    }
  },
  _resetTable: function() {
    this.thead.empty();
    this.tbody.empty();
  },
  setColumns: function(ncolumns) {
    this._resetTable();

    var tr = $("<tr>");
    for(var i=0; i<ncolumns;i++) {
      var td = $("<th>")
        .text("  ")
        .appendTo(tr);
    }
    this.thead.append(tr);

    for(var i=0;i<this.options.nrows;i++) {
      var tr = $("<tr>");
      for(var j=0; j<ncolumns;j++) {
        var td = $("<td>")
          .appendTo(tr);
      }
      this.tbody.append(tr);
    }
  },
  setRows: function(nrows) {
    this._resetTable();

    var tr = $("<tr>");
    for(var i=0; i<this.options.ncolumns;i++) {
      var td = $("<th>")
        .text("")
        .appendTo(tr);
    }
    this.thead.append(tr);

    for(var i=0;i<nrows;i++) {
      var tr = $("<tr>");
      for(var j=0; j<this.options.ncolumns;j++) {
        var td = $("<td>")
          .appendTo(tr);
      }
      this.tbody.append(tr);
    }
  },
  setTypes: function(csv) {
    if (!this.widths) {
      return;
    }
    var widget = this;
    var values = csv.split(",");
    this.types = new Array(this.options.ncolumns);
    for(var i=0;i<this.types.length;i++){
      this.types[i] = 1; // 0:TEXT, 1:LABEL 
    }
    for(var i=0;i<values.length;i++){
      if (values[i].match(/^text/i)) {
        this.types[i] = 0;
      }
    }
    this.cells = new Array(this.options.nrows);
    for(var i=0;i<this.options.nrows;i++){
      var rcells = new Array(this.ncolumns);
      for(var j=0;j<this.options.ncolumns;j++){
        var cell = this.tbody[0].children[i].children[j]; // <td>
        rcells[j] = $("<input>")
          .appendTo(cell)
          .css({margin:0,padding:0,width:this.widths[j]})
          .attr({row:i,column:j})
          ;
        if (this.types[j] != 0) {
          $(rcells[j]).attr({readonly:"readonly"});
        }
      }
      this.cells[i] = rcells;
    }
    for(var i=0;i<this.options.nrows;i++){
      for(var j=0;j<this.options.ncolumns;j++){
        $(this.cells[i][j])
          // FIXME
          .focus(function() {
            var l = $(this).attr("value").length;
            if (this.setSelectionRange) {
              this.setSelectionRange(l,l);
            } else if (this.createTextRange) {
              var range = this.createTextRange();
              range.collapse(true);
              range.moveEnd('character', l);
              range.moveStart('character', l);
              range.select();
            }
          })
          .keydown(function(e) { //enter
            var i = parseInt($(this).attr("row"));
            var j = parseInt($(this).attr("column"));
            if (e.keyCode == 13 && 
                e.shiftKey == false && 
                e.ctrlKey == false &&
                e.altKey == false &&
                widget.types[j] == 0) {
              widget.trow = i;
              widget.tcolumn = j;
              widget.tvalue = $(this).attr("value");
              widget.options.cell_edited(i,j,$(this).attr("value"));
              return;
            }
            if (e.keyCode == 38 && // up 
                e.shiftKey == false && 
                e.ctrlKey == false &&
                e.altKey == false) {
              if (i > 0) {
                $(widget.cells[i-1][j]).focus();
              }
              return;
            }
            if (e.keyCode == 40 && // down
                e.shiftKey == false && 
                e.ctrlKey == false &&
                e.altKey == false) {
              if (i < (widget.options.nrows -1)) {
                $(widget.cells[i+1][j]).focus();
              }
              return;
            }
            if (e.keyCode == 38 && // ctrl + up 
                e.shiftKey == false && 
                e.ctrlKey == true &&
                e.altKey == false) {
              if (i > 10) {
                $(widget.cells[i-10][j]).focus();
              } else {
                $(widget.cells[0][j]).focus();
              }
              return;
            }
            if (e.keyCode == 40 && // ctrl + down
                e.shiftKey == false && 
                e.ctrlKey == true &&
                e.altKey == false) {
              if (i < (widget.options.nrows - 10)) {
                $(widget.cells[i+10][j]).focus();
              } else {
                $(widget.cells[widget.options.nrows-1][j]).focus();
              }
              return;
            }
            if (e.keyCode == 37 && // left
                e.shiftKey == false && 
                e.ctrlKey == false &&
                e.altKey == false) {
              if (j > 0) {
                for(var k = j-1;k>=0;k--) {
                  if(!$(widget.cells[i][k]).attr("readonly")) {
                    $(widget.cells[i][k]).focus();
                    return;
                  }
                }
              }
              return;
            }
            if (e.keyCode == 39 && // right
                e.shiftKey == false && 
                e.ctrlKey == false &&
                e.altKey == false) {
              if (j < (widget.options.ncolumns-1)) {
                for(var k = j+1;k<widget.options.ncolumns;k++) {
                  if(!$(widget.cells[i][k]).attr("readonly")) {
                    $(widget.cells[i][k]).focus();
                    return;
                  }
                }
              }
              return;
            }
          });
      }
    }
  },
  setTitles: function(str_titles) {
    var titles = str_titles.split(",");
    var headers = this.thead[0].children[0].children;
    for(var i=0;i<headers.length;i++) {
      var t = "";
      if (i<titles.length) {
        t = titles[i];
      }
      $(headers[i]).text(t);
    }
  },
  setColumnWidths: function(str_widths) {
    var ws = str_widths.split(",");
    var headers = this.thead[0].children[0].children;
    var total = 0;
    this.widths = new Array(this.options.ncolumns);
    for(var i=0;i<headers.length;i++) {
      var w = 100;
      if (i<ws.length) {
        w = parseInt(ws[i]);
      }
      if (i == (headers.length-1)) {
        if (this.options.width > (total+w)) {
          this.widths[i] =  this.options.width - total;
        } else {
          this.widths[i] = w;
        }
      } else {
        this.widths[i] = w;
      }
      $(headers[i]).css("width",this.widths[i]);
      total += w;
    }
  },
  setCellData: function(data) {
    if(!this.cells) {
      return;
    }
    for(var i=0;i<this.options.nrows;i++) {
      var row = [];
      if (i < data.length) {
        row = data[i];
      }
      for(var j=0;j<this.options.ncolumns;j++) {
        if (j < row.length) {
          $(this.cells[i][j]).attr({value:row[j]});
        }
      }
    }
  },
  setBGColor: function(data) {
    if(!this.cells) {
      return;
    }
    for(var i=0;i<this.options.nrows;i++) {
      var row = [];
      if (i < data.length) {
        row = data[i];
      }
      for(var j=0;j<this.options.ncolumns;j++) {
        if (j < row.length) {
          var c = GTKCOLOR[row[j]] ? GTKCOLOR[row[j]] : "white"; 
          $(this.cells[i][j]).css({"background-color":c});
        }
      }
    }
  },
  setFGColor: function(data) {
    if(!this.cells) {
      return;
    }
    for(var i=0;i<this.options.nrows;i++) {
      var row = [];
      if (i < data.length) {
        row = data[i];
      }
      for(var j=0;j<this.options.ncolumns;j++) {
        if (j < row.length) {
          var c = GTKCOLOR[row[j]] ? GTKCOLOR[row[j]] : "black"; 
          $(this.cells[i][j]).css({"color":c});
        }
      }
    }
  },
  moveTo: function(r,attr,c,cattr) {
    if (r < 0 || r >= this.nrows || 
        attr < 0 || attr > 1 || 
        c < 0 || c >= this.ncolumns) {
      return;
    }
    var scroll = this.element.parent();
    if (!scroll.hasClass("gtk-scrolled-window")) {
      $(this.cells[r][c]).focus();
      return;
    }
    var th = this.element.height();
    var sh = scroll.height();
    // FIXME magic number 0.7
    var s = (th * 1.0 / (this.options.nrows+1)) * (r+1) - sh * attr * 0.7; 
    s = s < 0 ? 0 : s;
    $(this.cells[r][c]).focus();
    scroll.scrollTop(s);
  },
  deserialize: function(data) {
    $.monsia.GtkWidget.prototype.deserialize.apply(this,arguments);
    var widget = this;
    var trow = -1;
    var trowattr = 2;
    var tcolumn = -1;
    $.each(data,function(k,v) {
      switch(k) {
      case 'trow':
        trow = v > 1 ? v - 1: 0;
        break;
      case 'trowattr':
        switch(v) {
        case 1: /* DOWN */
          trowattr = 1.0;
          break;
        case 2: /* DOWN */
          trowattr = 0.5;
          break;
        case 3: /* QUATER */
          trowattr = 0.25;
          break;
        case 4: /* THREE QUATER */
          trowattr = 0.75;
          break;
        default: /* TOP */
          trowattr = 0.0;
          break;
        }
        break;
      case 'tcolumn':
        tcolumn = v > 1 ? v - 1:0;
        break;
      case 'rowdata':
        var fgColors = [];
        var bgColors = [];
        var cellData = [];
        for(var i=0;i<v.length;i++) {
          var r = v[i];
          var fg = [];
          var bg = [];
          var cd = [];
          for(var j=0;j<r.length;j++) {
            $.each(r[j],function(_k,_v) {
              switch(_k) {
              case 'celldata':
                cd.push(_v);
                break;
              case 'fgcolor':
                fg.push(_v);
                break;
              case 'bgcolor':
                bg.push(_v);
                break;
              }
            });
          }
          fgColors.push(fg);
          bgColors.push(bg);
          cellData.push(cd);
        }
        widget.setCellData(cellData);
        widget.setFGColor(fgColors);
        widget.setBGColor(bgColors);
        break;
      } 
    });
    if (trow != -1 && tcolumn != -1) {
      widget.moveTo(trow,trowattr,tcolumn,0.0);
    }
  },
  serialize: function(data) {
    data.trow = this.trow;
    data.tcolumn = this.tcolumn;
    data.tvalue = this.tvalue;
    if (this.cells) {
      for(var i=0;i<this.options.nrows;i++) {
        for(var j=0;j<this.options.ncolumns;j++) {
          data.rowdata[i][j].celldata = $(this.cells[i][j]).attr("value");
        }
      }
    }
    return data;
  }
});

/*
 * GtkPandaCList
 */
$.widget('monsia.GtkPandaCList',$.monsia.GtkWidget,{
  options: {
    // option
    state: 0,
    width: 200,
    height: 300,
    //
    show_titles: true,
    ncolumns: 1,
    mode: "single",
    // signal
    select_row: function() {},
    unselect_row: function() {}
  },
  _create: function() {
    this.name = this.element[0].id;
    var thead = this.thead = $("<thead>");
    var tbody = this.tbody = $("<tbody>");
    var table = this.table = this.element
      .addClass("ui-widget gtk-panda-clist")
      .attr("klass","GtkPandaCList")
      .append(thead)
      .append(tbody)
      ;
    this.nrows = 0;
    this.mode = 0; // 0:single, other:multi
    this.row = 0;
  },
  _setOption: function(key,value) {
    this.options[key] = value;
    switch(key) {
    case "state":
      if (value==4){ 
        // GTK_STATE_INSENSITIVE = 4
        this.disable();
      } else {
        this.enable();
      }
      break;
    case 'width':
      this.element.css({width:value});
      break;
    case 'height':
      //this.element.css("height","" + value + "px");
      break;
    case 'show_titles':
      if (value == true) {
        this.thead.show();
      } else {
        this.thead.hide();
      }
      break;
    case 'ncolumns':
      this._setColumns(value);
      break;
    case 'mode':
      if (value == "single") {
        this.mode = 0;
      } else {
        this.mode = 1;
      }
    }
    $.Widget.prototype._setOption.call( this, key, value );
  },
  _resetTable: function() {
    this.thead.empty();
    this.tbody.empty();
    this.nrows = 0;
  },
  _setColumns: function(columns) {
    this._resetTable();
    var tr = $("<tr>");
    for(var i=0; i<columns;i++) {
      var td = $("<th>")
        .text("  ")
        .appendTo(tr);
    }
    this.thead.append(tr);
  },
  setColumnWidths: function(str_widths) {
    var widths = str_widths.split(",");
    var headers = this.thead[0].children[0].children;
    for(var i=0;i<headers.length;i++) {
      var w = 100;
      if (i<widths.length) {
        w = widths[i];
      }
      $(headers[i]).css("width",w);
    }
  },
  append: function(rowdata) {
    var widget = this;
    var tr = $("<tr>")
      .addClass("gtk-panda-clist-row")
      .attr("rnum",this.nrows)
      .attr("select","false")
      .click(function(){
        if (widget.options.disabled) {
          return;
        }
        if (widget.mode == 0) { //single mode
            row = $(this).attr("rnum");
            var slist = [];
            for(var i=0;i<widget.nrows;i++) {
              if (i == row) {
                 slist.push(true);
              } else {
                 slist.push(false);
              }
            }
            widget.setSelection(slist);
            widget.row = row;
            widget.options.select_row(widget.name,row);
        } else { //multi mode
          if ($(this).attr("select") == "true") {
            $(this)
              .attr("select","true");
            widget.options.unselect_row(widget.name,$(this).attr("rnum"));
          } else {
            $(this)
              .attr("select","false");
            widget.options.select_row(widget.name,$(this).attr("rnum"));
          }
        }
      });
    for(var i=0; i<rowdata.length;i++) {
      var td = $("<td>")
        .append($("<p>").html(rowdata[i].replace(/ /g,"&nbsp;")))
        .appendTo(tr);
    }
    this.tbody.append(tr);
    this.nrows += 1;
  },
  clear: function() {
    this.tbody.empty();
    this.nrows = 0;
  },
  setSelection: function(selected) {
    if (this.nrows == 0) {
      return;
    }
    var max = selected.length > this.nrows ? this.nrows : selected.length;
    var rows = this.tbody[0].children;
    for(var i=0;i<max;i++) {
      if (selected[i]) {
        if ($(rows[i]).attr("select") == "false") {
          $(rows[i])
            .attr("select","true");
        }
      } else {
        if ($(rows[i]).attr("select") == "true") {
          $(rows[i])
            .attr("select","false");
        }
      }
    }
  },
  getSelection: function() {
    var ret = [];
    rows = this.tbody[0].children;
    for(var i=0;i<rows.length;i++) {
      if ($(rows[i]).attr("select")=="true") {
        ret.push(true);
      } else {
        ret.push(false);
      }
    }
    return ret;
  },
  setHeader: function(i,obj) {
    if ((this.columns - 1) < i) {
      return;
    }
    var headers = this.thead[0].children[0].children;
    $(headers[i]).append(obj);
  },
  moveTo: function(r,attr) {
    if (r < 0 || r >= this.nrows || attr < 0 || attr > 1) {
      return;
    }
    var scroll = this.element.parent();
    if (!scroll.hasClass("gtk-scrolled-window")) {
      return;
    }
    var th = this.element.height();
    var sh = scroll.height();
    // FIXME magic number 0.7
    var s = (th * 1.0 / (this.nrows+1)) * (r+1) - sh * attr * 0.7; 
    s = s < 0 ? 0 : s;
    scroll.scrollTop(s);
  },
  deserialize: function(data) {
    $.monsia.GtkWidget.prototype.deserialize.apply(this,arguments);
    var widget = this;
    var count = -1;
    var row = 0;
    var rowattr = 0;
    var rowdata = [];
    var booldata = [];
    $.each(data,function(k,v) {
      switch(k) {
      case 'count':
        count = v;
        break;
      case 'row':
        row = row > 1 ? row - 1 : 0;
        break;
      case 'rowattr':
        switch(v) {
        case 1: /* DOWN */
          rowattr = 1.0;
          break;
        case 2: /* DOWN */
          rowattr = 0.5;
          break;
        case 3: /* QUATER */
          rowattr = 0.25;
          break;
        case 4: /* THREE QUATER */
          rowattr = 0.75;
          break;
        default: /* TOP */
          rowattr = 0.0;
          break;
        }
        break;
      case 'column':
        break;
      case 'item':
        if (count < 0) {
          count = v.length;
        }
        for(var i=0;i<v.length;i++) {
          var r = [];
          for(var j in v[i]) {
            r.push(v[i][j]);
          }
          rowdata.push(r);
        }
        break;
      case 'state':
      case 'style':
      case 'visible':
        break;
      default:
        widget.booldataName = k;
        if (count < 0) {
          count = v.length;
        }
        booldata = $.map(v,function(_v,i){
          if (_v.match(/^t/i)){
            return true;
          } else {
            return false;
          }
        });
        break;
      } 
    });
    this.clear();
    for(var i=0;i<rowdata.length;i++) {
      if (i < count) {
        this.append(rowdata[i]);
      }
    }
    this.setSelection(booldata);
  },
  serialize: function(data) {
    data.row = this.row + 1;
    var slist = this.getSelection();
    for(var i=0;i<slist.length;i++) {
      data[this.booldataName][i] = slist[i] ? "TRUE":"FALSE";
    }
    return data;
  }
});

/*
 *  GtkPandaCombo
 */ 
$.widget('monsia.GtkPandaCombo',$.monsia.GtkWidget,{
  options: {
    state: '',
    width: 0,
    height: 0,
  },
  _create: function() {
    this.name = this.element[0].id;
    var widget = this;
    this.element
      .addClass("ui-widget ui-widget-content gtk-panda-combo")
      .css({margin:0,padding:0,"border-spacing":0});
    var tbody = this.tbody = $("<tbody>")
      .css({margin:0,border:0,padding:0})
      .appendTo(this.element);
    this.button = $("<button type ='button'>&nbsp;</button>")
      .attr("tabIndex",-1)
      .attr("title","Show All Items")
      .button({
        icons: {primary: "ui-icon-triangle-1-s"},
        text: false
      })
      .css({margin:0,border:0,padding:0})
      .removeClass("ui-corner-all")
      .addClass("ui-corner-right ui-button-icon")
      .click(function() {
        if(widget.entry) {
          widget.entry.autocomplete("search","");
          widget.entry.focus();
        }
      });
    var tr = $("<tr>");
    this.entry_cell = $("<td>")
      .css({margin:0,border:0,padding:0})
      .appendTo(tr);
    $("<td>")
      .css({margin:0,border:0,padding:0})
      .append(this.button)
      .appendTo(tr);
    this.tbody.append(tr);
  },
  _setOption: function(key,value) {
    $.monsia.GtkWidget.prototype._setOption.apply(this,arguments);
    this.options[key] = value;
    switch(key) {
    case 'state':
      if (value==4){ 
        // GTK_STATE_INSENSITIVE = 4
        if (this.entry) {
        this.entry.attr("disabled","disabled");
        }
        this.button.attr("disabled","disabled");
        this.disable();
      } else {
        if (this.entry) {
        this.entry.removeAttr("disabled");
        }
        this.button.removeAttr("disabled");
        this.enable();
      }
      break;
    case 'style':
      break;
    case 'width':
      value -= 2;
      this.element.css({width:value});
      this.button.css({width:value*0.3});
      if (this.entry){
        this.entry.css({width:value*0.7});
      }
      break;
    case 'height':
      value -= 2;
      this.element.css({height:value});
      this.button.css({height:value});
      if (this.entry) {
        this.entry.css({height:value});
      }
      break;
    }
  },
  setPopdownStrings: function(data) {
    if (this.entry) {
      this.entry.autocomplete({source: data,minLength: 0});
    }
  },
  setEntry: function(obj) {
    this.entry = $(obj)
      .appendTo(this.entry_cell)
      ;
  },
  deserialize: function(data) {
    $.monsia.GtkWidget.prototype.deserialize.apply(this,arguments);
    var widget = this;
    if (data.item) {
      var strs = [""];
      if (!data.count) {
        data.count = data.item.length;
      }
      for(var i=0;i<data.item.length;i++) {
        if (i<data.count) {
          strs.push(data.item[i]);
        }
      }
      widget.setPopdownStrings(strs);
    }
  }
});

/*
 * GtkPandaEntry
 */
$.widget('monsia.GtkPandaEntry',$.monsia.GtkWidget,{
  options: {
    state: 0,
    style: "",
    width: 100,
    height: 30,
    // option
    input_mode: "ascii",
    xim_enabled: false,
    text_max_length: 20,
    // signal callback
    activate: function() {}
  },
  kanaconv: {
    "la":"ァ", "li":"ィ", "lu":"ゥ", "le":"ェ", "lo":"ォ",
    "xa":"ァ", "xi":"ィ", "xu":"ゥ", "xe":"ェ", "xo":"ォ",
    "ka":"カ", "ki":"キ", "ku":"ク", "ke":"ケ", "ko":"コ",
    "kya":"キャ", "kyi":"キィ", "kyu":"キュ", "kye":"キェ", "kyo":"キョ",
    "ga":"ガ", "gi":"ギ", "gu":"グ", "ge":"ゲ", "go":"ゴ",
    "gya":"ギャ", "gyi":"ギィ", "gyu":"ギュ", "gye":"ギェ", "gyo":"ギョ",
    "sa":"サ", "si":"シ", "su":"ス", "se":"セ", "so":"ソ",
    "sya":"シャ", "syi":"シィ", "syu":"シュ", "sye":"シェ", "syo":"ショ",
    "sha":"シャ", "shi":"シィ", "shu":"シュ", "she":"シェ", "sho":"ショ",
    "za":"ザ", "zi":"ジ", "zu":"ズ", "ze":"ゼ", "zo":"ゾ",
    "zya":"ジャ", "zyi":"ジィ", "zyu":"ジュ", "zye":"ジェ", "zyo":"ジョ",
    "jya":"ジャ", "jyi":"ジィ", "jyu":"ジュ", "jye":"ジェ", "jyo":"ジョ",
    "ja":"ジャ", "ji":"ジ", "ju":"ジュ", "je":"ジェ", "jo":"ジョ",
    "ta":"タ", "ti":"チ", "tu":"ツ", "te":"テ", "to":"ト",
    "tsu":"ツ", "ltu":"ッ", "xtu":"ッ",
    "tya":"チャ", "tyi":"チィ", "tyu":"チュ", "tye":"チェ", "tyo":"チョ",
    "cya":"チャ", "cyi":"チ", "cyu":"チュ", "cye":"チェ", "cyo":"チョ", 
    "cha":"チャ", "chi":"チ", "chu":"チュ", "che":"チェ", "cho":"チョ",
    "tha":"テャ", "thi":"ティ", "thu":"テュ", "the":"テェ", "tho":"テョ",
    "da":"ダ", "di":"ヂ", "du":"ヅ", "de":"デ", "do":"ド",
    "dya":"ヂャ", "dyi":"ヂィ", "dyu":"ヂュ", "dye":"ヂェ", "dyo":"ヂョ",
    "dha":"デャ", "dhi":"ディ", "dhu":"デュ", "dhe":"デェ", "dho":"デョ",
    "dwa":"ドァ", "dwi":"ドィ", "dwu":"ドゥ", "dwe":"ドェ", "dwo":"ドォ",
    "na":"ナ", "ni":"ニ", "nu":"ヌ", "ne":"ネ", "no":"ノ",
    "nya":"ニャ", "nyi":"ニィ", "nyu":"ニュ", "nye":"ニェ", "nyo":"ニョ",
    "ha":"ハ", "hi":"ヒ", "hu":"フ", "he":"ヘ", "ho":"ホ",
    "fa":"ファ", "fi":"フィ", "fu":"フ", "fe":"ヘ", "fo":"ホ",
    "hya":"ヒャ", "hyi":"ヒィ", "hyu":"ヒュ", "hye":"ヒェ", "hyo":"ヒョ",
    "fya":"フャ", "fyi":"フィ", "fyu":"フュ", "fye":"フェ", "fyo":"フョ",
    "ba":"バ", "bi":"ビ", "bu":"ブ", "be":"ベ", "bo":"ボ",
    "bya":"ビャ", "byi":"ビィ", "byu":"ビュ", "bye":"ビェ", "byo":"ビョ",
    "pa":"パ", "pi":"ピ", "pu":"プ", "pe":"ペ", "po":"ポ",
    "pya":"ピャ", "pyi":"ピィ", "pyu":"ピュ", "pye":"ピェ", "pyo":"ピョ",
    "ma":"マ", "mi":"ミ", "mu":"ム", "me":"メ", "mo":"モ",
    "mya":"ミャ", "myi":"ミィ", "myu":"ミュ", "mye":"ミェ", "myo":"ミョ",
    "ya":"ヤ", "yi":"イ", "yu":"ユ", "ye":"エ", "yo":"ヨ",
    "lya":"ャ", "lyi":"ィ", "lyu":"ュ", "lye":"ェ", "lyo":"ョ",
    "xya":"ャ", "xyi":"ィ", "xyu":"ュ", "xye":"ェ", "xyo":"ョ",
    "ra":"ラ", "ri":"リ", "ru":"ル", "re":"レ", "ro":"ロ",
    "rya":"リャ", "ryi":"リィ", "ryu":"リュ", "rye":"リェ", "ryo":"リョ",
    "wa":"ワ", "wi":"ヰ", "wu":"ウ", "we":"ヱ", "wo":"ヲ",
    "wha":"ワ", "whi":"ウィ", "whu":"ウ", "whe":"ウェ", "who":"ウォ",
    "lwa":"ヮ", "xwa":"ヮ", 
    "va":"ヴァ", "vi":"ヴィ", "vu":"ヴ", "ve":"ヴェ", "vo":"ヴォ",
    "qa":"クァ", "qi":"クィ", "qu":"ク", "qe":"クェ", "qo":"クォ",
    " ": "　", '"': "”", "#": "＃", "$": "＄", "%": "％",
    "&": "＆", "'": "’", "(": "（", ")": "）", "*": "＊",
    "+": "＋", ",": "、", "-": "ー", ".": "．", "/": "／",
    "0": "０", "1": "１", "2": "２", "3": "３", "4": "４",
    "5": "５", "6": "６", "7": "７", "8": "８", "9": "９",
    ":": "：", ";": "；", "<": "＜", "=": "＝", ">": "＞",
    "?": "？", "@": "＠", 
    "A": "Ａ", "B": "Ｂ", "C": "Ｃ", "D": "Ｄ", "E": "Ｅ",
    "F": "Ｆ", "G": "Ｇ", "H": "Ｈ", "I": "Ｉ", "J": "Ｊ",
    "K": "Ｋ", "L": "Ｌ", "M": "Ｍ", "N": "Ｎ", "O": "Ｏ",
    "P": "Ｐ", "Q": "Ｑ", "R": "Ｒ", "S": "Ｓ", "T": "Ｔ",
    "U": "Ｕ", "V": "Ｖ", "W": "Ｗ", "X": "Ｘ", "Y": "Ｙ",
    "Z": "Ｚ", 
    "[": "［", "\\":  "￥", "]": "]", "^": "＾", "_": "＿",
    "`": "｀",
    "a": "ア", "i": "イ", "u": "ウ", "e": "エ", "o": "オ",
    "{": "｛", "|": "｜", "}": "｝", "~": "〜",
  },
  _create: function() {
    this.name = this.element[0].id;
    this.element
      .addClass("ui-widget ui-widget-content gtk-panda-entry")
      .attr("klass","GtkPandaEntry")
      .attr("autocomplete","off");
  },
  _setOption: function(key,value) {
    $.monsia.GtkWidget.prototype._setOption.apply(this,arguments);
    this.options[key] = value;
    switch(key) {
    case 'state':
      if (value==4){ 
        // GTK_STATE_INSENSITIVE = 4
        this.element.attr("disabled","disabled");
        this.disable();
      } else {
        this.element.removeAttr("disabled");
        this.enable();
      }
      break;
    case 'input_mode':
      if (this.options.input_mode == 'XIM' && 
          this.options.xim_enabled == true) {
        this.element.css("ime-mode","active");
      } else {
        this.element.css("ime-mode","auto");
      }
      var tag = this.element;
      var _this = this;
      if (this.options.input_mode == 'KANA'){
        this.element.keydown(function(e){
          if (e.which == 13 && 
              e.shiftKey == false && 
              e.ctrlKey == false &&
              e.altKey == false) {
            _this.options.activate(_this.name);
            return;
          }
          if (33 <= e.which && e.which <= 46) {
            return;
          }
          setTimeout(function(){
            var k;
            var text = tag.attr("value");
            for(k in _this.kanaconv) {
              text = text.toLowerCase().replace(k,_this.kanaconv[k]);
            }
            tag.attr("value",text);
          },10);
        });
      } else {
        this.element.keydown(function(e){
          if (e.which == 13 && 
              e.shiftKey == false && 
              e.ctrlKey == false &&
              e.altKey == false) {
            _this.options.activate(_this.name);
            return;
          }
        });
      }
      break;
    case 'xim_enabled':
      if (this.options.input_mode == 'xim' && 
          this.options.xim_enabled == true) {
        this.element.css("ime-mode","active");
      } else {
        this.element.css("ime-mode","auto");
      }
      break;
    case 'text_max_length':
      this.element.attr('maxlength',this.options.text_max_length);
      break;
    }
  },
  setText: function(value) {
    this.element.attr("value",value);
  },
  getText: function() {
    return this.element.attr("value")
  },
  deserialize: function(data) {
    $.monsia.GtkWidget.prototype.deserialize.apply(this,arguments);
    var widget = this;
    $.each(data,function(k,v) {
      switch(k) {
      case 'editable':
        if (v=="true") {
           widget.element.removeAttr("readonly");
           this.editable = true;
        } else {
           widget.element.attr("readonly","readonly");
           this.editable = false;
        }
        break;
      case 'state':
      case 'style':
      case 'visible':
        break;
      default:
        widget.anonName = k;
        widget.setText(v);
      } 
    });
  },
  serialize: function(data) {
    if (this.anonName) {
      data[this.anonName] = this.getText();
    }
    return data;
  }
});

/*
 * GtkPandaText
 */
$.widget('monsia.GtkPandaText',$.monsia.GtkWidget,{
  options: {
    state: 0,
    style: "",
    width: 0,
    height: 0,
    // option
    xim_enabled: false,
    // signal callback
    activate: function() {}
  },
  _create: function() {
    this.name = this.element[0].id;
    var widget = this;
    this.element
      .addClass("ui-widget ui-widget-content gtk-panda-text")
      .attr("klass","GtkPandaText")
      .attr("wrap","soft")
      .keydown(function(e){
         if (e.which == 13 && 
             e.shiftKey == false && 
             e.ctrlKey == true &&
             e.altKey == false) {
           widget.options.activate(widget.name);
           return;
         }
      });
      
  },
  _setOption: function(key,value) {
    $.monsia.GtkWidget.prototype._setOption.apply(this,arguments);
    this.options[key] = value;
    switch(key) {
    case 'state':
      if (value==4){ 
        // GTK_STATE_INSENSITIVE = 4
        this.element.attr("disabled","disabled");
        this.disable();
      } else {
        this.element.removeAttr("disabled");
        this.enable();
      }
      break;
    case 'xim_enabled':
      if (this.options.xim_enabled == true) {
        this.element.css("ime-mode","active");
      } else {
        this.element.css("ime-mode","auto");
      }
      break;
    }
  },
  setText: function(value) {
    this.element.attr("value",value);
  },
  getText: function() {
    return this.element.attr("value")
  },
  deserialize: function(data) {
    $.monsia.GtkWidget.prototype.deserialize.apply(this,arguments);
    var widget = this;
    $.each(data,function(k,v) {
      switch(k) {
      case 'state':
      case 'style':
      case 'visible':
        break;
      default:
        widget.anonName = k;
        widget.setText(v);
      } 
    });
  },
  serialize: function(data) {
    if (this.anonName) {
      data[this.anonName] = this.getText();
    }
    return data;
  }
});

/*
 * global
 */ 

const GTKCOLOR =
{
  snow: "rgb(255,250,250)",
  ghost: "rgb(248,248,255)",
  GhostWhite: "rgb(248,248,255)",
  white: "rgb(245,245,245)",
  WhiteSmoke: "rgb(245,245,245)",
  gainsboro: "rgb(220,220,220)",
  floral: "rgb(255,250,240)",
  FloralWhite: "rgb(255,250,240)",
  old: "rgb(253,245,230)",
  OldLace: "rgb(253,245,230)",
  linen: "rgb(250,240,230)",
  antique: "rgb(250,235,215)",
  AntiqueWhite: "rgb(250,235,215)",
  papaya: "rgb(255,239,213)",
  PapayaWhip: "rgb(255,239,213)",
  blanched: "rgb(255,235,205)",
  BlanchedAlmond: "rgb(255,235,205)",
  bisque: "rgb(255,228,196)",
  peach: "rgb(255,218,185)",
  PeachPuff: "rgb(255,218,185)",
  navajo: "rgb(255,222,173)",
  NavajoWhite: "rgb(255,222,173)",
  moccasin: "rgb(255,228,181)",
  cornsilk: "rgb(255,248,220)",
  ivory: "rgb(255,255,240)",
  lemon: "rgb(255,250,205)",
  LemonChiffon: "rgb(255,250,205)",
  seashell: "rgb(255,245,238)",
  honeydew: "rgb(240,255,240)",
  mint: "rgb(245,255,250)",
  MintCream: "rgb(245,255,250)",
  azure: "rgb(240,255,255)",
  alice: "rgb(240,248,255)",
  AliceBlue: "rgb(240,248,255)",
  lavender: "rgb(230,230,250)",
  lavender: "rgb(255,240,245)",
  LavenderBlush: "rgb(255,240,245)",
  misty: "rgb(255,228,225)",
  MistyRose: "rgb(255,228,225)",
  white: "rgb(255,255,255)",
  black: "rgb(0,0,0)",
  dark: "rgb(47,79,79)",
  DarkSlateGray: "rgb(47,79,79)",
  dark: "rgb(47,79,79)",
  DarkSlateGrey: "rgb(47,79,79)",
  dim: "rgb(105,105,105)",
  DimGray: "rgb(105,105,105)",
  dim: "rgb(105,105,105)",
  DimGrey: "rgb(105,105,105)",
  slate: "rgb(112,128,144)",
  SlateGray: "rgb(112,128,144)",
  slate: "rgb(112,128,144)",
  SlateGrey: "rgb(112,128,144)",
  light: "rgb(119,136,153)",
  LightSlateGray: "rgb(119,136,153)",
  light: "rgb(119,136,153)",
  LightSlateGrey: "rgb(119,136,153)",
  gray: "rgb(190,190,190)",
  grey: "rgb(190,190,190)",
  light: "rgb(211,211,211)",
  LightGrey: "rgb(211,211,211)",
  light: "rgb(211,211,211)",
  LightGray: "rgb(211,211,211)",
  midnight: "rgb(25,25,112)",
  MidnightBlue: "rgb(25,25,112)",
  navy: "rgb(0,0,128)",
  navy: "rgb(0,0,128)",
  NavyBlue: "rgb(0,0,128)",
  cornflower: "rgb(100,149,237)",
  CornflowerBlue: "rgb(100,149,237)",
  dark: "rgb(72,61,139)",
  DarkSlateBlue: "rgb(72,61,139)",
  slate: "rgb(106,90,205)",
  SlateBlue: "rgb(106,90,205)",
  medium: "rgb(123,104,238)",
  MediumSlateBlue: "rgb(123,104,238)",
  light: "rgb(132,112,255)",
  LightSlateBlue: "rgb(132,112,255)",
  medium: "rgb(0,0,205)",
  MediumBlue: "rgb(0,0,205)",
  royal: "rgb(65,105,225)",
  RoyalBlue: "rgb(65,105,225)",
  blue: "rgb(0,0,255)",
  dodger: "rgb(30,144,255)",
  DodgerBlue: "rgb(30,144,255)",
  deep: "rgb(0,191,255)",
  DeepSkyBlue: "rgb(0,191,255)",
  sky: "rgb(135,206,235)",
  SkyBlue: "rgb(135,206,235)",
  light: "rgb(135,206,250)",
  LightSkyBlue: "rgb(135,206,250)",
  steel: "rgb(70,130,180)",
  SteelBlue: "rgb(70,130,180)",
  light: "rgb(176,196,222)",
  LightSteelBlue: "rgb(176,196,222)",
  light: "rgb(173,216,230)",
  LightBlue: "rgb(173,216,230)",
  powder: "rgb(176,224,230)",
  PowderBlue: "rgb(176,224,230)",
  pale: "rgb(175,238,238)",
  PaleTurquoise: "rgb(175,238,238)",
  dark: "rgb(0,206,209)",
  DarkTurquoise: "rgb(0,206,209)",
  medium: "rgb(72,209,204)",
  MediumTurquoise: "rgb(72,209,204)",
  turquoise: "rgb(64,224,208)",
  cyan: "rgb(0,255,255)",
  light: "rgb(224,255,255)",
  LightCyan: "rgb(224,255,255)",
  cadet: "rgb(95,158,160)",
  CadetBlue: "rgb(95,158,160)",
  medium: "rgb(102,205,170)",
  MediumAquamarine: "rgb(102,205,170)",
  aquamarine: "rgb(127,255,212)",
  dark: "rgb(0,100,0)",
  DarkGreen: "rgb(0,100,0)",
  dark: "rgb(85,107,47)",
  DarkOliveGreen: "rgb(85,107,47)",
  dark: "rgb(143,188,143)",
  DarkSeaGreen: "rgb(143,188,143)",
  sea: "rgb(46,139,87)",
  SeaGreen: "rgb(46,139,87)",
  medium: "rgb(60,179,113)",
  MediumSeaGreen: "rgb(60,179,113)",
  light: "rgb(32,178,170)",
  LightSeaGreen: "rgb(32,178,170)",
  pale: "rgb(152,251,152)",
  PaleGreen: "rgb(152,251,152)",
  spring: "rgb(0,255,127)",
  SpringGreen: "rgb(0,255,127)",
  lawn: "rgb(124,252,0)",
  LawnGreen: "rgb(124,252,0)",
  green: "rgb(0,255,0)",
  chartreuse: "rgb(127,255,0)",
  medium: "rgb(0,250,154)",
  MediumSpringGreen: "rgb(0,250,154)",
  green: "rgb(173,255,47)",
  GreenYellow: "rgb(173,255,47)",
  lime: "rgb(50,205,50)",
  LimeGreen: "rgb(50,205,50)",
  yellow: "rgb(154,205,50)",
  YellowGreen: "rgb(154,205,50)",
  forest: "rgb(34,139,34)",
  ForestGreen: "rgb(34,139,34)",
  olive: "rgb(107,142,35)",
  OliveDrab: "rgb(107,142,35)",
  dark: "rgb(189,183,107)",
  DarkKhaki: "rgb(189,183,107)",
  khaki: "rgb(240,230,140)",
  pale: "rgb(238,232,170)",
  PaleGoldenrod: "rgb(238,232,170)",
  light: "rgb(250,250,210)",
  LightGoldenrodYellow: "rgb(250,250,210)",
  light: "rgb(255,255,224)",
  LightYellow: "rgb(255,255,224)",
  yellow: "rgb(255,255,0)",
  gold: "rgb(255,215,0)",
  light: "rgb(238,221,130)",
  LightGoldenrod: "rgb(238,221,130)",
  goldenrod: "rgb(218,165,32)",
  dark: "rgb(184,134,11)",
  DarkGoldenrod: "rgb(184,134,11)",
  rosy: "rgb(188,143,143)",
  RosyBrown: "rgb(188,143,143)",
  indian: "rgb(205,92,92)",
  IndianRed: "rgb(205,92,92)",
  saddle: "rgb(139,69,19)",
  SaddleBrown: "rgb(139,69,19)",
  sienna: "rgb(160,82,45)",
  peru: "rgb(205,133,63)",
  burlywood: "rgb(222,184,135)",
  beige: "rgb(245,245,220)",
  wheat: "rgb(245,222,179)",
  sandy: "rgb(244,164,96)",
  SandyBrown: "rgb(244,164,96)",
  tan: "rgb(210,180,140)",
  chocolate: "rgb(210,105,30)",
  firebrick: "rgb(178,34,34)",
  brown: "rgb(165,42,42)",
  dark: "rgb(233,150,122)",
  DarkSalmon: "rgb(233,150,122)",
  salmon: "rgb(250,128,114)",
  light: "rgb(255,160,122)",
  LightSalmon: "rgb(255,160,122)",
  orange: "rgb(255,165,0)",
  dark: "rgb(255,140,0)",
  DarkOrange: "rgb(255,140,0)",
  coral: "rgb(255,127,80)",
  light: "rgb(240,128,128)",
  LightCoral: "rgb(240,128,128)",
  tomato: "rgb(255,99,71)",
  orange: "rgb(255,69,0)",
  OrangeRed: "rgb(255,69,0)",
  red: "rgb(255,0,0)",
  hot: "rgb(255,105,180)",
  HotPink: "rgb(255,105,180)",
  deep: "rgb(255,20,147)",
  DeepPink: "rgb(255,20,147)",
  pink: "rgb(255,192,203)",
  light: "rgb(255,182,193)",
  LightPink: "rgb(255,182,193)",
  pale: "rgb(219,112,147)",
  PaleVioletRed: "rgb(219,112,147)",
  maroon: "rgb(176,48,96)",
  medium: "rgb(199,21,133)",
  MediumVioletRed: "rgb(199,21,133)",
  violet: "rgb(208,32,144)",
  VioletRed: "rgb(208,32,144)",
  magenta: "rgb(255,0,255)",
  violet: "rgb(238,130,238)",
  plum: "rgb(221,160,221)",
  orchid: "rgb(218,112,214)",
  medium: "rgb(186,85,211)",
  MediumOrchid: "rgb(186,85,211)",
  dark: "rgb(153,50,204)",
  DarkOrchid: "rgb(153,50,204)",
  dark: "rgb(148,0,211)",
  DarkViolet: "rgb(148,0,211)",
  blue: "rgb(138,43,226)",
  BlueViolet: "rgb(138,43,226)",
  purple: "rgb(160,32,240)",
  medium: "rgb(147,112,219)",
  MediumPurple: "rgb(147,112,219)",
  thistle: "rgb(216,191,216)",
  snow1: "rgb(255,250,250)",
  snow2: "rgb(238,233,233)",
  snow3: "rgb(205,201,201)",
  snow4: "rgb(139,137,137)",
  seashell1: "rgb(255,245,238)",
  seashell2: "rgb(238,229,222)",
  seashell3: "rgb(205,197,191)",
  seashell4: "rgb(139,134,130)",
  AntiqueWhite1: "rgb(255,239,219)",
  AntiqueWhite2: "rgb(238,223,204)",
  AntiqueWhite3: "rgb(205,192,176)",
  AntiqueWhite4: "rgb(139,131,120)",
  bisque1: "rgb(255,228,196)",
  bisque2: "rgb(238,213,183)",
  bisque3: "rgb(205,183,158)",
  bisque4: "rgb(139,125,107)",
  PeachPuff1: "rgb(255,218,185)",
  PeachPuff2: "rgb(238,203,173)",
  PeachPuff3: "rgb(205,175,149)",
  PeachPuff4: "rgb(139,119,101)",
  NavajoWhite1: "rgb(255,222,173)",
  NavajoWhite2: "rgb(238,207,161)",
  NavajoWhite3: "rgb(205,179,139)",
  NavajoWhite4: "rgb(139,121,94)",
  LemonChiffon1: "rgb(255,250,205)",
  LemonChiffon2: "rgb(238,233,191)",
  LemonChiffon3: "rgb(205,201,165)",
  LemonChiffon4: "rgb(139,137,112)",
  cornsilk1: "rgb(255,248,220)",
  cornsilk2: "rgb(238,232,205)",
  cornsilk3: "rgb(205,200,177)",
  cornsilk4: "rgb(139,136,120)",
  ivory1: "rgb(255,255,240)",
  ivory2: "rgb(238,238,224)",
  ivory3: "rgb(205,205,193)",
  ivory4: "rgb(139,139,131)",
  honeydew1: "rgb(240,255,240)",
  honeydew2: "rgb(224,238,224)",
  honeydew3: "rgb(193,205,193)",
  honeydew4: "rgb(131,139,131)",
  LavenderBlush1: "rgb(255,240,245)",
  LavenderBlush2: "rgb(238,224,229)",
  LavenderBlush3: "rgb(205,193,197)",
  LavenderBlush4: "rgb(139,131,134)",
  MistyRose1: "rgb(255,228,225)",
  MistyRose2: "rgb(238,213,210)",
  MistyRose3: "rgb(205,183,181)",
  MistyRose4: "rgb(139,125,123)",
  azure1: "rgb(240,255,255)",
  azure2: "rgb(224,238,238)",
  azure3: "rgb(193,205,205)",
  azure4: "rgb(131,139,139)",
  SlateBlue1: "rgb(131,111,255)",
  SlateBlue2: "rgb(122,103,238)",
  SlateBlue3: "rgb(105,89,205)",
  SlateBlue4: "rgb(71,60,139)",
  RoyalBlue1: "rgb(72,118,255)",
  RoyalBlue2: "rgb(67,110,238)",
  RoyalBlue3: "rgb(58,95,205)",
  RoyalBlue4: "rgb(39,64,139)",
  blue1: "rgb(0,0,255)",
  blue2: "rgb(0,0,238)",
  blue3: "rgb(0,0,205)",
  blue4: "rgb(0,0,139)",
  DodgerBlue1: "rgb(30,144,255)",
  DodgerBlue2: "rgb(28,134,238)",
  DodgerBlue3: "rgb(24,116,205)",
  DodgerBlue4: "rgb(16,78,139)",
  SteelBlue1: "rgb(99,184,255)",
  SteelBlue2: "rgb(92,172,238)",
  SteelBlue3: "rgb(79,148,205)",
  SteelBlue4: "rgb(54,100,139)",
  DeepSkyBlue1: "rgb(0,191,255)",
  DeepSkyBlue2: "rgb(0,178,238)",
  DeepSkyBlue3: "rgb(0,154,205)",
  DeepSkyBlue4: "rgb(0,104,139)",
  SkyBlue1: "rgb(135,206,255)",
  SkyBlue2: "rgb(126,192,238)",
  SkyBlue3: "rgb(108,166,205)",
  SkyBlue4: "rgb(74,112,139)",
  LightSkyBlue1: "rgb(176,226,255)",
  LightSkyBlue2: "rgb(164,211,238)",
  LightSkyBlue3: "rgb(141,182,205)",
  LightSkyBlue4: "rgb(96,123,139)",
  SlateGray1: "rgb(198,226,255)",
  SlateGray2: "rgb(185,211,238)",
  SlateGray3: "rgb(159,182,205)",
  SlateGray4: "rgb(108,123,139)",
  LightSteelBlue1: "rgb(202,225,255)",
  LightSteelBlue2: "rgb(188,210,238)",
  LightSteelBlue3: "rgb(162,181,205)",
  LightSteelBlue4: "rgb(110,123,139)",
  LightBlue1: "rgb(191,239,255)",
  LightBlue2: "rgb(178,223,238)",
  LightBlue3: "rgb(154,192,205)",
  LightBlue4: "rgb(104,131,139)",
  LightCyan1: "rgb(224,255,255)",
  LightCyan2: "rgb(209,238,238)",
  LightCyan3: "rgb(180,205,205)",
  LightCyan4: "rgb(122,139,139)",
  PaleTurquoise1: "rgb(187,255,255)",
  PaleTurquoise2: "rgb(174,238,238)",
  PaleTurquoise3: "rgb(150,205,205)",
  PaleTurquoise4: "rgb(102,139,139)",
  CadetBlue1: "rgb(152,245,255)",
  CadetBlue2: "rgb(142,229,238)",
  CadetBlue3: "rgb(122,197,205)",
  CadetBlue4: "rgb(83,134,139)",
  turquoise1: "rgb(0,245,255)",
  turquoise2: "rgb(0,229,238)",
  turquoise3: "rgb(0,197,205)",
  turquoise4: "rgb(0,134,139)",
  cyan1: "rgb(0,255,255)",
  cyan2: "rgb(0,238,238)",
  cyan3: "rgb(0,205,205)",
  cyan4: "rgb(0,139,139)",
  DarkSlateGray1: "rgb(151,255,255)",
  DarkSlateGray2: "rgb(141,238,238)",
  DarkSlateGray3: "rgb(121,205,205)",
  DarkSlateGray4: "rgb(82,139,139)",
  aquamarine1: "rgb(127,255,212)",
  aquamarine2: "rgb(118,238,198)",
  aquamarine3: "rgb(102,205,170)",
  aquamarine4: "rgb(69,139,116)",
  DarkSeaGreen1: "rgb(193,255,193)",
  DarkSeaGreen2: "rgb(180,238,180)",
  DarkSeaGreen3: "rgb(155,205,155)",
  DarkSeaGreen4: "rgb(105,139,105)",
  SeaGreen1: "rgb(84,255,159)",
  SeaGreen2: "rgb(78,238,148)",
  SeaGreen3: "rgb(67,205,128)",
  SeaGreen4: "rgb(46,139,87)",
  PaleGreen1: "rgb(154,255,154)",
  PaleGreen2: "rgb(144,238,144)",
  PaleGreen3: "rgb(124,205,124)",
  PaleGreen4: "rgb(84,139,84)",
  SpringGreen1: "rgb(0,255,127)",
  SpringGreen2: "rgb(0,238,118)",
  SpringGreen3: "rgb(0,205,102)",
  SpringGreen4: "rgb(0,139,69)",
  green1: "rgb(0,255,0)",
  green2: "rgb(0,238,0)",
  green3: "rgb(0,205,0)",
  green4: "rgb(0,139,0)",
  chartreuse1: "rgb(127,255,0)",
  chartreuse2: "rgb(118,238,0)",
  chartreuse3: "rgb(102,205,0)",
  chartreuse4: "rgb(69,139,0)",
  OliveDrab1: "rgb(192,255,62)",
  OliveDrab2: "rgb(179,238,58)",
  OliveDrab3: "rgb(154,205,50)",
  OliveDrab4: "rgb(105,139,34)",
  DarkOliveGreen1: "rgb(202,255,112)",
  DarkOliveGreen2: "rgb(188,238,104)",
  DarkOliveGreen3: "rgb(162,205,90)",
  DarkOliveGreen4: "rgb(110,139,61)",
  khaki1: "rgb(255,246,143)",
  khaki2: "rgb(238,230,133)",
  khaki3: "rgb(205,198,115)",
  khaki4: "rgb(139,134,78)",
  LightGoldenrod1: "rgb(255,236,139)",
  LightGoldenrod2: "rgb(238,220,130)",
  LightGoldenrod3: "rgb(205,190,112)",
  LightGoldenrod4: "rgb(139,129,76)",
  LightYellow1: "rgb(255,255,224)",
  LightYellow2: "rgb(238,238,209)",
  LightYellow3: "rgb(205,205,180)",
  LightYellow4: "rgb(139,139,122)",
  yellow1: "rgb(255,255,0)",
  yellow2: "rgb(238,238,0)",
  yellow3: "rgb(205,205,0)",
  yellow4: "rgb(139,139,0)",
  gold1: "rgb(255,215,0)",
  gold2: "rgb(238,201,0)",
  gold3: "rgb(205,173,0)",
  gold4: "rgb(139,117,0)",
  goldenrod1: "rgb(255,193,37)",
  goldenrod2: "rgb(238,180,34)",
  goldenrod3: "rgb(205,155,29)",
  goldenrod4: "rgb(139,105,20)",
  DarkGoldenrod1: "rgb(255,185,15)",
  DarkGoldenrod2: "rgb(238,173,14)",
  DarkGoldenrod3: "rgb(205,149,12)",
  DarkGoldenrod4: "rgb(139,101,8)",
  RosyBrown1: "rgb(255,193,193)",
  RosyBrown2: "rgb(238,180,180)",
  RosyBrown3: "rgb(205,155,155)",
  RosyBrown4: "rgb(139,105,105)",
  IndianRed1: "rgb(255,106,106)",
  IndianRed2: "rgb(238,99,99)",
  IndianRed3: "rgb(205,85,85)",
  IndianRed4: "rgb(139,58,58)",
  sienna1: "rgb(255,130,71)",
  sienna2: "rgb(238,121,66)",
  sienna3: "rgb(205,104,57)",
  sienna4: "rgb(139,71,38)",
  burlywood1: "rgb(255,211,155)",
  burlywood2: "rgb(238,197,145)",
  burlywood3: "rgb(205,170,125)",
  burlywood4: "rgb(139,115,85)",
  wheat1: "rgb(255,231,186)",
  wheat2: "rgb(238,216,174)",
  wheat3: "rgb(205,186,150)",
  wheat4: "rgb(139,126,102)",
  tan1: "rgb(255,165,79)",
  tan2: "rgb(238,154,73)",
  tan3: "rgb(205,133,63)",
  tan4: "rgb(139,90,43)",
  chocolate1: "rgb(255,127,36)",
  chocolate2: "rgb(238,118,33)",
  chocolate3: "rgb(205,102,29)",
  chocolate4: "rgb(139,69,19)",
  firebrick1: "rgb(255,48,48)",
  firebrick2: "rgb(238,44,44)",
  firebrick3: "rgb(205,38,38)",
  firebrick4: "rgb(139,26,26)",
  brown1: "rgb(255,64,64)",
  brown2: "rgb(238,59,59)",
  brown3: "rgb(205,51,51)",
  brown4: "rgb(139,35,35)",
  salmon1: "rgb(255,140,105)",
  salmon2: "rgb(238,130,98)",
  salmon3: "rgb(205,112,84)",
  salmon4: "rgb(139,76,57)",
  LightSalmon1: "rgb(255,160,122)",
  LightSalmon2: "rgb(238,149,114)",
  LightSalmon3: "rgb(205,129,98)",
  LightSalmon4: "rgb(139,87,66)",
  orange1: "rgb(255,165,0)",
  orange2: "rgb(238,154,0)",
  orange3: "rgb(205,133,0)",
  orange4: "rgb(139,90,0)",
  DarkOrange1: "rgb(255,127,0)",
  DarkOrange2: "rgb(238,118,0)",
  DarkOrange3: "rgb(205,102,0)",
  DarkOrange4: "rgb(139,69,0)",
  coral1: "rgb(255,114,86)",
  coral2: "rgb(238,106,80)",
  coral3: "rgb(205,91,69)",
  coral4: "rgb(139,62,47)",
  tomato1: "rgb(255,99,71)",
  tomato2: "rgb(238,92,66)",
  tomato3: "rgb(205,79,57)",
  tomato4: "rgb(139,54,38)",
  OrangeRed1: "rgb(255,69,0)",
  OrangeRed2: "rgb(238,64,0)",
  OrangeRed3: "rgb(205,55,0)",
  OrangeRed4: "rgb(139,37,0)",
  red1: "rgb(255,0,0)",
  red2: "rgb(238,0,0)",
  red3: "rgb(205,0,0)",
  red4: "rgb(139,0,0)",
  DebianRed: "rgb(215,7,81)",
  DeepPink1: "rgb(255,20,147)",
  DeepPink2: "rgb(238,18,137)",
  DeepPink3: "rgb(205,16,118)",
  DeepPink4: "rgb(139,10,80)",
  HotPink1: "rgb(255,110,180)",
  HotPink2: "rgb(238,106,167)",
  HotPink3: "rgb(205,96,144)",
  HotPink4: "rgb(139,58,98)",
  pink1: "rgb(255,181,197)",
  pink2: "rgb(238,169,184)",
  pink3: "rgb(205,145,158)",
  pink4: "rgb(139,99,108)",
  LightPink1: "rgb(255,174,185)",
  LightPink2: "rgb(238,162,173)",
  LightPink3: "rgb(205,140,149)",
  LightPink4: "rgb(139,95,101)",
  PaleVioletRed1: "rgb(255,130,171)",
  PaleVioletRed2: "rgb(238,121,159)",
  PaleVioletRed3: "rgb(205,104,137)",
  PaleVioletRed4: "rgb(139,71,93)",
  maroon1: "rgb(255,52,179)",
  maroon2: "rgb(238,48,167)",
  maroon3: "rgb(205,41,144)",
  maroon4: "rgb(139,28,98)",
  VioletRed1: "rgb(255,62,150)",
  VioletRed2: "rgb(238,58,140)",
  VioletRed3: "rgb(205,50,120)",
  VioletRed4: "rgb(139,34,82)",
  magenta1: "rgb(255,0,255)",
  magenta2: "rgb(238,0,238)",
  magenta3: "rgb(205,0,205)",
  magenta4: "rgb(139,0,139)",
  orchid1: "rgb(255,131,250)",
  orchid2: "rgb(238,122,233)",
  orchid3: "rgb(205,105,201)",
  orchid4: "rgb(139,71,137)",
  plum1: "rgb(255,187,255)",
  plum2: "rgb(238,174,238)",
  plum3: "rgb(205,150,205)",
  plum4: "rgb(139,102,139)",
  MediumOrchid1: "rgb(224,102,255)",
  MediumOrchid2: "rgb(209,95,238)",
  MediumOrchid3: "rgb(180,82,205)",
  MediumOrchid4: "rgb(122,55,139)",
  DarkOrchid1: "rgb(191,62,255)",
  DarkOrchid2: "rgb(178,58,238)",
  DarkOrchid3: "rgb(154,50,205)",
  DarkOrchid4: "rgb(104,34,139)",
  purple1: "rgb(155,48,255)",
  purple2: "rgb(145,44,238)",
  purple3: "rgb(125,38,205)",
  purple4: "rgb(85,26,139)",
  MediumPurple1: "rgb(171,130,255)",
  MediumPurple2: "rgb(159,121,238)",
  MediumPurple3: "rgb(137,104,205)",
  MediumPurple4: "rgb(93,71,139)",
  thistle1: "rgb(255,225,255)",
  thistle2: "rgb(238,210,238)",
  thistle3: "rgb(205,181,205)",
  thistle4: "rgb(139,123,139)",
  gray0: "rgb(0,0,0)",
  grey0: "rgb(0,0,0)",
  gray1: "rgb(3,3,3)",
  grey1: "rgb(3,3,3)",
  gray2: "rgb(5,5,5)",
  grey2: "rgb(5,5,5)",
  gray3: "rgb(8,8,8)",
  grey3: "rgb(8,8,8)",
  gray4: "rgb(10,10,10)",
  grey4: "rgb(10,10,10)",
  gray5: "rgb(13,13,13)",
  grey5: "rgb(13,13,13)",
  gray6: "rgb(15,15,15)",
  grey6: "rgb(15,15,15)",
  gray7: "rgb(18,18,18)",
  grey7: "rgb(18,18,18)",
  gray8: "rgb(20,20,20)",
  grey8: "rgb(20,20,20)",
  gray9: "rgb(23,23,23)",
  grey9: "rgb(23,23,23)",
  gray10: "rgb(26,26,26)",
  grey10: "rgb(26,26,26)",
  gray11: "rgb(28,28,28)",
  grey11: "rgb(28,28,28)",
  gray12: "rgb(31,31,31)",
  grey12: "rgb(31,31,31)",
  gray13: "rgb(33,33,33)",
  grey13: "rgb(33,33,33)",
  gray14: "rgb(36,36,36)",
  grey14: "rgb(36,36,36)",
  gray15: "rgb(38,38,38)",
  grey15: "rgb(38,38,38)",
  gray16: "rgb(41,41,41)",
  grey16: "rgb(41,41,41)",
  gray17: "rgb(43,43,43)",
  grey17: "rgb(43,43,43)",
  gray18: "rgb(46,46,46)",
  grey18: "rgb(46,46,46)",
  gray19: "rgb(48,48,48)",
  grey19: "rgb(48,48,48)",
  gray20: "rgb(51,51,51)",
  grey20: "rgb(51,51,51)",
  gray21: "rgb(54,54,54)",
  grey21: "rgb(54,54,54)",
  gray22: "rgb(56,56,56)",
  grey22: "rgb(56,56,56)",
  gray23: "rgb(59,59,59)",
  grey23: "rgb(59,59,59)",
  gray24: "rgb(61,61,61)",
  grey24: "rgb(61,61,61)",
  gray25: "rgb(64,64,64)",
  grey25: "rgb(64,64,64)",
  gray26: "rgb(66,66,66)",
  grey26: "rgb(66,66,66)",
  gray27: "rgb(69,69,69)",
  grey27: "rgb(69,69,69)",
  gray28: "rgb(71,71,71)",
  grey28: "rgb(71,71,71)",
  gray29: "rgb(74,74,74)",
  grey29: "rgb(74,74,74)",
  gray30: "rgb(77,77,77)",
  grey30: "rgb(77,77,77)",
  gray31: "rgb(79,79,79)",
  grey31: "rgb(79,79,79)",
  gray32: "rgb(82,82,82)",
  grey32: "rgb(82,82,82)",
  gray33: "rgb(84,84,84)",
  grey33: "rgb(84,84,84)",
  gray34: "rgb(87,87,87)",
  grey34: "rgb(87,87,87)",
  gray35: "rgb(89,89,89)",
  grey35: "rgb(89,89,89)",
  gray36: "rgb(92,92,92)",
  grey36: "rgb(92,92,92)",
  gray37: "rgb(94,94,94)",
  grey37: "rgb(94,94,94)",
  gray38: "rgb(97,97,97)",
  grey38: "rgb(97,97,97)",
  gray39: "rgb(99,99,99)",
  grey39: "rgb(99,99,99)",
  gray40: "rgb(102,102,102)",
  grey40: "rgb(102,102,102)",
  gray41: "rgb(105,105,105)",
  grey41: "rgb(105,105,105)",
  gray42: "rgb(107,107,107)",
  grey42: "rgb(107,107,107)",
  gray43: "rgb(110,110,110)",
  grey43: "rgb(110,110,110)",
  gray44: "rgb(112,112,112)",
  grey44: "rgb(112,112,112)",
  gray45: "rgb(115,115,115)",
  grey45: "rgb(115,115,115)",
  gray46: "rgb(117,117,117)",
  grey46: "rgb(117,117,117)",
  gray47: "rgb(120,120,120)",
  grey47: "rgb(120,120,120)",
  gray48: "rgb(122,122,122)",
  grey48: "rgb(122,122,122)",
  gray49: "rgb(125,125,125)",
  grey49: "rgb(125,125,125)",
  gray50: "rgb(127,127,127)",
  grey50: "rgb(127,127,127)",
  gray51: "rgb(130,130,130)",
  grey51: "rgb(130,130,130)",
  gray52: "rgb(133,133,133)",
  grey52: "rgb(133,133,133)",
  gray53: "rgb(135,135,135)",
  grey53: "rgb(135,135,135)",
  gray54: "rgb(138,138,138)",
  grey54: "rgb(138,138,138)",
  gray55: "rgb(140,140,140)",
  grey55: "rgb(140,140,140)",
  gray56: "rgb(143,143,143)",
  grey56: "rgb(143,143,143)",
  gray57: "rgb(145,145,145)",
  grey57: "rgb(145,145,145)",
  gray58: "rgb(148,148,148)",
  grey58: "rgb(148,148,148)",
  gray59: "rgb(150,150,150)",
  grey59: "rgb(150,150,150)",
  gray60: "rgb(153,153,153)",
  grey60: "rgb(153,153,153)",
  gray61: "rgb(156,156,156)",
  grey61: "rgb(156,156,156)",
  gray62: "rgb(158,158,158)",
  grey62: "rgb(158,158,158)",
  gray63: "rgb(161,161,161)",
  grey63: "rgb(161,161,161)",
  gray64: "rgb(163,163,163)",
  grey64: "rgb(163,163,163)",
  gray65: "rgb(166,166,166)",
  grey65: "rgb(166,166,166)",
  gray66: "rgb(168,168,168)",
  grey66: "rgb(168,168,168)",
  gray67: "rgb(171,171,171)",
  grey67: "rgb(171,171,171)",
  gray68: "rgb(173,173,173)",
  grey68: "rgb(173,173,173)",
  gray69: "rgb(176,176,176)",
  grey69: "rgb(176,176,176)",
  gray70: "rgb(179,179,179)",
  grey70: "rgb(179,179,179)",
  gray71: "rgb(181,181,181)",
  grey71: "rgb(181,181,181)",
  gray72: "rgb(184,184,184)",
  grey72: "rgb(184,184,184)",
  gray73: "rgb(186,186,186)",
  grey73: "rgb(186,186,186)",
  gray74: "rgb(189,189,189)",
  grey74: "rgb(189,189,189)",
  gray75: "rgb(191,191,191)",
  grey75: "rgb(191,191,191)",
  gray76: "rgb(194,194,194)",
  grey76: "rgb(194,194,194)",
  gray77: "rgb(196,196,196)",
  grey77: "rgb(196,196,196)",
  gray78: "rgb(199,199,199)",
  grey78: "rgb(199,199,199)",
  gray79: "rgb(201,201,201)",
  grey79: "rgb(201,201,201)",
  gray80: "rgb(204,204,204)",
  grey80: "rgb(204,204,204)",
  gray81: "rgb(207,207,207)",
  grey81: "rgb(207,207,207)",
  gray82: "rgb(209,209,209)",
  grey82: "rgb(209,209,209)",
  gray83: "rgb(212,212,212)",
  grey83: "rgb(212,212,212)",
  gray84: "rgb(214,214,214)",
  grey84: "rgb(214,214,214)",
  gray85: "rgb(217,217,217)",
  grey85: "rgb(217,217,217)",
  gray86: "rgb(219,219,219)",
  grey86: "rgb(219,219,219)",
  gray87: "rgb(222,222,222)",
  grey87: "rgb(222,222,222)",
  gray88: "rgb(224,224,224)",
  grey88: "rgb(224,224,224)",
  gray89: "rgb(227,227,227)",
  grey89: "rgb(227,227,227)",
  gray90: "rgb(229,229,229)",
  grey90: "rgb(229,229,229)",
  gray91: "rgb(232,232,232)",
  grey91: "rgb(232,232,232)",
  gray92: "rgb(235,235,235)",
  grey92: "rgb(235,235,235)",
  gray93: "rgb(237,237,237)",
  grey93: "rgb(237,237,237)",
  gray94: "rgb(240,240,240)",
  grey94: "rgb(240,240,240)",
  gray95: "rgb(242,242,242)",
  grey95: "rgb(242,242,242)",
  gray96: "rgb(245,245,245)",
  grey96: "rgb(245,245,245)",
  gray97: "rgb(247,247,247)",
  grey97: "rgb(247,247,247)",
  gray98: "rgb(250,250,250)",
  grey98: "rgb(250,250,250)",
  gray99: "rgb(252,252,252)",
  grey99: "rgb(252,252,252)",
  gray100: "rgb(255,255,255)",
  grey100: "rgb(255,255,255)",
  dark: "rgb(169,169,169)",
  DarkGrey: "rgb(169,169,169)",
  dark: "rgb(169,169,169)",
  DarkGray: "rgb(169,169,169)",
  dark: "rgb(0,0,139)",
  DarkBlue: "rgb(0,0,139)",
  dark: "rgb(0,139,139)",
  DarkCyan: "rgb(0,139,139)",
  dark: "rgb(139,0,139)",
  DarkMagenta: "rgb(139,0,139)",
  dark: "rgb(139,0,0)",
  DarkRed: "rgb(139,0,0)",
  light: "rgb(144,238,144)",
  LightGreen: "rgb(144,238,144)"
};
