var monsia = {
window1: {
initialized: false,
widgets: {},
widgetData: {},
initialize: function(body) {
if (this.initialized) {
return;
}
this.initialized = true;
var window1__fixed1__pandaentry1 = $("<input id='window1__fixed1__pandaentry1'>")
.appendTo($(body))
.GtkPandaEntry()
.GtkPandaEntry("option",{
height: 31,
width: 300,
text: "",
activate:           function(name) {
client.send_event(name,"");
}
,
xim_enabled: true,
input_mode: "XIM",
__terminator: ""
})
;
this.widgets["window1__fixed1__pandaentry1"] = window1__fixed1__pandaentry1;
var window1__fixed1__label1 = $("<p id='window1__fixed1__label1'>")
.appendTo($(body))
.GtkLabel()
.GtkLabel("option",{
label: "label",
height: 30,
width: 299,
__terminator: ""
})
;
this.widgets["window1__fixed1__label1"] = window1__fixed1__label1;
var window1__fixed1__button1 = $("<button id='window1__fixed1__button1'>")
.appendTo($(body))
.GtkButton()
.GtkButton("option",{
label: "to window2",
height: 38,
width: 125,
clicked:             function(name) {
client.send_event(name,"");
}
,
__terminator: ""
})
;
this.widgets["window1__fixed1__button1"] = window1__fixed1__button1;
var window1__fixed1__button2 = $("<button id='window1__fixed1__button2'>")
.appendTo($(body))
.GtkButton()
.GtkButton("option",{
label: "exit",
height: 34,
width: 144,
clicked:             function(name) {
client.exit();
}
,
__terminator: ""
})
;
this.widgets["window1__fixed1__button2"] = window1__fixed1__button2;
var window1__fixed1__button3 = $("<button id='window1__fixed1__button3'>")
.appendTo($(body))
.GtkButton()
.GtkButton("option",{
label: "reload",
height: 37,
width: 136,
clicked:             function(name) {
client.send_event(name,"");
}
,
__terminator: ""
})
;
this.widgets["window1__fixed1__button3"] = window1__fixed1__button3;
var window1__fixed1 = $("<div id='window1__fixed1'>")
.appendTo($(body))
.GtkFixed()
.GtkFixed("option",{
__terminator: ""
})
.GtkFixed("put",15,47,window1__fixed1__pandaentry1)
.GtkFixed("put",17,13,window1__fixed1__label1)
.GtkFixed("put",16,94,window1__fixed1__button1)
.GtkFixed("put",298,218,window1__fixed1__button2)
.GtkFixed("put",154,93,window1__fixed1__button3)
;
this.widgets["window1__fixed1"] = window1__fixed1;
var window1 = $("<div id='window1'>")
.GtkWindow()
.GtkWindow("option",{
modal: false,
title: "",
__terminator: ""
})
.GtkWindow("put",window1__fixed1)
;
this.widgets["window1"] = window1;
this.isWindow = true;
},
show: function() {
$("#window1").GtkWindow("open");
},
hide: function() {
$("#window1").GtkWindow("close");
},
deserialize: function(data) {
var w = this;
this.screenData = data;
$.each(this.widgets,function(k,v) {
var d = data;
var path = k.split("__");
$.each(path,function(kk,vv) {
if (!d) {
return;
}
if (d[vv]) {
d = d[vv];
} else {
d = undefined;
}
});
if (d) {
w.widgetData[k] = d;
v[v.attr("klass")]("deserialize",d);
}
});
},
serialize: function() {
var w = this;
$.each(this.widgets,function(k,v) {
if (w.widgetData[k]) {
v[v.attr("klass")]("serialize",w.widgetData[k]);
}
});
return(this.screenData);
}
},
window2: {
initialized: false,
widgets: {},
widgetData: {},
initialize: function(body) {
if (this.initialized) {
return;
}
this.initialized = true;
var window2__fixed1__pandaentry1 = $("<input id='window2__fixed1__pandaentry1'>")
.appendTo($(body))
.GtkPandaEntry()
.GtkPandaEntry("option",{
height: 31,
width: 300,
text: "",
activate:           function(name) {
client.send_event(name,"");
}
,
xim_enabled: true,
input_mode: "XIM",
__terminator: ""
})
;
this.widgets["window2__fixed1__pandaentry1"] = window2__fixed1__pandaentry1;
var window2__fixed1__label1 = $("<p id='window2__fixed1__label1'>")
.appendTo($(body))
.GtkLabel()
.GtkLabel("option",{
label: "label",
height: 30,
width: 299,
__terminator: ""
})
;
this.widgets["window2__fixed1__label1"] = window2__fixed1__label1;
var window2__fixed1__button1 = $("<button id='window2__fixed1__button1'>")
.appendTo($(body))
.GtkButton()
.GtkButton("option",{
label: "button",
height: 38,
width: 125,
clicked:             function(name) {
client.send_event(name,"");
}
,
__terminator: ""
})
;
this.widgets["window2__fixed1__button1"] = window2__fixed1__button1;
var window2__fixed1__button2 = $("<button id='window2__fixed1__button2'>")
.appendTo($(body))
.GtkButton()
.GtkButton("option",{
label: "exit",
height: 34,
width: 144,
clicked:             function(name) {
client.exit();
}
,
__terminator: ""
})
;
this.widgets["window2__fixed1__button2"] = window2__fixed1__button2;
var window2__fixed1 = $("<div id='window2__fixed1'>")
.appendTo($(body))
.GtkFixed()
.GtkFixed("option",{
__terminator: ""
})
.GtkFixed("put",15,47,window2__fixed1__pandaentry1)
.GtkFixed("put",17,13,window2__fixed1__label1)
.GtkFixed("put",17,85,window2__fixed1__button1)
.GtkFixed("put",174,199,window2__fixed1__button2)
;
this.widgets["window2__fixed1"] = window2__fixed1;
var window2 = $("<div id='window2'>")
.GtkWindow()
.GtkWindow("option",{
modal: false,
title: "",
__terminator: ""
})
.GtkWindow("put",window2__fixed1)
;
this.widgets["window2"] = window2;
this.isWindow = true;
},
show: function() {
$("#window2").GtkWindow("open");
},
hide: function() {
$("#window2").GtkWindow("close");
},
deserialize: function(data) {
var w = this;
this.screenData = data;
$.each(this.widgets,function(k,v) {
var d = data;
var path = k.split("__");
$.each(path,function(kk,vv) {
if (!d) {
return;
}
if (d[vv]) {
d = d[vv];
} else {
d = undefined;
}
});
if (d) {
w.widgetData[k] = d;
v[v.attr("klass")]("deserialize",d);
}
});
},
serialize: function() {
var w = this;
$.each(this.widgets,function(k,v) {
if (w.widgetData[k]) {
v[v.attr("klass")]("serialize",w.widgetData[k]);
}
});
return(this.screenData);
}
},
__terminator: ""
};
