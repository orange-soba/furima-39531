function scroll_down () {
  const messageContent = document.getElementById('message-content');
  if (!messageContent) return null;

  const messageContentHeight = messageContent.scrollHeight;
  messageContent.scrollTop = messageContentHeight;
};

window.addEventListener('turbo:load', scroll_down);
window.addEventListener('turbo:render', scroll_down);