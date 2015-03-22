 ### Details:
  - Photos are stored in static/img/db/, you must create this directory after cloning the repo


### Deploy: 
  - `virtualenv venv --distribute`
  - `source venv/bin/activate` (run for every new terminal window)
  - `pip install -r app/requirements.txt`
  - `gunicorn -b eecs485-08.eecs.umich.edu:5678 -b eecs485-08.eecs.umich.edu:5778 -w 4 runserver:app` (from app/ directory)
