FROM python:2.7

WORKDIR /code

# Copy the requirements file to the container
COPY ./requirements.txt ./

RUN apt install gcc libffi-dev libssl-dev

RUN pip install -r requirements.txt

# Copy the rest of the application code to the container
COPY ./ ./

# Setup the command to run when the container starts
CMD ["uvicorn", "src.main:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]