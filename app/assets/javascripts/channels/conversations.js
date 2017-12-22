// App.conversations = App.cable.subscriptions.create('ConversationsChannel', {  
//   received: function(data) {
//     $("#conversations").removeClass('hidden')
//     return $('#conversations').append(this.renderMessage(data));
//   },

//   renderMessage: function(data) {
//     return "<p> <b>" + data.user + ": </b>" + data.message + "</p>";
//   }
// });

// window.conversation_id

App.conversations = App.cable.subscriptions.create( { channel: 'ConversationsChannel', conversation_id: conversation_id }, {  
  received: function(data) {
    $("#conversations").removeClass('hidden')
    return $('#conversations').append(this.renderMessage(data));
  },

  renderMessage: function(data) {
    return "<p> <b>" + data.user + ": </b>" + data.message + "</p>";
  }
});