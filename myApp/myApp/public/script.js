const messageForm = document.querySelector('#message-form');
const messageInput = document.querySelector('#message-input');
const messagesDiv = document.querySelector('#messages');

function loadMessages() {
  fetch('/messages')
    .then(response => response.json())
    .then(data => {
      messagesDiv.innerHTML = '';
      data.forEach(message => {
        const messageDiv = document.createElement('div');
        messageDiv.classList.add('message');
        messageDiv.textContent = message;
        messagesDiv.appendChild(messageDiv);
      });
    });
}

loadMessages();

messageForm.addEventListener('submit', event => {
  event.preventDefault();

  const message = messageInput.value;

  fetch('/messages', {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify({ message: message })
  })
    .then(response => response.json())
    .then(data => {
      const messageDiv = document.createElement('div');
      messageDiv.classList.add('message');
      messageDiv.textContent = data.message;
      messagesDiv.appendChild(messageDiv);

      messageInput.value = '';
      messageInput.focus();
    });
});
