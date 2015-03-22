### Group Name:
  The Pink Fairy Armadillos

### Members:
  - Kolin Purcell (purcellc): Parsed XML and set up pictures in database, wrote indexing code
  - Craig Send (sendcr): Wrote front-end controller for search and similarity, worked on index server code
  - Abbey Ciolek (aciolek): Wrote index server and query matching code
  
### Details:
  - [Link For Running Version](http://eecs485-08.eecs.umich.edu:5678/utemnb/pa4)
  - Photos are stored in static/img/db/, you must create this directory after cloning the repo
  - For parsing captions, we split on spaces and removed punctuation from the beginning and/or end of the words

### Deploy: 
  - `virtualenv venv --distribute`
  - `source venv/bin/activate` (run for every new terminal window)
  - `pip install -r app/requirements.txt`
  - `gunicorn -b eecs485-08.eecs.umich.edu:5678 -b eecs485-08.eecs.umich.edu:5778 -w 4 runserver:app` (from app/ directory)

### Extra Credit Done:
