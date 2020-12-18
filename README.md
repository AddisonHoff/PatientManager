# Patient Manager

A system that allows a patient to report oxygen levels daily to their doctor from home and allows doctors to monitor their patients remotely.

Built with Rails 6.0.3.4

# Notes
* The current version with authentication for patients implemeneted is usable due to a problem with doctor authentication.
* To demo the app please use this version: https://github.com/AddisonHoff/PatientManager/tree/826d7d86cedaf9d160d95e279c66b6925a4509a1
* Doctor creation is also bugged, please run db:seed to populate the database with sample doctors. 

![alt text](https://github.com/AddisonHoff/PatientManager/blob/master/Screen%20Shot%202020-12-18%20at%201.59.15%20AM.png)
![alt text](https://github.com/AddisonHoff/PatientManager/blob/master/Screen%20Shot%202020-12-18%20at%202.00.49%20AM.png)

# How To Run

1. Clone this repo
2. Go the directory
3. yarn install
4. rails db:migrate
5. rake routes
6. rails db:seed
7. rails s
8. Open web browser and go to http://localhost:3000/patients 

(http://localhost:3000/patients/new) to create new patient


# Planned Features
* Sign up/login for doctor
* Working authentication
* A portal for patients to enter their oxygen level
* Email/text reminders for patients
* Email/text warnings for patients and doctors based on oxygen levels
* Automated reporting straight from oxymeter to database
* Cleaner UI

