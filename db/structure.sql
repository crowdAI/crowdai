SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: pg_stat_statements; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pg_stat_statements WITH SCHEMA public;


--
-- Name: EXTENSION pg_stat_statements; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION pg_stat_statements IS 'track execution statistics of all SQL statements executed';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: active_admin_comments; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.active_admin_comments (
    id integer NOT NULL,
    namespace character varying,
    body text,
    resource_id character varying NOT NULL,
    resource_type character varying NOT NULL,
    author_type character varying,
    author_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: active_admin_comments_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.active_admin_comments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: active_admin_comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.active_admin_comments_id_seq OWNED BY public.active_admin_comments.id;


--
-- Name: active_storage_attachments; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.active_storage_attachments (
    id bigint NOT NULL,
    name character varying NOT NULL,
    record_type character varying NOT NULL,
    record_id bigint NOT NULL,
    blob_id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL
);


--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.active_storage_attachments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.active_storage_attachments_id_seq OWNED BY public.active_storage_attachments.id;


--
-- Name: active_storage_blobs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.active_storage_blobs (
    id bigint NOT NULL,
    key character varying NOT NULL,
    filename character varying NOT NULL,
    content_type character varying,
    metadata text,
    byte_size bigint NOT NULL,
    checksum character varying NOT NULL,
    created_at timestamp without time zone NOT NULL
);


--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.active_storage_blobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.active_storage_blobs_id_seq OWNED BY public.active_storage_blobs.id;


--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: article_sections; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.article_sections (
    id integer NOT NULL,
    article_id integer,
    seq integer DEFAULT 1,
    description_markdown text,
    description text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    section character varying,
    slug character varying
);


--
-- Name: article_sections_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.article_sections_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: article_sections_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.article_sections_id_seq OWNED BY public.article_sections.id;


--
-- Name: articles; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.articles (
    id integer NOT NULL,
    article character varying,
    participant_id integer,
    published boolean DEFAULT false,
    vote_count integer DEFAULT 0,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    category character varying,
    view_count integer DEFAULT 0,
    summary character varying,
    slug character varying,
    image_file character varying,
    article_type_cd character varying,
    notebook_url character varying
);


--
-- Name: articles_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.articles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: articles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.articles_id_seq OWNED BY public.articles.id;


--
-- Name: badges_sashes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.badges_sashes (
    id bigint NOT NULL,
    badge_id integer,
    sash_id integer,
    notified_user boolean DEFAULT false,
    created_at timestamp without time zone
);


--
-- Name: badges_sashes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.badges_sashes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: badges_sashes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.badges_sashes_id_seq OWNED BY public.badges_sashes.id;


--
-- Name: base_leaderboards; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.base_leaderboards (
    id bigint NOT NULL,
    challenge_id bigint,
    challenge_round_id bigint,
    participant_id bigint,
    row_num integer,
    previous_row_num integer,
    slug character varying,
    name character varying,
    entries integer,
    score double precision,
    score_secondary double precision,
    media_large character varying,
    media_thumbnail character varying,
    media_content_type character varying,
    description character varying,
    description_markdown character varying,
    leaderboard_type_cd character varying,
    refreshed_at timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    submission_id integer,
    post_challenge boolean DEFAULT false,
    seq integer,
    baseline boolean,
    baseline_comment character varying
);


--
-- Name: base_leaderboards_20180809; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.base_leaderboards_20180809 (
    id bigint,
    challenge_id bigint,
    challenge_round_id bigint,
    participant_id bigint,
    row_num integer,
    previous_row_num integer,
    slug character varying,
    name character varying,
    entries integer,
    score double precision,
    score_secondary double precision,
    media_large character varying,
    media_thumbnail character varying,
    media_content_type character varying,
    description character varying,
    description_markdown character varying,
    leaderboard_type_cd character varying,
    refreshed_at timestamp without time zone,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    submission_id integer,
    post_challenge boolean
);


--
-- Name: base_leaderboards_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.base_leaderboards_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: base_leaderboards_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.base_leaderboards_id_seq OWNED BY public.base_leaderboards.id;


--
-- Name: blogs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.blogs (
    id bigint NOT NULL,
    participant_id bigint,
    title character varying,
    body text,
    published boolean,
    vote_count integer,
    view_count integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    body_markdown text,
    seq integer,
    posted_at timestamp without time zone
);


--
-- Name: blogs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.blogs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: blogs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.blogs_id_seq OWNED BY public.blogs.id;


--
-- Name: challenge_call_responses; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.challenge_call_responses (
    id bigint NOT NULL,
    challenge_call_id bigint,
    email character varying,
    phone character varying,
    organization character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    challenge_description text,
    contact_name character varying,
    challenge_title character varying,
    motivation text,
    timeline text,
    evaluation_criteria text,
    organizers_bio text,
    other text
);


--
-- Name: challenge_call_responses_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.challenge_call_responses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: challenge_call_responses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.challenge_call_responses_id_seq OWNED BY public.challenge_call_responses.id;


--
-- Name: challenge_calls; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.challenge_calls (
    id bigint NOT NULL,
    title character varying,
    website character varying,
    closing_date timestamp without time zone,
    description text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    slug character varying,
    organizer_id bigint,
    headline character varying,
    crowdai boolean DEFAULT false,
    description_markdown text
);


--
-- Name: challenge_calls_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.challenge_calls_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: challenge_calls_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.challenge_calls_id_seq OWNED BY public.challenge_calls.id;


--
-- Name: challenges; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.challenges (
    id integer NOT NULL,
    organizer_id integer,
    challenge character varying,
    status_cd character varying DEFAULT 'draft'::character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    tagline character varying,
    primary_sort_order_cd character varying DEFAULT 'ascending'::character varying,
    secondary_sort_order_cd character varying,
    perpetual_challenge boolean DEFAULT false,
    answer_file_s3_key character varying,
    page_views integer DEFAULT 0,
    participant_count integer DEFAULT 0,
    submission_count integer DEFAULT 0,
    score_title character varying,
    score_secondary_title character varying,
    slug character varying,
    submission_license character varying,
    api_required boolean DEFAULT false,
    media_on_leaderboard boolean DEFAULT false,
    challenge_client_name character varying,
    online_grading boolean DEFAULT true,
    vote_count integer DEFAULT 0,
    description_markdown text,
    description text,
    evaluation_markdown text,
    evaluation text,
    rules_markdown text,
    rules text,
    prizes_markdown text,
    prizes text,
    resources_markdown text,
    resources text,
    submission_instructions_markdown text,
    submission_instructions text,
    license_markdown text,
    license text,
    dataset_description_markdown text,
    dataset_description text,
    image_file character varying,
    featured_sequence integer DEFAULT 0,
    dynamic_content_flag boolean DEFAULT false,
    dynamic_content text,
    dynamic_content_tab character varying,
    winner_description_markdown text,
    winner_description text,
    winners_tab_active boolean DEFAULT false,
    clef_task_id bigint,
    clef_challenge boolean DEFAULT false,
    submissions_page boolean,
    private_challenge boolean DEFAULT false,
    show_leaderboard boolean DEFAULT true,
    grader_identifier character varying,
    online_submissions boolean DEFAULT false,
    grader_logs boolean DEFAULT false,
    require_registration boolean DEFAULT false,
    grading_history boolean DEFAULT false,
    post_challenge_submissions boolean DEFAULT false,
    submissions_downloadable boolean DEFAULT false,
    dataset_note_markdown text,
    dataset_note text,
    discussions_visible boolean DEFAULT true,
    require_toc_acceptance boolean DEFAULT false,
    toc_acceptance_text character varying,
    toc_acceptance_instructions text,
    toc_acceptance_instructions_markdown text
);


--
-- Name: organizers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.organizers (
    id integer NOT NULL,
    organizer character varying,
    address text,
    description text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    approved boolean DEFAULT false,
    slug character varying,
    image_file character varying,
    tagline character varying,
    challenge_proposal character varying,
    api_key character varying,
    clef_organizer boolean DEFAULT false
);


--
-- Name: participants; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.participants (
    id integer NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    confirmation_token character varying,
    confirmed_at timestamp without time zone,
    confirmation_sent_at timestamp without time zone,
    failed_attempts integer DEFAULT 0 NOT NULL,
    unlock_token character varying,
    locked_at timestamp without time zone,
    admin boolean DEFAULT false,
    verified boolean DEFAULT false,
    verification_date date,
    timezone character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    unconfirmed_email character varying,
    organizer_id integer,
    name character varying,
    email_public boolean DEFAULT false,
    bio text,
    website character varying,
    github character varying,
    linkedin character varying,
    twitter character varying,
    account_disabled boolean DEFAULT false,
    account_disabled_reason text,
    account_disabled_dttm timestamp without time zone,
    slug character varying,
    api_key character varying,
    image_file character varying,
    affiliation character varying,
    country_cd character varying,
    address text,
    city character varying,
    first_name character varying,
    last_name character varying,
    clef_email boolean DEFAULT false,
    sash_id integer,
    level integer DEFAULT 0
);


--
-- Name: challenge_organizer_participants; Type: MATERIALIZED VIEW; Schema: public; Owner: -
--

CREATE MATERIALIZED VIEW public.challenge_organizer_participants AS
 SELECT DISTINCT cop.id,
    cop.participant_id,
    cop.clef_task_id,
    cop.organizer_id,
    cop.name,
    cop.challenge
   FROM ( SELECT c.id,
            p.id AS participant_id,
            c.clef_task_id,
            c.organizer_id,
            p.name,
            c.challenge
           FROM public.participants p,
            public.challenges c,
            public.organizers o
          WHERE ((p.organizer_id = o.id) AND (c.organizer_id = o.id))
        UNION
         SELECT c.id,
            p.id AS participant_id,
            c.clef_task_id,
            c.organizer_id,
            p.name,
            c.challenge
           FROM public.participants p,
            public.challenges c
          WHERE ((c.clef_challenge IS TRUE) AND (c.clef_task_id IN ( SELECT c1.clef_task_id
                   FROM public.challenges c1,
                    public.organizers o1,
                    public.participants p1
                  WHERE ((c1.clef_challenge IS TRUE) AND (o1.id = c1.organizer_id) AND (o1.id = p1.organizer_id) AND (p1.id = p.id)))))) cop
  WITH NO DATA;


--
-- Name: challenge_participants; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.challenge_participants (
    id bigint NOT NULL,
    challenge_id bigint,
    participant_id bigint,
    email character varying,
    name character varying,
    registered boolean DEFAULT false,
    accepted_dataset_toc boolean DEFAULT false,
    clef_task_id integer,
    clef_eua_file character varying,
    clef_approved boolean DEFAULT false,
    clef_status_cd character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: challenge_participants_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.challenge_participants_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: challenge_participants_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.challenge_participants_id_seq OWNED BY public.challenge_participants.id;


--
-- Name: challenge_partners; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.challenge_partners (
    id bigint NOT NULL,
    challenge_id bigint,
    image_file character varying,
    partner_url character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: challenge_partners_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.challenge_partners_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: challenge_partners_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.challenge_partners_id_seq OWNED BY public.challenge_partners.id;


--
-- Name: comments; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.comments (
    id integer NOT NULL,
    topic_id integer,
    participant_id integer,
    comment text,
    flagged boolean DEFAULT false,
    notify boolean DEFAULT true,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    vote_count integer DEFAULT 0,
    slug character varying,
    comment_markdown text,
    mentions_cache character varying
);


--
-- Name: dataset_file_downloads; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.dataset_file_downloads (
    id integer NOT NULL,
    participant_id integer,
    dataset_file_id integer,
    ip_address character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: dataset_files; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.dataset_files (
    id integer NOT NULL,
    seq integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    description character varying,
    challenge_id integer,
    dataset_file_s3_key character varying,
    evaluation boolean DEFAULT false,
    title character varying,
    hosting_location character varying,
    external_url character varying,
    visible boolean DEFAULT true,
    external_file_size character varying
);


--
-- Name: participant_clef_tasks; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.participant_clef_tasks (
    id bigint NOT NULL,
    participant_id bigint,
    clef_task_id bigint,
    approved boolean DEFAULT false,
    eua_file character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    status_cd character varying
);


--
-- Name: submissions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.submissions (
    id integer NOT NULL,
    challenge_id integer,
    participant_id integer,
    score double precision,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    description text,
    score_secondary double precision,
    grading_message character varying,
    grading_status_cd character varying DEFAULT 'ready'::character varying,
    description_markdown text,
    vote_count integer DEFAULT 0,
    post_challenge boolean DEFAULT false,
    api character varying,
    media_large character varying,
    media_thumbnail character varying,
    media_content_type character varying,
    challenge_round_id integer,
    meta json DEFAULT '{}'::json,
    short_url character varying,
    clef_method_description text,
    clef_retrieval_type character varying,
    clef_run_type character varying,
    clef_primary_run boolean DEFAULT false,
    clef_other_info text,
    clef_additional text,
    online_submission boolean DEFAULT false,
    score_display double precision,
    score_secondary_display double precision,
    baseline boolean DEFAULT false,
    baseline_comment character varying
);


--
-- Name: topics; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.topics (
    id integer NOT NULL,
    challenge_id integer,
    participant_id integer,
    topic character varying,
    sticky boolean DEFAULT false,
    views integer DEFAULT 0,
    posts_count integer DEFAULT 0,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    slug character varying,
    vote_count integer DEFAULT 0
);


--
-- Name: votes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.votes (
    id integer NOT NULL,
    votable_id integer NOT NULL,
    votable_type character varying NOT NULL,
    participant_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: challenge_registrations; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW public.challenge_registrations AS
 SELECT row_number() OVER () AS id,
    x.challenge_id,
    x.participant_id,
    x.registration_type,
    x.clef_task_id
   FROM ( SELECT s.challenge_id,
            s.participant_id,
            'submission'::text AS registration_type,
            NULL::integer AS clef_task_id
           FROM public.submissions s
        UNION
         SELECT s.votable_id,
            s.participant_id,
            'heart'::text AS registration_type,
            NULL::integer AS clef_task_id
           FROM public.votes s
          WHERE ((s.votable_type)::text = 'Challenge'::text)
        UNION
         SELECT df.challenge_id,
            dfd.participant_id,
            'dataset_download'::text AS text,
            NULL::integer AS clef_task_id
           FROM public.dataset_file_downloads dfd,
            public.dataset_files df
          WHERE (dfd.dataset_file_id = df.id)
        UNION
         SELECT c_1.id AS challenge_id,
            p_1.id AS participant_id,
            'forum'::text AS registration_type,
            NULL::integer AS clef_task_id
           FROM public.challenges c_1,
            public.participants p_1,
            public.topics t
          WHERE ((t.challenge_id = c_1.id) AND (t.participant_id = p_1.id))
        UNION
         SELECT t.challenge_id,
            ps.participant_id,
            'forum'::text AS registration_type,
            NULL::integer AS clef_task_id
           FROM public.comments ps,
            public.topics t
          WHERE (t.id = ps.topic_id)
        UNION
         SELECT c.id,
            pc.participant_id,
            'clef_task'::text AS registration_type,
            pc.clef_task_id
           FROM public.participant_clef_tasks pc,
            public.challenges c
          WHERE (c.clef_task_id = pc.clef_task_id)) x;


--
-- Name: challenge_rounds; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.challenge_rounds (
    id bigint NOT NULL,
    challenge_id bigint,
    challenge_round character varying,
    active boolean DEFAULT false,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    submission_limit integer,
    submission_limit_period_cd character varying,
    start_dttm timestamp without time zone,
    end_dttm timestamp without time zone,
    minimum_score double precision,
    minimum_score_secondary double precision,
    ranking_window integer,
    ranking_highlight integer,
    score_precision integer,
    score_secondary_precision integer,
    leaderboard_note_markdown text,
    leaderboard_note text,
    failed_submissions integer DEFAULT 0,
    parallel_submissions integer DEFAULT 0 NOT NULL
);


--
-- Name: challenge_round_views; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW public.challenge_round_views AS
 SELECT cr.id,
    cr.challenge_round,
    cr.row_num,
    cr.active,
    cr.challenge_id,
    cr.start_dttm,
    cr.end_dttm,
    cr.submission_limit,
    cr.submission_limit_period_cd,
    cr.failed_submissions,
    cr.minimum_score,
    cr.minimum_score_secondary
   FROM ( SELECT r1.id,
            r1.challenge_id,
            r1.challenge_round,
            r1.active,
            r1.created_at,
            r1.updated_at,
            r1.submission_limit,
            r1.submission_limit_period_cd,
            r1.start_dttm,
            r1.end_dttm,
            r1.minimum_score,
            r1.minimum_score_secondary,
            r1.ranking_window,
            r1.ranking_highlight,
            r1.score_precision,
            r1.score_secondary_precision,
            r1.leaderboard_note_markdown,
            r1.leaderboard_note,
            r1.failed_submissions,
            row_number() OVER (PARTITION BY r1.challenge_id ORDER BY r1.challenge_id, r1.start_dttm) AS row_num
           FROM public.challenge_rounds r1) cr;


--
-- Name: challenge_round_summaries; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW public.challenge_round_summaries AS
 SELECT cr.id,
    cr.challenge_round,
    cr.row_num,
    acr.row_num AS active_row_num,
        CASE
            WHEN (cr.row_num < acr.row_num) THEN 'history'::text
            WHEN (cr.row_num = acr.row_num) THEN 'current'::text
            WHEN (cr.row_num > acr.row_num) THEN 'future'::text
            ELSE NULL::text
        END AS round_status_cd,
    cr.active,
    cr.challenge_id,
    cr.start_dttm,
    cr.end_dttm,
    cr.submission_limit,
    cr.submission_limit_period_cd,
    cr.failed_submissions,
    cr.minimum_score,
    cr.minimum_score_secondary,
    c.status_cd
   FROM public.challenge_round_views cr,
    public.challenge_round_views acr,
    public.challenges c
  WHERE ((c.id = cr.challenge_id) AND (c.id = acr.challenge_id) AND (acr.active IS TRUE));


--
-- Name: challenge_rounds_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.challenge_rounds_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: challenge_rounds_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.challenge_rounds_id_seq OWNED BY public.challenge_rounds.id;


--
-- Name: challenge_stats; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW public.challenge_stats AS
 SELECT row_number() OVER () AS id,
    c.id AS challenge_id,
    c.challenge,
    r.id AS challenge_round_id,
    r.challenge_round,
    r.start_dttm,
    r.end_dttm,
    (r.end_dttm - r.start_dttm) AS duration,
    ( SELECT count(s.id) AS count
           FROM public.submissions s
          WHERE (s.challenge_id = c.id)) AS submissions,
    ( SELECT count(p.id) AS count
           FROM public.participants p
          WHERE (p.id IN ( SELECT s1.participant_id
                   FROM public.submissions s1
                  WHERE (s1.challenge_id = c.id)))) AS participants
   FROM public.challenges c,
    public.challenge_rounds r
  WHERE (r.challenge_id = c.id)
  ORDER BY (row_number() OVER ()), c.challenge;


--
-- Name: challenges_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.challenges_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: challenges_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.challenges_id_seq OWNED BY public.challenges.id;


--
-- Name: clef_tasks; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.clef_tasks (
    id bigint NOT NULL,
    organizer_id bigint,
    task character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    eua_file character varying
);


--
-- Name: clef_tasks_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.clef_tasks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: clef_tasks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.clef_tasks_id_seq OWNED BY public.clef_tasks.id;


--
-- Name: comments_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.comments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.comments_id_seq OWNED BY public.comments.id;


--
-- Name: dataset_file_downloads_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.dataset_file_downloads_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: dataset_file_downloads_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.dataset_file_downloads_id_seq OWNED BY public.dataset_file_downloads.id;


--
-- Name: dataset_files_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.dataset_files_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: dataset_files_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.dataset_files_id_seq OWNED BY public.dataset_files.id;


--
-- Name: email_preferences; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.email_preferences (
    id integer NOT NULL,
    participant_id integer,
    newsletter boolean DEFAULT true,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    challenges_followed boolean DEFAULT true,
    mentions boolean DEFAULT true,
    email_frequency_cd character varying DEFAULT 'daily'::character varying
);


--
-- Name: email_preferences_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.email_preferences_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: email_preferences_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.email_preferences_id_seq OWNED BY public.email_preferences.id;


--
-- Name: email_preferences_tokens; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.email_preferences_tokens (
    id bigint NOT NULL,
    participant_id bigint,
    email_preferences_token character varying,
    token_expiration_dttm timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: email_preferences_tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.email_preferences_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: email_preferences_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.email_preferences_tokens_id_seq OWNED BY public.email_preferences_tokens.id;


--
-- Name: follows; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.follows (
    id integer NOT NULL,
    followable_id integer NOT NULL,
    followable_type character varying NOT NULL,
    participant_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: follows_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.follows_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: follows_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.follows_id_seq OWNED BY public.follows.id;


--
-- Name: friendly_id_slugs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.friendly_id_slugs (
    id integer NOT NULL,
    slug character varying NOT NULL,
    sluggable_id integer NOT NULL,
    sluggable_type character varying(50),
    scope character varying,
    created_at timestamp without time zone
);


--
-- Name: friendly_id_slugs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.friendly_id_slugs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: friendly_id_slugs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.friendly_id_slugs_id_seq OWNED BY public.friendly_id_slugs.id;


--
-- Name: invitations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.invitations (
    id bigint NOT NULL,
    challenge_id bigint,
    participant_id bigint,
    email character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    invitee_name character varying
);


--
-- Name: invitations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.invitations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: invitations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.invitations_id_seq OWNED BY public.invitations.id;


--
-- Name: job_postings; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.job_postings (
    id bigint NOT NULL,
    title character varying,
    organisation character varying,
    contact_name character varying,
    contact_email character varying,
    contact_phone character varying,
    posting_date date,
    closing_date date,
    status_cd character varying,
    description text,
    remote boolean DEFAULT true,
    location character varying,
    country character varying,
    page_views integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    job_url character varying
);


--
-- Name: job_postings_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.job_postings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: job_postings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.job_postings_id_seq OWNED BY public.job_postings.id;


--
-- Name: leaderboards; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW public.leaderboards AS
 SELECT base_leaderboards.id,
    base_leaderboards.challenge_id,
    base_leaderboards.challenge_round_id,
    base_leaderboards.participant_id,
    base_leaderboards.row_num,
    base_leaderboards.previous_row_num,
    base_leaderboards.slug,
    base_leaderboards.name,
    base_leaderboards.entries,
    base_leaderboards.score,
    base_leaderboards.score_secondary,
    base_leaderboards.media_large,
    base_leaderboards.media_thumbnail,
    base_leaderboards.media_content_type,
    base_leaderboards.description,
    base_leaderboards.description_markdown,
    base_leaderboards.leaderboard_type_cd,
    base_leaderboards.refreshed_at,
    base_leaderboards.created_at,
    base_leaderboards.updated_at,
    base_leaderboards.submission_id,
    base_leaderboards.post_challenge,
    base_leaderboards.seq,
    base_leaderboards.baseline,
    base_leaderboards.baseline_comment
   FROM public.base_leaderboards
  WHERE ((base_leaderboards.leaderboard_type_cd)::text = 'leaderboard'::text);


--
-- Name: login_activities; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.login_activities (
    id bigint NOT NULL,
    scope character varying,
    strategy character varying,
    identity character varying,
    success boolean,
    failure_reason character varying,
    user_type character varying,
    user_id bigint,
    context character varying,
    ip character varying,
    user_agent text,
    referrer text,
    city character varying,
    region character varying,
    country character varying,
    created_at timestamp without time zone
);


--
-- Name: login_activities_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.login_activities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: login_activities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.login_activities_id_seq OWNED BY public.login_activities.id;


--
-- Name: mandrill_messages; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.mandrill_messages (
    id bigint NOT NULL,
    res jsonb,
    message jsonb,
    meta jsonb,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    participant_id integer
);


--
-- Name: mandrill_messages_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.mandrill_messages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: mandrill_messages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.mandrill_messages_id_seq OWNED BY public.mandrill_messages.id;


--
-- Name: merit_actions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.merit_actions (
    id bigint NOT NULL,
    user_id integer,
    action_method character varying,
    action_value integer,
    had_errors boolean DEFAULT false,
    target_model character varying,
    target_id integer,
    target_data text,
    processed boolean DEFAULT false,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: merit_actions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.merit_actions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: merit_actions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.merit_actions_id_seq OWNED BY public.merit_actions.id;


--
-- Name: merit_activity_logs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.merit_activity_logs (
    id bigint NOT NULL,
    action_id integer,
    related_change_type character varying,
    related_change_id integer,
    description character varying,
    created_at timestamp without time zone
);


--
-- Name: merit_activity_logs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.merit_activity_logs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: merit_activity_logs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.merit_activity_logs_id_seq OWNED BY public.merit_activity_logs.id;


--
-- Name: merit_score_points; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.merit_score_points (
    id bigint NOT NULL,
    score_id bigint,
    num_points integer DEFAULT 0,
    log character varying,
    created_at timestamp without time zone
);


--
-- Name: merit_score_points_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.merit_score_points_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: merit_score_points_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.merit_score_points_id_seq OWNED BY public.merit_score_points.id;


--
-- Name: merit_scores; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.merit_scores (
    id bigint NOT NULL,
    sash_id bigint,
    category character varying DEFAULT 'default'::character varying
);


--
-- Name: merit_scores_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.merit_scores_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: merit_scores_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.merit_scores_id_seq OWNED BY public.merit_scores.id;


--
-- Name: notifications; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.notifications (
    id bigint NOT NULL,
    participant_id bigint,
    notification_type character varying,
    notifiable_type character varying,
    notifiable_id bigint,
    read_at timestamp without time zone,
    is_new boolean DEFAULT false,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    message character varying,
    thumbnail_url character varying,
    notification_url character varying
);


--
-- Name: notifications_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.notifications_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: notifications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.notifications_id_seq OWNED BY public.notifications.id;


--
-- Name: oauth_access_grants; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.oauth_access_grants (
    id bigint NOT NULL,
    resource_owner_id integer NOT NULL,
    application_id bigint NOT NULL,
    token character varying NOT NULL,
    expires_in integer NOT NULL,
    redirect_uri text NOT NULL,
    created_at timestamp without time zone NOT NULL,
    revoked_at timestamp without time zone,
    scopes character varying
);


--
-- Name: oauth_access_grants_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.oauth_access_grants_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: oauth_access_grants_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.oauth_access_grants_id_seq OWNED BY public.oauth_access_grants.id;


--
-- Name: oauth_access_tokens; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.oauth_access_tokens (
    id bigint NOT NULL,
    resource_owner_id integer,
    application_id bigint,
    token character varying NOT NULL,
    refresh_token character varying,
    expires_in integer,
    revoked_at timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    scopes character varying,
    previous_refresh_token character varying DEFAULT ''::character varying NOT NULL
);


--
-- Name: oauth_access_tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.oauth_access_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: oauth_access_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.oauth_access_tokens_id_seq OWNED BY public.oauth_access_tokens.id;


--
-- Name: oauth_applications; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.oauth_applications (
    id bigint NOT NULL,
    name character varying NOT NULL,
    uid character varying NOT NULL,
    secret character varying NOT NULL,
    redirect_uri text NOT NULL,
    scopes character varying DEFAULT ''::character varying NOT NULL,
    confidential boolean DEFAULT true NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: oauth_applications_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.oauth_applications_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: oauth_applications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.oauth_applications_id_seq OWNED BY public.oauth_applications.id;


--
-- Name: ongoing_leaderboards; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW public.ongoing_leaderboards AS
 SELECT base_leaderboards.id,
    base_leaderboards.challenge_id,
    base_leaderboards.challenge_round_id,
    base_leaderboards.participant_id,
    base_leaderboards.row_num,
    base_leaderboards.previous_row_num,
    base_leaderboards.slug,
    base_leaderboards.name,
    base_leaderboards.entries,
    base_leaderboards.score,
    base_leaderboards.score_secondary,
    base_leaderboards.media_large,
    base_leaderboards.media_thumbnail,
    base_leaderboards.media_content_type,
    base_leaderboards.description,
    base_leaderboards.description_markdown,
    base_leaderboards.leaderboard_type_cd,
    base_leaderboards.refreshed_at,
    base_leaderboards.created_at,
    base_leaderboards.updated_at,
    base_leaderboards.submission_id,
    base_leaderboards.post_challenge,
    base_leaderboards.seq,
    base_leaderboards.baseline,
    base_leaderboards.baseline_comment
   FROM public.base_leaderboards
  WHERE ((base_leaderboards.leaderboard_type_cd)::text = 'ongoing'::text);


--
-- Name: organizer_applications; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.organizer_applications (
    id integer NOT NULL,
    contact_name character varying,
    email character varying,
    phone character varying,
    organization character varying,
    organization_description character varying,
    challenge_description character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: organizer_applications_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.organizer_applications_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: organizer_applications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.organizer_applications_id_seq OWNED BY public.organizer_applications.id;


--
-- Name: organizers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.organizers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: organizers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.organizers_id_seq OWNED BY public.organizers.id;


--
-- Name: participant_challenge_counts; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW public.participant_challenge_counts AS
 SELECT row_number() OVER () AS row_number,
    y.challenge_id,
    y.participant_id,
    y.registration_type
   FROM ( SELECT DISTINCT x.challenge_id,
            x.participant_id,
            x.registration_type
           FROM ( SELECT s.challenge_id,
                    s.participant_id,
                    'submission'::text AS registration_type
                   FROM public.submissions s
                UNION
                 SELECT s.votable_id,
                    s.participant_id,
                    'heart'::text AS registration_type
                   FROM public.votes s
                  WHERE ((s.votable_type)::text = 'Challenge'::text)
                UNION
                 SELECT df.challenge_id,
                    dfd.participant_id,
                    'dataset_download'::text AS text
                   FROM public.dataset_file_downloads dfd,
                    public.dataset_files df
                  WHERE (dfd.dataset_file_id = df.id)
                UNION
                 SELECT c_1.id AS challenge_id,
                    p_1.id AS participant_id,
                    'forum'::text AS registration_type
                   FROM public.challenges c_1,
                    public.participants p_1,
                    public.topics t
                  WHERE ((t.challenge_id = c_1.id) AND (t.participant_id = p_1.id))
                UNION
                 SELECT t.challenge_id,
                    ps.participant_id,
                    'forum'::text AS registration_type
                   FROM public.comments ps,
                    public.topics t
                  WHERE (t.id = ps.topic_id)) x
          ORDER BY x.challenge_id, x.participant_id) y;


--
-- Name: participant_challenges; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW public.participant_challenges AS
 SELECT DISTINCT p.id,
    cr.challenge_id,
    cr.participant_id,
    c.organizer_id,
    c.status_cd,
    c.challenge,
    c.private_challenge,
    c.description,
    c.rules,
    c.prizes,
    c.resources,
    c.tagline,
    c.image_file,
    c.submission_count,
    c.participant_count,
    c.page_views,
    p.name,
    p.email,
    p.bio,
    p.github,
    p.linkedin,
    p.twitter
   FROM public.participants p,
    public.challenges c,
    public.challenge_registrations cr
  WHERE ((cr.participant_id = p.id) AND (cr.challenge_id = c.id));


--
-- Name: participant_clef_tasks_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.participant_clef_tasks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: participant_clef_tasks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.participant_clef_tasks_id_seq OWNED BY public.participant_clef_tasks.id;


--
-- Name: participant_sign_ups; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW public.participant_sign_ups AS
 SELECT row_number() OVER () AS id,
    count(participants.id) AS count,
    (date_part('month'::text, participants.created_at))::integer AS mnth,
    (date_part('year'::text, participants.created_at))::integer AS yr
   FROM public.participants
  GROUP BY ((date_part('month'::text, participants.created_at))::integer), ((date_part('year'::text, participants.created_at))::integer)
  ORDER BY ((date_part('year'::text, participants.created_at))::integer), ((date_part('month'::text, participants.created_at))::integer);


--
-- Name: submission_files; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.submission_files (
    id integer NOT NULL,
    submission_id integer,
    seq integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    submission_file_s3_key character varying,
    leaderboard_video boolean DEFAULT false
);


--
-- Name: participant_submissions; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW public.participant_submissions AS
 SELECT s.id,
    s.challenge_id,
    s.participant_id,
    p.name,
    s.grading_status_cd,
    s.post_challenge,
    s.score,
    s.score_secondary,
    count(f.*) AS files,
    s.created_at
   FROM public.participants p,
    (public.submissions s
     LEFT JOIN public.submission_files f ON ((f.submission_id = s.id)))
  WHERE (s.participant_id = p.id)
  GROUP BY s.id, s.challenge_id, s.participant_id, p.name, s.grading_status_cd, s.post_challenge, s.score, s.score_secondary, s.created_at
  ORDER BY s.created_at DESC;


--
-- Name: participants_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.participants_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: participants_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.participants_id_seq OWNED BY public.participants.id;


--
-- Name: partners; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.partners (
    id bigint NOT NULL,
    organizer_id bigint,
    image_file character varying,
    visible boolean DEFAULT false,
    seq integer DEFAULT 0,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    name character varying
);


--
-- Name: partners_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.partners_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: partners_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.partners_id_seq OWNED BY public.partners.id;


--
-- Name: previous_leaderboards; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW public.previous_leaderboards AS
 SELECT base_leaderboards.id,
    base_leaderboards.challenge_id,
    base_leaderboards.challenge_round_id,
    base_leaderboards.participant_id,
    base_leaderboards.row_num,
    base_leaderboards.previous_row_num,
    base_leaderboards.slug,
    base_leaderboards.name,
    base_leaderboards.entries,
    base_leaderboards.score,
    base_leaderboards.score_secondary,
    base_leaderboards.media_large,
    base_leaderboards.media_thumbnail,
    base_leaderboards.media_content_type,
    base_leaderboards.description,
    base_leaderboards.description_markdown,
    base_leaderboards.leaderboard_type_cd,
    base_leaderboards.refreshed_at,
    base_leaderboards.created_at,
    base_leaderboards.updated_at,
    base_leaderboards.submission_id,
    base_leaderboards.post_challenge,
    base_leaderboards.seq,
    base_leaderboards.baseline,
    base_leaderboards.baseline_comment
   FROM public.base_leaderboards
  WHERE ((base_leaderboards.leaderboard_type_cd)::text = 'previous'::text);


--
-- Name: previous_ongoing_leaderboards; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW public.previous_ongoing_leaderboards AS
 SELECT base_leaderboards.id,
    base_leaderboards.challenge_id,
    base_leaderboards.challenge_round_id,
    base_leaderboards.participant_id,
    base_leaderboards.row_num,
    base_leaderboards.previous_row_num,
    base_leaderboards.slug,
    base_leaderboards.name,
    base_leaderboards.entries,
    base_leaderboards.score,
    base_leaderboards.score_secondary,
    base_leaderboards.media_large,
    base_leaderboards.media_thumbnail,
    base_leaderboards.media_content_type,
    base_leaderboards.description,
    base_leaderboards.description_markdown,
    base_leaderboards.leaderboard_type_cd,
    base_leaderboards.refreshed_at,
    base_leaderboards.created_at,
    base_leaderboards.updated_at,
    base_leaderboards.submission_id,
    base_leaderboards.post_challenge,
    base_leaderboards.seq,
    base_leaderboards.baseline,
    base_leaderboards.baseline_comment
   FROM public.base_leaderboards
  WHERE ((base_leaderboards.leaderboard_type_cd)::text = 'previous_ongoing'::text);


--
-- Name: sashes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sashes (
    id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: sashes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.sashes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sashes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.sashes_id_seq OWNED BY public.sashes.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


--
-- Name: settings; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.settings (
    id bigint NOT NULL,
    jobs_visible boolean DEFAULT false,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: settings_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.settings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.settings_id_seq OWNED BY public.settings.id;


--
-- Name: submission_comments; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.submission_comments (
    id bigint NOT NULL,
    submission_id bigint,
    participant_id bigint,
    comment_markdown text,
    comment text,
    vote_count integer DEFAULT 0,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: submission_comments_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.submission_comments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: submission_comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.submission_comments_id_seq OWNED BY public.submission_comments.id;


--
-- Name: submission_file_definitions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.submission_file_definitions (
    id integer NOT NULL,
    challenge_id integer,
    seq integer,
    submission_file_description character varying,
    filetype_cd character varying,
    file_required boolean DEFAULT false,
    submission_file_help_text text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: submission_file_definitions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.submission_file_definitions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: submission_file_definitions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.submission_file_definitions_id_seq OWNED BY public.submission_file_definitions.id;


--
-- Name: submission_files_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.submission_files_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: submission_files_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.submission_files_id_seq OWNED BY public.submission_files.id;


--
-- Name: submission_grades; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.submission_grades (
    id integer NOT NULL,
    submission_id integer,
    grading_status_cd character varying,
    grading_message character varying,
    grading_factor double precision,
    score double precision,
    score_secondary double precision,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    slug character varying
);


--
-- Name: submission_grades_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.submission_grades_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: submission_grades_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.submission_grades_id_seq OWNED BY public.submission_grades.id;


--
-- Name: submissions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.submissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: submissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.submissions_id_seq OWNED BY public.submissions.id;


--
-- Name: task_dataset_file_downloads; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.task_dataset_file_downloads (
    id bigint NOT NULL,
    participant_id bigint,
    task_dataset_file_id bigint,
    ip_address character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: task_dataset_file_downloads_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.task_dataset_file_downloads_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: task_dataset_file_downloads_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.task_dataset_file_downloads_id_seq OWNED BY public.task_dataset_file_downloads.id;


--
-- Name: task_dataset_files; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.task_dataset_files (
    id bigint NOT NULL,
    clef_task_id bigint,
    seq integer DEFAULT 0,
    description character varying,
    evaluation boolean DEFAULT false,
    title character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    dataset_file_s3_key character varying
);


--
-- Name: task_dataset_files_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.task_dataset_files_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: task_dataset_files_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.task_dataset_files_id_seq OWNED BY public.task_dataset_files.id;


--
-- Name: topics_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.topics_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: topics_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.topics_id_seq OWNED BY public.topics.id;


--
-- Name: versions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.versions (
    id integer NOT NULL,
    item_type character varying NOT NULL,
    item_id integer NOT NULL,
    event character varying NOT NULL,
    whodunnit character varying,
    object text,
    created_at timestamp without time zone
);


--
-- Name: versions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.versions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: versions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.versions_id_seq OWNED BY public.versions.id;


--
-- Name: votes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.votes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: votes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.votes_id_seq OWNED BY public.votes.id;


--
-- Name: active_admin_comments id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_admin_comments ALTER COLUMN id SET DEFAULT nextval('public.active_admin_comments_id_seq'::regclass);


--
-- Name: active_storage_attachments id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_attachments ALTER COLUMN id SET DEFAULT nextval('public.active_storage_attachments_id_seq'::regclass);


--
-- Name: active_storage_blobs id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_blobs ALTER COLUMN id SET DEFAULT nextval('public.active_storage_blobs_id_seq'::regclass);


--
-- Name: article_sections id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.article_sections ALTER COLUMN id SET DEFAULT nextval('public.article_sections_id_seq'::regclass);


--
-- Name: articles id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.articles ALTER COLUMN id SET DEFAULT nextval('public.articles_id_seq'::regclass);


--
-- Name: badges_sashes id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.badges_sashes ALTER COLUMN id SET DEFAULT nextval('public.badges_sashes_id_seq'::regclass);


--
-- Name: base_leaderboards id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.base_leaderboards ALTER COLUMN id SET DEFAULT nextval('public.base_leaderboards_id_seq'::regclass);


--
-- Name: blogs id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.blogs ALTER COLUMN id SET DEFAULT nextval('public.blogs_id_seq'::regclass);


--
-- Name: challenge_call_responses id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.challenge_call_responses ALTER COLUMN id SET DEFAULT nextval('public.challenge_call_responses_id_seq'::regclass);


--
-- Name: challenge_calls id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.challenge_calls ALTER COLUMN id SET DEFAULT nextval('public.challenge_calls_id_seq'::regclass);


--
-- Name: challenge_participants id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.challenge_participants ALTER COLUMN id SET DEFAULT nextval('public.challenge_participants_id_seq'::regclass);


--
-- Name: challenge_partners id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.challenge_partners ALTER COLUMN id SET DEFAULT nextval('public.challenge_partners_id_seq'::regclass);


--
-- Name: challenge_rounds id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.challenge_rounds ALTER COLUMN id SET DEFAULT nextval('public.challenge_rounds_id_seq'::regclass);


--
-- Name: challenges id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.challenges ALTER COLUMN id SET DEFAULT nextval('public.challenges_id_seq'::regclass);


--
-- Name: clef_tasks id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.clef_tasks ALTER COLUMN id SET DEFAULT nextval('public.clef_tasks_id_seq'::regclass);


--
-- Name: comments id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.comments ALTER COLUMN id SET DEFAULT nextval('public.comments_id_seq'::regclass);


--
-- Name: dataset_file_downloads id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dataset_file_downloads ALTER COLUMN id SET DEFAULT nextval('public.dataset_file_downloads_id_seq'::regclass);


--
-- Name: dataset_files id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dataset_files ALTER COLUMN id SET DEFAULT nextval('public.dataset_files_id_seq'::regclass);


--
-- Name: email_preferences id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.email_preferences ALTER COLUMN id SET DEFAULT nextval('public.email_preferences_id_seq'::regclass);


--
-- Name: email_preferences_tokens id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.email_preferences_tokens ALTER COLUMN id SET DEFAULT nextval('public.email_preferences_tokens_id_seq'::regclass);


--
-- Name: follows id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.follows ALTER COLUMN id SET DEFAULT nextval('public.follows_id_seq'::regclass);


--
-- Name: friendly_id_slugs id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.friendly_id_slugs ALTER COLUMN id SET DEFAULT nextval('public.friendly_id_slugs_id_seq'::regclass);


--
-- Name: invitations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.invitations ALTER COLUMN id SET DEFAULT nextval('public.invitations_id_seq'::regclass);


--
-- Name: job_postings id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.job_postings ALTER COLUMN id SET DEFAULT nextval('public.job_postings_id_seq'::regclass);


--
-- Name: login_activities id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.login_activities ALTER COLUMN id SET DEFAULT nextval('public.login_activities_id_seq'::regclass);


--
-- Name: mandrill_messages id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.mandrill_messages ALTER COLUMN id SET DEFAULT nextval('public.mandrill_messages_id_seq'::regclass);


--
-- Name: merit_actions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.merit_actions ALTER COLUMN id SET DEFAULT nextval('public.merit_actions_id_seq'::regclass);


--
-- Name: merit_activity_logs id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.merit_activity_logs ALTER COLUMN id SET DEFAULT nextval('public.merit_activity_logs_id_seq'::regclass);


--
-- Name: merit_score_points id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.merit_score_points ALTER COLUMN id SET DEFAULT nextval('public.merit_score_points_id_seq'::regclass);


--
-- Name: merit_scores id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.merit_scores ALTER COLUMN id SET DEFAULT nextval('public.merit_scores_id_seq'::regclass);


--
-- Name: notifications id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.notifications ALTER COLUMN id SET DEFAULT nextval('public.notifications_id_seq'::regclass);


--
-- Name: oauth_access_grants id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.oauth_access_grants ALTER COLUMN id SET DEFAULT nextval('public.oauth_access_grants_id_seq'::regclass);


--
-- Name: oauth_access_tokens id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.oauth_access_tokens ALTER COLUMN id SET DEFAULT nextval('public.oauth_access_tokens_id_seq'::regclass);


--
-- Name: oauth_applications id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.oauth_applications ALTER COLUMN id SET DEFAULT nextval('public.oauth_applications_id_seq'::regclass);


--
-- Name: organizer_applications id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.organizer_applications ALTER COLUMN id SET DEFAULT nextval('public.organizer_applications_id_seq'::regclass);


--
-- Name: organizers id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.organizers ALTER COLUMN id SET DEFAULT nextval('public.organizers_id_seq'::regclass);


--
-- Name: participant_clef_tasks id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.participant_clef_tasks ALTER COLUMN id SET DEFAULT nextval('public.participant_clef_tasks_id_seq'::regclass);


--
-- Name: participants id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.participants ALTER COLUMN id SET DEFAULT nextval('public.participants_id_seq'::regclass);


--
-- Name: partners id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.partners ALTER COLUMN id SET DEFAULT nextval('public.partners_id_seq'::regclass);


--
-- Name: sashes id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sashes ALTER COLUMN id SET DEFAULT nextval('public.sashes_id_seq'::regclass);


--
-- Name: settings id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.settings ALTER COLUMN id SET DEFAULT nextval('public.settings_id_seq'::regclass);


--
-- Name: submission_comments id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.submission_comments ALTER COLUMN id SET DEFAULT nextval('public.submission_comments_id_seq'::regclass);


--
-- Name: submission_file_definitions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.submission_file_definitions ALTER COLUMN id SET DEFAULT nextval('public.submission_file_definitions_id_seq'::regclass);


--
-- Name: submission_files id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.submission_files ALTER COLUMN id SET DEFAULT nextval('public.submission_files_id_seq'::regclass);


--
-- Name: submission_grades id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.submission_grades ALTER COLUMN id SET DEFAULT nextval('public.submission_grades_id_seq'::regclass);


--
-- Name: submissions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.submissions ALTER COLUMN id SET DEFAULT nextval('public.submissions_id_seq'::regclass);


--
-- Name: task_dataset_file_downloads id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.task_dataset_file_downloads ALTER COLUMN id SET DEFAULT nextval('public.task_dataset_file_downloads_id_seq'::regclass);


--
-- Name: task_dataset_files id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.task_dataset_files ALTER COLUMN id SET DEFAULT nextval('public.task_dataset_files_id_seq'::regclass);


--
-- Name: topics id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.topics ALTER COLUMN id SET DEFAULT nextval('public.topics_id_seq'::regclass);


--
-- Name: versions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.versions ALTER COLUMN id SET DEFAULT nextval('public.versions_id_seq'::regclass);


--
-- Name: votes id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.votes ALTER COLUMN id SET DEFAULT nextval('public.votes_id_seq'::regclass);


--
-- Name: active_admin_comments active_admin_comments_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_admin_comments
    ADD CONSTRAINT active_admin_comments_pkey PRIMARY KEY (id);


--
-- Name: active_storage_attachments active_storage_attachments_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_attachments
    ADD CONSTRAINT active_storage_attachments_pkey PRIMARY KEY (id);


--
-- Name: active_storage_blobs active_storage_blobs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_blobs
    ADD CONSTRAINT active_storage_blobs_pkey PRIMARY KEY (id);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: article_sections article_sections_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.article_sections
    ADD CONSTRAINT article_sections_pkey PRIMARY KEY (id);


--
-- Name: articles articles_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.articles
    ADD CONSTRAINT articles_pkey PRIMARY KEY (id);


--
-- Name: badges_sashes badges_sashes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.badges_sashes
    ADD CONSTRAINT badges_sashes_pkey PRIMARY KEY (id);


--
-- Name: base_leaderboards base_leaderboards_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.base_leaderboards
    ADD CONSTRAINT base_leaderboards_pkey PRIMARY KEY (id);


--
-- Name: blogs blogs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.blogs
    ADD CONSTRAINT blogs_pkey PRIMARY KEY (id);


--
-- Name: challenge_call_responses challenge_call_responses_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.challenge_call_responses
    ADD CONSTRAINT challenge_call_responses_pkey PRIMARY KEY (id);


--
-- Name: challenge_calls challenge_calls_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.challenge_calls
    ADD CONSTRAINT challenge_calls_pkey PRIMARY KEY (id);


--
-- Name: challenge_participants challenge_participants_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.challenge_participants
    ADD CONSTRAINT challenge_participants_pkey PRIMARY KEY (id);


--
-- Name: challenge_partners challenge_partners_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.challenge_partners
    ADD CONSTRAINT challenge_partners_pkey PRIMARY KEY (id);


--
-- Name: challenge_rounds challenge_rounds_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.challenge_rounds
    ADD CONSTRAINT challenge_rounds_pkey PRIMARY KEY (id);


--
-- Name: challenges challenges_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.challenges
    ADD CONSTRAINT challenges_pkey PRIMARY KEY (id);


--
-- Name: clef_tasks clef_tasks_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.clef_tasks
    ADD CONSTRAINT clef_tasks_pkey PRIMARY KEY (id);


--
-- Name: comments comments_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (id);


--
-- Name: dataset_file_downloads dataset_file_downloads_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dataset_file_downloads
    ADD CONSTRAINT dataset_file_downloads_pkey PRIMARY KEY (id);


--
-- Name: dataset_files dataset_files_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dataset_files
    ADD CONSTRAINT dataset_files_pkey PRIMARY KEY (id);


--
-- Name: email_preferences email_preferences_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.email_preferences
    ADD CONSTRAINT email_preferences_pkey PRIMARY KEY (id);


--
-- Name: email_preferences_tokens email_preferences_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.email_preferences_tokens
    ADD CONSTRAINT email_preferences_tokens_pkey PRIMARY KEY (id);


--
-- Name: follows follows_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.follows
    ADD CONSTRAINT follows_pkey PRIMARY KEY (id);


--
-- Name: friendly_id_slugs friendly_id_slugs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.friendly_id_slugs
    ADD CONSTRAINT friendly_id_slugs_pkey PRIMARY KEY (id);


--
-- Name: invitations invitations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.invitations
    ADD CONSTRAINT invitations_pkey PRIMARY KEY (id);


--
-- Name: job_postings job_postings_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.job_postings
    ADD CONSTRAINT job_postings_pkey PRIMARY KEY (id);


--
-- Name: login_activities login_activities_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.login_activities
    ADD CONSTRAINT login_activities_pkey PRIMARY KEY (id);


--
-- Name: mandrill_messages mandrill_messages_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.mandrill_messages
    ADD CONSTRAINT mandrill_messages_pkey PRIMARY KEY (id);


--
-- Name: merit_actions merit_actions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.merit_actions
    ADD CONSTRAINT merit_actions_pkey PRIMARY KEY (id);


--
-- Name: merit_activity_logs merit_activity_logs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.merit_activity_logs
    ADD CONSTRAINT merit_activity_logs_pkey PRIMARY KEY (id);


--
-- Name: merit_score_points merit_score_points_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.merit_score_points
    ADD CONSTRAINT merit_score_points_pkey PRIMARY KEY (id);


--
-- Name: merit_scores merit_scores_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.merit_scores
    ADD CONSTRAINT merit_scores_pkey PRIMARY KEY (id);


--
-- Name: notifications notifications_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.notifications
    ADD CONSTRAINT notifications_pkey PRIMARY KEY (id);


--
-- Name: oauth_access_grants oauth_access_grants_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.oauth_access_grants
    ADD CONSTRAINT oauth_access_grants_pkey PRIMARY KEY (id);


--
-- Name: oauth_access_tokens oauth_access_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.oauth_access_tokens
    ADD CONSTRAINT oauth_access_tokens_pkey PRIMARY KEY (id);


--
-- Name: oauth_applications oauth_applications_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.oauth_applications
    ADD CONSTRAINT oauth_applications_pkey PRIMARY KEY (id);


--
-- Name: organizer_applications organizer_applications_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.organizer_applications
    ADD CONSTRAINT organizer_applications_pkey PRIMARY KEY (id);


--
-- Name: organizers organizers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.organizers
    ADD CONSTRAINT organizers_pkey PRIMARY KEY (id);


--
-- Name: participant_clef_tasks participant_clef_tasks_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.participant_clef_tasks
    ADD CONSTRAINT participant_clef_tasks_pkey PRIMARY KEY (id);


--
-- Name: participants participants_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.participants
    ADD CONSTRAINT participants_pkey PRIMARY KEY (id);


--
-- Name: partners partners_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.partners
    ADD CONSTRAINT partners_pkey PRIMARY KEY (id);


--
-- Name: sashes sashes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sashes
    ADD CONSTRAINT sashes_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: settings settings_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.settings
    ADD CONSTRAINT settings_pkey PRIMARY KEY (id);


--
-- Name: submission_comments submission_comments_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.submission_comments
    ADD CONSTRAINT submission_comments_pkey PRIMARY KEY (id);


--
-- Name: submission_file_definitions submission_file_definitions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.submission_file_definitions
    ADD CONSTRAINT submission_file_definitions_pkey PRIMARY KEY (id);


--
-- Name: submission_files submission_files_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.submission_files
    ADD CONSTRAINT submission_files_pkey PRIMARY KEY (id);


--
-- Name: submission_grades submission_grades_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.submission_grades
    ADD CONSTRAINT submission_grades_pkey PRIMARY KEY (id);


--
-- Name: submissions submissions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.submissions
    ADD CONSTRAINT submissions_pkey PRIMARY KEY (id);


--
-- Name: task_dataset_file_downloads task_dataset_file_downloads_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.task_dataset_file_downloads
    ADD CONSTRAINT task_dataset_file_downloads_pkey PRIMARY KEY (id);


--
-- Name: task_dataset_files task_dataset_files_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.task_dataset_files
    ADD CONSTRAINT task_dataset_files_pkey PRIMARY KEY (id);


--
-- Name: topics topics_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.topics
    ADD CONSTRAINT topics_pkey PRIMARY KEY (id);


--
-- Name: versions versions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.versions
    ADD CONSTRAINT versions_pkey PRIMARY KEY (id);


--
-- Name: votes votes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.votes
    ADD CONSTRAINT votes_pkey PRIMARY KEY (id);


--
-- Name: index_active_admin_comments_on_author_type_and_author_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_active_admin_comments_on_author_type_and_author_id ON public.active_admin_comments USING btree (author_type, author_id);


--
-- Name: index_active_admin_comments_on_namespace; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_active_admin_comments_on_namespace ON public.active_admin_comments USING btree (namespace);


--
-- Name: index_active_admin_comments_on_resource_type_and_resource_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_active_admin_comments_on_resource_type_and_resource_id ON public.active_admin_comments USING btree (resource_type, resource_id);


--
-- Name: index_active_storage_attachments_on_blob_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_active_storage_attachments_on_blob_id ON public.active_storage_attachments USING btree (blob_id);


--
-- Name: index_active_storage_attachments_uniqueness; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_active_storage_attachments_uniqueness ON public.active_storage_attachments USING btree (record_type, record_id, name, blob_id);


--
-- Name: index_active_storage_blobs_on_key; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_active_storage_blobs_on_key ON public.active_storage_blobs USING btree (key);


--
-- Name: index_article_sections_on_article_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_article_sections_on_article_id ON public.article_sections USING btree (article_id);


--
-- Name: index_article_sections_on_slug; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_article_sections_on_slug ON public.article_sections USING btree (slug);


--
-- Name: index_articles_on_participant_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_articles_on_participant_id ON public.articles USING btree (participant_id);


--
-- Name: index_articles_on_slug; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_articles_on_slug ON public.articles USING btree (slug);


--
-- Name: index_badges_sashes_on_badge_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_badges_sashes_on_badge_id ON public.badges_sashes USING btree (badge_id);


--
-- Name: index_badges_sashes_on_badge_id_and_sash_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_badges_sashes_on_badge_id_and_sash_id ON public.badges_sashes USING btree (badge_id, sash_id);


--
-- Name: index_badges_sashes_on_sash_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_badges_sashes_on_sash_id ON public.badges_sashes USING btree (sash_id);


--
-- Name: index_base_leaderboards_on_challenge_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_base_leaderboards_on_challenge_id ON public.base_leaderboards USING btree (challenge_id);


--
-- Name: index_base_leaderboards_on_challenge_round_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_base_leaderboards_on_challenge_round_id ON public.base_leaderboards USING btree (challenge_round_id);


--
-- Name: index_base_leaderboards_on_leaderboard_type_cd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_base_leaderboards_on_leaderboard_type_cd ON public.base_leaderboards USING btree (leaderboard_type_cd);


--
-- Name: index_base_leaderboards_on_participant_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_base_leaderboards_on_participant_id ON public.base_leaderboards USING btree (participant_id);


--
-- Name: index_blogs_on_participant_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_blogs_on_participant_id ON public.blogs USING btree (participant_id);


--
-- Name: index_challenge_call_responses_on_challenge_call_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_challenge_call_responses_on_challenge_call_id ON public.challenge_call_responses USING btree (challenge_call_id);


--
-- Name: index_challenge_calls_on_organizer_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_challenge_calls_on_organizer_id ON public.challenge_calls USING btree (organizer_id);


--
-- Name: index_challenge_participants_on_challenge_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_challenge_participants_on_challenge_id ON public.challenge_participants USING btree (challenge_id);


--
-- Name: index_challenge_participants_on_participant_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_challenge_participants_on_participant_id ON public.challenge_participants USING btree (participant_id);


--
-- Name: index_challenge_partners_on_challenge_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_challenge_partners_on_challenge_id ON public.challenge_partners USING btree (challenge_id);


--
-- Name: index_challenge_rounds_on_challenge_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_challenge_rounds_on_challenge_id ON public.challenge_rounds USING btree (challenge_id);


--
-- Name: index_challenges_on_clef_task_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_challenges_on_clef_task_id ON public.challenges USING btree (clef_task_id);


--
-- Name: index_challenges_on_organizer_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_challenges_on_organizer_id ON public.challenges USING btree (organizer_id);


--
-- Name: index_challenges_on_slug; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_challenges_on_slug ON public.challenges USING btree (slug);


--
-- Name: index_clef_tasks_on_organizer_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_clef_tasks_on_organizer_id ON public.clef_tasks USING btree (organizer_id);


--
-- Name: index_dataset_file_downloads_on_dataset_file_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_dataset_file_downloads_on_dataset_file_id ON public.dataset_file_downloads USING btree (dataset_file_id);


--
-- Name: index_dataset_file_downloads_on_participant_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_dataset_file_downloads_on_participant_id ON public.dataset_file_downloads USING btree (participant_id);


--
-- Name: index_dataset_files_on_challenge_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_dataset_files_on_challenge_id ON public.dataset_files USING btree (challenge_id);


--
-- Name: index_email_preferences_on_participant_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_email_preferences_on_participant_id ON public.email_preferences USING btree (participant_id);


--
-- Name: index_email_preferences_tokens_on_participant_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_email_preferences_tokens_on_participant_id ON public.email_preferences_tokens USING btree (participant_id);


--
-- Name: index_follows_on_followable_id_and_followable_type; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_follows_on_followable_id_and_followable_type ON public.follows USING btree (followable_id, followable_type);


--
-- Name: index_follows_on_participant_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_follows_on_participant_id ON public.follows USING btree (participant_id);


--
-- Name: index_friendly_id_slugs_on_slug_and_sluggable_type; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_friendly_id_slugs_on_slug_and_sluggable_type ON public.friendly_id_slugs USING btree (slug, sluggable_type);


--
-- Name: index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope ON public.friendly_id_slugs USING btree (slug, sluggable_type, scope);


--
-- Name: index_friendly_id_slugs_on_sluggable_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_friendly_id_slugs_on_sluggable_id ON public.friendly_id_slugs USING btree (sluggable_id);


--
-- Name: index_friendly_id_slugs_on_sluggable_type; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_friendly_id_slugs_on_sluggable_type ON public.friendly_id_slugs USING btree (sluggable_type);


--
-- Name: index_invitations_on_challenge_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_invitations_on_challenge_id ON public.invitations USING btree (challenge_id);


--
-- Name: index_invitations_on_participant_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_invitations_on_participant_id ON public.invitations USING btree (participant_id);


--
-- Name: index_login_activities_on_identity; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_login_activities_on_identity ON public.login_activities USING btree (identity);


--
-- Name: index_login_activities_on_ip; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_login_activities_on_ip ON public.login_activities USING btree (ip);


--
-- Name: index_login_activities_on_user_type_and_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_login_activities_on_user_type_and_user_id ON public.login_activities USING btree (user_type, user_id);


--
-- Name: index_merit_score_points_on_score_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_merit_score_points_on_score_id ON public.merit_score_points USING btree (score_id);


--
-- Name: index_merit_scores_on_sash_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_merit_scores_on_sash_id ON public.merit_scores USING btree (sash_id);


--
-- Name: index_notifications_on_notifiable_type_and_notifiable_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_notifications_on_notifiable_type_and_notifiable_id ON public.notifications USING btree (notifiable_type, notifiable_id);


--
-- Name: index_notifications_on_participant_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_notifications_on_participant_id ON public.notifications USING btree (participant_id);


--
-- Name: index_oauth_access_grants_on_application_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_oauth_access_grants_on_application_id ON public.oauth_access_grants USING btree (application_id);


--
-- Name: index_oauth_access_grants_on_token; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_oauth_access_grants_on_token ON public.oauth_access_grants USING btree (token);


--
-- Name: index_oauth_access_tokens_on_application_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_oauth_access_tokens_on_application_id ON public.oauth_access_tokens USING btree (application_id);


--
-- Name: index_oauth_access_tokens_on_refresh_token; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_oauth_access_tokens_on_refresh_token ON public.oauth_access_tokens USING btree (refresh_token);


--
-- Name: index_oauth_access_tokens_on_resource_owner_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_oauth_access_tokens_on_resource_owner_id ON public.oauth_access_tokens USING btree (resource_owner_id);


--
-- Name: index_oauth_access_tokens_on_token; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_oauth_access_tokens_on_token ON public.oauth_access_tokens USING btree (token);


--
-- Name: index_oauth_applications_on_uid; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_oauth_applications_on_uid ON public.oauth_applications USING btree (uid);


--
-- Name: index_organizers_on_slug; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_organizers_on_slug ON public.organizers USING btree (slug);


--
-- Name: index_participant_clef_tasks_on_clef_task_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_participant_clef_tasks_on_clef_task_id ON public.participant_clef_tasks USING btree (clef_task_id);


--
-- Name: index_participant_clef_tasks_on_participant_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_participant_clef_tasks_on_participant_id ON public.participant_clef_tasks USING btree (participant_id);


--
-- Name: index_participants_on_confirmation_token; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_participants_on_confirmation_token ON public.participants USING btree (confirmation_token);


--
-- Name: index_participants_on_email; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_participants_on_email ON public.participants USING btree (email);


--
-- Name: index_participants_on_organizer_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_participants_on_organizer_id ON public.participants USING btree (organizer_id);


--
-- Name: index_participants_on_reset_password_token; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_participants_on_reset_password_token ON public.participants USING btree (reset_password_token);


--
-- Name: index_participants_on_slug; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_participants_on_slug ON public.participants USING btree (slug);


--
-- Name: index_participants_on_unlock_token; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_participants_on_unlock_token ON public.participants USING btree (unlock_token);


--
-- Name: index_partners_on_organizer_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_partners_on_organizer_id ON public.partners USING btree (organizer_id);


--
-- Name: index_posts_on_participant_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_posts_on_participant_id ON public.comments USING btree (participant_id);


--
-- Name: index_posts_on_slug; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_posts_on_slug ON public.comments USING btree (slug);


--
-- Name: index_posts_on_topic_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_posts_on_topic_id ON public.comments USING btree (topic_id);


--
-- Name: index_submission_comments_on_participant_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_submission_comments_on_participant_id ON public.submission_comments USING btree (participant_id);


--
-- Name: index_submission_comments_on_submission_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_submission_comments_on_submission_id ON public.submission_comments USING btree (submission_id);


--
-- Name: index_submission_file_definitions_on_challenge_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_submission_file_definitions_on_challenge_id ON public.submission_file_definitions USING btree (challenge_id);


--
-- Name: index_submission_files_on_submission_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_submission_files_on_submission_id ON public.submission_files USING btree (submission_id);


--
-- Name: index_submission_grades_on_slug; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_submission_grades_on_slug ON public.submission_grades USING btree (slug);


--
-- Name: index_submission_grades_on_submission_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_submission_grades_on_submission_id ON public.submission_grades USING btree (submission_id);


--
-- Name: index_submissions_on_challenge_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_submissions_on_challenge_id ON public.submissions USING btree (challenge_id);


--
-- Name: index_submissions_on_challenge_round_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_submissions_on_challenge_round_id ON public.submissions USING btree (challenge_round_id);


--
-- Name: index_submissions_on_participant_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_submissions_on_participant_id ON public.submissions USING btree (participant_id);


--
-- Name: index_task_dataset_file_downloads_on_participant_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_task_dataset_file_downloads_on_participant_id ON public.task_dataset_file_downloads USING btree (participant_id);


--
-- Name: index_task_dataset_file_downloads_on_task_dataset_file_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_task_dataset_file_downloads_on_task_dataset_file_id ON public.task_dataset_file_downloads USING btree (task_dataset_file_id);


--
-- Name: index_task_dataset_files_on_clef_task_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_task_dataset_files_on_clef_task_id ON public.task_dataset_files USING btree (clef_task_id);


--
-- Name: index_topics_on_challenge_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_topics_on_challenge_id ON public.topics USING btree (challenge_id);


--
-- Name: index_topics_on_participant_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_topics_on_participant_id ON public.topics USING btree (participant_id);


--
-- Name: index_topics_on_slug; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_topics_on_slug ON public.topics USING btree (slug);


--
-- Name: index_versions_on_item_type_and_item_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_versions_on_item_type_and_item_id ON public.versions USING btree (item_type, item_id);


--
-- Name: index_votes_on_participant_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_votes_on_participant_id ON public.votes USING btree (participant_id);


--
-- Name: index_votes_on_votable_id_and_votable_type; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_votes_on_votable_id_and_votable_type ON public.votes USING btree (votable_id, votable_type);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX unique_schema_migrations ON public.schema_migrations USING btree (version);


--
-- Name: follows fk_rails_083110362d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.follows
    ADD CONSTRAINT fk_rails_083110362d FOREIGN KEY (participant_id) REFERENCES public.participants(id);


--
-- Name: challenges fk_rails_0bdc80d25a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.challenges
    ADD CONSTRAINT fk_rails_0bdc80d25a FOREIGN KEY (organizer_id) REFERENCES public.organizers(id);


--
-- Name: submission_comments fk_rails_0cca7f1218; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.submission_comments
    ADD CONSTRAINT fk_rails_0cca7f1218 FOREIGN KEY (participant_id) REFERENCES public.participants(id);


--
-- Name: submissions fk_rails_182329c489; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.submissions
    ADD CONSTRAINT fk_rails_182329c489 FOREIGN KEY (participant_id) REFERENCES public.participants(id);


--
-- Name: topics fk_rails_2d21c274d1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.topics
    ADD CONSTRAINT fk_rails_2d21c274d1 FOREIGN KEY (challenge_id) REFERENCES public.challenges(id);


--
-- Name: article_sections fk_rails_2f1fa44b2d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.article_sections
    ADD CONSTRAINT fk_rails_2f1fa44b2d FOREIGN KEY (article_id) REFERENCES public.articles(id);


--
-- Name: comments fk_rails_30b8c1c680; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT fk_rails_30b8c1c680 FOREIGN KEY (participant_id) REFERENCES public.participants(id);


--
-- Name: challenge_partners fk_rails_3d7aaf3ff9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.challenge_partners
    ADD CONSTRAINT fk_rails_3d7aaf3ff9 FOREIGN KEY (challenge_id) REFERENCES public.challenges(id);


--
-- Name: base_leaderboards fk_rails_3fd0c70c35; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.base_leaderboards
    ADD CONSTRAINT fk_rails_3fd0c70c35 FOREIGN KEY (challenge_round_id) REFERENCES public.challenge_rounds(id);


--
-- Name: base_leaderboards fk_rails_44e759267b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.base_leaderboards
    ADD CONSTRAINT fk_rails_44e759267b FOREIGN KEY (challenge_id) REFERENCES public.challenges(id);


--
-- Name: challenge_rounds fk_rails_58f957502d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.challenge_rounds
    ADD CONSTRAINT fk_rails_58f957502d FOREIGN KEY (challenge_id) REFERENCES public.challenges(id);


--
-- Name: submissions fk_rails_62fce1582b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.submissions
    ADD CONSTRAINT fk_rails_62fce1582b FOREIGN KEY (challenge_id) REFERENCES public.challenges(id);


--
-- Name: email_preferences fk_rails_6712e930b2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.email_preferences
    ADD CONSTRAINT fk_rails_6712e930b2 FOREIGN KEY (participant_id) REFERENCES public.participants(id);


--
-- Name: dataset_file_downloads fk_rails_69796846aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dataset_file_downloads
    ADD CONSTRAINT fk_rails_69796846aa FOREIGN KEY (dataset_file_id) REFERENCES public.dataset_files(id);


--
-- Name: participant_clef_tasks fk_rails_6b197e3111; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.participant_clef_tasks
    ADD CONSTRAINT fk_rails_6b197e3111 FOREIGN KEY (clef_task_id) REFERENCES public.clef_tasks(id);


--
-- Name: comments fk_rails_70d0b6486a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT fk_rails_70d0b6486a FOREIGN KEY (topic_id) REFERENCES public.topics(id);


--
-- Name: oauth_access_tokens fk_rails_732cb83ab7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.oauth_access_tokens
    ADD CONSTRAINT fk_rails_732cb83ab7 FOREIGN KEY (application_id) REFERENCES public.oauth_applications(id);


--
-- Name: clef_tasks fk_rails_7660c1d17b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.clef_tasks
    ADD CONSTRAINT fk_rails_7660c1d17b FOREIGN KEY (organizer_id) REFERENCES public.organizers(id);


--
-- Name: comments fk_rails_7b51c0b3c1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT fk_rails_7b51c0b3c1 FOREIGN KEY (topic_id) REFERENCES public.topics(id);


--
-- Name: votes fk_rails_7d535390f0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.votes
    ADD CONSTRAINT fk_rails_7d535390f0 FOREIGN KEY (participant_id) REFERENCES public.participants(id);


--
-- Name: base_leaderboards fk_rails_7d7e1d7b57; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.base_leaderboards
    ADD CONSTRAINT fk_rails_7d7e1d7b57 FOREIGN KEY (participant_id) REFERENCES public.participants(id);


--
-- Name: challenge_participants fk_rails_7fd31647c0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.challenge_participants
    ADD CONSTRAINT fk_rails_7fd31647c0 FOREIGN KEY (challenge_id) REFERENCES public.challenges(id);


--
-- Name: submission_grades fk_rails_8198fbcfd9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.submission_grades
    ADD CONSTRAINT fk_rails_8198fbcfd9 FOREIGN KEY (submission_id) REFERENCES public.submissions(id);


--
-- Name: dataset_file_downloads fk_rails_9eb5d4b472; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dataset_file_downloads
    ADD CONSTRAINT fk_rails_9eb5d4b472 FOREIGN KEY (dataset_file_id) REFERENCES public.dataset_files(id);


--
-- Name: challenge_call_responses fk_rails_a24ea39882; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.challenge_call_responses
    ADD CONSTRAINT fk_rails_a24ea39882 FOREIGN KEY (challenge_call_id) REFERENCES public.challenge_calls(id);


--
-- Name: invitations fk_rails_a4a4e9d2a4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.invitations
    ADD CONSTRAINT fk_rails_a4a4e9d2a4 FOREIGN KEY (participant_id) REFERENCES public.participants(id);


--
-- Name: participants fk_rails_a4e41c0c05; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.participants
    ADD CONSTRAINT fk_rails_a4e41c0c05 FOREIGN KEY (organizer_id) REFERENCES public.organizers(id);


--
-- Name: base_leaderboards fk_rails_a63256485e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.base_leaderboards
    ADD CONSTRAINT fk_rails_a63256485e FOREIGN KEY (participant_id) REFERENCES public.participants(id);


--
-- Name: submission_file_definitions fk_rails_a801f5516c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.submission_file_definitions
    ADD CONSTRAINT fk_rails_a801f5516c FOREIGN KEY (challenge_id) REFERENCES public.challenges(id);


--
-- Name: articles fk_rails_a80d056f19; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.articles
    ADD CONSTRAINT fk_rails_a80d056f19 FOREIGN KEY (participant_id) REFERENCES public.participants(id);


--
-- Name: partners fk_rails_ac4a29ffd1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.partners
    ADD CONSTRAINT fk_rails_ac4a29ffd1 FOREIGN KEY (organizer_id) REFERENCES public.organizers(id);


--
-- Name: oauth_access_grants fk_rails_b4b53e07b8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.oauth_access_grants
    ADD CONSTRAINT fk_rails_b4b53e07b8 FOREIGN KEY (application_id) REFERENCES public.oauth_applications(id);


--
-- Name: challenge_rounds fk_rails_b8ef780193; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.challenge_rounds
    ADD CONSTRAINT fk_rails_b8ef780193 FOREIGN KEY (challenge_id) REFERENCES public.challenges(id);


--
-- Name: topics fk_rails_b8f223b308; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.topics
    ADD CONSTRAINT fk_rails_b8f223b308 FOREIGN KEY (participant_id) REFERENCES public.participants(id);


--
-- Name: invitations fk_rails_c2309c24bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.invitations
    ADD CONSTRAINT fk_rails_c2309c24bd FOREIGN KEY (challenge_id) REFERENCES public.challenges(id);


--
-- Name: dataset_file_downloads fk_rails_c485aee385; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dataset_file_downloads
    ADD CONSTRAINT fk_rails_c485aee385 FOREIGN KEY (participant_id) REFERENCES public.participants(id);


--
-- Name: submission_files fk_rails_d1aca45f2f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.submission_files
    ADD CONSTRAINT fk_rails_d1aca45f2f FOREIGN KEY (submission_id) REFERENCES public.submissions(id);


--
-- Name: challenge_participants fk_rails_d8df5b8654; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.challenge_participants
    ADD CONSTRAINT fk_rails_d8df5b8654 FOREIGN KEY (participant_id) REFERENCES public.participants(id);


--
-- Name: comments fk_rails_db8b8e9fe8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT fk_rails_db8b8e9fe8 FOREIGN KEY (participant_id) REFERENCES public.participants(id);


--
-- Name: task_dataset_files fk_rails_e29a2cbc72; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.task_dataset_files
    ADD CONSTRAINT fk_rails_e29a2cbc72 FOREIGN KEY (clef_task_id) REFERENCES public.clef_tasks(id);


--
-- Name: submission_comments fk_rails_e4ff9f0115; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.submission_comments
    ADD CONSTRAINT fk_rails_e4ff9f0115 FOREIGN KEY (submission_id) REFERENCES public.submissions(id);


--
-- Name: participant_clef_tasks fk_rails_e84c24dfaa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.participant_clef_tasks
    ADD CONSTRAINT fk_rails_e84c24dfaa FOREIGN KEY (participant_id) REFERENCES public.participants(id);


--
-- Name: base_leaderboards fk_rails_f20ff50e17; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.base_leaderboards
    ADD CONSTRAINT fk_rails_f20ff50e17 FOREIGN KEY (challenge_id) REFERENCES public.challenges(id);


--
-- Name: task_dataset_files fk_rails_f90572ee46; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.task_dataset_files
    ADD CONSTRAINT fk_rails_f90572ee46 FOREIGN KEY (clef_task_id) REFERENCES public.clef_tasks(id);


--
-- Name: blogs fk_rails_f9e0464b78; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.blogs
    ADD CONSTRAINT fk_rails_f9e0464b78 FOREIGN KEY (participant_id) REFERENCES public.participants(id);


--
-- Name: dataset_file_downloads fk_rails_fa0b04a034; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.dataset_file_downloads
    ADD CONSTRAINT fk_rails_fa0b04a034 FOREIGN KEY (participant_id) REFERENCES public.participants(id);


--
-- Name: base_leaderboards fk_rails_fda7e7aa4d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.base_leaderboards
    ADD CONSTRAINT fk_rails_fda7e7aa4d FOREIGN KEY (challenge_round_id) REFERENCES public.challenge_rounds(id);


--
-- Name: notifications fk_rails_fea941547a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.notifications
    ADD CONSTRAINT fk_rails_fea941547a FOREIGN KEY (participant_id) REFERENCES public.participants(id);


--
-- PostgreSQL database dump complete
--

SET search_path TO "$user", public;

INSERT INTO "schema_migrations" (version) VALUES
('20180827110235'),
('20180827145811'),
('20180914093818'),
('20180914101925'),
('20180914101940'),
('20181005130752'),
('20181005132446'),
('20181023161118'),
('20181025120952'),
('20181030210046'),
('20181030211035'),
('20181030213518'),
('20181030221452');


