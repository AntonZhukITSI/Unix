const express = require('express');
const app = express();

const port = 3000;

app.use(express.static('public'));
app.use(express.json());

const messages = [];

app.get('/messages', (req, res) => {
  res.json(messages);
});

app.post('/messages', (req, res) => {
  const message = req.body.message;
  messages.push(message);
  res.json({ message: message });
});

app.listen(port, () => {
  console.log(`Server started at http://localhost:${port}`);
});