## Prometheus

The crowdAI landscape uses [Prometheus] to track stats and build dashboards. The crowdAI Web app publishes raw data on an endpoint, which is constantly scraped by the Prometheus server.

The official [Prometheus client_ruby](https://github.com/prometheus/client_ruby) is used. An endpoint is hosted at **/metrics** and populated with **after_create** or **after_save** actions on the Participant and Submission models.

The endpoint is secured via basic auth, and the password is the CROWDAI_API_KEY environment variable. The endpoint is provided by the gem and the rack integration is in **config.ru**.
