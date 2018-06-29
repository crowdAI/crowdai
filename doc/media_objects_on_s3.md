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

### Transmission

The media fields are sent via the API with these params:

- media_large
- media_thumbnail
- media_content_type

Both ```media_large``` and ```media_thumbnail``` need to be populated with a S3 key the crowdAI bucket, although they can both point to the same key.

crowdAI will make these assets ```public read``` when they are received by the API.

The content type should be:

- image/<type>
- video/<type>

Example

- 'image/png'
- 'video/mp4'

### Display

The **media on leaderboard?** setting must be ON in the challenge.
