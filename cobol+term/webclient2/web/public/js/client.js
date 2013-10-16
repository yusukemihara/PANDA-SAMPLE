var client = {
  window_stack: [],
  update: function(json) {
    client.json = json;
    var w = monsia[json.window];
    if (!w) {
      alert("window not found:"+json.window);
      return;
    }
    w.initialize($("#monsia_main"));
    $.each(client.window_stack,function(i,v){
      monsia[v].hide();
    });
    w.deserialize(json.widget_data);
    var showWindow = true;
console.log(json.window_stack);
    $.each(json.window_stack,function(i,v){
console.log(v);
console.log(monsia[v].isWindow);
      if (monsia[v].isWindow) {
        if (showWindow) {
          monsia[v].show();
          showWindow = false;
        } 
      } else {
        monsia[v].show();
      }
    });
    client.window_stack = json.window_stack;
  },
  send_event: function(_widget,_event) {
    var json = client.json;
    var w = monsia[json.window];
    if (!w) {
      alert("window not found:"+json.window);
      return;
    }
    var path = _widget.split("__");
    json.widget = path[path.length-1];
    json.event = _event;
    json.widget_data = w.serialize(json.widget_data);

    $.post("/main",JSON.stringify(json),function(data,st) {
      if (st == "success") {
        client.update(data);
      } else {
        alert("error:"+st);
      }
    },"json");
  },
  exit: function() {
    $.get("/logout");
    location.href = "/logout";
    return location
  }
};

$(function() {
  $.get("/screendata.json",function(json) {
    client.update(json);
  },'json');
});
