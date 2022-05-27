from locust import HttpUser, task

class mgwebUser(HttpUser):
    @task
    def mg_web(self):
        self.client.get("/api/patients")


