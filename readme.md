Step One git clone 

To Build the image use

$ docker build -t feedback-app .

To run the container use on port 3000
$ docker run -p -d  3000:3000 --name feedback-app-c feedback-app  

check on brawser on port 3000
and give a title and desc in form and then check the url localhost:3000/feedback/title.txt
feedback/title.txt file is temp stored data in container

but we can use volume which is two typw named and anonymous
anonymous volume not survive when the container remove but named volumen servive

To run the container with anonymous volume
$ first stop the running container

Then run cmd
docker run -d -p 3000:3000 --rm --name feedback-app-c -v /app/feedback feedback-app

this command will save the create file with anonymous volume but when we stop and remove the container volume data will lost

Now again stop the container and run the container with named volume

$ docker run -d -p 3000:3000 --rm --name feedback-app-c -v feedback:/app/feedback feedback-app

the above command in detached mode and when the container delete volume data will not lost

Bind Mount : If you are on the developement side and doing changes in source code which is not reflecting in running container when you can use bing mount metthod
which will mount all the source code with running conatiner 
use cmd
$ docker run -d -p 3000:3000 --rm --name feedback-app-c -v feedback:/app/feedback -v "/Users/macbookair/Downloads/data-volumes-01-starting-setup:/app" feedback-app

but the above command will give error if you not install node_module on you local machine and we dont actually need node_modules because we are using image and coanter to run the project 
to solve the error we will add volume which will not mount node_modules

$ docker run -d -p 3000:3000 --rm --name feedback-app-c -v feedback:/app/feedback -v "/Users/macbookair/Downloads/data-volumes-01-starting-setup:/app" -v /app/node_modules feedback-app

now everything to work 

to see all volumes use
$ docker volumes ls
$ docker volume prune to delete volume