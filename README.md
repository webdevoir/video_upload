# 8BallTV Video Upload Feature

## About
This feature allows users to upload videos to 8BallTV's S3 storage, and save associated
metadata on a database.

## Technology
  * Ruby on Rails Back End
  * Tus.io Resumable Upload
     Utilizes Tus.io protocol (as implemented by tus-ruby-server and shrine gems) to
     allow for video uploads to resume where they left off in case of lost internet connection / upload errors
  * Uppy File client
      A popular JS library that allows for asynchronous upload to cloud storage
  * AWS S3
      Video files are stored on S3, and a PostgreSQL DB points to the S3 url
  * PostgresSQL
      SQL database that stores video file metadata

## About 8BallTV
  Started in November 2016, 8BallTV is a 24/7 public access TV channel on the web.
  Users submit videos, which are then scheduled by site administrators. For a full explanation
  of the site's manifesto and code of conduct, visit [8BallTV](http://8balltv.club/scheduler.html?theday=mon#h17_00) and scroll
  down : )
