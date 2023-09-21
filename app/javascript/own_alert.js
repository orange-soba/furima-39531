function own_alert() {
  const flashCheck = document.getElementById('flash-check');
  if (flashCheck) {
    const alertSentence = flashCheck.innerHTML;
    alert(alertSentence);
  };
};

window.addEventListener('turbo:load', own_alert);