#!/bin/bash
# cd best-car-dealers/server
# Download and Give it execute permission: chmod +x setup_django.sh
# ./setup_django.sh

# Exit script on error
set -e

# Install virtualenv if not already installed
if ! command -v virtualenv &> /dev/null
then
    echo "Installing virtualenv..."
    pip install virtualenv
fi

# Create and activate virtual environment
echo "Creating virtual environment..."
virtualenv djangoenv

echo "Activating virtual environment..."
source djangoenv/bin/activate

# Install dependencies from requirements.txt
if [ -f "requirements.txt" ]; then
    echo "Installing dependencies..."
    python3 -m pip install -U -r requirements.txt
else
    echo "requirements.txt not found. Skipping dependency installation."
fi

# Run Django migrations
echo "Running Django migrations..."
python3 manage.py makemigrations
python3 manage.py migrate

echo "Setup complete!"

# Start the local development server
python3 manage.py runserver

