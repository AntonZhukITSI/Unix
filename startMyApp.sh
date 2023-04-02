#!/bin/bash

# Set the application directory path
APP_DIR=/Users/nikitastorcaj/Desktop/myApp

# Check if Node.js is installed
if ! command -v node &> /dev/null; then
    echo "Node.js is not installed. Please install it and try again."
    exit 1
fi

# Check if npm is installed
if ! command -v npm &> /dev/null; then
    echo "npm is not installed. Please install it and try again."
    exit 1
fi

# Navigate to the application directory
cd "$APP_DIR"

# Install dependencies
npm install

# Start the server
node server.js &
PID=$!

# Open the application in the default web browser
if command -v xdg-open &> /dev/null; then
    xdg-open http://localhost:3000
elif command -v gnome-open &> /dev/null; then
    gnome-open http://localhost:3000
elif command -v open &> /dev/null; then
    open http://localhost:3000
else
    echo "Could not detect the web browser to use. Please open http://localhost:3000 manually."
fi

# Navigate to the client directory and start the client
cd public
npm run