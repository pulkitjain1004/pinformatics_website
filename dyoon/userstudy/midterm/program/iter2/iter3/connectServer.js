var socket = new WebSocket(webSocketURL);
 
socket.onopen = function() {
  //event handler when the connection has been established
};
 
socket.onmessage = function(message) {
  //event handler when data has been received from the server
};
 
socket.onclose = function() {
 //event handler when the socket has been properly closed
}
 
socket.onerror = function() {
 //event handler when an error has occurred during communication
}
 
//for sending data to the server
socket.send(someTextData);