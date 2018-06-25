### IAM Account

Two IAM users have been set up for access:

- crowdai-broker-stg
- crowdai-broker-prd

### Media objects

Media objects are images, video or audio produced by the **crowdAI Broker** and which are produced in two forms:

- large
- thumbnail

These are written to the crowdAI S3 bucket by the **crowdAI Broker** and then the url is sent via API call to the **crowdAI Webapp**. If the **crowdAI Webapp** cannot access the asset in the S3 bucket, the API call will be rejected.

The directory structure in S3 is:

- audio
- video
- image

The two files (thumb and large) are written with a unique key, prepended by 'large' or 'thumb'.
