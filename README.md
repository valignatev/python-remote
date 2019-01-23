# Goals

Being able to work with remote Python interpreters as seamlessly as possible.

What does it mean:
  * Run executables such as `pytest` and `manage.py` on the remote server,
    e.g. where the Python interpreter sits.
  * Index remote Python environment locally so intellisense tools could use the index
    for providing their features such as autocompletion, go to definition etc without
    need of installing them to the remote server and having latency penalty.
  * Support two main remote workflows - ssh (both password and key authentication ways)
    and docker.
  * It should be editor-independent.
