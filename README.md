# Radiology Scheduler

Used for generating a yearly work rotation schedule for residents.

There are 2 main services:
+ Schedule::Generator.new.schedule_residents
    - Takes list of employees and rotations and saves yearly schedule in db

+ Schedule::Exporter.new.export
    - Exports the yearly schedule that was saved to the db to Google Sheets
    - https://docs.google.com/spreadsheets/d/1P2cYMVV_SP4wvQj2bNlFquLrc6KR-yjtWeymgieVfgY/edit#gid=0

--------------------------------------------------------------------------
TEST-1
* Setup
    - Add employees through: /employees
    - Add rotations through: /rotations

* Services
    - Generate schedule: /schedules/generate
    - Export schedule to Google Sheets: /schedule/export

* Ruby version
    - ruby 2.6
    - Rails 5.2.3
    - mysql  Ver 14.14 
