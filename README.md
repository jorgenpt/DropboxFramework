DropboxFramework
================

DropboxFramework is a port of the official [Dropbox SDK for iOS][1] to Mac OS
X. It has **no affilation with [Dropbox][2]**, except that they have given
me permission to publish this code.

DropboxFramework is meant as a tool for Mac developers who wish to interface
with Dropbox using their API under OS X. It contains an Objective-C interface
that should be familiar to developers who have used it on iOS, as well as a
clean user interface that the application developer can easily invoke. All of
this is wrapped into a OS X .framework file, so that you can quickly get
started using the Dropbox API in your own app.

Note that Dropbox does not officially support desktop applications that use the
API. This means that you're in no way entitled to get an API key for a desktop
app, and you should contact Dropbox directly at [api-program@dropbox.com][4]
before even starting your project, asking if they'll allow you to use the API.

Most of the code is verbatim copied from the most recent (at the time of
writing) iOS SDK, [v1.0][3]. Some code has been written from scratch:

 * **Examples/** This contains example code that uses DropboxFramework.

[1]: http://www.dropbox.com/developers/releases "Dropbox SDKs"
[2]: http://www.dropbox.com/ "Dropbox"
[3]: http://www.dropbox.com/static/developers/dropbox-iphone-sdk-1.0.tar.gz "Objective-C/iOS SDK v1.0"
[4]: mailto:api-program@dropbox.com "API Program"
