1. git clone https://github.com/vishswati1011/docker-with-volume.git 

2. To Build the image use

$ docker build -t feedback-app .

3. To run the container use on port 3000
$ docker run -p -d  3000:3000 --name feedback-app-c feedback-app  

4. check on browser on port 3000
and give a title and desc in the form and then check the URL localhost:3000/feedback/title.txt
feedback/title.txt file is temp stored data in the container

but we can use volume which is two type named and anonymous
Anonymous volume not survive when the container was removed but named Volume servive

To run the container with an anonymous volume
$ first stop the running container

Then run cmd
docker run -d -p 3000:3000 --rm --name feedback-app-c -v /app/feedback feedback-app

this command will save the created file with an anonymous volume but when we stop and remove the container volume data will lost

Now again stop the container and run the container with a named volume

$ docker run -d -p 3000:3000 --rm --name feedback-app-c -v feedback:/app/feedback feedback-app

the above command in detached mode and when the container is deleted volume data will not lost

Bind Mount: If you are on the development side and doing changes in source code which are not reflected in the running container you can use the bind mount method
which will mount all the source code with a running container 
use cmd
$ docker run -d -p 3000:3000 --rm --name feedback-app-c -v feedback:/app/feedback -v "/Users/macbookair/Downloads/data-volumes-01-starting-setup:/app" feedback-app

but the above command will give an error if you do not install node_module on your local machine and we don't actually need node_modules because we are using image and coanter to run the project 
to solve the error we will add volume which will not mount node_modules

$ docker run -d -p 3000:3000 --rm --name feedback-app-c -v feedback:/app/feedback -v "/Users/macbookair/Downloads/data-volumes-01-starting-setup:/app" -v /app/node_modules feedback-app

now everything works 

To see all volumes use
$ docker volumes ls
$ docker volume prune to delete volume
