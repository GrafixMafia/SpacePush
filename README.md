spacepush
=====

Not even an alpha 

An OTP application that provides apple push notification server. The goal is to keep the application as simple as even possible. This means also to make use of as little dependencies as possible. 


Build
-----

    $ rebar compile

Structure
--- 
each push notification channel will for each device token will open an ssl connection to the APNS (Apple Push Notification Service) server an will keep it open. This is the recommended behavior by Apple Inc. 
Therefor each incoming new token/device will create a new process that handles the connection.    

<center> ![Abstract Structure of SpacePush](https://raw.githubusercontent.com/GrafixMafia/SpacePush/master/doc/struct_small.png "Abstract Structure of SpacePush")
</center>

Dependencies
--- 
The spacepush application dependens on the following applications/libs:

* jiffy - a json coding and decoding lib that doesn't has any further dependencies ([on GitHub](https://github.com/davisp/jiffy))


Features 
--- 
will send configurable push notifications to apple devices

Not a Feature yet
--- 
This application does not make use of the new introduced HTTP/2 APNS API. This is because the Erlang http client does not support the „new“ HTTP protocol yet.
There is no android push support. I would be happy to support these devices to, but i don’t have any Android device and i do not plan to own one. So if you would like to see Android support, i welcome you to send pull requests!  

 

Credits
---

License
---

The MIT License (MIT)

Copyright (c) 2015 GrafixMafia

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
