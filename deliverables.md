## Screenshots
### Deploying Trustworhty Code
#### 1. Build Phase

- Find the job named `build-frontend` in the `.circleci/config.yml` file. 
  - Add code to build/compile the front-end.
- Find another job named `build-backend` in the `.circleci/config.yml` file. 
  - Add code to build/compile the back-end.
- Notice that both jobs have selected a Docker image that is compatible with NodeJS.
- We have provided an easy-to-fix compile error in the code to prove the jobs fail. Provide a screenshot of jobs that failed because of compile errors. **[SCREENSHOT01]**

![Job properly failing because of compile errors.](screenshots/SCREENSHOT01.png)

#### 2. Test Phase
- Find the jobs named `test-frontend` and `test-backend` in the config file. 
  - For both jobs, select a Docker image that is compatible with NodeJS.
  - Write code to run all the unit tests in both layers. 
- Remember, we separate the frontend and backend into separate jobs!
- A unit test job should fail the job and prevent any future jobs from running.
- We have provided one failing test in both front-end and back-end. Provide a screenshot of the failed unit tests in the "Test Failures" tab. **[SCREENSHOT02]**
![Job properly failing because of test failures.](screenshots/SCREENSHOT02.png)

#### 3. Analyze Phase
- Find the jobs named `scan-frontend` and `scan-backend` in the config file. 
  - For both jobs, select a Docker image that is compatible with NodeJS.
  - Write code to check for security vulnerabilities in the packages used in the application.
- Job should fail if any major vulnerabilities are found (fail for the right reasons). We left you an intentional vulnerability to cause a failure. Provide a screenshot of jobs that failed because of vulnerable packages listed. **[SCREENSHOT03]**
![Job properly failing because of security vulnerabilities.](screenshots/SCREENSHOT03.png)

#### 4. Alerts
- Integrate Slack, email or another communication tool to receive alerts when jobs fail. Our examples are using Slack, but you should feel free to use the communication tool to which you are most accustomed.
- Alerts should include a summary of what happened and a link to the job console output for quick troubleshooting.
- Provide a screenshot of an alert from one of your failed builds. **[SCREENSHOT04]**
![An alert when the build breaks.](screenshots/SCREENSHOT04.png)
