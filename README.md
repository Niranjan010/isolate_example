# isolate_example

A Basic overview of Isolates in flutter for multithreading

## Getting Started

If you have programming knowledge such as java then isolate is basically Thread/Multithreading in dart.

What is isolate again?
When you run a dart or flutter program, all code is executed one after another line by line in a single 
thread which is the main thread.

even if you are using async/await you are still using the main thread internally using event and loop.

Now say you want to insert 10000 records in a database or call HTTP with lots of data and responses.
If you are using the main thread with CircularProgressBar while inserting. Your App and CircularProgressBar 
will freeze after some time till the insertion/API call is complete.
Long story short, If you do too much work on the main thread, it will lead bad user experience and eventually 
your app might crash.

## Few things to remember while using Thread/Isolate in dart?

1)You can’t communicate between threads. i.e you can’t access the main thread object including the 
custom object you created in the main isolate.

2)If you want to call HTTP/database you will have to create a new connection or HTTP request.

3)So how will you pass objects between threads? isolate? The answer is you will have to use SendPort 
and ReceivePort to communicate between threads.

4)Eg. say you want to call an HTTP request in the background and as soon as you get responses you want 
to send the response to the main thread so you can display it in UI then you will have to use Port as 
mentioned to pass data between isolate