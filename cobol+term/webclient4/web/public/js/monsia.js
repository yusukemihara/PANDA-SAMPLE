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
var window1__fixed1__button2 = $("<button id='window1__fixed1__button2'>")
//.appendTo($(body))
.GtkButton()
.GtkButton("option",{
width: 100,
height: 80,
clicked:             function(name) {
client.send_event(name,"");
}
,
label: "button",
__terminator: ""
})
;
this.widgets["window1__fixed1__button2"] = window1__fixed1__button2;
var window1__fixed1__button3 = $("<button id='window1__fixed1__button3'>")
//.appendTo($(body))
.GtkButton()
.GtkButton("option",{
width: 100,
height: 80,
clicked:             function(name) {
client.send_event(name,"");
}
,
label: "entry",
__terminator: ""
})
;
this.widgets["window1__fixed1__button3"] = window1__fixed1__button3;
var window1__fixed1__button4 = $("<button id='window1__fixed1__button4'>")
//.appendTo($(body))
.GtkButton()
.GtkButton("option",{
width: 100,
height: 80,
clicked:             function(name) {
client.send_event(name,"");
}
,
label: "combo",
__terminator: ""
})
;
this.widgets["window1__fixed1__button4"] = window1__fixed1__button4;
var window1__fixed1__button5 = $("<button id='window1__fixed1__button5'>")
//.appendTo($(body))
.GtkButton()
.GtkButton("option",{
width: 100,
height: 80,
clicked:             function(name) {
client.send_event(name,"");
}
,
label: "clist",
__terminator: ""
})
;
this.widgets["window1__fixed1__button5"] = window1__fixed1__button5;
var window1__fixed1__button6 = $("<button id='window1__fixed1__button6'>")
//.appendTo($(body))
.GtkButton()
.GtkButton("option",{
width: 100,
height: 80,
clicked:             function(name) {
client.send_event(name,"");
}
,
label: "table",
__terminator: ""
})
;
this.widgets["window1__fixed1__button6"] = window1__fixed1__button6;
var window1__fixed1__button1 = $("<button id='window1__fixed1__button1'>")
//.appendTo($(body))
.GtkButton()
.GtkButton("option",{
width: 100,
height: 80,
clicked:             function(name) {
client.exit();
}
,
label: "exit",
__terminator: ""
})
;
this.widgets["window1__fixed1__button1"] = window1__fixed1__button1;
var window1__fixed1 = $("<div id='window1__fixed1'>")
//.appendTo($(body))
.GtkFixed()
.GtkFixed("option",{
__terminator: ""
})
.GtkFixed("put",
22,23,window1__fixed1__button2
)
.GtkFixed("put",
136,24,window1__fixed1__button3
)
.GtkFixed("put",
248,24,window1__fixed1__button4
)
.GtkFixed("put",
24,112,window1__fixed1__button5
)
.GtkFixed("put",
136,112,window1__fixed1__button6
)
.GtkFixed("put",
408,320,window1__fixed1__button1
)
;
this.widgets["window1__fixed1"] = window1__fixed1;
var window1 = $("<div id='window1'>")
.appendTo($(body))
.GtkWindow()
.GtkWindow("option",{
title: "",
modal: false,
__terminator: ""
})
.GtkWindow("put",window1__fixed1)
;
this.widgets["window1"] = window1;
this.isWindow = true;
this.show();
},
show: function() {
$("#window1").GtkWindow("open");
$.each(this.widgets,function(name,widget) {
if (widget.attr("klass") == "GtkFixed") {
widget.GtkFixed("relocate");
}
});
},
hide: function() {
$("#window1").GtkWindow("close");
},
deserialize: function(data) {
console.log("deserialize");
console.log(data);
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
console.log("d:" + d);
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
console.log("serialize");
console.log(this.screenData);
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
var window2__fixed1__label1 = $("<p id='window2__fixed1__label1'>")
//.appendTo($(body))
.GtkLabel()
.GtkLabel("option",{
width: 299,
height: 30,
label: "label",
__terminator: ""
})
;
this.widgets["window2__fixed1__label1"] = window2__fixed1__label1;
var window2__fixed1__button1 = $("<button id='window2__fixed1__button1'>")
//.appendTo($(body))
.GtkButton()
.GtkButton("option",{
width: 100,
height: 80,
clicked:             function(name) {
client.send_event(name,"");
}
,
label: "back",
__terminator: ""
})
;
this.widgets["window2__fixed1__button1"] = window2__fixed1__button1;
var window2__fixed1__button2 = $("<button id='window2__fixed1__button2'>")
//.appendTo($(body))
.GtkButton()
.GtkButton("option",{
width: 100,
height: 80,
clicked:             function(name) {
client.send_event(name,"");
}
,
label: "button2",
__terminator: ""
})
;
this.widgets["window2__fixed1__button2"] = window2__fixed1__button2;
var window2__fixed1__toggle1 = $("<button id='window2__fixed1__toggle1'>")
//.appendTo($(body))
.GtkToggleButton()
.GtkToggleButton("option",{
width: 100,
height: 80,
clicked:             function(name) {
client.send_event(name,"");
}
,
label: "toggle1",
__terminator: ""
})
;
this.widgets["window2__fixed1__toggle1"] = window2__fixed1__toggle1;
var window2__fixed1__check1 = $("<div id='window2__fixed1__check1'>")
//.appendTo($(body))
.GtkCheckButton()
.GtkCheckButton("option",{
width: 100,
height: 80,
clicked:             function(name) {
client.send_event(name,"");
}
,
label: "check1",
__terminator: ""
})
;
this.widgets["window2__fixed1__check1"] = window2__fixed1__check1;
var window2__fixed1__radio1 = $("<div id='window2__fixed1__radio1'>")
//.appendTo($(body))
.GtkRadioButton()
.GtkRadioButton("option",{
width: 100,
height: 80,
clicked:             function(name) {
client.send_event(name,"");
}
,
group: "radio1",
label: "radio1",
__terminator: ""
})
;
this.widgets["window2__fixed1__radio1"] = window2__fixed1__radio1;
var window2__fixed1__radio2 = $("<div id='window2__fixed1__radio2'>")
//.appendTo($(body))
.GtkRadioButton()
.GtkRadioButton("option",{
width: 100,
height: 80,
clicked:             function(name) {
client.send_event(name,"");
}
,
group: "radio1",
label: "radio2",
__terminator: ""
})
;
this.widgets["window2__fixed1__radio2"] = window2__fixed1__radio2;
var window2__fixed1__radio3 = $("<div id='window2__fixed1__radio3'>")
//.appendTo($(body))
.GtkRadioButton()
.GtkRadioButton("option",{
width: 100,
height: 80,
clicked:             function(name) {
client.send_event(name,"");
}
,
group: "radio1",
label: "radio3",
__terminator: ""
})
;
this.widgets["window2__fixed1__radio3"] = window2__fixed1__radio3;
var window2__fixed1__hseparator1 = $("<div id='window2__fixed1__hseparator1'>")
//.appendTo($(body))
.GtkHSeparator()
.GtkHSeparator("option",{
width: 332,
height: 28,
__terminator: ""
})
;
this.widgets["window2__fixed1__hseparator1"] = window2__fixed1__hseparator1;
var window2__fixed1__radio4 = $("<div id='window2__fixed1__radio4'>")
//.appendTo($(body))
.GtkRadioButton()
.GtkRadioButton("option",{
width: 100,
height: 80,
clicked:             function(name) {
client.send_event(name,"");
}
,
group: "radio4",
label: "radio4",
__terminator: ""
})
;
this.widgets["window2__fixed1__radio4"] = window2__fixed1__radio4;
var window2__fixed1__radio5 = $("<div id='window2__fixed1__radio5'>")
//.appendTo($(body))
.GtkRadioButton()
.GtkRadioButton("option",{
width: 100,
height: 80,
clicked:             function(name) {
client.send_event(name,"");
}
,
group: "radio4",
label: "radio5",
__terminator: ""
})
;
this.widgets["window2__fixed1__radio5"] = window2__fixed1__radio5;
var window2__fixed1__radio6 = $("<div id='window2__fixed1__radio6'>")
//.appendTo($(body))
.GtkRadioButton()
.GtkRadioButton("option",{
width: 100,
height: 80,
clicked:             function(name) {
client.send_event(name,"");
}
,
group: "radio4",
label: "radio6",
__terminator: ""
})
;
this.widgets["window2__fixed1__radio6"] = window2__fixed1__radio6;
var window2__fixed1 = $("<div id='window2__fixed1'>")
//.appendTo($(body))
.GtkFixed()
.GtkFixed("option",{
__terminator: ""
})
.GtkFixed("put",
17,13,window2__fixed1__label1
)
.GtkFixed("put",
20,352,window2__fixed1__button1
)
.GtkFixed("put",
20,60,window2__fixed1__button2
)
.GtkFixed("put",
136,60,window2__fixed1__toggle1
)
.GtkFixed("put",
252,60,window2__fixed1__check1
)
.GtkFixed("put",
24,160,window2__fixed1__radio1
)
.GtkFixed("put",
136,160,window2__fixed1__radio2
)
.GtkFixed("put",
248,160,window2__fixed1__radio3
)
.GtkFixed("put",
24,224,window2__fixed1__hseparator1
)
.GtkFixed("put",
24,244,window2__fixed1__radio4
)
.GtkFixed("put",
136,244,window2__fixed1__radio5
)
.GtkFixed("put",
248,244,window2__fixed1__radio6
)
;
this.widgets["window2__fixed1"] = window2__fixed1;
var window2 = $("<div id='window2'>")
.appendTo($(body))
.GtkWindow()
.GtkWindow("option",{
title: "",
modal: false,
__terminator: ""
})
.GtkWindow("put",window2__fixed1)
;
this.widgets["window2"] = window2;
this.isWindow = true;
this.show();
},
show: function() {
$("#window2").GtkWindow("open");
$.each(this.widgets,function(name,widget) {
if (widget.attr("klass") == "GtkFixed") {
widget.GtkFixed("relocate");
}
});
},
hide: function() {
$("#window2").GtkWindow("close");
},
deserialize: function(data) {
console.log("deserialize");
console.log(data);
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
console.log("d:" + d);
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
console.log("serialize");
console.log(this.screenData);
return(this.screenData);
}
},
window3: {
initialized: false,
widgets: {},
widgetData: {},
initialize: function(body) {
if (this.initialized) {
return;
}
this.initialized = true;
var window3__fixed1__button1 = $("<button id='window3__fixed1__button1'>")
//.appendTo($(body))
.GtkButton()
.GtkButton("option",{
width: 100,
height: 80,
clicked:             function(name) {
client.send_event(name,"");
}
,
label: "back",
__terminator: ""
})
;
this.widgets["window3__fixed1__button1"] = window3__fixed1__button1;
var window3__fixed1__label1 = $("<p id='window3__fixed1__label1'>")
//.appendTo($(body))
.GtkLabel()
.GtkLabel("option",{
width: 400,
height: 32,
label: "label",
__terminator: ""
})
;
this.widgets["window3__fixed1__label1"] = window3__fixed1__label1;
var window3__fixed1__numberentry1 = $("<input id='window3__fixed1__numberentry1'>")
//.appendTo($(body))
.GtkNumberEntry()
.GtkNumberEntry("option",{
width: 208,
format: "-99,999.99",
height: 36,
activate:           function(name) {
client.send_event(name,"");
}
,
editable: true,
__terminator: ""
})
;
this.widgets["window3__fixed1__numberentry1"] = window3__fixed1__numberentry1;
var window3__fixed1__label2 = $("<p id='window3__fixed1__label2'>")
//.appendTo($(body))
.GtkLabel()
.GtkLabel("option",{
width: 404,
height: 36,
label: "label",
__terminator: ""
})
;
this.widgets["window3__fixed1__label2"] = window3__fixed1__label2;
var window3__fixed1__pandaentry1 = $("<input id='window3__fixed1__pandaentry1'>")
//.appendTo($(body))
.GtkPandaEntry()
.GtkPandaEntry("option",{
xim_enabled: true,
width: 208,
input_mode: "XIM",
height: 36,
activate:           function(name) {
client.send_event(name,"");
}
,
text: "",
editable: true,
__terminator: ""
})
;
this.widgets["window3__fixed1__pandaentry1"] = window3__fixed1__pandaentry1;
var window3__fixed1__pandaentry2 = $("<input id='window3__fixed1__pandaentry2'>")
//.appendTo($(body))
.GtkPandaEntry()
.GtkPandaEntry("option",{
xim_enabled: false,
width: 208,
input_mode: "KANA",
height: 36,
activate:           function(name) {
client.send_event(name,"");
}
,
text: "",
editable: true,
__terminator: ""
})
;
this.widgets["window3__fixed1__pandaentry2"] = window3__fixed1__pandaentry2;
var window3__fixed1__pandaentry3 = $("<input id='window3__fixed1__pandaentry3'>")
//.appendTo($(body))
.GtkPandaEntry()
.GtkPandaEntry("option",{
xim_enabled: false,
width: 208,
input_mode: "ASCII",
height: 36,
activate:           function(name) {
client.send_event(name,"");
}
,
text: "",
editable: true,
__terminator: ""
})
;
this.widgets["window3__fixed1__pandaentry3"] = window3__fixed1__pandaentry3;
var window3__fixed1 = $("<div id='window3__fixed1'>")
//.appendTo($(body))
.GtkFixed()
.GtkFixed("option",{
__terminator: ""
})
.GtkFixed("put",
288,112,window3__fixed1__button1
)
.GtkFixed("put",
26,25,window3__fixed1__label1
)
.GtkFixed("put",
24,112,window3__fixed1__numberentry1
)
.GtkFixed("put",
24,60,window3__fixed1__label2
)
.GtkFixed("put",
24,160,window3__fixed1__pandaentry1
)
.GtkFixed("put",
24,204,window3__fixed1__pandaentry2
)
.GtkFixed("put",
24,252,window3__fixed1__pandaentry3
)
;
this.widgets["window3__fixed1"] = window3__fixed1;
var window3 = $("<div id='window3'>")
.appendTo($(body))
.GtkWindow()
.GtkWindow("option",{
title: "",
modal: false,
__terminator: ""
})
.GtkWindow("put",window3__fixed1)
;
this.widgets["window3"] = window3;
this.isWindow = true;
this.show();
},
show: function() {
$("#window3").GtkWindow("open");
$.each(this.widgets,function(name,widget) {
if (widget.attr("klass") == "GtkFixed") {
widget.GtkFixed("relocate");
}
});
},
hide: function() {
$("#window3").GtkWindow("close");
},
deserialize: function(data) {
console.log("deserialize");
console.log(data);
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
console.log("d:" + d);
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
console.log("serialize");
console.log(this.screenData);
return(this.screenData);
}
},
window4: {
initialized: false,
widgets: {},
widgetData: {},
initialize: function(body) {
if (this.initialized) {
return;
}
this.initialized = true;
var window4__fixed1__button1 = $("<button id='window4__fixed1__button1'>")
//.appendTo($(body))
.GtkButton()
.GtkButton("option",{
width: 100,
height: 80,
clicked:             function(name) {
client.send_event(name,"");
}
,
label: "back",
__terminator: ""
})
;
this.widgets["window4__fixed1__button1"] = window4__fixed1__button1;
var window4__fixed1__label1 = $("<p id='window4__fixed1__label1'>")
//.appendTo($(body))
.GtkLabel()
.GtkLabel("option",{
width: 400,
height: 32,
label: "label",
__terminator: ""
})
;
this.widgets["window4__fixed1__label1"] = window4__fixed1__label1;
var window4__fixed1__pandacombo1__pandacombo_entry1 = $("<input id='window4__fixed1__pandacombo1__pandacombo_entry1'>")
//.appendTo($(body))
.GtkPandaEntry()
.GtkPandaEntry("option",{
xim_enabled: false,
input_mode: "XIM",
activate:           function(name) {
client.send_event(name,"");
}
,
text: "",
editable: true,
__terminator: ""
})
;
this.widgets["window4__fixed1__pandacombo1__pandacombo_entry1"] = window4__fixed1__pandacombo1__pandacombo_entry1;
var window4__fixed1__pandacombo1 = $("<div id='window4__fixed1__pandacombo1'>")
//.appendTo($(body))
.GtkPandaCombo()
.GtkPandaCombo("setEntry",window4__fixed1__pandacombo1__pandacombo_entry1)
.GtkPandaCombo("option",{
width: 252,
items: "01 a\n02 i\n03 u\n04 e\n05 o",
height: 68,
__terminator: ""
})
;
this.widgets["window4__fixed1__pandacombo1"] = window4__fixed1__pandacombo1;
var window4__fixed1 = $("<div id='window4__fixed1'>")
//.appendTo($(body))
.GtkFixed()
.GtkFixed("option",{
__terminator: ""
})
.GtkFixed("put",
288,112,window4__fixed1__button1
)
.GtkFixed("put",
26,25,window4__fixed1__label1
)
.GtkFixed("put",
26,72,window4__fixed1__pandacombo1
)
;
this.widgets["window4__fixed1"] = window4__fixed1;
var window4 = $("<div id='window4'>")
.appendTo($(body))
.GtkWindow()
.GtkWindow("option",{
title: "",
modal: false,
__terminator: ""
})
.GtkWindow("put",window4__fixed1)
;
this.widgets["window4"] = window4;
this.isWindow = true;
this.show();
},
show: function() {
$("#window4").GtkWindow("open");
$.each(this.widgets,function(name,widget) {
if (widget.attr("klass") == "GtkFixed") {
widget.GtkFixed("relocate");
}
});
},
hide: function() {
$("#window4").GtkWindow("close");
},
deserialize: function(data) {
console.log("deserialize");
console.log(data);
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
console.log("d:" + d);
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
console.log("serialize");
console.log(this.screenData);
return(this.screenData);
}
},
window5: {
initialized: false,
widgets: {},
widgetData: {},
initialize: function(body) {
if (this.initialized) {
return;
}
this.initialized = true;
var window5__fixed1__button1 = $("<button id='window5__fixed1__button1'>")
//.appendTo($(body))
.GtkButton()
.GtkButton("option",{
width: 100,
height: 80,
clicked:             function(name) {
client.send_event(name,"");
}
,
label: "back",
__terminator: ""
})
;
this.widgets["window5__fixed1__button1"] = window5__fixed1__button1;
var window5__fixed1__label7 = $("<p id='window5__fixed1__label7'>")
//.appendTo($(body))
.GtkLabel()
.GtkLabel("option",{
width: 412,
height: 32,
label: "label",
__terminator: ""
})
;
this.widgets["window5__fixed1__label7"] = window5__fixed1__label7;
var window5__fixed1__scrolledwindow1__pandaclist1__label1 = $("<p id='window5__fixed1__scrolledwindow1__pandaclist1__label1'>")
//.appendTo($(body))
.GtkLabel()
.GtkLabel("option",{
label: "column1",
__terminator: ""
})
;
this.widgets["window5__fixed1__scrolledwindow1__pandaclist1__label1"] = window5__fixed1__scrolledwindow1__pandaclist1__label1;
var window5__fixed1__scrolledwindow1__pandaclist1__label2 = $("<p id='window5__fixed1__scrolledwindow1__pandaclist1__label2'>")
//.appendTo($(body))
.GtkLabel()
.GtkLabel("option",{
label: "column2",
__terminator: ""
})
;
this.widgets["window5__fixed1__scrolledwindow1__pandaclist1__label2"] = window5__fixed1__scrolledwindow1__pandaclist1__label2;
var window5__fixed1__scrolledwindow1__pandaclist1__label3 = $("<p id='window5__fixed1__scrolledwindow1__pandaclist1__label3'>")
//.appendTo($(body))
.GtkLabel()
.GtkLabel("option",{
label: "column3",
__terminator: ""
})
;
this.widgets["window5__fixed1__scrolledwindow1__pandaclist1__label3"] = window5__fixed1__scrolledwindow1__pandaclist1__label3;
var window5__fixed1__scrolledwindow1__pandaclist1 = $("<table id='window5__fixed1__scrolledwindow1__pandaclist1'>")
//.appendTo($(body))
.GtkPandaCList()
.GtkPandaCList("option","ncolumns",3)
.GtkPandaCList("option",{
headers: [window5__fixed1__scrolledwindow1__pandaclist1__label1,window5__fixed1__scrolledwindow1__pandaclist1__label2,window5__fixed1__scrolledwindow1__pandaclist1__label3],
width: 392,
select_row:           function(name) {
client.send_event(name,"");
}
,
height: 180,
show_titles: true,
mode: "single",
__terminator: ""
})
.GtkPandaCList("option","column_widths","100,100,100,100,100,100,100,100,100,100,100,100,100")
;
this.widgets["window5__fixed1__scrolledwindow1__pandaclist1"] = window5__fixed1__scrolledwindow1__pandaclist1;
var window5__fixed1__scrolledwindow1 = $("<div id='window5__fixed1__scrolledwindow1'>")
//.appendTo($(body))
.GtkScrolledWindow()
.GtkScrolledWindow("option",{
width: 392,
height: 196,
__terminator: ""
})
.GtkScrolledWindow("put",window5__fixed1__scrolledwindow1__pandaclist1)
;
this.widgets["window5__fixed1__scrolledwindow1"] = window5__fixed1__scrolledwindow1;
var window5__fixed1__scrolledwindow2__pandaclist2__label4 = $("<p id='window5__fixed1__scrolledwindow2__pandaclist2__label4'>")
//.appendTo($(body))
.GtkLabel()
.GtkLabel("option",{
label: "column1",
__terminator: ""
})
;
this.widgets["window5__fixed1__scrolledwindow2__pandaclist2__label4"] = window5__fixed1__scrolledwindow2__pandaclist2__label4;
var window5__fixed1__scrolledwindow2__pandaclist2__label5 = $("<p id='window5__fixed1__scrolledwindow2__pandaclist2__label5'>")
//.appendTo($(body))
.GtkLabel()
.GtkLabel("option",{
label: "column2",
__terminator: ""
})
;
this.widgets["window5__fixed1__scrolledwindow2__pandaclist2__label5"] = window5__fixed1__scrolledwindow2__pandaclist2__label5;
var window5__fixed1__scrolledwindow2__pandaclist2__label6 = $("<p id='window5__fixed1__scrolledwindow2__pandaclist2__label6'>")
//.appendTo($(body))
.GtkLabel()
.GtkLabel("option",{
label: "column3",
__terminator: ""
})
;
this.widgets["window5__fixed1__scrolledwindow2__pandaclist2__label6"] = window5__fixed1__scrolledwindow2__pandaclist2__label6;
var window5__fixed1__scrolledwindow2__pandaclist2 = $("<table id='window5__fixed1__scrolledwindow2__pandaclist2'>")
//.appendTo($(body))
.GtkPandaCList()
.GtkPandaCList("option","ncolumns",3)
.GtkPandaCList("option",{
headers: [window5__fixed1__scrolledwindow2__pandaclist2__label4,window5__fixed1__scrolledwindow2__pandaclist2__label5,window5__fixed1__scrolledwindow2__pandaclist2__label6],
width: 392,
unselect_row:           function(name) {
client.send_event(name,"");
}
,
select_row:           function(name) {
client.send_event(name,"");
}
,
height: 192,
show_titles: true,
mode: "multi",
__terminator: ""
})
.GtkPandaCList("option","column_widths","100,100,100,100,100,100,100,100,100,100,100,100,100")
;
this.widgets["window5__fixed1__scrolledwindow2__pandaclist2"] = window5__fixed1__scrolledwindow2__pandaclist2;
var window5__fixed1__scrolledwindow2 = $("<div id='window5__fixed1__scrolledwindow2'>")
//.appendTo($(body))
.GtkScrolledWindow()
.GtkScrolledWindow("option",{
width: 392,
height: 188,
__terminator: ""
})
.GtkScrolledWindow("put",window5__fixed1__scrolledwindow2__pandaclist2)
;
this.widgets["window5__fixed1__scrolledwindow2"] = window5__fixed1__scrolledwindow2;
var window5__fixed1 = $("<div id='window5__fixed1'>")
//.appendTo($(body))
.GtkFixed()
.GtkFixed("option",{
__terminator: ""
})
.GtkFixed("put",
420,352,window5__fixed1__button1
)
.GtkFixed("put",
20,12,window5__fixed1__label7
)
.GtkFixed("put",
16,44,window5__fixed1__scrolledwindow1
)
.GtkFixed("put",
16,252,window5__fixed1__scrolledwindow2
)
;
this.widgets["window5__fixed1"] = window5__fixed1;
var window5 = $("<div id='window5'>")
.appendTo($(body))
.GtkWindow()
.GtkWindow("option",{
title: "",
modal: false,
__terminator: ""
})
.GtkWindow("put",window5__fixed1)
;
this.widgets["window5"] = window5;
this.isWindow = true;
this.show();
},
show: function() {
$("#window5").GtkWindow("open");
$.each(this.widgets,function(name,widget) {
if (widget.attr("klass") == "GtkFixed") {
widget.GtkFixed("relocate");
}
});
},
hide: function() {
$("#window5").GtkWindow("close");
},
deserialize: function(data) {
console.log("deserialize");
console.log(data);
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
console.log("d:" + d);
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
console.log("serialize");
console.log(this.screenData);
return(this.screenData);
}
},
window6: {
initialized: false,
widgets: {},
widgetData: {},
initialize: function(body) {
if (this.initialized) {
return;
}
this.initialized = true;
var window6__fixed1__button1 = $("<button id='window6__fixed1__button1'>")
//.appendTo($(body))
.GtkButton()
.GtkButton("option",{
width: 100,
height: 80,
clicked:             function(name) {
client.send_event(name,"");
}
,
label: "back",
__terminator: ""
})
;
this.widgets["window6__fixed1__button1"] = window6__fixed1__button1;
var window6__fixed1__scrolledwindow1__pandatable1 = $("<table id='window6__fixed1__scrolledwindow1__pandatable1'>")
//.appendTo($(body))
.GtkPandaTable()
.GtkPandaTable("option",{ncolumns:3,nrows:50})
.GtkPandaTable("option",{
column_widths: "100,100,100,100,100,100,100,100,100,100",
cell_edited:           function(name) {
client.send_event(name,"");
}
,
types: "label,text,text",
titles: "col1,col2,col3,col4,col5,col6,col7,col8,col9,col10",
__terminator: ""
})
;
this.widgets["window6__fixed1__scrolledwindow1__pandatable1"] = window6__fixed1__scrolledwindow1__pandatable1;
var window6__fixed1__scrolledwindow1 = $("<div id='window6__fixed1__scrolledwindow1'>")
//.appendTo($(body))
.GtkScrolledWindow()
.GtkScrolledWindow("option",{
width: 436,
height: 548,
__terminator: ""
})
.GtkScrolledWindow("put",window6__fixed1__scrolledwindow1__pandatable1)
;
this.widgets["window6__fixed1__scrolledwindow1"] = window6__fixed1__scrolledwindow1;
var window6__fixed1 = $("<div id='window6__fixed1'>")
//.appendTo($(body))
.GtkFixed()
.GtkFixed("option",{
__terminator: ""
})
.GtkFixed("put",
456,488,window6__fixed1__button1
)
.GtkFixed("put",
16,16,window6__fixed1__scrolledwindow1
)
;
this.widgets["window6__fixed1"] = window6__fixed1;
var window6 = $("<div id='window6'>")
.appendTo($(body))
.GtkWindow()
.GtkWindow("option",{
title: "",
modal: false,
__terminator: ""
})
.GtkWindow("put",window6__fixed1)
;
this.widgets["window6"] = window6;
this.isWindow = true;
this.show();
},
show: function() {
$("#window6").GtkWindow("open");
$.each(this.widgets,function(name,widget) {
if (widget.attr("klass") == "GtkFixed") {
widget.GtkFixed("relocate");
}
});
},
hide: function() {
$("#window6").GtkWindow("close");
},
deserialize: function(data) {
console.log("deserialize");
console.log(data);
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
console.log("d:" + d);
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
console.log("serialize");
console.log(this.screenData);
return(this.screenData);
}
},
__terminator: ""
};
