var client = {
  window_stack: [],
  update: function(json) {
    client.json = json;
    var w = monsia[json.window];
    if (!w) {
      alert("window not found:"+json.window);
      return;
    }
    w.initialize($("body"));
    $.each(client.window_stack,function(i,v){
      monsia[v].hide();
    });
    w.deserialize(json.widget_data);
    var showWindow = true;
    $.each(json.window_stack,function(i,v){
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
    json.type = "main";
    client.ws.send(JSON.stringify(json));
  },
  exit: function() {
    location.reload();
  }
};

$(function(){
  ws = new WebSocket("ws://localhost:8080")
  client.ws = ws;

  ws.onclose = function() {
  };

  ws.onopen = function () {
  };

  ws.onmessage = function(msg) {
    console.log(msg);
    var data = $.parseJSON(msg.data);

    switch(data.status) {
    case 205:
      location.reload();
      return;
      break;
    case 403:
      location.reload();
      $("#pws_login_message").text("invalid user or password");
      return;
      break;
    case 500:
      location.reload();
      $("#pws_login_message").text("internal server error");
      return;
      break;
    }

    // login
    if(data.status != 200) {
      return
    }

    $("#pws_login").hide();
    client.update(data);
  };

  $("#pws_login_form").submit(function(e) {
    var data = {type:"login"};
    data.user = $("#pws_login_user").val();
    data.password = $("#pws_login_password").val();
    ws.send(JSON.stringify(data));
    return false;
  });
});
