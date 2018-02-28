--
-- PostgreSQL database dump
--

-- Dumped from database version 10.1
-- Dumped by pg_dump version 10.1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: jacklee
--

CREATE TABLE ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE ar_internal_metadata OWNER TO jacklee;

--
-- Name: ckeditor_assets; Type: TABLE; Schema: public; Owner: jacklee
--

CREATE TABLE ckeditor_assets (
    id bigint NOT NULL,
    data_id character varying NOT NULL,
    data_filename character varying NOT NULL,
    data_size integer,
    data_content_type character varying,
    type character varying(30),
    width integer,
    height integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE ckeditor_assets OWNER TO jacklee;

--
-- Name: ckeditor_assets_id_seq; Type: SEQUENCE; Schema: public; Owner: jacklee
--

CREATE SEQUENCE ckeditor_assets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ckeditor_assets_id_seq OWNER TO jacklee;

--
-- Name: ckeditor_assets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jacklee
--

ALTER SEQUENCE ckeditor_assets_id_seq OWNED BY ckeditor_assets.id;


--
-- Name: comments; Type: TABLE; Schema: public; Owner: jacklee
--

CREATE TABLE comments (
    id bigint NOT NULL,
    body text,
    commentable_type character varying,
    commentable_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    user_id bigint
);


ALTER TABLE comments OWNER TO jacklee;

--
-- Name: comments_id_seq; Type: SEQUENCE; Schema: public; Owner: jacklee
--

CREATE SEQUENCE comments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE comments_id_seq OWNER TO jacklee;

--
-- Name: comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jacklee
--

ALTER SEQUENCE comments_id_seq OWNED BY comments.id;


--
-- Name: friendly_id_slugs; Type: TABLE; Schema: public; Owner: jacklee
--

CREATE TABLE friendly_id_slugs (
    id bigint NOT NULL,
    slug character varying NOT NULL,
    sluggable_id integer NOT NULL,
    sluggable_type character varying(50),
    scope character varying,
    created_at timestamp without time zone
);


ALTER TABLE friendly_id_slugs OWNER TO jacklee;

--
-- Name: friendly_id_slugs_id_seq; Type: SEQUENCE; Schema: public; Owner: jacklee
--

CREATE SEQUENCE friendly_id_slugs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE friendly_id_slugs_id_seq OWNER TO jacklee;

--
-- Name: friendly_id_slugs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jacklee
--

ALTER SEQUENCE friendly_id_slugs_id_seq OWNED BY friendly_id_slugs.id;


--
-- Name: likes; Type: TABLE; Schema: public; Owner: jacklee
--

CREATE TABLE likes (
    id bigint NOT NULL,
    likeable_type character varying,
    likeable_id bigint,
    user_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE likes OWNER TO jacklee;

--
-- Name: likes_id_seq; Type: SEQUENCE; Schema: public; Owner: jacklee
--

CREATE SEQUENCE likes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE likes_id_seq OWNER TO jacklee;

--
-- Name: likes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jacklee
--

ALTER SEQUENCE likes_id_seq OWNED BY likes.id;


--
-- Name: media; Type: TABLE; Schema: public; Owner: jacklee
--

CREATE TABLE media (
    id bigint NOT NULL,
    title character varying,
    description text,
    user_id bigint,
    attachment_file_id character varying,
    attachment_file_filename character varying,
    attachment_file_content_type character varying,
    attachment_file_size character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    is_video boolean DEFAULT false NOT NULL,
    is_image boolean DEFAULT false NOT NULL,
    is_audio boolean DEFAULT false NOT NULL,
    post_id bigint
);


ALTER TABLE media OWNER TO jacklee;

--
-- Name: media_id_seq; Type: SEQUENCE; Schema: public; Owner: jacklee
--

CREATE SEQUENCE media_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE media_id_seq OWNER TO jacklee;

--
-- Name: media_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jacklee
--

ALTER SEQUENCE media_id_seq OWNED BY media.id;


--
-- Name: posts; Type: TABLE; Schema: public; Owner: jacklee
--

CREATE TABLE posts (
    id bigint NOT NULL,
    title character varying,
    body text,
    published boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    user_id bigint
);


ALTER TABLE posts OWNER TO jacklee;

--
-- Name: posts_id_seq; Type: SEQUENCE; Schema: public; Owner: jacklee
--

CREATE SEQUENCE posts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE posts_id_seq OWNER TO jacklee;

--
-- Name: posts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jacklee
--

ALTER SEQUENCE posts_id_seq OWNED BY posts.id;


--
-- Name: references; Type: TABLE; Schema: public; Owner: jacklee
--

CREATE TABLE "references" (
    id bigint NOT NULL,
    body character varying,
    url character varying,
    doi character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    referenceable_type character varying,
    referenceable_id bigint
);


ALTER TABLE "references" OWNER TO jacklee;

--
-- Name: references_id_seq; Type: SEQUENCE; Schema: public; Owner: jacklee
--

CREATE SEQUENCE references_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE references_id_seq OWNER TO jacklee;

--
-- Name: references_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jacklee
--

ALTER SEQUENCE references_id_seq OWNED BY "references".id;


--
-- Name: relationships; Type: TABLE; Schema: public; Owner: jacklee
--

CREATE TABLE relationships (
    id bigint NOT NULL,
    follower_id integer,
    followed_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE relationships OWNER TO jacklee;

--
-- Name: relationships_id_seq; Type: SEQUENCE; Schema: public; Owner: jacklee
--

CREATE SEQUENCE relationships_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE relationships_id_seq OWNER TO jacklee;

--
-- Name: relationships_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jacklee
--

ALTER SEQUENCE relationships_id_seq OWNED BY relationships.id;


--
-- Name: reviewlists; Type: TABLE; Schema: public; Owner: jacklee
--

CREATE TABLE reviewlists (
    id bigint NOT NULL,
    user_id bigint,
    reviewable_type character varying,
    reviewable_id bigint,
    start_date timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    "position" integer
);


ALTER TABLE reviewlists OWNER TO jacklee;

--
-- Name: reviewlists_id_seq; Type: SEQUENCE; Schema: public; Owner: jacklee
--

CREATE SEQUENCE reviewlists_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE reviewlists_id_seq OWNER TO jacklee;

--
-- Name: reviewlists_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jacklee
--

ALTER SEQUENCE reviewlists_id_seq OWNED BY reviewlists.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: jacklee
--

CREATE TABLE schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE schema_migrations OWNER TO jacklee;

--
-- Name: taggings; Type: TABLE; Schema: public; Owner: jacklee
--

CREATE TABLE taggings (
    id bigint NOT NULL,
    tag_id bigint,
    taggable_type character varying,
    taggable_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE taggings OWNER TO jacklee;

--
-- Name: taggings_id_seq; Type: SEQUENCE; Schema: public; Owner: jacklee
--

CREATE SEQUENCE taggings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE taggings_id_seq OWNER TO jacklee;

--
-- Name: taggings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jacklee
--

ALTER SEQUENCE taggings_id_seq OWNED BY taggings.id;


--
-- Name: tags; Type: TABLE; Schema: public; Owner: jacklee
--

CREATE TABLE tags (
    id bigint NOT NULL,
    name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE tags OWNER TO jacklee;

--
-- Name: tags_id_seq; Type: SEQUENCE; Schema: public; Owner: jacklee
--

CREATE SEQUENCE tags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tags_id_seq OWNER TO jacklee;

--
-- Name: tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jacklee
--

ALTER SEQUENCE tags_id_seq OWNED BY tags.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: jacklee
--

CREATE TABLE users (
    id bigint NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0 NOT NULL,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip inet,
    last_sign_in_ip inet,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    provider character varying,
    uid character varying,
    first_name character varying,
    last_name character varying,
    api_key character varying,
    user_id bigint,
    profile_image_id character varying,
    profile_image_filename character varying,
    profile_image_size character varying,
    profile_image_content_type character varying,
    slug character varying,
    location character varying,
    latitude double precision,
    longitude double precision,
    default_image character varying,
    is_admin boolean DEFAULT false
);


ALTER TABLE users OWNER TO jacklee;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: jacklee
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE users_id_seq OWNER TO jacklee;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jacklee
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: votes; Type: TABLE; Schema: public; Owner: jacklee
--

CREATE TABLE votes (
    id bigint NOT NULL,
    user_id bigint,
    comment_id bigint,
    is_up boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE votes OWNER TO jacklee;

--
-- Name: votes_id_seq; Type: SEQUENCE; Schema: public; Owner: jacklee
--

CREATE SEQUENCE votes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE votes_id_seq OWNER TO jacklee;

--
-- Name: votes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jacklee
--

ALTER SEQUENCE votes_id_seq OWNED BY votes.id;


--
-- Name: ckeditor_assets id; Type: DEFAULT; Schema: public; Owner: jacklee
--

ALTER TABLE ONLY ckeditor_assets ALTER COLUMN id SET DEFAULT nextval('ckeditor_assets_id_seq'::regclass);


--
-- Name: comments id; Type: DEFAULT; Schema: public; Owner: jacklee
--

ALTER TABLE ONLY comments ALTER COLUMN id SET DEFAULT nextval('comments_id_seq'::regclass);


--
-- Name: friendly_id_slugs id; Type: DEFAULT; Schema: public; Owner: jacklee
--

ALTER TABLE ONLY friendly_id_slugs ALTER COLUMN id SET DEFAULT nextval('friendly_id_slugs_id_seq'::regclass);


--
-- Name: likes id; Type: DEFAULT; Schema: public; Owner: jacklee
--

ALTER TABLE ONLY likes ALTER COLUMN id SET DEFAULT nextval('likes_id_seq'::regclass);


--
-- Name: media id; Type: DEFAULT; Schema: public; Owner: jacklee
--

ALTER TABLE ONLY media ALTER COLUMN id SET DEFAULT nextval('media_id_seq'::regclass);


--
-- Name: posts id; Type: DEFAULT; Schema: public; Owner: jacklee
--

ALTER TABLE ONLY posts ALTER COLUMN id SET DEFAULT nextval('posts_id_seq'::regclass);


--
-- Name: references id; Type: DEFAULT; Schema: public; Owner: jacklee
--

ALTER TABLE ONLY "references" ALTER COLUMN id SET DEFAULT nextval('references_id_seq'::regclass);


--
-- Name: relationships id; Type: DEFAULT; Schema: public; Owner: jacklee
--

ALTER TABLE ONLY relationships ALTER COLUMN id SET DEFAULT nextval('relationships_id_seq'::regclass);


--
-- Name: reviewlists id; Type: DEFAULT; Schema: public; Owner: jacklee
--

ALTER TABLE ONLY reviewlists ALTER COLUMN id SET DEFAULT nextval('reviewlists_id_seq'::regclass);


--
-- Name: taggings id; Type: DEFAULT; Schema: public; Owner: jacklee
--

ALTER TABLE ONLY taggings ALTER COLUMN id SET DEFAULT nextval('taggings_id_seq'::regclass);


--
-- Name: tags id; Type: DEFAULT; Schema: public; Owner: jacklee
--

ALTER TABLE ONLY tags ALTER COLUMN id SET DEFAULT nextval('tags_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: jacklee
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Name: votes id; Type: DEFAULT; Schema: public; Owner: jacklee
--

ALTER TABLE ONLY votes ALTER COLUMN id SET DEFAULT nextval('votes_id_seq'::regclass);


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: jacklee
--

COPY ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	development	2018-01-19 07:25:22.528986	2018-01-19 07:25:22.528986
\.


--
-- Data for Name: ckeditor_assets; Type: TABLE DATA; Schema: public; Owner: jacklee
--

COPY ckeditor_assets (id, data_id, data_filename, data_size, data_content_type, type, width, height, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: comments; Type: TABLE DATA; Schema: public; Owner: jacklee
--

COPY comments (id, body, commentable_type, commentable_id, created_at, updated_at, user_id) FROM stdin;
1	aslghadg;ahdgdas;ghas	Post	4	2018-01-23 03:52:40.846589	2018-01-23 03:52:40.846589	1
3	Testing out comments in media	Medium	1	2018-01-23 05:54:39.013105	2018-01-23 05:54:39.013105	1
5	khkbbubuijjkjbbyvfi79	Post	2	2018-01-23 06:41:36.91578	2018-01-23 06:41:36.91578	1
6	lvhvhvjvhhjj	Medium	1	2018-01-23 06:43:13.936114	2018-01-23 06:43:13.936114	1
7	jvlbkjbjkbj	Medium	1	2018-01-23 06:43:48.360358	2018-01-23 06:43:48.360358	1
8	7ughjvvhuoyvi	Medium	1	2018-01-23 06:50:02.743272	2018-01-23 06:50:02.743272	1
9	bklkjbklbj	Medium	1	2018-01-23 06:55:27.811596	2018-01-23 06:55:27.811596	1
10	Dicta optio totam aliquid aperiam qui occaecat ullam assumenda voluptatibus et quia incidunt est in dolor duis	Post	2	2018-01-23 07:06:40.726491	2018-01-23 07:06:40.726491	1
11	Voluptatum harum cupidatat consequat Ex sit iste omnis minus et quis blanditiis ullam ipsum velit	Post	2	2018-01-23 07:06:46.018872	2018-01-23 07:06:46.018872	1
12	Laborum Quis iure nemo cillum qui dolore amet veritatis rem	Post	2	2018-01-23 07:06:50.429307	2018-01-23 07:06:50.429307	1
4	Est incididunt enim quasi nulla eum et culpa incidunt	Post	4	2018-01-23 06:22:23.36471	2018-01-23 06:22:23.36471	1
15	Aliquam ducimus incididunt cupidatat pariatur Necessitatibus suscipit qui ipsa	Post	2	2018-01-24 08:02:52.080441	2018-01-24 08:02:52.080441	7
16	Aliquid autem iure perspiciatis ex rem sed fugit pariatur Eu iusto natus quibusdam irure	Post	1	2018-01-24 18:28:26.730066	2018-01-24 18:28:26.730066	7
17	Nulla consequat Officia quis ad minus cillum magnam culpa vel	Post	1	2018-01-24 18:31:35.610301	2018-01-24 18:31:35.610301	7
18	Sunt minima consequat Et qui commodo sed	Post	1	2018-01-24 18:34:02.713774	2018-01-24 18:34:02.713774	7
13	Eius hic qui ratione sit laborum fugiat rem et ut dolor molestiae	Post	4	2018-01-23 19:52:55.220191	2018-01-23 19:52:55.220191	2
14	Do sint perspiciatis dolor nobis.	Post	3	2018-01-23 19:54:42.399876	2018-01-23 19:54:42.399876	2
19	Praesentium sed totam quo quam ea quo doloribus tempor molestiae repellendus Odio culpa ea consectetur	Post	53	2018-02-02 20:59:35.884445	2018-02-02 20:59:35.884445	7
20	Small batch post-ironic iphone mixtape cold-pressed trust fund. Tofu crucifix beard godard humblebrag chicharrones. Street pinterest synth pitchfork put a bird on it narwhal. Raw denim goth distillery tilde pour-over scenester put a bird on it pickled.	Post	46	2018-02-03 22:28:21.137663	2018-02-03 22:28:21.137663	20
21	Stumptown freegan selvage ennui retro taxidermy photo booth. Pickled raw denim hella. Skateboard heirloom sriracha kickstarter trust fund chicharrones. Ramps keffiyeh gentrify seitan lumbersexual. Everyday forage stumptown slow-carb cardigan actually portland cleanse.	Post	48	2018-02-03 22:28:21.19667	2018-02-03 22:28:21.19667	56
22	Quinoa venmo asymmetrical fixie. Stumptown ugh franzen pitchfork bushwick irony.	Post	48	2018-02-03 22:28:21.208662	2018-02-03 22:28:21.208662	73
23	Dreamcatcher raw denim paleo. Locavore banjo stumptown organic bicycle rights photo booth neutra lo-fi. Vinyl stumptown cray bitters deep v scenester retro 90's. Authentic tattooed dreamcatcher. Lo-fi vhs cardigan. Kale chips viral kitsch messenger bag umami sartorial hoodie cray.	Post	48	2018-02-03 22:28:21.217284	2018-02-03 22:28:21.217284	36
24	Flannel keytar butcher meditation 90's vinyl vinegar chicharrones. Kogi health williamsburg jean shorts pork belly narwhal paleo. Williamsburg gentrify narwhal migas cronut synth heirloom. Gastropub whatever actually umami mustache kombucha street distillery. Trust fund semiotics aesthetic photo booth. Cornhole mumblecore stumptown selvage flexitarian normcore.	Post	1	2018-02-03 22:28:21.223767	2018-02-03 22:28:21.223767	6
25	Gluten-free fashion axe heirloom beard kale chips meh kickstarter. Park disrupt mumblecore thundercats. Sustainable sartorial mlkshk waistcoat etsy you probably haven't heard of them normcore freegan.	Post	1	2018-02-03 22:28:21.228657	2018-02-03 22:28:21.228657	74
26	Chartreuse fixie sartorial. Echo cornhole blue bottle. Small batch gastropub bespoke portland williamsburg.	Post	1	2018-02-03 22:28:21.233701	2018-02-03 22:28:21.233701	33
27	Truffaut fashion axe irony gluten-free hammock. Hashtag crucifix pork belly pop-up godard photo booth loko. Selvage listicle venmo cardigan fashion axe small batch. Try-hard hoodie brunch yuccie. Forage austin messenger bag microdosing pitchfork tousled. Celiac squid gastropub.	Post	1	2018-02-03 22:28:21.243637	2018-02-03 22:28:21.243637	40
28	Small batch tote bag jean shorts church-key plaid 3 wolf moon cliche. Goth yuccie ugh neutra pop-up. Squid disrupt kinfolk.	Post	2	2018-02-03 22:28:21.251196	2018-02-03 22:28:21.251196	61
29	Humblebrag cred lo-fi cardigan aesthetic whatever gluten-free. Typewriter small batch tilde. Gluten-free deep v before they sold out pop-up austin irony shoreditch. Freegan tilde bushwick heirloom letterpress. Wes anderson blog intelligentsia readymade yolo.	Post	4	2018-02-03 22:28:21.260226	2018-02-03 22:28:21.260226	30
30	Brunch artisan mumblecore distillery. Fingerstache blue bottle forage crucifix mlkshk ethical. Echo microdosing kogi seitan knausgaard. Neutra carry truffaut yr gastropub mixtape food truck gluten-free. Retro truffaut trust fund master distillery. Pbr&b small batch tote bag drinking.	Post	4	2018-02-03 22:28:21.268297	2018-02-03 22:28:21.268297	49
31	Art party salvia yr chambray. Pabst 90's letterpress stumptown. Whatever letterpress try-hard wes anderson williamsburg flannel brunch. Chambray 8-bit tote bag microdosing church-key lumbersexual trust fund. Pork belly cornhole thundercats humblebrag ennui gastropub chillwave.	Post	4	2018-02-03 22:28:21.277684	2018-02-03 22:28:21.277684	17
32	Pinterest keytar listicle squid paleo wolf. Church-key tilde kogi +1 blue bottle. Pug cliche blue bottle. Ethical cronut listicle hoodie. Semiotics kinfolk xoxo art party photo booth helvetica.	Post	3	2018-02-03 22:28:21.286736	2018-02-03 22:28:21.286736	77
33	Meditation stumptown cold-pressed lumbersexual keffiyeh twee. Pop-up readymade ethical vice flexitarian.	Post	3	2018-02-03 22:28:21.294472	2018-02-03 22:28:21.294472	45
34	Cred mustache farm-to-table you probably haven't heard of them kombucha meditation. Mustache irony squid.	Post	3	2018-02-03 22:28:21.302985	2018-02-03 22:28:21.302985	68
35	Skateboard organic kickstarter letterpress tousled vegan. Xoxo distillery shabby chic crucifix cliche kickstarter.	Post	3	2018-02-03 22:28:21.310994	2018-02-03 22:28:21.310994	23
36	Forage deep v pitchfork vhs. Selvage gentrify cred authentic actually post-ironic blog. Semiotics 3 wolf moon drinking twee pinterest quinoa. Crucifix chartreuse everyday cornhole pinterest pbr&b kickstarter godard. Church-key shabby chic green juice.	Post	5	2018-02-03 22:28:21.320281	2018-02-03 22:28:21.320281	3
37	Semiotics sriracha 8-bit umami lo-fi green juice. Retro 8-bit pinterest. Austin crucifix asymmetrical sriracha. 90's pork belly vinyl skateboard sartorial. Scenester pickled authentic keytar roof ethical. Narwhal mixtape disrupt five dollar toast bicycle rights photo booth muggle magic.	Post	8	2018-02-03 22:28:21.327424	2018-02-03 22:28:21.327424	9
38	Vice mustache polaroid gluten-free shabby chic sriracha direct trade blog. Everyday tacos chicharrones salvia literally freegan squid. Franzen cornhole single-origin coffee lumbersexual. Franzen brooklyn keffiyeh yolo. Listicle mustache austin cornhole.	Post	10	2018-02-03 22:28:21.343183	2018-02-03 22:28:21.343183	76
39	Crucifix pour-over celiac meditation dreamcatcher cornhole. Everyday authentic flannel green juice pbr&b. Mumblecore meh leggings tattooed. Lumbersexual banh mi pop-up chillwave occupy. Franzen shoreditch before they sold out slow-carb chillwave squid. Pbr&b carry swag pabst cray ugh.	Post	10	2018-02-03 22:28:21.352401	2018-02-03 22:28:21.352401	21
40	Banh mi squid hammock. Post-ironic etsy skateboard freegan. Squid celiac banjo trust fund bespoke yuccie. Butcher gentrify jean shorts cold-pressed pug. Thundercats salvia selfies chambray trust fund.	Post	10	2018-02-03 22:28:21.362515	2018-02-03 22:28:21.362515	14
41	Hella jean shorts you probably haven't heard of them typewriter mixtape pabst offal occupy. Diy typewriter kickstarter bitters retro heirloom schlitz. Truffaut blue bottle gastropub aesthetic tumblr farm-to-table.	Post	10	2018-02-03 22:28:21.370302	2018-02-03 22:28:21.370302	70
42	Pitchfork scenester actually austin craft beer. Franzen semiotics narwhal lo-fi. 3 wolf moon bicycle rights portland health twee brunch. Cardigan park bespoke tattooed seitan. Messenger bag meditation vinyl kogi.	Post	43	2018-02-03 22:28:21.380039	2018-02-03 22:28:21.380039	15
43	Put a bird on it raw denim literally vhs banh mi green juice gastropub. Viral franzen before they sold out microdosing vinegar diy pop-up. Meditation messenger bag literally. Austin keffiyeh literally you probably haven't heard of them shoreditch mlkshk. Leggings butcher narwhal pork belly blog roof quinoa.	Post	43	2018-02-03 22:28:21.390626	2018-02-03 22:28:21.390626	70
44	Mlkshk street messenger bag. Meh semiotics franzen godard single-origin coffee pitchfork disrupt green juice. You probably haven't heard of them everyday viral polaroid lo-fi carry.	Post	43	2018-02-03 22:28:21.399814	2018-02-03 22:28:21.399814	71
46	Neutra five dollar toast disrupt. Hashtag cardigan deep v skateboard messenger bag bushwick franzen retro.	Post	45	2018-02-03 22:28:21.416422	2018-02-03 22:28:21.416422	11
47	Diy pinterest single-origin coffee. Kitsch meggings whatever vegan venmo park. Farm-to-table typewriter aesthetic flannel disrupt williamsburg. Polaroid butcher meditation humblebrag five dollar toast trust fund beard next level. Neutra blog chillwave. Ugh kinfolk xoxo whatever flexitarian thundercats pitchfork.	Post	45	2018-02-03 22:28:21.42484	2018-02-03 22:28:21.42484	58
48	Pork belly vice viral humblebrag. Brooklyn 8-bit hoodie. Lomo flannel normcore 3 wolf moon etsy neutra vice. Five dollar toast letterpress vhs. Polaroid neutra tumblr irony. Try-hard williamsburg vice irony next level post-ironic brooklyn trust fund.	Post	45	2018-02-03 22:28:21.434349	2018-02-03 22:28:21.434349	39
52	Fixie echo gentrify brooklyn tofu. Pour-over artisan vinegar helvetica phlogiston austin. Bushwick photo booth carry tousled next level try-hard beard disrupt.	Post	49	2018-02-03 22:28:21.462953	2018-02-03 22:28:21.462953	46
53	Taxidermy craft beer before they sold out flexitarian swag offal wes anderson. Park disrupt sartorial. Williamsburg tousled shabby chic seitan. Organic hella jean shorts letterpress hammock. Authentic keytar cliche phlogiston gastropub ennui crucifix.	Post	50	2018-02-03 22:28:21.468866	2018-02-03 22:28:21.468866	14
54	Goth polaroid phlogiston letterpress direct trade tacos. Raw denim fingerstache bitters banh mi park photo booth hashtag. Sustainable mixtape cornhole letterpress wes anderson scenester.	Post	50	2018-02-03 22:28:21.475386	2018-02-03 22:28:21.475386	39
55	Leggings cold-pressed helvetica cliche listicle master. Shabby chic crucifix mumblecore pbr&b asymmetrical locavore.	Post	50	2018-02-03 22:28:21.480548	2018-02-03 22:28:21.480548	3
56	Wes anderson banjo selvage. Kombucha iphone fashion axe ennui irony wolf put a bird on it. Yuccie typewriter kinfolk celiac banh mi fixie distillery. Letterpress bitters synth squid irony waistcoat. Lomo pinterest neutra cronut bushwick keytar kitsch vice. Chicharrones tattooed schlitz before they sold out 3 wolf moon muggle magic tote bag bicycle rights.	Post	51	2018-02-03 22:28:21.486039	2018-02-03 22:28:21.486039	25
57	Hammock you probably haven't heard of them deep v kombucha kogi knausgaard next level banjo. Kitsch poutine farm-to-table gluten-free fanny pack mumblecore narwhal asymmetrical. Master kickstarter semiotics. Viral meggings banh mi butcher kinfolk ethical kombucha.	Post	51	2018-02-03 22:28:21.491343	2018-02-03 22:28:21.491343	12
58	Swag biodiesel intelligentsia umami craft beer tilde sartorial. Try-hard deep v asymmetrical. Cornhole single-origin coffee muggle magic distillery. Readymade vegan distillery try-hard trust fund. Bespoke kale chips lo-fi. Sartorial hella brunch hashtag sustainable.	Post	52	2018-02-03 22:28:21.497018	2018-02-03 22:28:21.497018	77
59	Hoodie synth artisan lo-fi. Chillwave migas seitan kinfolk.	Post	52	2018-02-03 22:28:21.504814	2018-02-03 22:28:21.504814	76
60	Mumblecore diy fingerstache. Mlkshk carry cray post-ironic park farm-to-table paleo. Jean shorts neutra synth heirloom photo booth skateboard.	Post	52	2018-02-03 22:28:21.510591	2018-02-03 22:28:21.510591	56
61	Occupy street yr neutra vegan bushwick wayfarers. Salvia heirloom aesthetic meggings gentrify iphone. Pour-over cred lo-fi chia craft beer. Fixie flexitarian blog slow-carb.	Post	52	2018-02-03 22:28:21.516139	2018-02-03 22:28:21.516139	58
62	Schlitz brunch sustainable ugh cliche typewriter lumbersexual pug. Slow-carb kickstarter chia offal chambray.	Post	52	2018-02-03 22:28:21.52163	2018-02-03 22:28:21.52163	11
63	+1 williamsburg schlitz sustainable chia. Kale chips craft beer food truck. 8-bit pickled brooklyn franzen authentic retro master. Shoreditch sustainable literally pug. Listicle pinterest fixie five dollar toast brooklyn bespoke jean shorts keytar.	Post	47	2018-02-03 22:28:21.5277	2018-02-03 22:28:21.5277	44
120	Pork belly semiotics quinoa narwhal. Bespoke quinoa mixtape cornhole cleanse bicycle rights. Microdosing loko trust fund diy fashion axe wayfarers viral ethical.	Post	70	2018-02-03 22:28:21.880291	2018-02-03 22:28:21.880291	9
64	Stumptown etsy deep v organic neutra truffaut actually small batch. Cardigan wayfarers kogi readymade loko meh offal. Chambray craft beer semiotics. Taxidermy pitchfork etsy cornhole cray scenester. Meditation seitan beard.	Post	47	2018-02-03 22:28:21.533395	2018-02-03 22:28:21.533395	77
65	Biodiesel lumbersexual tote bag kombucha cronut tilde. Fanny pack pbr&b next level etsy artisan organic blue bottle vinegar. Tattooed thundercats wayfarers pork belly normcore. 90's shoreditch kale chips flannel microdosing. Waistcoat synth poutine typewriter pug thundercats. Sriracha vice fixie typewriter fanny pack next level brunch.	Post	47	2018-02-03 22:28:21.539333	2018-02-03 22:28:21.539333	35
66	Aesthetic franzen biodiesel slow-carb. Plaid tousled etsy tofu. Church-key readymade kale chips hashtag sriracha vinyl crucifix street. Pug cardigan trust fund kombucha microdosing. Quinoa selfies ennui bespoke mlkshk kinfolk. Bicycle rights williamsburg actually normcore letterpress messenger bag.	Post	47	2018-02-03 22:28:21.545163	2018-02-03 22:28:21.545163	13
67	Lumbersexual beard selvage. Bitters hella vinegar polaroid everyday.	Post	47	2018-02-03 22:28:21.551135	2018-02-03 22:28:21.551135	18
68	Austin pop-up bushwick 90's yr thundercats. Mlkshk blog food truck waistcoat paleo actually pickled bicycle rights. Pitchfork scenester neutra.	Post	59	2018-02-03 22:28:21.558364	2018-02-03 22:28:21.558364	47
69	Yuccie seitan dreamcatcher pop-up. Health sartorial kitsch. Migas vinyl leggings. Selvage beard pbr&b aesthetic biodiesel diy meditation chillwave.	Post	59	2018-02-03 22:28:21.564974	2018-02-03 22:28:21.564974	14
70	Cardigan mixtape distillery tumblr. Before they sold out cold-pressed sriracha pork belly beard cliche direct trade. Shoreditch disrupt selfies thundercats put a bird on it. Readymade vinyl salvia cronut gentrify. Semiotics normcore locavore hashtag gluten-free. Polaroid locavore everyday pabst.	Post	59	2018-02-03 22:28:21.570892	2018-02-03 22:28:21.570892	19
71	Tofu poutine bitters fingerstache pickled goth cred pitchfork. Chillwave post-ironic pug normcore neutra art party aesthetic kombucha. Pabst food truck ennui. Flannel typewriter authentic five dollar toast tattooed skateboard post-ironic. Kickstarter next level banjo whatever taxidermy.	Post	59	2018-02-03 22:28:21.576867	2018-02-03 22:28:21.576867	26
72	Blue bottle try-hard direct trade photo booth master asymmetrical leggings plaid. Keytar sriracha you probably haven't heard of them dreamcatcher synth iphone. Flannel fanny pack single-origin coffee health.	Post	53	2018-02-03 22:28:21.582793	2018-02-03 22:28:21.582793	13
73	Health fixie pug messenger bag wes anderson keffiyeh cronut distillery. Before they sold out yuccie ugh. Asymmetrical skateboard kale chips before they sold out occupy chia. Thundercats street tousled bespoke letterpress slow-carb. Narwhal knausgaard disrupt etsy cold-pressed.	Post	54	2018-02-03 22:28:21.590401	2018-02-03 22:28:21.590401	14
74	Lomo tote bag hella cred truffaut heirloom mumblecore. Knausgaard asymmetrical portland 90's. Messenger bag tacos everyday artisan schlitz brunch. Slow-carb xoxo knausgaard organic farm-to-table mumblecore. Keytar raw denim tousled scenester jean shorts. Cardigan austin typewriter park vhs mumblecore asymmetrical.	Post	54	2018-02-03 22:28:21.596893	2018-02-03 22:28:21.596893	65
75	Wayfarers church-key mlkshk. Viral poutine mumblecore narwhal humblebrag celiac. Authentic bushwick paleo everyday 90's put a bird on it cliche kinfolk. Letterpress etsy yr swag lomo. Selfies xoxo 3 wolf moon dreamcatcher kickstarter whatever.	Post	55	2018-02-03 22:28:21.604796	2018-02-03 22:28:21.604796	49
76	Cold-pressed cardigan truffaut literally biodiesel cred butcher mlkshk. Hoodie loko deep v truffaut umami.	Post	55	2018-02-03 22:28:21.612122	2018-02-03 22:28:21.612122	12
77	Semiotics salvia swag meh pabst tacos seitan portland. Scenester vinegar chia shabby chic.	Post	55	2018-02-03 22:28:21.619995	2018-02-03 22:28:21.619995	52
78	Migas try-hard quinoa ramps muggle magic retro. Readymade selvage hashtag hella selfies pop-up pour-over crucifix.	Post	55	2018-02-03 22:28:21.625762	2018-02-03 22:28:21.625762	13
79	Vice flexitarian salvia banjo iphone vegan offal. Gastropub cold-pressed pug bushwick tattooed. Mixtape banh mi 8-bit beard meh occupy listicle roof. Kinfolk seitan williamsburg blue bottle butcher.	Post	55	2018-02-03 22:28:21.632093	2018-02-03 22:28:21.632093	20
80	Irony ugh leggings roof. Etsy plaid drinking farm-to-table.	Post	56	2018-02-03 22:28:21.64076	2018-02-03 22:28:21.64076	62
81	Muggle magic synth vinegar vegan meditation organic butcher selfies. Wayfarers cray mlkshk cred humblebrag letterpress fashion axe squid. Occupy farm-to-table 90's sustainable.	Post	56	2018-02-03 22:28:21.648826	2018-02-03 22:28:21.648826	56
82	Dreamcatcher five dollar toast swag celiac leggings meh. Wolf chillwave keffiyeh iphone. Blue bottle try-hard banh mi cardigan vegan thundercats. Literally church-key asymmetrical mustache meggings etsy. Portland fashion axe kickstarter poutine.	Post	56	2018-02-03 22:28:21.654471	2018-02-03 22:28:21.654471	32
83	Muggle magic crucifix phlogiston 90's shoreditch church-key fixie kitsch. Bicycle rights put a bird on it humblebrag scenester thundercats.	Post	57	2018-02-03 22:28:21.66021	2018-02-03 22:28:21.66021	31
84	Polaroid sartorial slow-carb bitters listicle tilde wayfarers forage. Kinfolk portland mixtape banjo. Lo-fi iphone plaid sartorial hoodie. Cliche diy pug tofu next level pitchfork. Sriracha distillery green juice.	Post	57	2018-02-03 22:28:21.665621	2018-02-03 22:28:21.665621	18
85	Kale chips truffaut messenger bag franzen selvage flannel wayfarers. Quinoa mixtape jean shorts deep v dreamcatcher microdosing. Try-hard chambray kinfolk tousled lumbersexual vice chia chartreuse. Normcore yuccie plaid keytar kickstarter vinegar jean shorts. Asymmetrical irony distillery iphone.	Post	57	2018-02-03 22:28:21.672376	2018-02-03 22:28:21.672376	53
86	Lo-fi crucifix taxidermy. Post-ironic brooklyn chartreuse leggings.	Post	57	2018-02-03 22:28:21.678551	2018-02-03 22:28:21.678551	63
87	Squid locavore beard muggle magic franzen kitsch hella taxidermy. Kale chips ugh five dollar toast tousled crucifix. 3 wolf moon phlogiston muggle magic. Sartorial chambray xoxo poutine. +1 synth master normcore try-hard loko.	Post	57	2018-02-03 22:28:21.685788	2018-02-03 22:28:21.685788	65
88	Banjo fashion axe mlkshk distillery vinyl. Scenester meh irony narwhal ethical squid. Bicycle rights tousled xoxo williamsburg jean shorts. Post-ironic sustainable yolo. Truffaut godard williamsburg.	Post	58	2018-02-03 22:28:21.693152	2018-02-03 22:28:21.693152	7
89	Roof shabby chic single-origin coffee cred everyday next level. Pug sartorial chicharrones. Meh lomo whatever aesthetic master. Carry muggle magic try-hard. Green juice ugh paleo crucifix authentic cronut organic. Chartreuse schlitz 3 wolf moon offal austin fixie.	Post	58	2018-02-03 22:28:21.699854	2018-02-03 22:28:21.699854	57
90	Chartreuse selvage 8-bit normcore. Xoxo kickstarter banh mi single-origin coffee flannel crucifix wayfarers synth. Banjo kitsch brooklyn pinterest williamsburg brunch flannel roof. Keffiyeh viral franzen ethical narwhal. Typewriter blue bottle migas keffiyeh gluten-free.	Post	58	2018-02-03 22:28:21.706063	2018-02-03 22:28:21.706063	2
91	Post-ironic gluten-free celiac wayfarers. Fashion axe before they sold out chambray humblebrag kickstarter helvetica cold-pressed tacos.	Post	60	2018-02-03 22:28:21.711853	2018-02-03 22:28:21.711853	53
179	Paleo post-ironic selvage blog ramps raw denim. Distillery bushwick everyday retro chambray kale chips occupy.	Post	86	2018-02-03 22:28:22.258479	2018-02-03 22:28:22.258479	47
92	Aesthetic williamsburg paleo ethical ugh +1 sriracha kinfolk. Mlkshk small batch vinegar wes anderson yuccie marfa typewriter drinking. Organic chartreuse cliche forage vinyl. Brunch drinking hammock ugh bespoke migas direct trade. Neutra kombucha kickstarter carry.	Post	60	2018-02-03 22:28:21.718021	2018-02-03 22:28:21.718021	34
93	Chambray cronut flexitarian cold-pressed single-origin coffee sartorial 8-bit. Loko fingerstache truffaut. Gastropub helvetica truffaut pour-over poutine thundercats photo booth meggings.	Post	61	2018-02-03 22:28:21.723934	2018-02-03 22:28:21.723934	75
94	Kombucha dreamcatcher swag single-origin coffee beard. Phlogiston biodiesel shabby chic tumblr neutra. Gluten-free yuccie you probably haven't heard of them lomo venmo. Drinking williamsburg ethical before they sold out blog schlitz messenger bag goth.	Post	61	2018-02-03 22:28:21.73141	2018-02-03 22:28:21.73141	12
95	Pinterest freegan bushwick shoreditch tilde 8-bit. Sustainable swag intelligentsia narwhal xoxo loko wayfarers scenester. Blue bottle bitters poutine normcore. Chicharrones fingerstache 3 wolf moon kickstarter 90's kitsch shoreditch.	Post	61	2018-02-03 22:28:21.737287	2018-02-03 22:28:21.737287	10
96	Freegan green juice 8-bit pour-over sriracha. Green juice kale chips pickled. Carry loko cold-pressed. Chia normcore vinegar. Tattooed post-ironic heirloom fingerstache beard taxidermy cardigan organic.	Post	61	2018-02-03 22:28:21.743855	2018-02-03 22:28:21.743855	56
97	Poutine master cleanse meggings chillwave microdosing. Swag 3 wolf moon disrupt. Lomo semiotics polaroid vice actually. Fingerstache seitan ethical roof. Meditation wes anderson direct trade five dollar toast gastropub salvia pabst. Before they sold out celiac pug bespoke distillery hashtag scenester.	Post	61	2018-02-03 22:28:21.749653	2018-02-03 22:28:21.749653	77
103	Quinoa flannel five dollar toast cold-pressed diy chartreuse etsy bushwick. Ennui farm-to-table ethical butcher before they sold out humblebrag chicharrones. Pinterest plaid skateboard gentrify viral scenester hashtag. Blue bottle hoodie poutine bitters cleanse cronut trust fund.	Post	64	2018-02-03 22:28:21.791025	2018-02-03 22:28:21.791025	15
104	Aesthetic kinfolk master kale chips. Ennui before they sold out art party bicycle rights. Pug seitan etsy cred photo booth flannel sustainable yolo.	Post	65	2018-02-03 22:28:21.796733	2018-02-03 22:28:21.796733	75
105	Pitchfork neutra semiotics keytar. Retro williamsburg tacos trust fund gastropub master. Vinegar banjo actually artisan biodiesel mustache salvia. You probably haven't heard of them truffaut poutine loko keytar seitan synth. Humblebrag tofu wayfarers.	Post	65	2018-02-03 22:28:21.80216	2018-02-03 22:28:21.80216	55
106	Flannel post-ironic fixie tilde hella offal goth. Portland ramps vegan goth health. Cray austin mumblecore hella bespoke. Offal pbr&b hoodie beard fanny pack craft beer microdosing tacos. Ethical etsy banh mi tacos.	Post	65	2018-02-03 22:28:21.807539	2018-02-03 22:28:21.807539	58
107	Hoodie wes anderson jean shorts vice meditation seitan. Craft beer godard xoxo. 8-bit ugh vinegar green juice tilde roof blue bottle cornhole.	Post	66	2018-02-03 22:28:21.812494	2018-02-03 22:28:21.812494	18
108	Sustainable selfies pinterest retro iphone. Salvia pitchfork humblebrag disrupt selfies kombucha crucifix carry.	Post	66	2018-02-03 22:28:21.817667	2018-02-03 22:28:21.817667	53
109	Chillwave tote bag offal gentrify. Tattooed kale chips pbr&b chicharrones roof blue bottle health pug. Kickstarter typewriter next level. Hella bushwick pop-up semiotics selvage cold-pressed celiac selfies. Ramps keffiyeh kitsch church-key.	Post	66	2018-02-03 22:28:21.822567	2018-02-03 22:28:21.822567	31
110	Paleo single-origin coffee pop-up butcher tacos. Bicycle rights church-key wolf poutine tacos. Wolf literally cred gentrify offal chillwave squid lomo. Vinyl actually chicharrones next level cleanse. Tofu kinfolk carry heirloom. Church-key vinyl aesthetic shabby chic tofu roof.	Post	67	2018-02-03 22:28:21.827699	2018-02-03 22:28:21.827699	40
111	Tofu kombucha direct trade mumblecore before they sold out. Celiac jean shorts gentrify meditation flannel organic whatever messenger bag.	Post	67	2018-02-03 22:28:21.832673	2018-02-03 22:28:21.832673	2
112	Food truck roof tumblr. Kitsch forage normcore cronut banh mi. Yr lumbersexual chartreuse keytar heirloom pug. Chia pickled distillery. Migas williamsburg post-ironic paleo salvia. Viral franzen gastropub try-hard.	Post	67	2018-02-03 22:28:21.837959	2018-02-03 22:28:21.837959	75
113	Authentic twee vhs lo-fi hashtag loko. Selvage paleo mustache sustainable vhs. Hella franzen irony pug everyday diy.	Post	67	2018-02-03 22:28:21.843203	2018-02-03 22:28:21.843203	22
114	Tilde kale chips humblebrag. Put a bird on it kickstarter cornhole literally pickled carry. Readymade biodiesel sustainable pickled carry kinfolk organic.	Post	67	2018-02-03 22:28:21.848664	2018-02-03 22:28:21.848664	14
115	Truffaut ugh chartreuse fixie venmo paleo. Narwhal lo-fi put a bird on it wayfarers heirloom. Mixtape occupy 3 wolf moon meditation master. Hammock iphone whatever celiac meh squid flexitarian. Meggings tumblr viral. Next level cronut skateboard waistcoat muggle magic bitters lo-fi.	Post	68	2018-02-03 22:28:21.854035	2018-02-03 22:28:21.854035	42
116	Everyday tofu cold-pressed single-origin coffee. Yolo artisan organic gluten-free neutra. Actually hoodie microdosing. Before they sold out marfa swag vinyl.	Post	68	2018-02-03 22:28:21.859225	2018-02-03 22:28:21.859225	18
117	Seitan banh mi thundercats semiotics. Waistcoat paleo letterpress. Skateboard 3 wolf moon tilde squid cornhole salvia 8-bit health. Umami actually narwhal. Sustainable tattooed selfies.	Post	69	2018-02-03 22:28:21.864549	2018-02-03 22:28:21.864549	11
118	Knausgaard marfa venmo leggings franzen slow-carb fingerstache. Echo bushwick 8-bit occupy wolf waistcoat. Hammock cray humblebrag vinyl intelligentsia listicle tattooed. Wes anderson tattooed lomo vhs neutra. Salvia viral banh mi cleanse gluten-free distillery wayfarers. Vhs brooklyn sustainable.	Post	69	2018-02-03 22:28:21.869798	2018-02-03 22:28:21.869798	33
119	Kitsch cardigan 8-bit next level marfa microdosing. Viral pop-up kitsch food truck pabst next level. Pitchfork normcore flannel biodiesel. Hammock sustainable pinterest gastropub distillery.	Post	70	2018-02-03 22:28:21.875057	2018-02-03 22:28:21.875057	68
121	Muggle magic wes anderson ugh cred. Kombucha asymmetrical synth ramps. Hella tote bag venmo stumptown mumblecore. Cleanse keffiyeh fashion axe you probably haven't heard of them flexitarian. Sriracha green juice tousled typewriter bicycle rights. Etsy stumptown selfies venmo polaroid.	Post	70	2018-02-03 22:28:21.885601	2018-02-03 22:28:21.885601	20
122	Retro gentrify disrupt five dollar toast. Heirloom microdosing forage pinterest cray dreamcatcher. Park mixtape bicycle rights direct trade wolf. Bitters humblebrag whatever deep v viral biodiesel church-key kickstarter. Kombucha asymmetrical health butcher kickstarter chia. Pabst street twee goth.	Post	71	2018-02-03 22:28:21.890919	2018-02-03 22:28:21.890919	41
123	3 wolf moon deep v gentrify meditation. Plaid artisan knausgaard gastropub +1 tofu vice seitan. Organic wolf retro roof freegan trust fund tacos venmo. Keytar thundercats austin pop-up beard quinoa loko. Pug lo-fi 3 wolf moon paleo street diy tousled.	Post	71	2018-02-03 22:28:21.896212	2018-02-03 22:28:21.896212	53
124	Scenester listicle swag. Master cronut yolo health 90's tote bag brooklyn. Synth disrupt messenger bag kitsch 90's church-key cardigan. Marfa green juice mixtape tousled. Kogi readymade pug you probably haven't heard of them.	Post	71	2018-02-03 22:28:21.90138	2018-02-03 22:28:21.90138	15
125	Echo blue bottle locavore bicycle rights meh skateboard. Cleanse photo booth brooklyn butcher. Vegan small batch bitters try-hard.	Post	71	2018-02-03 22:28:21.906511	2018-02-03 22:28:21.906511	11
126	Sustainable banjo artisan. Ramps cold-pressed 90's. Gentrify pug listicle pitchfork.	Post	72	2018-02-03 22:28:21.911741	2018-02-03 22:28:21.911741	44
127	Pbr&b ramps kitsch street pickled sriracha vhs migas. Cray pbr&b wayfarers hoodie offal sustainable. Echo tumblr brunch +1 vegan. Gluten-free five dollar toast forage chicharrones hammock cronut viral meggings. Selfies poutine occupy.	Post	72	2018-02-03 22:28:21.916898	2018-02-03 22:28:21.916898	75
128	Dreamcatcher vinyl heirloom. Lumbersexual chartreuse jean shorts flannel diy. Direct trade blue bottle yolo seitan raw denim five dollar toast irony chartreuse. Marfa microdosing vice carry etsy.	Post	72	2018-02-03 22:28:21.922161	2018-02-03 22:28:21.922161	36
129	Narwhal lo-fi cornhole mixtape park tofu ethical hella. Ennui scenester biodiesel stumptown cred chambray fanny pack. Kickstarter williamsburg poutine ennui asymmetrical pabst. Leggings seitan meh carry stumptown. Cold-pressed tacos cray vinegar diy xoxo synth. Meggings cliche food truck cleanse meditation pour-over.	Post	72	2018-02-03 22:28:21.927599	2018-02-03 22:28:21.927599	62
130	Wolf poutine vinegar wes anderson franzen wayfarers intelligentsia photo booth. Bicycle rights next level banh mi readymade wolf godard loko. Skateboard bicycle rights lumbersexual cliche. Ugh iphone master. Carry bicycle rights helvetica.	Post	73	2018-02-03 22:28:21.932736	2018-02-03 22:28:21.932736	34
131	Tousled everyday pbr&b lo-fi brooklyn cardigan. Humblebrag scenester pinterest. Selfies 8-bit pug blue bottle retro banjo raw denim. Scenester bushwick distillery humblebrag master next level. Tilde xoxo swag.	Post	74	2018-02-03 22:28:21.93828	2018-02-03 22:28:21.93828	26
132	Bitters thundercats blue bottle park tilde celiac cliche flannel. Freegan slow-carb flannel semiotics cred vice cornhole vinegar. Lomo selvage dreamcatcher microdosing pug. Williamsburg yuccie pickled.	Post	74	2018-02-03 22:28:21.943726	2018-02-03 22:28:21.943726	43
133	Ethical raw denim aesthetic 8-bit beard mumblecore wes anderson leggings. Kickstarter sriracha lo-fi banjo squid cronut wolf.	Post	75	2018-02-03 22:28:21.948796	2018-02-03 22:28:21.948796	61
134	Kitsch freegan scenester food truck schlitz cardigan beard. Humblebrag xoxo gastropub echo microdosing trust fund plaid. Sriracha schlitz food truck stumptown.	Post	75	2018-02-03 22:28:21.953792	2018-02-03 22:28:21.953792	24
135	Heirloom venmo blog. Blue bottle you probably haven't heard of them knausgaard gentrify artisan phlogiston offal pitchfork. Umami scenester organic franzen poutine. Goth gentrify wayfarers fingerstache hammock synth cray literally.	Post	75	2018-02-03 22:28:21.959172	2018-02-03 22:28:21.959172	73
136	Williamsburg plaid hoodie. Church-key distillery cray chambray portland banjo drinking. Franzen occupy craft beer tumblr neutra carry. Vinyl forage wolf photo booth irony park kogi. Tousled messenger bag artisan mumblecore cray.	Post	75	2018-02-03 22:28:21.964278	2018-02-03 22:28:21.964278	24
137	Typewriter disrupt messenger bag pickled chillwave migas ethical. Seitan kombucha synth. Brunch try-hard chillwave trust fund. Ennui chillwave cronut whatever. Cleanse retro asymmetrical phlogiston cred.	Post	75	2018-02-03 22:28:21.969367	2018-02-03 22:28:21.969367	72
138	Hammock ethical synth pinterest. Skateboard ennui fingerstache raw denim meditation pop-up kickstarter. Brunch authentic cardigan bicycle rights.	Post	76	2018-02-03 22:28:21.974456	2018-02-03 22:28:21.974456	73
139	Gluten-free deep v normcore five dollar toast ennui vhs you probably haven't heard of them quinoa. Brunch schlitz irony deep v. Normcore selvage hashtag. Vhs cray roof fingerstache austin pour-over keytar.	Post	76	2018-02-03 22:28:21.979589	2018-02-03 22:28:21.979589	43
140	Pitchfork butcher chambray williamsburg hoodie seitan kinfolk park. Chartreuse hoodie chicharrones. Five dollar toast jean shorts park twee.	Post	76	2018-02-03 22:28:21.984658	2018-02-03 22:28:21.984658	28
141	Brooklyn lomo church-key irony umami schlitz etsy quinoa. Brunch crucifix neutra beard biodiesel authentic. Muggle magic offal typewriter goth distillery sriracha bespoke trust fund. Pug typewriter wes anderson disrupt cronut sustainable. Fingerstache kickstarter dreamcatcher franzen. Drinking quinoa bespoke gastropub.	Post	77	2018-02-03 22:28:21.990159	2018-02-03 22:28:21.990159	48
142	Tilde vice pour-over yr migas. Neutra vhs roof. Scenester humblebrag typewriter kombucha you probably haven't heard of them. Direct trade +1 yr.	Post	77	2018-02-03 22:28:21.995674	2018-02-03 22:28:21.995674	63
143	Food truck locavore kombucha chartreuse banh mi brooklyn vegan. Ennui iphone 3 wolf moon vhs fingerstache loko synth. Roof keffiyeh post-ironic portland goth organic. Tattooed jean shorts wes anderson gluten-free carry venmo fashion axe cornhole. Locavore tumblr fingerstache vice messenger bag fanny pack chillwave lumbersexual. Roof jean shorts sustainable migas blog kickstarter.	Post	77	2018-02-03 22:28:22.004978	2018-02-03 22:28:22.004978	64
144	Taxidermy tilde flannel cleanse seitan messenger bag. Deep v organic pop-up forage. Stumptown etsy cliche food truck health. Tumblr retro godard seitan.	Post	77	2018-02-03 22:28:22.012167	2018-02-03 22:28:22.012167	41
145	Sustainable distillery marfa microdosing vinyl. Ugh fashion axe yolo vhs. Scenester knausgaard pug migas vinegar tilde 8-bit fixie. Intelligentsia flannel drinking waistcoat taxidermy hammock.	Post	77	2018-02-03 22:28:22.019016	2018-02-03 22:28:22.019016	28
146	Chillwave franzen umami seitan quinoa next level. Godard tilde chia pop-up flannel direct trade hashtag letterpress.	Post	78	2018-02-03 22:28:22.025884	2018-02-03 22:28:22.025884	73
147	Freegan mumblecore slow-carb truffaut. Pour-over chartreuse ramps brooklyn lo-fi church-key beard.	Post	78	2018-02-03 22:28:22.033488	2018-02-03 22:28:22.033488	55
148	Cliche leggings locavore heirloom hoodie mixtape keffiyeh. Tattooed fixie next level literally.	Post	78	2018-02-03 22:28:22.040573	2018-02-03 22:28:22.040573	69
149	Keffiyeh drinking vinegar poutine artisan raw denim. Knausgaard umami try-hard 90's quinoa occupy fingerstache health. Xoxo cliche godard green juice gluten-free listicle.	Post	79	2018-02-03 22:28:22.047186	2018-02-03 22:28:22.047186	21
150	Keytar occupy meh. Meh neutra banh mi pork belly pbr&b. 8-bit tumblr you probably haven't heard of them raw denim. Salvia pug post-ironic godard park stumptown organic echo. Squid selvage chicharrones franzen single-origin coffee actually skateboard.	Post	79	2018-02-03 22:28:22.054155	2018-02-03 22:28:22.054155	57
151	Tofu kinfolk sustainable selvage kickstarter. Pork belly banh mi goth franzen lo-fi sartorial. Blue bottle tilde pop-up single-origin coffee keffiyeh you probably haven't heard of them paleo aesthetic. Normcore neutra ramps. Retro park 90's brooklyn etsy hoodie gluten-free.	Post	80	2018-02-03 22:28:22.060031	2018-02-03 22:28:22.060031	40
152	Roof letterpress kale chips kogi keffiyeh selvage selfies godard. Kickstarter gastropub celiac diy shabby chic loko mixtape. Craft beer truffaut put a bird on it slow-carb helvetica chartreuse offal franzen.	Post	80	2018-02-03 22:28:22.066924	2018-02-03 22:28:22.066924	27
153	Pinterest street mustache knausgaard franzen wes anderson. Fashion axe butcher cold-pressed beard narwhal. Post-ironic swag paleo. Viral green juice migas seitan blue bottle art party pug marfa. Narwhal hammock twee cold-pressed pour-over fixie actually.	Post	80	2018-02-03 22:28:22.076654	2018-02-03 22:28:22.076654	39
154	Occupy squid craft beer. Photo booth asymmetrical crucifix salvia readymade ennui bitters hammock. Organic semiotics vinegar gluten-free. Whatever pbr&b messenger bag tofu tilde selvage phlogiston. Freegan kickstarter fixie single-origin coffee gentrify narwhal austin. 3 wolf moon meditation wes anderson +1.	Post	80	2018-02-03 22:28:22.083919	2018-02-03 22:28:22.083919	66
155	Health swag yr hoodie wayfarers pabst skateboard. Paleo single-origin coffee street shoreditch authentic pour-over trust fund 8-bit. Etsy sriracha cornhole green juice crucifix poutine. Lomo pickled chambray five dollar toast lo-fi schlitz kickstarter. Occupy disrupt pug pabst.	Post	81	2018-02-03 22:28:22.090924	2018-02-03 22:28:22.090924	32
156	Pinterest migas church-key normcore aesthetic. Freegan pug literally keytar yolo banjo meggings. Pbr&b xoxo craft beer quinoa. Kogi health loko. Small batch stumptown jean shorts gluten-free. Keytar muggle magic forage 8-bit kickstarter.	Post	81	2018-02-03 22:28:22.098151	2018-02-03 22:28:22.098151	11
157	Dreamcatcher street aesthetic master pitchfork 8-bit. Yuccie etsy locavore. Street heirloom tote bag butcher yolo. Cronut twee tousled loko fingerstache venmo pork belly.	Post	81	2018-02-03 22:28:22.10627	2018-02-03 22:28:22.10627	55
158	Paleo pug wayfarers. Small batch direct trade williamsburg pug austin. Yolo actually shabby chic park.	Post	81	2018-02-03 22:28:22.11312	2018-02-03 22:28:22.11312	13
159	Locavore trust fund mixtape franzen truffaut actually vhs art party. Fanny pack yuccie bespoke tofu farm-to-table. Mlkshk diy chambray taxidermy tousled. Pop-up ethical raw denim irony pabst vegan. Crucifix austin yolo bicycle rights. Thundercats viral tousled migas master.	Post	81	2018-02-03 22:28:22.120291	2018-02-03 22:28:22.120291	53
160	Pork belly semiotics tattooed vhs typewriter butcher pinterest meh. Polaroid leggings franzen art party quinoa cliche shoreditch farm-to-table.	Post	82	2018-02-03 22:28:22.127388	2018-02-03 22:28:22.127388	41
161	Pabst kitsch listicle. Pug gluten-free chillwave bushwick fanny pack cleanse roof.	Post	82	2018-02-03 22:28:22.134169	2018-02-03 22:28:22.134169	73
162	Quinoa cred chia chambray blog. Readymade letterpress chambray direct trade selfies. Plaid muggle magic humblebrag freegan. Hashtag pbr&b asymmetrical chartreuse butcher. Irony tofu tumblr brunch. Paleo mumblecore direct trade whatever health fanny pack.	Post	82	2018-02-03 22:28:22.139256	2018-02-03 22:28:22.139256	49
163	Pinterest slow-carb marfa gluten-free diy ennui portland. Shabby chic crucifix quinoa waistcoat everyday cardigan pork belly seitan.	Post	82	2018-02-03 22:28:22.146108	2018-02-03 22:28:22.146108	77
164	Iphone flannel tacos wolf farm-to-table. Ramps paleo next level brooklyn pitchfork.	Post	82	2018-02-03 22:28:22.153153	2018-02-03 22:28:22.153153	3
165	Blue bottle pabst sartorial art party bushwick lo-fi ramps. Cold-pressed ugh roof offal keffiyeh. Vegan tattooed knausgaard jean shorts scenester you probably haven't heard of them. Humblebrag tumblr lomo narwhal. Brunch pabst bicycle rights single-origin coffee meh.	Post	83	2018-02-03 22:28:22.160206	2018-02-03 22:28:22.160206	2
166	Post-ironic marfa crucifix stumptown locavore xoxo schlitz franzen. Fashion axe knausgaard ugh before they sold out pork belly. Cardigan heirloom pug chillwave meditation narwhal. Pabst +1 gluten-free chambray readymade blog vinegar.	Post	83	2018-02-03 22:28:22.16734	2018-02-03 22:28:22.16734	66
167	Loko five dollar toast tote bag vinegar. Umami bicycle rights hammock meh 3 wolf moon. Migas typewriter cronut direct trade.	Post	83	2018-02-03 22:28:22.174991	2018-02-03 22:28:22.174991	47
168	Squid intelligentsia yolo. Flexitarian williamsburg crucifix mixtape tattooed tote bag venmo. Small batch echo cardigan neutra humblebrag hashtag fixie gastropub. Tote bag godard viral lo-fi fixie forage. Letterpress retro celiac.	Post	83	2018-02-03 22:28:22.182254	2018-02-03 22:28:22.182254	34
169	Mustache pug banjo pop-up seitan meditation ennui gentrify. Street drinking biodiesel pitchfork echo. Meggings cray poutine irony paleo health portland cliche.	Post	83	2018-02-03 22:28:22.187304	2018-02-03 22:28:22.187304	15
170	Cray tilde cardigan cornhole pickled meditation drinking quinoa. Tattooed cred tacos muggle magic. Ramps ugh ennui.	Post	84	2018-02-03 22:28:22.194261	2018-02-03 22:28:22.194261	24
171	Asymmetrical put a bird on it pabst umami. Gastropub celiac aesthetic mlkshk mustache keytar williamsburg post-ironic. Truffaut pour-over scenester blog plaid vegan stumptown kale chips.	Post	85	2018-02-03 22:28:22.201285	2018-02-03 22:28:22.201285	17
172	Banjo pour-over mustache yr yolo fanny pack tattooed. Whatever mlkshk pbr&b photo booth 8-bit. Vinyl gluten-free tofu cornhole letterpress. Thundercats cleanse wes anderson. Before they sold out art party hoodie tilde locavore xoxo diy.	Post	85	2018-02-03 22:28:22.208573	2018-02-03 22:28:22.208573	1
173	Marfa park selfies normcore distillery sriracha. Whatever brooklyn helvetica cred next level cliche wolf. Normcore meh tumblr locavore. Kinfolk synth plaid cornhole etsy pbr&b listicle leggings. Shoreditch kogi organic. Cornhole banjo hoodie.	Post	85	2018-02-03 22:28:22.216135	2018-02-03 22:28:22.216135	70
174	Meh portland mlkshk echo tumblr typewriter wes anderson. Street semiotics tote bag pug venmo twee. Vinyl kinfolk tattooed polaroid. Neutra blue bottle green juice cardigan selfies mustache vice aesthetic. Aesthetic cornhole pabst diy.	Post	85	2018-02-03 22:28:22.223462	2018-02-03 22:28:22.223462	48
175	Kogi before they sold out green juice godard shoreditch sartorial. Hammock blue bottle chia. Deep v kickstarter etsy heirloom. Direct trade hashtag meditation vice 8-bit. Taxidermy food truck shoreditch ramps vinegar hashtag +1 trust fund. Kombucha tattooed occupy goth tumblr street hoodie.	Post	85	2018-02-03 22:28:22.230633	2018-02-03 22:28:22.230633	40
176	Craft beer messenger bag cronut ramps aesthetic mixtape selvage. Brooklyn tattooed polaroid neutra ethical.	Post	86	2018-02-03 22:28:22.237456	2018-02-03 22:28:22.237456	14
177	Intelligentsia wes anderson cleanse seitan asymmetrical literally chambray. Art party chartreuse humblebrag normcore.	Post	86	2018-02-03 22:28:22.24427	2018-02-03 22:28:22.24427	67
178	Heirloom offal chillwave phlogiston franzen dreamcatcher mlkshk hella. Cronut cornhole pickled.	Post	86	2018-02-03 22:28:22.249198	2018-02-03 22:28:22.249198	67
180	Before they sold out food truck pour-over dreamcatcher jean shorts slow-carb hammock. Narwhal pabst chambray etsy. Knausgaard hoodie polaroid chia. Single-origin coffee artisan salvia fixie asymmetrical cliche meggings bushwick. Lo-fi tattooed mustache semiotics. Tattooed health kitsch fixie vhs meggings.	Post	87	2018-02-03 22:28:22.264887	2018-02-03 22:28:22.264887	67
181	Marfa swag organic skateboard chartreuse. Echo pork belly carry heirloom. Art party gastropub lomo actually biodiesel. Crucifix flannel 3 wolf moon chartreuse ramps brunch hoodie. Keytar vice thundercats crucifix cliche wolf. Selvage heirloom synth narwhal kinfolk flannel.	Post	88	2018-02-03 22:28:22.275186	2018-02-03 22:28:22.275186	59
182	Vhs artisan post-ironic. Pour-over swag scenester.	Post	88	2018-02-03 22:28:22.280369	2018-02-03 22:28:22.280369	30
183	Diy keffiyeh swag schlitz pickled. Phlogiston helvetica meditation narwhal umami polaroid lomo scenester. Migas health street bespoke pour-over drinking. Leggings mixtape beard meditation tote bag normcore locavore pbr&b.	Post	88	2018-02-03 22:28:22.287349	2018-02-03 22:28:22.287349	34
184	Roof helvetica plaid etsy kale chips put a bird on it neutra. Pop-up typewriter bushwick small batch farm-to-table cray kinfolk put a bird on it. Listicle gentrify sustainable next level. Direct trade salvia etsy. Shoreditch franzen lomo.	Post	89	2018-02-03 22:28:22.294376	2018-02-03 22:28:22.294376	51
185	Artisan marfa whatever yr vice meditation roof cray. Migas art party shoreditch franzen pop-up. Crucifix fashion axe wayfarers semiotics gentrify ramps marfa phlogiston. Heirloom pour-over selfies messenger bag. Hella distillery food truck.	Post	89	2018-02-03 22:28:22.30139	2018-02-03 22:28:22.30139	52
186	Echo celiac vhs. Vegan pabst master. Swag retro kogi art party ethical meh yuccie. Tattooed etsy diy cardigan. Xoxo brunch seitan goth vhs next level migas.	Post	90	2018-02-03 22:28:22.308438	2018-02-03 22:28:22.308438	30
187	Pinterest wolf offal. Selfies gluten-free fingerstache.	Post	91	2018-02-03 22:28:22.315382	2018-02-03 22:28:22.315382	32
188	Fixie ugh schlitz austin. Phlogiston pitchfork sartorial cliche loko offal hashtag master. Artisan bicycle rights wayfarers leggings intelligentsia occupy venmo keffiyeh. Asymmetrical flannel scenester vhs truffaut skateboard tattooed. Sustainable bitters ramps. Retro muggle magic keytar letterpress asymmetrical crucifix skateboard thundercats.	Post	91	2018-02-03 22:28:22.322498	2018-02-03 22:28:22.322498	27
189	Kogi pug everyday neutra next level semiotics bicycle rights. Messenger bag vice mustache jean shorts tilde slow-carb. Wolf squid bespoke selfies hammock. Occupy pop-up pour-over. Diy mixtape you probably haven't heard of them banjo. Keffiyeh yuccie artisan leggings hashtag ennui.	Post	91	2018-02-03 22:28:22.32769	2018-02-03 22:28:22.32769	36
190	Keytar fixie pug occupy listicle literally artisan crucifix. Actually distillery cray bicycle rights skateboard 3 wolf moon helvetica squid. Thundercats irony banjo kogi organic flannel. Kogi muggle magic post-ironic yolo goth. Tacos pinterest carry echo bespoke tote bag beard.	Post	91	2018-02-03 22:28:22.335099	2018-02-03 22:28:22.335099	24
191	Vegan yuccie kogi lo-fi kale chips pork belly. Pitchfork flannel kickstarter viral typewriter.	Post	92	2018-02-03 22:28:22.341876	2018-02-03 22:28:22.341876	2
192	90's chia park muggle magic franzen jean shorts 8-bit. Letterpress seitan before they sold out venmo single-origin coffee. Artisan banh mi gastropub williamsburg phlogiston taxidermy fashion axe hoodie. Franzen cleanse kickstarter bicycle rights. Wolf chambray tote bag mustache pour-over.	Post	92	2018-02-03 22:28:22.349192	2018-02-03 22:28:22.349192	32
193	Vinegar loko lomo poutine truffaut. Organic bicycle rights flannel venmo tattooed thundercats.	Post	93	2018-02-03 22:28:22.35629	2018-02-03 22:28:22.35629	10
194	Tattooed bespoke ennui single-origin coffee yr street. 3 wolf moon kinfolk banh mi blog. Shabby chic ugh cleanse quinoa direct trade art party. Cronut kickstarter whatever muggle magic franzen chicharrones. Fashion axe mixtape lo-fi irony bushwick kale chips aesthetic. Health sriracha ramps waistcoat meggings.	Post	93	2018-02-03 22:28:22.364148	2018-02-03 22:28:22.364148	44
195	Vice gluten-free pbr&b jean shorts distillery iphone thundercats actually. Pickled stumptown cold-pressed wolf portland knausgaard gluten-free messenger bag. Everyday post-ironic pop-up lomo chillwave aesthetic.	Post	93	2018-02-03 22:28:22.370994	2018-02-03 22:28:22.370994	64
196	Tousled sartorial crucifix literally. Skateboard listicle park brooklyn chillwave. Forage yolo messenger bag.	Post	94	2018-02-03 22:28:22.378352	2018-02-03 22:28:22.378352	51
197	Paleo biodiesel leggings pabst vegan master bicycle rights trust fund. Banjo kinfolk narwhal migas disrupt farm-to-table aesthetic craft beer. 3 wolf moon seitan ennui kale chips diy pabst.	Post	94	2018-02-03 22:28:22.385053	2018-02-03 22:28:22.385053	69
198	Sustainable tumblr locavore gentrify 90's mixtape. Food truck direct trade polaroid butcher ugh tilde yr. Authentic before they sold out chambray chicharrones gentrify keffiyeh. Franzen lumbersexual blue bottle narwhal park chambray. Pickled park chia selfies portland banh mi pour-over heirloom.	Post	94	2018-02-03 22:28:22.393808	2018-02-03 22:28:22.393808	72
199	Banh mi everyday chambray pop-up helvetica deep v listicle hashtag. Farm-to-table 90's swag next level. Authentic pop-up before they sold out next level blue bottle fanny pack sustainable farm-to-table.	Post	95	2018-02-03 22:28:22.403249	2018-02-03 22:28:22.403249	33
200	Yolo bushwick organic put a bird on it. Readymade williamsburg chartreuse chambray. Authentic vegan cray food truck kale chips blog wes anderson truffaut.	Post	95	2018-02-03 22:28:22.41025	2018-02-03 22:28:22.41025	1
201	Mixtape food truck meggings twee hammock before they sold out. +1 kombucha schlitz 8-bit before they sold out. Yuccie you probably haven't heard of them sartorial schlitz wes anderson bicycle rights truffaut.	Post	96	2018-02-03 22:28:22.417788	2018-02-03 22:28:22.417788	12
202	Chicharrones gluten-free loko pug +1 keffiyeh direct trade williamsburg. Raw denim knausgaard before they sold out. Lomo cold-pressed mlkshk typewriter brunch. Tousled loko hoodie goth austin chillwave pabst. Fingerstache disrupt venmo skateboard banjo semiotics chambray. Pbr&b blue bottle cornhole vhs gluten-free.	Post	96	2018-02-03 22:28:22.425031	2018-02-03 22:28:22.425031	53
203	Sustainable loko carry schlitz drinking. Hashtag master mustache single-origin coffee pug ennui artisan.	Post	96	2018-02-03 22:28:22.431887	2018-02-03 22:28:22.431887	42
204	Beard trust fund cronut chambray blog try-hard. Post-ironic plaid freegan fashion axe. Migas master hoodie shabby chic jean shorts dreamcatcher truffaut.	Post	96	2018-02-03 22:28:22.439961	2018-02-03 22:28:22.439961	29
205	Chartreuse venmo street. Franzen wes anderson intelligentsia. Art party irony farm-to-table. Vegan pickled selvage. Cornhole blue bottle sriracha stumptown.	Post	96	2018-02-03 22:28:22.44719	2018-02-03 22:28:22.44719	15
206	Intelligentsia vegan heirloom etsy marfa diy. Bitters hella chia cardigan.	Post	97	2018-02-03 22:28:22.455091	2018-02-03 22:28:22.455091	30
207	Tousled art party typewriter. Trust fund shoreditch chambray banjo thundercats brunch chicharrones cliche. Schlitz beard cornhole shoreditch vhs lomo iphone. Pabst sriracha pitchfork bitters fashion axe readymade. Typewriter poutine squid keffiyeh try-hard sustainable gluten-free butcher. Drinking aesthetic try-hard seitan celiac franzen keffiyeh.	Post	97	2018-02-03 22:28:22.462638	2018-02-03 22:28:22.462638	14
208	Waistcoat vinegar neutra hashtag. Retro paleo swag chicharrones muggle magic.	Post	97	2018-02-03 22:28:22.470403	2018-02-03 22:28:22.470403	21
209	Vinyl celiac readymade butcher deep v brunch vhs. Swag neutra tumblr lo-fi actually. You probably haven't heard of them brunch marfa austin muggle magic hammock kale chips. Actually pitchfork polaroid park flannel bespoke twee fingerstache. Kinfolk direct trade small batch quinoa meggings knausgaard. Taxidermy listicle photo booth pinterest carry microdosing viral.	Post	97	2018-02-03 22:28:22.477967	2018-02-03 22:28:22.477967	44
210	Polaroid schlitz put a bird on it umami narwhal. Jean shorts semiotics yr bespoke stumptown. Chia crucifix iphone lumbersexual tumblr letterpress vhs blog. Meggings locavore goth plaid 3 wolf moon craft beer. Stumptown fingerstache chia migas portland ramps. Bespoke gastropub tote bag crucifix lo-fi.	Post	97	2018-02-03 22:28:22.486822	2018-02-03 22:28:22.486822	76
211	Banjo lomo actually pabst wes anderson trust fund venmo microdosing. Plaid meggings you probably haven't heard of them next level aesthetic craft beer ethical. Bushwick knausgaard kickstarter semiotics intelligentsia.	Post	98	2018-02-03 22:28:22.495635	2018-02-03 22:28:22.495635	24
212	Muggle magic actually fashion axe hammock wolf jean shorts mlkshk. You probably haven't heard of them quinoa street williamsburg.	Post	98	2018-02-03 22:28:22.503605	2018-02-03 22:28:22.503605	72
213	Microdosing quinoa yolo tacos direct trade plaid tumblr gentrify. Brunch kickstarter literally vegan. Bicycle rights five dollar toast cardigan master 3 wolf moon forage trust fund. Raw denim pbr&b street trust fund tattooed ugh.	Post	98	2018-02-03 22:28:22.510561	2018-02-03 22:28:22.510561	47
214	Thundercats kitsch neutra. Venmo cliche yolo authentic retro diy. Biodiesel fanny pack intelligentsia. Truffaut gluten-free migas. Kinfolk flexitarian ugh poutine williamsburg health hammock.	Post	98	2018-02-03 22:28:22.519184	2018-02-03 22:28:22.519184	7
215	Cronut scenester loko salvia phlogiston. Disrupt retro xoxo green juice art party scenester. Cronut pinterest occupy leggings yr shabby chic put a bird on it.	Post	98	2018-02-03 22:28:22.526083	2018-02-03 22:28:22.526083	13
216	Selfies portland you probably haven't heard of them austin pitchfork small batch meh lumbersexual. Deep v disrupt typewriter vinegar mustache. Fanny pack pour-over xoxo next level offal squid cronut leggings. Vinyl meggings asymmetrical ugh heirloom. Pitchfork crucifix celiac.	Post	99	2018-02-03 22:28:22.531548	2018-02-03 22:28:22.531548	17
217	Yr pug vinegar. Wolf small batch +1 portland godard. Portland post-ironic cleanse heirloom bushwick meditation readymade. Humblebrag leggings celiac bushwick chambray polaroid gluten-free farm-to-table.	Post	99	2018-02-03 22:28:22.539069	2018-02-03 22:28:22.539069	48
218	Kitsch flexitarian actually heirloom umami meggings kinfolk raw denim. Fashion axe deep v vice goth keytar. Farm-to-table vinyl carry diy. Irony cornhole neutra squid heirloom fashion axe gluten-free quinoa. Schlitz jean shorts dreamcatcher chicharrones skateboard. 3 wolf moon paleo whatever taxidermy farm-to-table.	Post	100	2018-02-03 22:28:22.548658	2018-02-03 22:28:22.548658	15
219	Loko put a bird on it viral. Pitchfork slow-carb brunch tofu paleo hella 90's. Swag beard keytar blue bottle craft beer. Narwhal godard fashion axe.	Post	100	2018-02-03 22:28:22.555669	2018-02-03 22:28:22.555669	26
220	Whatever pour-over kale chips. Lumbersexual organic cray hoodie. Microdosing fingerstache cliche intelligentsia cold-pressed heirloom etsy biodiesel. Austin hella tilde ugh church-key tofu yolo art party. Semiotics cornhole helvetica you probably haven't heard of them swag.	Post	100	2018-02-03 22:28:22.562601	2018-02-03 22:28:22.562601	18
221	Gluten-free synth farm-to-table waistcoat. Tote bag tofu organic bicycle rights migas. Deep v hella jean shorts. Flannel biodiesel chicharrones lumbersexual ethical readymade cred. You probably haven't heard of them cardigan drinking bicycle rights pop-up meh. Disrupt cardigan health before they sold out paleo.	Post	100	2018-02-03 22:28:22.569657	2018-02-03 22:28:22.569657	1
222	Asymmetrical 3 wolf moon master disrupt banh mi kitsch chicharrones direct trade. Five dollar toast biodiesel lumbersexual twee. You probably haven't heard of them williamsburg yolo scenester skateboard. Literally single-origin coffee gentrify brunch ugh.	Post	100	2018-02-03 22:28:22.57677	2018-02-03 22:28:22.57677	22
223	Ennui distillery hashtag fixie salvia. Flannel wes anderson yuccie. Hashtag semiotics thundercats mixtape celiac. Gluten-free swag intelligentsia cardigan pabst photo booth bushwick listicle. Cardigan tousled direct trade kogi bitters master street. Keytar hella mustache park.	Post	101	2018-02-03 22:28:22.586302	2018-02-03 22:28:22.586302	35
224	Vhs ugh pinterest echo chia. Banjo ugh poutine wes anderson muggle magic.	Post	101	2018-02-03 22:28:22.59307	2018-02-03 22:28:22.59307	45
225	Street roof brooklyn cleanse. Waistcoat semiotics seitan kinfolk banh mi jean shorts.	Post	101	2018-02-03 22:28:22.60008	2018-02-03 22:28:22.60008	66
226	Try-hard readymade vinegar crucifix. Readymade tacos dreamcatcher fixie listicle. Heirloom cronut post-ironic tofu readymade brooklyn. Sartorial shoreditch phlogiston pinterest. Wolf street hella blue bottle. Helvetica seitan trust fund hashtag.	Post	101	2018-02-03 22:28:22.607276	2018-02-03 22:28:22.607276	54
227	Tattooed farm-to-table blog tofu cred. Synth authentic celiac intelligentsia portland. Thundercats ethical 90's sriracha umami intelligentsia carry.	Post	101	2018-02-03 22:28:22.614247	2018-02-03 22:28:22.614247	21
228	Small batch marfa lomo hammock tote bag try-hard. Austin post-ironic vinegar.	Post	102	2018-02-03 22:28:22.621376	2018-02-03 22:28:22.621376	53
229	Artisan hella flannel street. Small batch mixtape muggle magic umami vinegar street. Hashtag kinfolk xoxo single-origin coffee lomo vinegar.	Post	102	2018-02-03 22:28:22.626394	2018-02-03 22:28:22.626394	43
230	Bicycle rights fingerstache keffiyeh mumblecore williamsburg echo church-key. Pickled leggings kale chips blog. Fashion axe plaid readymade pabst loko art party occupy intelligentsia.	Post	102	2018-02-03 22:28:22.633781	2018-02-03 22:28:22.633781	54
231	Dreamcatcher diy plaid mixtape sriracha next level butcher xoxo. Park vice tattooed. Cornhole tilde hashtag. Aesthetic yolo farm-to-table church-key thundercats kinfolk waistcoat. Tattooed sartorial franzen meditation. Jean shorts heirloom cred.	Post	103	2018-02-03 22:28:22.641038	2018-02-03 22:28:22.641038	8
232	Hoodie irony cronut. Blue bottle mustache bespoke fanny pack you probably haven't heard of them craft beer. Cleanse viral normcore post-ironic. Umami beard messenger bag typewriter selvage. Green juice truffaut raw denim lo-fi. Poutine tote bag seitan stumptown pbr&b cleanse.	Post	103	2018-02-03 22:28:22.648234	2018-02-03 22:28:22.648234	16
233	Swag mixtape chambray pop-up artisan. Locavore bitters street sustainable. Thundercats irony next level truffaut 8-bit chambray. Waistcoat gentrify chartreuse pickled cold-pressed viral. Meh park art party vegan.	Post	103	2018-02-03 22:28:22.655514	2018-02-03 22:28:22.655514	57
234	Pork belly flannel selvage etsy wes anderson. Pitchfork kogi migas sustainable. Viral tattooed pabst meditation beard brunch readymade. Vinegar kinfolk narwhal migas. Chambray salvia typewriter leggings portland pabst pork belly.	Post	103	2018-02-03 22:28:22.663049	2018-02-03 22:28:22.663049	11
235	Lumbersexual mumblecore squid five dollar toast +1 gastropub kombucha pour-over. Hella kinfolk cray bushwick pop-up. Kitsch venmo banh mi intelligentsia ugh cleanse viral mixtape. Wes anderson wayfarers cliche kinfolk. Chambray listicle master polaroid freegan goth.	Post	103	2018-02-03 22:28:22.670142	2018-02-03 22:28:22.670142	23
236	Venmo quinoa pabst biodiesel 3 wolf moon salvia williamsburg brunch. Authentic humblebrag kogi stumptown blog. Pabst cliche celiac. Knausgaard carry quinoa diy yr sustainable helvetica.	Post	104	2018-02-03 22:28:22.677296	2018-02-03 22:28:22.677296	49
237	Diy taxidermy xoxo shabby chic lo-fi celiac muggle magic. Fanny pack irony tumblr. Tilde everyday keffiyeh squid stumptown waistcoat yr shoreditch. Food truck stumptown butcher synth polaroid fanny pack cleanse listicle. Viral cornhole celiac meditation selfies brunch leggings wolf.	Post	104	2018-02-03 22:28:22.684561	2018-02-03 22:28:22.684561	56
238	Carry you probably haven't heard of them vice hammock post-ironic 3 wolf moon. You probably haven't heard of them 8-bit small batch. Kogi kitsch disrupt helvetica.	Post	104	2018-02-03 22:28:22.692086	2018-02-03 22:28:22.692086	71
239	Everyday chillwave messenger bag phlogiston photo booth hoodie heirloom. Shoreditch venmo hoodie meditation ramps selvage blue bottle.	Post	104	2018-02-03 22:28:22.699264	2018-02-03 22:28:22.699264	70
240	Blue bottle cliche offal flexitarian fingerstache. Bicycle rights before they sold out waistcoat blog health quinoa narwhal. Mixtape tattooed direct trade pour-over forage pabst keytar. Chia vinegar knausgaard chambray muggle magic. Art party cardigan humblebrag ennui blog tacos.	Post	105	2018-02-03 22:28:22.704922	2018-02-03 22:28:22.704922	34
241	Cardigan five dollar toast scenester kitsch microdosing chillwave polaroid. Kickstarter shabby chic brooklyn. Asymmetrical schlitz helvetica. Tote bag meditation keytar mlkshk.	Post	105	2018-02-03 22:28:22.712173	2018-02-03 22:28:22.712173	41
242	Green juice disrupt master leggings. Try-hard blue bottle venmo ethical intelligentsia.	Post	105	2018-02-03 22:28:22.719042	2018-02-03 22:28:22.719042	43
243	Intelligentsia franzen ramps bitters skateboard actually salvia normcore. Keytar chicharrones wayfarers flannel. Pug hoodie master.	Post	105	2018-02-03 22:28:22.726228	2018-02-03 22:28:22.726228	76
244	Green juice retro pug. Skateboard forage pug paleo vegan blue bottle pop-up pbr&b. Tattooed bitters narwhal yr slow-carb. Biodiesel carry wes anderson health. Hashtag locavore 8-bit freegan actually. Asymmetrical williamsburg plaid iphone distillery xoxo biodiesel leggings.	Post	105	2018-02-03 22:28:22.733979	2018-02-03 22:28:22.733979	8
245	Migas cred pug sustainable umami. Photo booth bespoke tilde readymade pickled.	Post	106	2018-02-03 22:28:22.740772	2018-02-03 22:28:22.740772	30
246	3 wolf moon scenester messenger bag squid fanny pack thundercats ugh. Chillwave chia lomo food truck mustache. Seitan semiotics migas. Raw denim +1 sustainable post-ironic ethical brooklyn. Truffaut neutra kickstarter fingerstache offal. Pug artisan trust fund cliche.	Post	106	2018-02-03 22:28:22.746303	2018-02-03 22:28:22.746303	71
247	Art party bicycle rights yuccie photo booth loko. Thundercats kinfolk authentic cold-pressed master. Keffiyeh quinoa pour-over meditation helvetica flannel. Tumblr hammock kitsch cardigan fingerstache poutine.	Post	106	2018-02-03 22:28:22.753468	2018-02-03 22:28:22.753468	30
248	Banjo art party five dollar toast humblebrag. Leggings retro everyday next level. Diy bespoke viral vinyl cornhole skateboard cronut heirloom. Organic deep v banh mi keffiyeh tacos ethical swag. Swag yolo pinterest wes anderson. Muggle magic cliche viral kombucha forage fingerstache mumblecore tumblr.	Post	106	2018-02-03 22:28:22.760799	2018-02-03 22:28:22.760799	3
249	Jean shorts park gastropub craft beer distillery yr locavore organic. Kombucha godard fingerstache twee keytar muggle magic actually direct trade. Hashtag polaroid raw denim drinking goth plaid phlogiston pop-up. Craft beer polaroid stumptown.	Post	106	2018-02-03 22:28:22.768232	2018-02-03 22:28:22.768232	45
250	Readymade chartreuse locavore gentrify stumptown leggings cold-pressed. Post-ironic banjo ramps mustache street deep v sustainable readymade. Chicharrones tumblr flexitarian celiac sustainable knausgaard quinoa. Semiotics salvia viral. Cardigan try-hard whatever.	Post	107	2018-02-03 22:28:22.77561	2018-02-03 22:28:22.77561	49
251	Pork belly post-ironic dreamcatcher meggings. Cornhole neutra pitchfork bitters cold-pressed seitan. Cliche cardigan gluten-free. Listicle skateboard pinterest.	Post	107	2018-02-03 22:28:22.782746	2018-02-03 22:28:22.782746	14
252	Seitan marfa taxidermy health brunch. Chia letterpress cold-pressed chillwave pabst muggle magic.	Post	107	2018-02-03 22:28:22.789981	2018-02-03 22:28:22.789981	8
253	Mustache vinyl yolo try-hard mlkshk master. Kitsch gluten-free vinegar disrupt kickstarter.	Post	107	2018-02-03 22:28:22.796799	2018-02-03 22:28:22.796799	7
254	Cray fashion axe gluten-free 90's pickled. Meh lumbersexual whatever normcore. Five dollar toast franzen venmo meggings small batch aesthetic paleo hammock.	Post	108	2018-02-03 22:28:22.804362	2018-02-03 22:28:22.804362	51
255	Umami normcore church-key trust fund gentrify biodiesel. Ennui actually quinoa cold-pressed put a bird on it. Photo booth pug echo semiotics hoodie vhs polaroid. Gluten-free raw denim plaid master carry helvetica blue bottle skateboard.	Post	108	2018-02-03 22:28:22.811675	2018-02-03 22:28:22.811675	32
256	Cronut bicycle rights banh mi mixtape single-origin coffee gluten-free hashtag meditation. Small batch chillwave gentrify sriracha offal photo booth +1 master.	Post	108	2018-02-03 22:28:22.817497	2018-02-03 22:28:22.817497	58
257	Kale chips narwhal truffaut single-origin coffee. Venmo cleanse muggle magic kinfolk ugh pbr&b keffiyeh. Locavore marfa retro.	Post	108	2018-02-03 22:28:22.822118	2018-02-03 22:28:22.822118	8
258	Chambray trust fund hoodie carry art party. 3 wolf moon normcore tumblr gastropub neutra selvage biodiesel. Vinegar pabst chartreuse.	Post	109	2018-02-03 22:28:22.827365	2018-02-03 22:28:22.827365	21
259	Authentic carry park. Occupy leggings kogi venmo actually cred wes anderson. Pabst selvage meggings flexitarian venmo actually.	Post	109	2018-02-03 22:28:22.832703	2018-02-03 22:28:22.832703	34
260	Yolo pug swag cliche taxidermy. +1 shoreditch single-origin coffee celiac godard yuccie messenger bag tote bag. Bushwick post-ironic cornhole diy microdosing. Viral yuccie everyday gluten-free.	Post	109	2018-02-03 22:28:22.837967	2018-02-03 22:28:22.837967	38
261	Fashion axe seitan pabst forage narwhal letterpress. Readymade before they sold out cray pitchfork typewriter asymmetrical. Brunch vinyl celiac jean shorts artisan pabst pour-over. Occupy carry ethical fingerstache franzen tofu pinterest.	Post	110	2018-02-03 22:28:22.843241	2018-02-03 22:28:22.843241	27
262	Vinyl cronut thundercats. Pbr&b blue bottle pabst gentrify ennui yr. Biodiesel carry park tousled. Bespoke squid leggings bicycle rights organic lumbersexual crucifix. You probably haven't heard of them pop-up selvage roof.	Post	110	2018-02-03 22:28:22.847779	2018-02-03 22:28:22.847779	56
263	You probably haven't heard of them readymade quinoa truffaut. Occupy vhs disrupt pinterest stumptown direct trade fingerstache.	Post	110	2018-02-03 22:28:22.852809	2018-02-03 22:28:22.852809	37
264	8-bit jean shorts tacos chicharrones pop-up. Carry pinterest mlkshk. Meh you probably haven't heard of them master celiac leggings blog occupy. Echo next level keffiyeh single-origin coffee gluten-free scenester literally food truck.	Post	110	2018-02-03 22:28:22.861488	2018-02-03 22:28:22.861488	68
265	Mixtape paleo flexitarian pitchfork migas. Meditation chia truffaut mustache wolf banh mi typewriter. Echo paleo five dollar toast plaid marfa. Meditation authentic chambray. Schlitz kale chips diy ennui swag truffaut.	Post	111	2018-02-03 22:28:22.869033	2018-02-03 22:28:22.869033	22
266	Forage goth vegan. Vinegar art party green juice kombucha listicle austin. Pinterest fanny pack plaid literally. Stumptown forage chillwave everyday gastropub.	Post	111	2018-02-03 22:28:22.876062	2018-02-03 22:28:22.876062	65
267	Church-key food truck franzen tilde iphone retro. Before they sold out brooklyn selfies cardigan actually shabby chic everyday synth. Vinegar five dollar toast direct trade hashtag green juice actually.	Post	111	2018-02-03 22:28:22.882948	2018-02-03 22:28:22.882948	8
268	Pop-up jean shorts knausgaard 90's try-hard raw denim. +1 occupy narwhal wolf shoreditch. Waistcoat bitters letterpress bushwick poutine organic neutra. Roof offal leggings shoreditch keffiyeh farm-to-table. Cardigan blog art party dreamcatcher hella pitchfork yuccie. Fashion axe kale chips slow-carb butcher brooklyn fixie quinoa cred.	Post	112	2018-02-03 22:28:22.890136	2018-02-03 22:28:22.890136	67
269	Gentrify pickled fanny pack cliche actually. Food truck pickled hella quinoa cold-pressed messenger bag umami. Williamsburg before they sold out yuccie chicharrones.	Post	112	2018-02-03 22:28:22.897119	2018-02-03 22:28:22.897119	44
270	Fanny pack knausgaard meditation trust fund gastropub waistcoat. Occupy carry truffaut sustainable twee kickstarter. Lomo authentic forage chartreuse dreamcatcher vice drinking retro. Cardigan before they sold out thundercats try-hard kickstarter pickled chartreuse.	Post	112	2018-02-03 22:28:22.904355	2018-02-03 22:28:22.904355	57
271	Hashtag normcore farm-to-table umami. Pop-up artisan twee fixie master freegan. Dreamcatcher meh migas. Gluten-free keytar master cliche kickstarter etsy locavore waistcoat. Freegan pug ramps mixtape.	Post	112	2018-02-03 22:28:22.912293	2018-02-03 22:28:22.912293	74
272	Offal marfa five dollar toast meh lomo. Banh mi quinoa literally. Five dollar toast asymmetrical cornhole. Normcore raw denim biodiesel helvetica neutra meggings. Retro health tilde. Sriracha humblebrag stumptown bicycle rights hella crucifix meditation tousled.	Post	112	2018-02-03 22:28:22.920761	2018-02-03 22:28:22.920761	57
273	Xoxo paleo flannel yr shabby chic. Cardigan thundercats helvetica tattooed art party beard vegan. Green juice hammock iphone poutine stumptown cliche put a bird on it banjo. Locavore irony chartreuse leggings. Art party scenester normcore raw denim. Dreamcatcher knausgaard neutra seitan before they sold out swag marfa.	Post	113	2018-02-03 22:28:22.929288	2018-02-03 22:28:22.929288	56
274	Bicycle rights ethical cold-pressed intelligentsia flannel. Street phlogiston poutine ennui marfa kogi offal. Iphone waistcoat mumblecore viral dreamcatcher vhs skateboard. Migas viral skateboard. Vinegar tofu normcore.	Post	113	2018-02-03 22:28:22.934606	2018-02-03 22:28:22.934606	54
275	Stumptown fixie blog twee distillery squid retro. Pork belly shabby chic brunch butcher authentic chillwave you probably haven't heard of them. Williamsburg gentrify chillwave cold-pressed. Mlkshk poutine microdosing fanny pack pop-up photo booth yr. Keffiyeh fixie vice wayfarers.	Post	113	2018-02-03 22:28:22.939168	2018-02-03 22:28:22.939168	73
276	Listicle knausgaard beard. Cronut bitters tilde. Meh green juice dreamcatcher vhs ugh vegan. Iphone schlitz poutine cray flexitarian chicharrones. Meggings chia austin shoreditch poutine. Literally post-ironic chartreuse letterpress photo booth.	Post	114	2018-02-03 22:28:22.944591	2018-02-03 22:28:22.944591	55
277	Twee wes anderson post-ironic freegan. Kickstarter street blue bottle kale chips hoodie loko. Tattooed humblebrag carry farm-to-table bitters.	Post	114	2018-02-03 22:28:22.949722	2018-02-03 22:28:22.949722	68
278	Locavore polaroid aesthetic. Goth taxidermy cronut kinfolk single-origin coffee. Crucifix banjo distillery xoxo trust fund. Trust fund forage neutra street yuccie wes anderson. Offal whatever echo semiotics.	Post	114	2018-02-03 22:28:22.954737	2018-02-03 22:28:22.954737	25
279	Lo-fi brunch paleo blog seitan gentrify ethical loko. Banh mi occupy kinfolk. Hashtag cornhole direct trade locavore irony flannel humblebrag. Crucifix polaroid yr cleanse 8-bit artisan photo booth.	Post	115	2018-02-03 22:28:22.95987	2018-02-03 22:28:22.95987	18
280	Distillery yr austin semiotics. Fashion axe twee meggings truffaut occupy gentrify. Direct trade yuccie street helvetica celiac tote bag viral. Tumblr shabby chic street authentic. Bespoke typewriter banjo ethical etsy paleo chillwave schlitz. Twee stumptown intelligentsia dreamcatcher tilde neutra quinoa.	Post	115	2018-02-03 22:28:22.965359	2018-02-03 22:28:22.965359	61
281	Tilde bicycle rights williamsburg. Bicycle rights cleanse direct trade retro. Twee yuccie letterpress lomo.	Post	143	2018-02-03 22:28:22.970341	2018-02-03 22:28:22.970341	53
282	Single-origin coffee normcore jean shorts typewriter yolo pug. Cleanse street hoodie yolo tousled art party. Godard sartorial pork belly ugh taxidermy. Next level dreamcatcher vinyl artisan.	Post	143	2018-02-03 22:28:22.975688	2018-02-03 22:28:22.975688	12
283	Deep v xoxo muggle magic aesthetic tote bag bicycle rights. Literally scenester vhs. Asymmetrical chia everyday skateboard. Godard helvetica waistcoat. Polaroid echo swag tacos craft beer truffaut meditation.	Post	143	2018-02-03 22:28:22.981224	2018-02-03 22:28:22.981224	33
284	Squid iphone pbr&b tilde. Flexitarian swag bespoke try-hard synth forage small batch vice. Master cliche cray pop-up kitsch authentic. Vegan xoxo kinfolk messenger bag banh mi banjo godard.	Post	116	2018-02-03 22:28:22.985309	2018-02-03 22:28:22.985309	8
285	Chambray meh salvia retro five dollar toast selfies dreamcatcher. Selvage echo kitsch etsy kale chips lo-fi squid typewriter. Trust fund tattooed kombucha put a bird on it echo 3 wolf moon actually diy. Pinterest direct trade tilde kogi church-key readymade.	Post	117	2018-02-03 22:28:22.990568	2018-02-03 22:28:22.990568	29
286	Celiac wolf artisan sriracha. Schlitz paleo fixie stumptown 90's keytar goth chartreuse. Kinfolk narwhal gluten-free. Semiotics pbr&b xoxo ethical schlitz. Leggings muggle magic vegan.	Post	117	2018-02-03 22:28:22.99591	2018-02-03 22:28:22.99591	67
287	Chartreuse street knausgaard kickstarter. Pop-up mlkshk cray authentic narwhal gluten-free deep v. Keffiyeh bicycle rights poutine single-origin coffee.	Post	117	2018-02-03 22:28:23.004571	2018-02-03 22:28:23.004571	53
288	Scenester portland keytar cray tote bag shabby chic. Church-key kombucha hella hammock. Diy retro pour-over messenger bag polaroid mumblecore. Sustainable cronut brooklyn dreamcatcher hoodie butcher literally brunch.	Post	117	2018-02-03 22:28:23.011506	2018-02-03 22:28:23.011506	43
289	Ennui small batch letterpress bespoke keffiyeh kinfolk roof. Chicharrones celiac phlogiston goth hella slow-carb hashtag ennui. Offal readymade vinyl mlkshk meggings diy.	Post	118	2018-02-03 22:28:23.018583	2018-02-03 22:28:23.018583	15
290	Portland hella sriracha vegan single-origin coffee skateboard readymade sustainable. Tacos twee polaroid pickled wayfarers. Chillwave put a bird on it street ethical wolf beard.	Post	118	2018-02-03 22:28:23.028229	2018-02-03 22:28:23.028229	65
291	Kale chips semiotics skateboard hella schlitz austin listicle. Flannel ethical master brunch meditation.	Post	118	2018-02-03 22:28:23.033613	2018-02-03 22:28:23.033613	43
292	Ugh narwhal ennui hoodie brooklyn whatever. Organic vinegar actually fanny pack plaid schlitz butcher selvage. Semiotics raw denim carry austin taxidermy selvage cold-pressed truffaut.	Post	119	2018-02-03 22:28:23.040384	2018-02-03 22:28:23.040384	68
293	Kogi ennui trust fund meggings ethical next level listicle keffiyeh. Cleanse portland selvage bushwick hashtag microdosing skateboard. Crucifix ramps helvetica heirloom. Lomo locavore cold-pressed. Cornhole 3 wolf moon bicycle rights umami keffiyeh 8-bit.	Post	119	2018-02-03 22:28:23.051864	2018-02-03 22:28:23.051864	60
294	Aesthetic yuccie kale chips. Tilde cardigan poutine viral. Ramps kickstarter bitters tilde deep v biodiesel drinking fanny pack. Asymmetrical truffaut loko plaid selfies 3 wolf moon. Jean shorts waistcoat yr ugh kombucha asymmetrical xoxo flexitarian.	Post	119	2018-02-03 22:28:23.059186	2018-02-03 22:28:23.059186	61
295	Everyday bitters vegan. Pbr&b kitsch bitters 8-bit viral schlitz. Knausgaard food truck viral kale chips. Green juice blue bottle next level squid.	Post	119	2018-02-03 22:28:23.065946	2018-02-03 22:28:23.065946	71
296	Marfa plaid narwhal cronut slow-carb crucifix pitchfork leggings. Narwhal cliche everyday forage messenger bag bicycle rights polaroid lumbersexual. Tilde farm-to-table bitters iphone schlitz flexitarian helvetica asymmetrical. Trust fund mlkshk chambray. Plaid chartreuse food truck mlkshk mumblecore meh ramps street.	Post	119	2018-02-03 22:28:23.073335	2018-02-03 22:28:23.073335	2
297	Viral roof cred retro bitters deep v humblebrag thundercats. Gentrify normcore street. Tacos health echo marfa. Drinking helvetica 8-bit viral. Pop-up chambray crucifix yr. Iphone park salvia vinyl shabby chic.	Post	120	2018-02-03 22:28:23.080422	2018-02-03 22:28:23.080422	68
298	Leggings vinegar organic. Pbr&b lomo pork belly organic.	Post	120	2018-02-03 22:28:23.087416	2018-02-03 22:28:23.087416	57
299	Kitsch shabby chic squid selvage hoodie readymade. Direct trade blog +1 flexitarian 8-bit cray gentrify yuccie. Slow-carb ugh tacos. Slow-carb sriracha offal. Celiac cred stumptown loko schlitz. Pitchfork wayfarers williamsburg pickled freegan paleo ennui cliche.	Post	120	2018-02-03 22:28:23.094686	2018-02-03 22:28:23.094686	9
300	Keytar cronut kinfolk. Deep v pbr&b direct trade gentrify meh yr. Gastropub yuccie post-ironic. Skateboard cleanse diy. Yr cleanse narwhal wolf cray trust fund poutine.	Post	120	2018-02-03 22:28:23.102116	2018-02-03 22:28:23.102116	62
301	Typewriter keffiyeh selfies sriracha street. Ramps you probably haven't heard of them brunch sartorial chambray letterpress banjo helvetica. Cronut tumblr twee freegan tilde listicle austin echo. Knausgaard gastropub cliche cardigan.	Post	120	2018-02-03 22:28:23.109351	2018-02-03 22:28:23.109351	13
302	Typewriter marfa everyday cornhole aesthetic pour-over locavore thundercats. Tousled flannel celiac squid. Fixie drinking austin cliche messenger bag. Leggings brooklyn green juice polaroid. Post-ironic fingerstache pour-over aesthetic locavore scenester.	Post	121	2018-02-03 22:28:23.116646	2018-02-03 22:28:23.116646	69
303	Bitters bespoke readymade photo booth. Neutra blog vegan. Sriracha meggings gentrify jean shorts cornhole pork belly banjo. Schlitz bicycle rights cornhole roof blue bottle retro semiotics. Hoodie trust fund leggings stumptown intelligentsia cornhole fingerstache art party.	Post	121	2018-02-03 22:28:23.123722	2018-02-03 22:28:23.123722	23
304	Lomo art party locavore carry photo booth bespoke. Small batch poutine cliche meditation. Chicharrones fanny pack leggings iphone. Kale chips xoxo small batch actually goth williamsburg cred etsy. Fingerstache pinterest heirloom echo typewriter. Vinegar tofu yuccie yr banjo xoxo.	Post	121	2018-02-03 22:28:23.128961	2018-02-03 22:28:23.128961	16
305	Diy franzen narwhal paleo cleanse cronut pour-over small batch. Actually tote bag bespoke viral pop-up. Salvia skateboard chillwave selvage flannel neutra.	Post	121	2018-02-03 22:28:23.135954	2018-02-03 22:28:23.135954	53
306	Flannel neutra muggle magic banh mi +1. Asymmetrical park pinterest phlogiston dreamcatcher diy hella messenger bag. Synth ugh ethical organic schlitz 8-bit poutine fixie. Fashion axe schlitz jean shorts williamsburg aesthetic franzen migas actually. Yr bicycle rights lo-fi keytar paleo ethical 3 wolf moon muggle magic.	Post	122	2018-02-03 22:28:23.143311	2018-02-03 22:28:23.143311	49
307	Paleo salvia marfa vice fashion axe before they sold out tousled tattooed. Vhs kitsch cred. Cred 8-bit cliche typewriter gastropub keffiyeh etsy phlogiston.	Post	122	2018-02-03 22:28:23.150262	2018-02-03 22:28:23.150262	55
308	Cronut intelligentsia single-origin coffee paleo loko vhs fixie. Next level lumbersexual ethical gastropub swag asymmetrical chambray. Master irony taxidermy cliche drinking gastropub lomo bicycle rights. Hella sriracha farm-to-table single-origin coffee ethical plaid. 90's put a bird on it jean shorts health truffaut stumptown.	Post	122	2018-02-03 22:28:23.157358	2018-02-03 22:28:23.157358	7
309	Tote bag meggings banh mi 8-bit ramps umami cronut hella. 8-bit small batch direct trade meh squid hoodie diy. Kogi pork belly salvia muggle magic actually. Kinfolk keytar put a bird on it meggings vinegar typewriter migas.	Post	122	2018-02-03 22:28:23.164521	2018-02-03 22:28:23.164521	49
310	Selfies cornhole ethical. Chartreuse flannel vice five dollar toast tumblr williamsburg banh mi. Sriracha kinfolk mustache direct trade retro. Williamsburg thundercats quinoa seitan.	Post	122	2018-02-03 22:28:23.172078	2018-02-03 22:28:23.172078	2
311	Chia pabst single-origin coffee marfa williamsburg synth plaid jean shorts. 8-bit selvage carry vhs typewriter. Wes anderson fingerstache beard craft beer. Yolo cardigan bitters skateboard pour-over gentrify wayfarers. Kombucha tumblr fixie mumblecore cornhole portland.	Post	123	2018-02-03 22:28:23.179315	2018-02-03 22:28:23.179315	48
312	Celiac humblebrag readymade poutine. Banjo brunch park salvia wayfarers chicharrones. Meh paleo etsy phlogiston waistcoat ethical blue bottle.	Post	124	2018-02-03 22:28:23.18629	2018-02-03 22:28:23.18629	26
313	Offal direct trade schlitz sustainable. Cliche pbr&b shabby chic taxidermy. Keytar chartreuse gluten-free chambray. Celiac etsy forage 90's iphone. Brooklyn try-hard flexitarian leggings.	Post	124	2018-02-03 22:28:23.191739	2018-02-03 22:28:23.191739	57
314	Vinegar vinyl banh mi. Cold-pressed pop-up readymade raw denim truffaut waistcoat. Fingerstache celiac biodiesel church-key knausgaard.	Post	124	2018-02-03 22:28:23.198972	2018-02-03 22:28:23.198972	62
315	Offal health cred gentrify next level +1 retro photo booth. Gluten-free disrupt tofu irony pbr&b farm-to-table.	Post	125	2018-02-03 22:28:23.205821	2018-02-03 22:28:23.205821	21
316	Phlogiston ugh occupy organic gentrify synth. Pbr&b put a bird on it gentrify kinfolk migas butcher 8-bit. Celiac brunch knausgaard seitan marfa. Deep v yr godard.	Post	126	2018-02-03 22:28:23.212798	2018-02-03 22:28:23.212798	74
317	Green juice tote bag scenester dreamcatcher chicharrones polaroid letterpress shabby chic. Locavore crucifix chicharrones distillery flexitarian cornhole sriracha phlogiston.	Post	126	2018-02-03 22:28:23.219755	2018-02-03 22:28:23.219755	47
318	Tacos chartreuse synth lomo fixie hella. Truffaut post-ironic tilde. Vice cleanse food truck 90's.	Post	126	2018-02-03 22:28:23.227476	2018-02-03 22:28:23.227476	32
319	Blue bottle distillery yuccie celiac neutra literally kogi. Wes anderson salvia 90's franzen sriracha slow-carb.	Post	126	2018-02-03 22:28:23.234395	2018-02-03 22:28:23.234395	42
320	Meggings letterpress listicle 8-bit kogi shabby chic. Iphone tote bag taxidermy hella. Meh church-key butcher five dollar toast organic hammock.	Post	127	2018-02-03 22:28:23.239286	2018-02-03 22:28:23.239286	72
321	Everyday freegan polaroid gentrify pickled schlitz mixtape. Normcore artisan try-hard etsy. Blog keffiyeh cardigan flexitarian brooklyn retro franzen taxidermy. Cold-pressed sriracha kombucha tote bag letterpress.	Post	127	2018-02-03 22:28:23.246433	2018-02-03 22:28:23.246433	1
351	Portland umami phlogiston ugh distillery mixtape helvetica. Quinoa vhs keffiyeh lo-fi. Jean shorts kinfolk hoodie. Cleanse tote bag irony farm-to-table art party +1 chambray. Fixie tousled vinyl.	Post	137	2018-02-03 22:28:23.447801	2018-02-03 22:28:23.447801	35
322	Synth mixtape cliche neutra wes anderson. Neutra kale chips brunch pinterest church-key. Mustache kickstarter organic wes anderson jean shorts skateboard distillery. Synth occupy pug freegan. Vice cleanse cold-pressed marfa post-ironic freegan pbr&b migas. Irony lo-fi farm-to-table chillwave xoxo cray +1 selfies.	Post	127	2018-02-03 22:28:23.253623	2018-02-03 22:28:23.253623	41
323	Mustache pour-over humblebrag drinking kitsch. Banh mi next level migas skateboard. Migas craft beer hoodie jean shorts master fashion axe pinterest. Vinegar chillwave cold-pressed kitsch ugh.	Post	128	2018-02-03 22:28:23.260795	2018-02-03 22:28:23.260795	59
324	Chillwave microdosing sartorial pug kale chips shabby chic church-key +1. Semiotics biodiesel park gluten-free meditation. Street yuccie banh mi selvage. Wes anderson pop-up crucifix next level try-hard gentrify scenester. Five dollar toast diy park slow-carb vinegar.	Post	129	2018-02-03 22:28:23.268063	2018-02-03 22:28:23.268063	70
325	Pug master tacos craft beer deep v yr. Pork belly roof you probably haven't heard of them photo booth. Pickled distillery jean shorts butcher brooklyn iphone vice fixie. Dreamcatcher pbr&b kogi messenger bag. Tofu tilde selvage chillwave microdosing.	Post	129	2018-02-03 22:28:23.276001	2018-02-03 22:28:23.276001	72
326	Organic sriracha pickled tote bag cleanse goth ugh. Church-key godard tote bag brooklyn swag distillery cronut salvia. Put a bird on it helvetica craft beer. Next level selfies celiac.	Post	130	2018-02-03 22:28:23.283094	2018-02-03 22:28:23.283094	72
327	Vinegar migas plaid taxidermy kogi polaroid photo booth. Taxidermy cold-pressed retro bespoke. Synth mustache keytar tote bag scenester.	Post	130	2018-02-03 22:28:23.290123	2018-02-03 22:28:23.290123	16
328	Yuccie tacos celiac bespoke migas photo booth. Put a bird on it yolo knausgaard squid normcore hashtag green juice. Beard drinking neutra cliche church-key. Vinyl green juice retro viral organic ugh etsy.	Post	131	2018-02-03 22:28:23.297081	2018-02-03 22:28:23.297081	70
329	Offal locavore xoxo fashion axe wayfarers knausgaard everyday squid. Tote bag retro portland sustainable loko etsy. Etsy plaid schlitz keytar bitters skateboard truffaut. Quinoa neutra hammock aesthetic thundercats letterpress. Keytar photo booth ethical seitan.	Post	131	2018-02-03 22:28:23.302368	2018-02-03 22:28:23.302368	28
330	Occupy vinegar typewriter 8-bit farm-to-table lo-fi fanny pack fixie. Taxidermy selvage health gentrify bespoke keffiyeh waistcoat freegan. Cleanse truffaut pork belly locavore. Farm-to-table cleanse ugh selvage franzen readymade. Intelligentsia echo farm-to-table chambray. Offal 8-bit viral xoxo iphone.	Post	131	2018-02-03 22:28:23.309457	2018-02-03 22:28:23.309457	60
331	Asymmetrical ethical locavore synth pitchfork selvage. Lumbersexual kale chips skateboard gastropub neutra. Sartorial ethical hammock.	Post	131	2018-02-03 22:28:23.316425	2018-02-03 22:28:23.316425	30
332	Bitters salvia yolo godard small batch truffaut. Taxidermy keffiyeh marfa hammock meggings gentrify shoreditch loko. Post-ironic kogi celiac messenger bag cliche wolf next level tofu. Messenger bag skateboard pop-up austin ramps freegan. Wes anderson marfa gluten-free vhs pour-over waistcoat neutra.	Post	131	2018-02-03 22:28:23.323576	2018-02-03 22:28:23.323576	25
333	Loko banjo direct trade drinking austin tofu. Meh twee goth plaid sriracha. Pour-over cronut muggle magic. Kinfolk wolf pabst irony disrupt mustache. Brooklyn irony hashtag scenester squid narwhal.	Post	132	2018-02-03 22:28:23.330835	2018-02-03 22:28:23.330835	64
334	Green juice poutine normcore knausgaard trust fund chartreuse. Viral organic godard cardigan art party sustainable.	Post	132	2018-02-03 22:28:23.337815	2018-02-03 22:28:23.337815	24
335	Chia sriracha you probably haven't heard of them fixie leggings. Tilde plaid sriracha. Cliche tilde yr normcore disrupt semiotics marfa. Pork belly flexitarian beard cronut gentrify fashion axe. Paleo irony bespoke 8-bit wayfarers cornhole.	Post	132	2018-02-03 22:28:23.344904	2018-02-03 22:28:23.344904	70
336	Church-key paleo helvetica farm-to-table bitters single-origin coffee humblebrag taxidermy. Ugh poutine pinterest cleanse diy hella pug cold-pressed.	Post	132	2018-02-03 22:28:23.353283	2018-02-03 22:28:23.353283	35
337	Asymmetrical normcore beard. Artisan wolf yolo messenger bag. Brunch venmo paleo yuccie goth waistcoat. Celiac aesthetic retro forage yuccie single-origin coffee small batch hella. Schlitz plaid forage whatever.	Post	133	2018-02-03 22:28:23.360557	2018-02-03 22:28:23.360557	52
338	Leggings vice flexitarian. Brooklyn viral green juice kickstarter portland slow-carb selvage.	Post	134	2018-02-03 22:28:23.369054	2018-02-03 22:28:23.369054	39
339	Meditation deep v farm-to-table blue bottle selvage cliche flexitarian. Raw denim meggings pop-up. Hella hoodie authentic sustainable.	Post	134	2018-02-03 22:28:23.376283	2018-02-03 22:28:23.376283	46
340	Readymade venmo wes anderson. Tousled poutine before they sold out knausgaard skateboard. Humblebrag hashtag taxidermy messenger bag typewriter cliche. Pinterest vinegar migas. Banh mi echo diy cronut swag. Squid cold-pressed pop-up hoodie.	Post	134	2018-02-03 22:28:23.385238	2018-02-03 22:28:23.385238	48
341	Synth vinyl kombucha. Art party kickstarter gastropub distillery franzen. Ethical franzen artisan vinyl. Biodiesel aesthetic migas chillwave hammock carry skateboard. Squid plaid kinfolk authentic viral cray vegan bicycle rights. Tote bag letterpress waistcoat scenester.	Post	134	2018-02-03 22:28:23.392474	2018-02-03 22:28:23.392474	2
342	Shabby chic heirloom xoxo keffiyeh echo blue bottle small batch. Xoxo bicycle rights retro art party green juice.	Post	134	2018-02-03 22:28:23.403607	2018-02-03 22:28:23.403607	75
343	Meggings banjo everyday. Pbr&b cold-pressed pour-over. Heirloom echo vinegar kinfolk authentic bushwick migas. Ethical muggle magic sriracha. Banjo godard blue bottle fingerstache bicycle rights semiotics green juice.	Post	135	2018-02-03 22:28:23.409197	2018-02-03 22:28:23.409197	11
344	Pbr&b lo-fi portland. Kogi forage wes anderson. Master hella migas. Sustainable yr helvetica 8-bit retro. Kitsch trust fund vegan chambray lomo. Tousled twee echo freegan pickled.	Post	135	2018-02-03 22:28:23.412352	2018-02-03 22:28:23.412352	75
345	Pabst cray gastropub tumblr tousled park. Waistcoat kogi next level pinterest synth shoreditch. Chartreuse gentrify selvage blue bottle. Slow-carb meggings blog humblebrag umami intelligentsia literally. Cold-pressed schlitz church-key banjo tousled heirloom occupy wayfarers.	Post	135	2018-02-03 22:28:23.417393	2018-02-03 22:28:23.417393	10
346	Echo wayfarers master meditation organic. Pop-up kogi flexitarian heirloom tacos intelligentsia iphone vice. Meh taxidermy meditation mumblecore. Asymmetrical cred leggings. Chartreuse roof blog. Vice fanny pack master +1.	Post	136	2018-02-03 22:28:23.422811	2018-02-03 22:28:23.422811	46
347	Cleanse park try-hard celiac pitchfork. Tousled tacos semiotics salvia bespoke artisan. Viral cred twee. Health vinegar deep v carry biodiesel. Listicle ennui ugh pork belly lumbersexual bushwick.	Post	136	2018-02-03 22:28:23.427462	2018-02-03 22:28:23.427462	53
348	Lo-fi asymmetrical craft beer pickled migas chia. Keffiyeh sartorial 8-bit authentic fanny pack.	Post	136	2018-02-03 22:28:23.432632	2018-02-03 22:28:23.432632	28
349	Artisan actually deep v park health swag plaid kombucha. Shabby chic normcore vinyl chia kickstarter. Banh mi selfies vhs chicharrones bushwick. Vhs schlitz vegan brunch. Humblebrag shabby chic chartreuse banjo scenester.	Post	137	2018-02-03 22:28:23.438223	2018-02-03 22:28:23.438223	73
350	Venmo stumptown vinyl pork belly neutra. Bicycle rights pbr&b goth polaroid.	Post	137	2018-02-03 22:28:23.442476	2018-02-03 22:28:23.442476	31
352	Art party disrupt 90's forage yolo selvage. Schlitz yr franzen literally blue bottle. Dreamcatcher flannel semiotics church-key carry. Beard 8-bit ethical chicharrones kickstarter. Cliche readymade 90's locavore deep v pickled brunch artisan.	Post	137	2018-02-03 22:28:23.453102	2018-02-03 22:28:23.453102	29
353	Wes anderson goth aesthetic chambray wolf readymade craft beer chartreuse. Vice disrupt literally mumblecore phlogiston.	Post	137	2018-02-03 22:28:23.458106	2018-02-03 22:28:23.458106	16
354	Keytar cardigan chia synth blog 90's biodiesel. Shoreditch ethical gentrify listicle fanny pack next level fingerstache. Scenester cardigan ethical biodiesel vice migas. Street gastropub 3 wolf moon distillery. Chicharrones knausgaard pabst try-hard fashion axe occupy jean shorts. Master try-hard fanny pack cred pop-up roof.	Post	138	2018-02-03 22:28:23.463556	2018-02-03 22:28:23.463556	57
355	Gentrify flexitarian selvage tousled. Cardigan ethical next level kogi put a bird on it jean shorts banh mi normcore. Butcher venmo flexitarian.	Post	139	2018-02-03 22:28:23.468807	2018-02-03 22:28:23.468807	27
356	Pbr&b seitan blue bottle migas vinyl goth whatever hammock. Synth phlogiston skateboard meditation readymade migas food truck kale chips. Wes anderson biodiesel leggings kombucha.	Post	140	2018-02-03 22:28:23.47314	2018-02-03 22:28:23.47314	27
357	Chicharrones wayfarers yuccie tumblr portland humblebrag. Offal humblebrag tumblr plaid vinegar try-hard. Forage before they sold out tilde. Direct trade truffaut hoodie bitters helvetica 8-bit post-ironic pitchfork.	Post	141	2018-02-03 22:28:23.478594	2018-02-03 22:28:23.478594	37
358	Pbr&b carry slow-carb. Master microdosing wes anderson schlitz. Carry occupy pork belly pitchfork gastropub.	Post	141	2018-02-03 22:28:23.484236	2018-02-03 22:28:23.484236	33
359	Loko jean shorts next level seitan pinterest migas listicle craft beer. Mixtape biodiesel normcore slow-carb photo booth gastropub. Synth muggle magic portland goth brooklyn biodiesel. Mixtape whatever plaid taxidermy waistcoat brooklyn meggings. Craft beer schlitz roof crucifix marfa. Viral craft beer heirloom bespoke lumbersexual tilde.	Post	141	2018-02-03 22:28:23.489375	2018-02-03 22:28:23.489375	58
360	Hoodie brunch deep v pinterest. Irony green juice slow-carb mustache health art party. 90's venmo kinfolk wayfarers vinyl tote bag.	Post	141	2018-02-03 22:28:23.494645	2018-02-03 22:28:23.494645	39
361	Art party leggings vhs pour-over letterpress skateboard organic. Literally celiac godard. Plaid kombucha yuccie leggings asymmetrical master selfies thundercats. Chartreuse vinegar leggings wayfarers echo. Butcher lomo humblebrag listicle. Hashtag stumptown wolf narwhal mlkshk direct trade.	Post	142	2018-02-03 22:28:23.503162	2018-02-03 22:28:23.503162	27
362	Plaid distillery food truck lo-fi shoreditch crucifix xoxo mumblecore. Deep v try-hard you probably haven't heard of them forage. 3 wolf moon gastropub photo booth.	Post	142	2018-02-03 22:28:23.508975	2018-02-03 22:28:23.508975	1
363	Banh mi truffaut forage helvetica. Hella kickstarter keytar readymade. Kogi meggings authentic trust fund beard. You probably haven't heard of them messenger bag polaroid next level cardigan gentrify schlitz. Brooklyn carry gluten-free meh vegan slow-carb narwhal tattooed.	Post	142	2018-02-03 22:28:23.515135	2018-02-03 22:28:23.515135	40
364	Mumblecore williamsburg typewriter waistcoat pug cardigan. Mlkshk hoodie kale chips locavore. Umami shoreditch ramps wayfarers cold-pressed. Salvia authentic intelligentsia godard. Shabby chic brunch asymmetrical knausgaard butcher cred shoreditch etsy.	Post	144	2018-02-03 22:28:23.52006	2018-02-03 22:28:23.52006	62
365	Freegan pinterest cornhole meditation irony. Truffaut mumblecore meditation. Phlogiston raw denim twee five dollar toast artisan put a bird on it hammock.	Post	144	2018-02-03 22:28:23.525269	2018-02-03 22:28:23.525269	71
366	Roof chicharrones pinterest intelligentsia leggings. Blue bottle kinfolk pabst bushwick gentrify. Carry squid mixtape direct trade.	Post	144	2018-02-03 22:28:23.530628	2018-02-03 22:28:23.530628	67
367	Helvetica godard gluten-free freegan cronut trust fund. Normcore art party humblebrag. Tousled art party pug. Street gastropub chambray deep v.	Post	144	2018-02-03 22:28:23.535116	2018-02-03 22:28:23.535116	47
368	Shabby chic single-origin coffee shoreditch neutra listicle mumblecore phlogiston vhs. Letterpress neutra hella 3 wolf moon. Goth 90's vinyl pour-over tattooed narwhal taxidermy. Quinoa twee scenester drinking truffaut.	Post	144	2018-02-03 22:28:23.540156	2018-02-03 22:28:23.540156	24
369	Godard food truck umami cleanse williamsburg. Craft beer trust fund fixie kitsch franzen truffaut. Irony bespoke pinterest cred tumblr. Squid pitchfork franzen ugh asymmetrical ennui fanny pack. Xoxo next level listicle.	Post	145	2018-02-03 22:28:23.545569	2018-02-03 22:28:23.545569	35
370	Readymade pork belly gluten-free next level vegan. Muggle magic ethical pitchfork gentrify poutine flannel green juice. Tousled yolo pug crucifix retro messenger bag typewriter twee. Truffaut blue bottle letterpress synth.	Post	145	2018-02-03 22:28:23.550483	2018-02-03 22:28:23.550483	75
371	Flannel marfa bespoke normcore cray. Gentrify direct trade craft beer. Kickstarter bushwick ethical.	Post	145	2018-02-03 22:28:23.555464	2018-02-03 22:28:23.555464	38
372	Mlkshk austin kinfolk knausgaard ennui lomo. Gastropub truffaut helvetica everyday. Wolf kitsch trust fund keytar. Literally franzen viral kinfolk bushwick mumblecore. Gluten-free selfies chillwave photo booth whatever wolf kombucha. Bicycle rights craft beer pug fanny pack mixtape viral bushwick.	Post	145	2018-02-03 22:28:23.561208	2018-02-03 22:28:23.561208	8
373	Master readymade bicycle rights migas. Brooklyn phlogiston kinfolk quinoa street pinterest biodiesel narwhal. Migas semiotics portland bitters. Poutine vinyl freegan yolo organic occupy asymmetrical gentrify. 3 wolf moon semiotics vinegar retro meditation swag polaroid ennui.	Post	145	2018-02-03 22:28:23.566064	2018-02-03 22:28:23.566064	13
374	Gluten-free photo booth hashtag fingerstache disrupt selvage kombucha. Meh chia street deep v tacos fingerstache park pug. Butcher intelligentsia beard wolf keffiyeh. Ramps pbr&b mumblecore loko. Xoxo pop-up crucifix vegan.	Post	146	2018-02-03 22:28:23.571317	2018-02-03 22:28:23.571317	29
375	Sriracha irony selfies distillery occupy scenester. Paleo fanny pack hammock vhs. Vice asymmetrical paleo.	Post	146	2018-02-03 22:28:23.57694	2018-02-03 22:28:23.57694	8
376	Pickled hashtag before they sold out kombucha viral hoodie carry. Wolf meh brunch. Distillery disrupt meditation hoodie 8-bit. Crucifix everyday butcher humblebrag ethical iphone.	Post	146	2018-02-03 22:28:23.581612	2018-02-03 22:28:23.581612	29
377	Yuccie letterpress franzen dreamcatcher. Before they sold out meditation kinfolk pinterest trust fund salvia. Bicycle rights portland actually mustache chartreuse vegan pabst. Single-origin coffee health gastropub before they sold out. Stumptown viral food truck squid knausgaard.	Post	146	2018-02-03 22:28:23.587549	2018-02-03 22:28:23.587549	59
378	Lomo chia try-hard. Xoxo art party green juice. Vhs banjo pickled. Shabby chic narwhal stumptown yuccie biodiesel. Kale chips aesthetic cronut mlkshk. Quinoa hella brooklyn swag polaroid portland.	Post	147	2018-02-03 22:28:23.596236	2018-02-03 22:28:23.596236	66
379	Literally beard seitan vice readymade phlogiston thundercats pour-over. Actually farm-to-table 90's cred cold-pressed echo brunch meditation. Dreamcatcher waistcoat post-ironic hella sustainable carry before they sold out taxidermy. Ethical kogi plaid street cronut. Photo booth umami fashion axe diy semiotics direct trade vice taxidermy.	Post	147	2018-02-03 22:28:23.605383	2018-02-03 22:28:23.605383	15
380	Kickstarter sriracha quinoa. Plaid yr lo-fi deep v chartreuse. Phlogiston bushwick thundercats beard. Whatever goth portland authentic seitan. Flexitarian banjo 8-bit tilde diy.	Post	147	2018-02-03 22:28:23.612545	2018-02-03 22:28:23.612545	65
381	Muggle magic phlogiston hashtag. Diy vhs vegan you probably haven't heard of them neutra. Ugh beard hashtag pinterest keytar vhs keffiyeh church-key. Forage heirloom bitters brunch pitchfork occupy.	Post	148	2018-02-03 22:28:23.619801	2018-02-03 22:28:23.619801	67
382	Chia asymmetrical cliche street letterpress intelligentsia. Viral goth ugh. Lomo vinyl listicle pour-over chillwave retro. Kickstarter before they sold out park tilde beard keffiyeh sartorial asymmetrical. Retro slow-carb helvetica sriracha kitsch.	Post	148	2018-02-03 22:28:23.62721	2018-02-03 22:28:23.62721	30
383	Austin lomo yr portland organic put a bird on it disrupt pop-up. Leggings photo booth ugh cronut. Vinegar chambray xoxo fixie drinking offal diy.	Post	148	2018-02-03 22:28:23.634172	2018-02-03 22:28:23.634172	7
384	Keytar kombucha forage squid. Echo pug try-hard yuccie everyday health chillwave skateboard. Microdosing vhs plaid. Ennui sartorial pbr&b deep v health shabby chic.	Post	148	2018-02-03 22:28:23.64131	2018-02-03 22:28:23.64131	35
385	Diy meditation taxidermy gastropub williamsburg scenester before they sold out fixie. Viral brunch tattooed. Portland locavore distillery beard you probably haven't heard of them church-key skateboard. Intelligentsia skateboard neutra drinking pour-over biodiesel letterpress street. Wolf occupy bitters farm-to-table meditation shoreditch locavore.	Post	148	2018-02-03 22:28:23.649386	2018-02-03 22:28:23.649386	40
386	Banjo twee gluten-free lomo forage locavore leggings kombucha. Swag godard ethical. Swag fashion axe wes anderson pork belly lo-fi.	Post	149	2018-02-03 22:28:23.656466	2018-02-03 22:28:23.656466	15
387	Five dollar toast flexitarian dreamcatcher truffaut post-ironic bushwick hoodie. 8-bit aesthetic distillery hashtag meh vinegar vinyl. Lomo banjo drinking distillery kombucha.	Post	149	2018-02-03 22:28:23.664115	2018-02-03 22:28:23.664115	15
388	Bicycle rights franzen deep v venmo sustainable scenester hammock. Craft beer diy bushwick quinoa shoreditch hoodie. Neutra diy single-origin coffee carry blog umami. Green juice photo booth xoxo. Sustainable pickled scenester semiotics bicycle rights tote bag biodiesel phlogiston. Synth disrupt scenester yolo whatever mlkshk.	Post	149	2018-02-03 22:28:23.671357	2018-02-03 22:28:23.671357	33
389	Banh mi cornhole narwhal umami microdosing celiac loko. Truffaut distillery marfa migas readymade everyday. Diy seitan cleanse leggings.	Post	150	2018-02-03 22:28:23.679777	2018-02-03 22:28:23.679777	21
390	Migas ethical diy. Wes anderson muggle magic franzen biodiesel. Paleo +1 chambray thundercats cray jean shorts sustainable. Chicharrones organic artisan hammock viral. Plaid freegan pug vinyl authentic vhs fixie sartorial.	Post	150	2018-02-03 22:28:23.690454	2018-02-03 22:28:23.690454	18
391	Disrupt leggings brooklyn. Vinyl pbr&b shabby chic bespoke leggings ennui pug. Taxidermy butcher vhs listicle hashtag chicharrones swag.	Post	151	2018-02-03 22:28:23.701511	2018-02-03 22:28:23.701511	39
392	Fanny pack blog trust fund kickstarter. Tilde chambray bushwick tousled muggle magic kale chips forage portland. Intelligentsia iphone cray direct trade muggle magic art party offal. Viral vice umami food truck.	Post	151	2018-02-03 22:28:23.712978	2018-02-03 22:28:23.712978	74
393	Locavore everyday skateboard cronut microdosing tacos. Selvage diy flannel pbr&b chartreuse brooklyn. Actually stumptown letterpress iphone. Kickstarter cornhole lomo 3 wolf moon banjo kombucha distillery. Tumblr locavore artisan. Flannel farm-to-table viral trust fund cold-pressed asymmetrical cliche street.	Post	151	2018-02-03 22:28:23.729729	2018-02-03 22:28:23.729729	9
394	Sustainable vinegar whatever biodiesel carry. Aesthetic locavore sustainable fashion axe. Roof cardigan banjo echo. Selvage pork belly roof street occupy pbr&b butcher. Loko everyday organic readymade authentic viral next level.	Post	151	2018-02-03 22:28:23.738141	2018-02-03 22:28:23.738141	40
395	Swag roof lomo pour-over vhs direct trade tilde. Tousled muggle magic banh mi humblebrag green juice semiotics.	Post	152	2018-02-03 22:28:23.752709	2018-02-03 22:28:23.752709	33
396	Sustainable meh you probably haven't heard of them biodiesel. Banh mi messenger bag neutra park godard offal. Before they sold out kickstarter pug post-ironic celiac. Narwhal pug muggle magic 8-bit.	Post	153	2018-02-03 22:28:23.761724	2018-02-03 22:28:23.761724	21
397	Whatever small batch shoreditch chambray kickstarter kale chips. Cray beard pug banjo gluten-free bicycle rights chia aesthetic. Neutra helvetica microdosing. Trust fund celiac hammock twee. Everyday 8-bit post-ironic diy put a bird on it five dollar toast. Cold-pressed typewriter yuccie wayfarers loko etsy bitters pug.	Post	153	2018-02-03 22:28:23.77669	2018-02-03 22:28:23.77669	6
398	Vice brooklyn pabst. Food truck franzen try-hard vice tumblr phlogiston paleo. Yr literally yolo freegan trust fund. Ethical authentic pinterest tilde venmo. Selvage sriracha ethical cornhole tofu.	Post	153	2018-02-03 22:28:23.786153	2018-02-03 22:28:23.786153	15
399	Diy plaid meggings cliche direct trade mumblecore 8-bit. Knausgaard hammock ramps cliche selvage wayfarers wes anderson. Next level cray leggings everyday knausgaard.	Post	154	2018-02-03 22:28:23.796721	2018-02-03 22:28:23.796721	65
400	Swag taxidermy farm-to-table flexitarian sriracha yr bushwick deep v. Next level cliche franzen mustache locavore vinegar. Polaroid poutine fanny pack williamsburg sriracha cleanse. Pabst readymade letterpress blue bottle poutine chartreuse etsy whatever. Sriracha cred phlogiston tacos.	Post	155	2018-02-03 22:28:23.806928	2018-02-03 22:28:23.806928	77
401	Slow-carb health meh echo. Cred 3 wolf moon ennui distillery. Yuccie venmo carry normcore pitchfork.	Post	155	2018-02-03 22:28:23.818267	2018-02-03 22:28:23.818267	33
402	Pour-over umami dreamcatcher tumblr tofu pug hashtag. Bushwick migas disrupt single-origin coffee slow-carb meditation +1 synth. 90's authentic goth marfa ethical.	Post	155	2018-02-03 22:28:23.834932	2018-02-03 22:28:23.834932	77
403	Venmo bicycle rights salvia leggings. Artisan pug normcore ugh hoodie cred offal. Chartreuse lumbersexual raw denim williamsburg. Celiac +1 cardigan lo-fi banjo literally pitchfork.	Post	155	2018-02-03 22:28:23.850024	2018-02-03 22:28:23.850024	34
404	Ramps cornhole venmo post-ironic aesthetic echo pour-over. You probably haven't heard of them scenester poutine. Tilde everyday tousled photo booth semiotics forage twee. Lo-fi echo freegan roof ennui banjo. Shoreditch brunch taxidermy food truck venmo.	Post	155	2018-02-03 22:28:23.858804	2018-02-03 22:28:23.858804	36
405	Umami mlkshk distillery. Chartreuse hammock listicle put a bird on it godard narwhal paleo.	Post	156	2018-02-03 22:28:23.88088	2018-02-03 22:28:23.88088	43
406	Pabst semiotics etsy. Asymmetrical biodiesel vinyl banjo. Offal austin typewriter ennui pitchfork tofu bicycle rights. Helvetica kinfolk messenger bag schlitz normcore fingerstache park lomo.	Post	156	2018-02-03 22:28:23.885299	2018-02-03 22:28:23.885299	67
407	Yr yolo church-key cardigan. Blue bottle marfa tumblr. Roof skateboard pickled. Tattooed crucifix aesthetic wayfarers irony ennui knausgaard vinegar. Taxidermy waistcoat iphone brooklyn knausgaard.	Post	156	2018-02-03 22:28:23.894949	2018-02-03 22:28:23.894949	69
408	Selvage listicle authentic flexitarian typewriter. Ugh +1 meh ethical carry cleanse cray taxidermy. Chia austin slow-carb letterpress portland knausgaard park.	Post	156	2018-02-03 22:28:23.9054	2018-02-03 22:28:23.9054	54
409	Polaroid letterpress godard plaid butcher brooklyn. Umami brunch kinfolk bitters vhs skateboard deep v pickled. Truffaut photo booth xoxo offal diy artisan venmo post-ironic. Blog church-key salvia readymade diy austin iphone. Cray forage locavore direct trade photo booth jean shorts.	Post	157	2018-02-03 22:28:23.92226	2018-02-03 22:28:23.92226	47
410	Sriracha portland lomo sustainable butcher pork belly beard. Craft beer shabby chic vhs wes anderson keytar beard sriracha.	Post	157	2018-02-03 22:28:23.939797	2018-02-03 22:28:23.939797	40
411	Viral ennui vinegar jean shorts church-key mumblecore put a bird on it. Pinterest authentic fanny pack neutra keffiyeh everyday listicle vegan.	Post	158	2018-02-03 22:28:23.954158	2018-02-03 22:28:23.954158	58
412	Sriracha marfa yuccie ramps cliche you probably haven't heard of them. Vhs butcher 90's shoreditch. Cleanse bicycle rights synth hashtag meggings pickled. Tumblr park cred meh beard street small batch trust fund. Offal kitsch neutra 90's. Neutra normcore messenger bag mustache.	Post	158	2018-02-03 22:28:23.971731	2018-02-03 22:28:23.971731	53
413	Vinegar beard microdosing health authentic. Venmo aesthetic five dollar toast cardigan. Craft beer quinoa lumbersexual pitchfork seitan swag.	Post	158	2018-02-03 22:28:23.98727	2018-02-03 22:28:23.98727	31
414	Cornhole mustache pinterest hoodie cred truffaut schlitz yolo. Tacos flexitarian venmo.	Post	159	2018-02-03 22:28:23.995778	2018-02-03 22:28:23.995778	62
415	Pabst food truck cleanse. Kinfolk readymade jean shorts mumblecore cred typewriter organic. Fixie wayfarers organic chillwave pour-over kogi schlitz. Aesthetic small batch pop-up. Godard deep v stumptown hoodie actually. Wayfarers helvetica cred mustache tote bag.	Post	160	2018-02-03 22:28:24.000712	2018-02-03 22:28:24.000712	77
416	Vegan bicycle rights fixie pinterest meh brooklyn pabst mustache. Etsy letterpress green juice.	Post	161	2018-02-03 22:28:24.016434	2018-02-03 22:28:24.016434	67
417	Post-ironic irony farm-to-table. Viral selvage post-ironic vhs. Diy art party food truck tattooed stumptown butcher hammock. Umami vegan tattooed jean shorts etsy. Sartorial waistcoat organic. Freegan 90's tumblr trust fund roof kitsch scenester biodiesel.	Post	161	2018-02-03 22:28:24.026058	2018-02-03 22:28:24.026058	77
418	Ugh food truck biodiesel kitsch sartorial beard. Tilde bitters crucifix. Bushwick stumptown pork belly neutra selfies drinking everyday.	Post	161	2018-02-03 22:28:24.041865	2018-02-03 22:28:24.041865	71
419	Disrupt occupy messenger bag meh kickstarter slow-carb. Paleo narwhal meditation you probably haven't heard of them pitchfork diy. Fingerstache taxidermy keffiyeh heirloom pop-up banh mi meh helvetica.	Post	162	2018-02-03 22:28:24.051027	2018-02-03 22:28:24.051027	77
420	Stumptown tattooed vhs squid organic mixtape. Tousled slow-carb vice gastropub put a bird on it tumblr pitchfork offal. Bushwick deep v hammock cray narwhal organic before they sold out cliche. Muggle magic schlitz pabst. Raw denim narwhal waistcoat flannel ramps hoodie. Pour-over chia paleo sriracha jean shorts art party kickstarter.	Post	163	2018-02-03 22:28:24.060497	2018-02-03 22:28:24.060497	26
421	Truffaut kogi yr shoreditch synth. Williamsburg vinegar polaroid everyday skateboard. Meditation distillery sriracha wolf yuccie.	Post	163	2018-02-03 22:28:24.070227	2018-02-03 22:28:24.070227	53
422	Lo-fi before they sold out pickled food truck cleanse. Ramps diy cardigan mumblecore swag carry.	Post	163	2018-02-03 22:28:24.080337	2018-02-03 22:28:24.080337	27
423	Plaid try-hard cardigan pbr&b sartorial. Shabby chic normcore migas bespoke. Literally helvetica selfies brunch shabby chic disrupt occupy raw denim.	Post	163	2018-02-03 22:28:24.087641	2018-02-03 22:28:24.087641	8
424	Cliche migas fashion axe umami normcore synth waistcoat. Godard venmo slow-carb hella. Ennui direct trade humblebrag whatever. Art party lomo biodiesel forage polaroid cold-pressed.	Post	164	2018-02-03 22:28:24.092517	2018-02-03 22:28:24.092517	41
425	Pbr&b waistcoat kinfolk vhs. Ugh tacos chillwave franzen fingerstache ethical twee intelligentsia. Biodiesel typewriter quinoa next level shoreditch fingerstache. Poutine literally trust fund kogi phlogiston vinyl before they sold out.	Post	164	2018-02-03 22:28:24.099506	2018-02-03 22:28:24.099506	32
426	Mixtape messenger bag authentic thundercats taxidermy lomo typewriter kogi. Quinoa mixtape leggings try-hard actually. Sustainable cardigan tousled tumblr. Portland muggle magic try-hard. Occupy banh mi tattooed meditation mustache 90's pbr&b wes anderson.	Post	164	2018-02-03 22:28:24.10636	2018-02-03 22:28:24.10636	62
427	Pbr&b bushwick gluten-free normcore retro goth try-hard. Mumblecore hoodie humblebrag. Aesthetic whatever 90's neutra keffiyeh brunch put a bird on it beard. Tousled chartreuse cleanse mumblecore hella. Kale chips freegan church-key blue bottle. Kickstarter whatever bicycle rights crucifix franzen roof.	Post	165	2018-02-03 22:28:24.113624	2018-02-03 22:28:24.113624	77
428	Cardigan fingerstache fixie authentic marfa paleo tattooed. Vice you probably haven't heard of them forage banjo cleanse listicle pug narwhal.	Post	166	2018-02-03 22:28:24.120512	2018-02-03 22:28:24.120512	64
429	Venmo pabst scenester typewriter pbr&b. Fanny pack gluten-free forage dreamcatcher humblebrag wayfarers. Biodiesel everyday readymade.	Post	166	2018-02-03 22:28:24.128245	2018-02-03 22:28:24.128245	77
430	Twee pbr&b art party celiac master. Cray diy knausgaard deep v gluten-free. Austin hammock brooklyn put a bird on it gentrify dreamcatcher.	Post	166	2018-02-03 22:28:24.134984	2018-02-03 22:28:24.134984	43
431	Cred waistcoat before they sold out tumblr narwhal sriracha. Stumptown occupy offal muggle magic health helvetica. Keytar cleanse synth pitchfork food truck neutra. Brunch narwhal cold-pressed. Sustainable iphone meditation.	Post	166	2018-02-03 22:28:24.140205	2018-02-03 22:28:24.140205	23
432	Offal flexitarian fixie. Knausgaard selfies locavore pug meggings cronut. Pork belly 3 wolf moon deep v tattooed yuccie direct trade meh. Green juice chia normcore waistcoat scenester keytar kale chips.	Post	166	2018-02-03 22:28:24.147033	2018-02-03 22:28:24.147033	7
433	Farm-to-table forage banh mi normcore cleanse yr mumblecore. Venmo vegan 8-bit narwhal. Wolf loko pop-up gluten-free hoodie. Tacos twee taxidermy mustache artisan hoodie sartorial celiac. Brooklyn cardigan farm-to-table wes anderson whatever craft beer.	Post	167	2018-02-03 22:28:24.15406	2018-02-03 22:28:24.15406	62
434	Literally readymade green juice hashtag cornhole selvage single-origin coffee thundercats. Banh mi godard forage pork belly heirloom next level taxidermy. Organic microdosing tofu cray drinking etsy dreamcatcher lo-fi. Locavore hoodie pork belly craft beer art party lo-fi. Kogi shabby chic marfa meh put a bird on it street 90's schlitz.	Post	167	2018-02-03 22:28:24.160943	2018-02-03 22:28:24.160943	69
435	Heirloom pour-over xoxo phlogiston pop-up microdosing authentic keffiyeh. Ramps ennui selvage.	Post	167	2018-02-03 22:28:24.167649	2018-02-03 22:28:24.167649	35
436	Whatever keytar paleo sriracha aesthetic crucifix locavore loko. Etsy flexitarian park tumblr yuccie church-key. Quinoa lomo microdosing meditation slow-carb intelligentsia trust fund letterpress. Stumptown diy park lo-fi. Ethical squid chambray tofu meditation.	Post	167	2018-02-03 22:28:24.174962	2018-02-03 22:28:24.174962	16
437	Cleanse schlitz cardigan sriracha retro pabst green juice xoxo. Actually messenger bag health sartorial 90's. Retro sartorial bushwick. Poutine occupy mustache. Lumbersexual pabst poutine asymmetrical. Etsy tote bag raw denim bitters mixtape.	Post	168	2018-02-03 22:28:24.182028	2018-02-03 22:28:24.182028	29
438	Kale chips schlitz health. Ugh pour-over sriracha. Stumptown paleo brunch. Tofu echo kale chips flannel retro keytar. Pitchfork squid muggle magic blog polaroid vegan.	Post	168	2018-02-03 22:28:24.190166	2018-02-03 22:28:24.190166	65
439	Polaroid 8-bit normcore. Vice asymmetrical crucifix meh chambray umami. Whatever kickstarter blue bottle muggle magic put a bird on it before they sold out. Direct trade brooklyn sartorial mlkshk health pop-up echo chicharrones.	Post	168	2018-02-03 22:28:24.197087	2018-02-03 22:28:24.197087	32
440	Chambray goth meh vinyl gentrify wes anderson. Chia schlitz brooklyn. Pickled pug tofu echo cred loko cleanse.	Post	169	2018-02-03 22:28:24.201975	2018-02-03 22:28:24.201975	20
441	8-bit narwhal pork belly intelligentsia cornhole normcore. Pinterest yr cardigan seitan tattooed synth lumbersexual. Pbr&b flannel cray street artisan mumblecore. Beard freegan celiac pop-up chambray bespoke. Whatever umami vice tote bag. Umami tacos distillery roof heirloom pitchfork.	Post	170	2018-02-03 22:28:24.209004	2018-02-03 22:28:24.209004	9
442	3 wolf moon cleanse migas kickstarter health gastropub tattooed leggings. Craft beer goth fixie godard kogi asymmetrical green juice artisan. Park authentic tilde artisan. Single-origin coffee craft beer yuccie wayfarers. Pinterest stumptown chicharrones church-key hoodie. Craft beer trust fund venmo roof.	Post	170	2018-02-03 22:28:24.216038	2018-02-03 22:28:24.216038	75
443	Five dollar toast selfies cronut drinking food truck dreamcatcher. Organic meggings bushwick squid quinoa keffiyeh retro. Gastropub cleanse banjo vegan. Try-hard polaroid gentrify artisan fingerstache.	Post	171	2018-02-03 22:28:24.222842	2018-02-03 22:28:24.222842	32
444	Tote bag leggings intelligentsia knausgaard. Cold-pressed organic keffiyeh.	Post	172	2018-02-03 22:28:24.230476	2018-02-03 22:28:24.230476	33
445	Meditation vice lumbersexual hashtag mixtape yolo muggle magic. Tattooed next level synth bushwick chillwave.	Post	172	2018-02-03 22:28:24.235747	2018-02-03 22:28:24.235747	6
446	Raw denim godard neutra cleanse echo umami portland meggings. Locavore synth next level xoxo lomo diy vhs. Master ennui aesthetic try-hard chartreuse craft beer portland. Carry chillwave waistcoat crucifix ramps pinterest bitters fixie. Pitchfork muggle magic iphone jean shorts yolo.	Post	172	2018-02-03 22:28:24.242665	2018-02-03 22:28:24.242665	35
447	Forage cardigan brooklyn vinegar occupy keytar knausgaard seitan. Cornhole next level pbr&b 90's cronut cold-pressed. Ethical 3 wolf moon stumptown franzen swag. Authentic blog tofu pop-up typewriter crucifix carry retro. Normcore chia pickled kogi deep v roof chambray meh. Deep v lo-fi yr.	Post	173	2018-02-03 22:28:24.249774	2018-02-03 22:28:24.249774	75
448	Craft beer locavore meditation wes anderson chia tousled. Health portland muggle magic cronut bushwick.	Post	173	2018-02-03 22:28:24.256441	2018-02-03 22:28:24.256441	25
449	Keffiyeh you probably haven't heard of them trust fund. 8-bit carry iphone pork belly pickled stumptown banjo. Pabst cray poutine sriracha etsy. Neutra ramps distillery blue bottle. Cold-pressed biodiesel godard.	Post	174	2018-02-03 22:28:24.26342	2018-02-03 22:28:24.26342	17
450	Phlogiston chambray celiac distillery slow-carb. Yr slow-carb put a bird on it marfa helvetica narwhal tilde messenger bag. Jean shorts deep v meditation.	Post	174	2018-02-03 22:28:24.270104	2018-02-03 22:28:24.270104	57
451	Freegan cardigan master pbr&b street helvetica. Kitsch skateboard artisan organic messenger bag tumblr chicharrones butcher.	Post	174	2018-02-03 22:28:24.277003	2018-02-03 22:28:24.277003	51
452	8-bit squid everyday chambray. Portland authentic put a bird on it bushwick offal park mumblecore. Ramps sartorial tumblr. Goth yolo pabst.	Post	174	2018-02-03 22:28:24.284267	2018-02-03 22:28:24.284267	22
453	Retro selvage beard waistcoat twee yuccie freegan portland. Bushwick put a bird on it brooklyn listicle mlkshk. Typewriter chambray tumblr master hashtag. Polaroid brunch pinterest etsy kale chips deep v.	Post	175	2018-02-03 22:28:24.291364	2018-02-03 22:28:24.291364	72
454	Blue bottle iphone chicharrones. Distillery kinfolk bicycle rights phlogiston plaid keytar squid. Pop-up cold-pressed kitsch swag. Synth fanny pack intelligentsia drinking hoodie sartorial sustainable.	Post	176	2018-02-03 22:28:24.296585	2018-02-03 22:28:24.296585	66
455	Austin muggle magic master taxidermy sriracha cleanse ethical. Hella pbr&b diy typewriter cred craft beer forage. 90's leggings messenger bag listicle fixie. Dreamcatcher shoreditch pork belly. Helvetica skateboard austin lumbersexual truffaut disrupt. Skateboard lumbersexual mixtape typewriter.	Post	176	2018-02-03 22:28:24.303605	2018-02-03 22:28:24.303605	70
456	Tofu lumbersexual franzen aesthetic goth umami taxidermy. Microdosing literally beard vinyl food truck ramps dreamcatcher kinfolk. Drinking readymade iphone yr irony cleanse. Biodiesel crucifix flexitarian banh mi.	Post	176	2018-02-03 22:28:24.31063	2018-02-03 22:28:24.31063	52
457	Blue bottle kale chips franzen farm-to-table. Tacos etsy messenger bag taxidermy plaid fingerstache.	Post	177	2018-02-03 22:28:24.317475	2018-02-03 22:28:24.317475	43
458	Letterpress twee quinoa. Mixtape godard disrupt small batch distillery.	Post	177	2018-02-03 22:28:24.324298	2018-02-03 22:28:24.324298	13
459	Polaroid 8-bit before they sold out fingerstache bespoke sustainable fixie beard. You probably haven't heard of them muggle magic cliche everyday pour-over iphone. Wolf pinterest post-ironic butcher chartreuse ennui.	Post	177	2018-02-03 22:28:24.335984	2018-02-03 22:28:24.335984	43
460	Wayfarers semiotics gluten-free cold-pressed cronut. Distillery shoreditch slow-carb hashtag green juice tilde mixtape jean shorts. Truffaut banjo paleo. Scenester put a bird on it pbr&b photo booth biodiesel lumbersexual. Freegan 3 wolf moon cray xoxo squid small batch chillwave authentic.	Post	178	2018-02-03 22:28:24.343465	2018-02-03 22:28:24.343465	56
461	Squid artisan cardigan before they sold out stumptown blue bottle ennui portland. Tofu xoxo seitan bushwick put a bird on it small batch. Lomo 3 wolf moon beard knausgaard occupy marfa salvia paleo.	Post	178	2018-02-03 22:28:24.350433	2018-02-03 22:28:24.350433	45
462	Pork belly whatever umami mumblecore shoreditch +1 migas. Distillery irony 90's sustainable chillwave flannel. Echo hella health ramps kickstarter pbr&b. Squid bitters brooklyn pitchfork schlitz knausgaard bushwick cardigan. Cray tumblr retro.	Post	178	2018-02-03 22:28:24.357532	2018-02-03 22:28:24.357532	60
463	Pitchfork helvetica franzen muggle magic leggings 8-bit 3 wolf moon. Put a bird on it neutra chambray waistcoat.	Post	179	2018-02-03 22:28:24.364633	2018-02-03 22:28:24.364633	68
464	Pabst cray muggle magic. Cornhole artisan fashion axe twee hella post-ironic. Synth meh kitsch.	Post	179	2018-02-03 22:28:24.37172	2018-02-03 22:28:24.37172	18
465	Cliche beard cold-pressed park stumptown before they sold out asymmetrical. Tacos dreamcatcher vice etsy deep v squid kitsch.	Post	179	2018-02-03 22:28:24.378795	2018-02-03 22:28:24.378795	50
466	Shabby chic yolo cray readymade next level narwhal health freegan. Pork belly selvage bicycle rights.	Post	179	2018-02-03 22:28:24.386359	2018-02-03 22:28:24.386359	6
467	Ramps +1 chia goth swag lumbersexual. Fanny pack slow-carb retro banjo umami. Tilde wes anderson narwhal cold-pressed farm-to-table semiotics carry.	Post	179	2018-02-03 22:28:24.393516	2018-02-03 22:28:24.393516	52
468	Gluten-free keytar fashion axe kale chips. Post-ironic salvia kinfolk kombucha put a bird on it. Seitan crucifix poutine raw denim banjo.	Post	180	2018-02-03 22:28:24.400459	2018-02-03 22:28:24.400459	45
469	Slow-carb distillery pork belly literally echo butcher. Umami craft beer wes anderson cardigan cliche knausgaard blog shabby chic.	Post	180	2018-02-03 22:28:24.407426	2018-02-03 22:28:24.407426	31
470	Diy fashion axe normcore pork belly knausgaard etsy listicle blue bottle. Ennui vhs chicharrones.	Post	180	2018-02-03 22:28:24.414475	2018-02-03 22:28:24.414475	1
471	Venmo paleo cold-pressed. Five dollar toast lumbersexual tattooed goth. Venmo wes anderson normcore. Fashion axe farm-to-table butcher cray hammock normcore.	Post	180	2018-02-03 22:28:24.421346	2018-02-03 22:28:24.421346	43
472	Meggings vhs before they sold out gluten-free waistcoat. Thundercats gluten-free keytar quinoa cliche.	Post	180	2018-02-03 22:28:24.428516	2018-02-03 22:28:24.428516	47
473	Scenester single-origin coffee artisan direct trade. Phlogiston hammock vhs fingerstache tumblr chia. Cornhole twee banh mi readymade godard. Cold-pressed +1 intelligentsia pabst.	Post	181	2018-02-03 22:28:24.435482	2018-02-03 22:28:24.435482	35
474	Bespoke keffiyeh intelligentsia marfa hammock viral hoodie single-origin coffee. Tacos leggings poutine banh mi squid keffiyeh. Hoodie street cold-pressed distillery truffaut poutine yolo. 3 wolf moon mumblecore iphone food truck messenger bag.	Post	181	2018-02-03 22:28:24.442684	2018-02-03 22:28:24.442684	22
475	Synth fashion axe meh phlogiston cray intelligentsia thundercats. Blue bottle seitan cred schlitz retro lo-fi ramps. Blog synth hella cred butcher intelligentsia neutra banjo. Hoodie austin freegan xoxo bitters.	Post	181	2018-02-03 22:28:24.449924	2018-02-03 22:28:24.449924	75
476	Meh church-key gluten-free. Semiotics fingerstache schlitz typewriter tofu pabst migas letterpress. Meh tumblr celiac kickstarter waistcoat. Portland tilde echo squid 3 wolf moon art party. Crucifix before they sold out cred distillery.	Post	181	2018-02-03 22:28:24.457054	2018-02-03 22:28:24.457054	17
477	Gentrify pinterest keffiyeh synth. Microdosing food truck roof slow-carb ethical freegan forage. Gentrify fanny pack austin. Intelligentsia pour-over beard venmo chambray.	Post	182	2018-02-03 22:28:24.464325	2018-02-03 22:28:24.464325	45
478	Meggings muggle magic goth. Flannel lumbersexual hashtag muggle magic twee bitters echo retro. Poutine irony bushwick master taxidermy. Wolf normcore pinterest offal pop-up.	Post	182	2018-02-03 22:28:24.471504	2018-02-03 22:28:24.471504	23
479	Etsy sriracha flexitarian squid narwhal green juice. Master truffaut venmo fingerstache gluten-free put a bird on it pork belly street. Pitchfork typewriter knausgaard godard muggle magic etsy jean shorts. Stumptown shabby chic quinoa mustache scenester goth. Literally health brooklyn tumblr freegan 8-bit yuccie pitchfork.	Post	183	2018-02-03 22:28:24.478563	2018-02-03 22:28:24.478563	16
480	Sartorial godard blue bottle helvetica cold-pressed wayfarers chillwave. Photo booth tattooed cornhole. Forage pitchfork gluten-free artisan venmo locavore.	Post	183	2018-02-03 22:28:24.486806	2018-02-03 22:28:24.486806	60
481	Pork belly iphone thundercats put a bird on it. Tousled try-hard plaid yolo squid venmo you probably haven't heard of them. Mlkshk sriracha church-key literally drinking tacos.	Post	183	2018-02-03 22:28:24.493968	2018-02-03 22:28:24.493968	1
482	Typewriter narwhal try-hard cliche bicycle rights. Sustainable tofu biodiesel gentrify chambray +1 wes anderson quinoa.	Post	184	2018-02-03 22:28:24.498871	2018-02-03 22:28:24.498871	38
483	Kombucha blog ugh aesthetic master cardigan church-key ennui. Neutra deep v leggings crucifix wes anderson selvage.	Post	184	2018-02-03 22:28:24.505687	2018-02-03 22:28:24.505687	27
484	Distillery pour-over raw denim heirloom migas messenger bag synth keffiyeh. Brooklyn cornhole distillery locavore slow-carb. 8-bit yuccie sartorial pickled brunch quinoa semiotics seitan. 90's keytar tacos direct trade iphone mustache.	Post	184	2018-02-03 22:28:24.512997	2018-02-03 22:28:24.512997	65
485	Banjo food truck typewriter flexitarian synth tumblr. Kombucha salvia tumblr. Poutine forage selfies synth. Keffiyeh gastropub blog celiac crucifix jean shorts quinoa master.	Post	184	2018-02-03 22:28:24.519852	2018-02-03 22:28:24.519852	73
486	Pickled fixie food truck. Master vegan tousled 8-bit authentic disrupt. Beard pop-up mumblecore.	Post	184	2018-02-03 22:28:24.526874	2018-02-03 22:28:24.526874	15
487	Typewriter twee chambray. Pitchfork wolf 90's sriracha keytar. Shoreditch taxidermy godard selvage marfa 3 wolf moon tacos. Post-ironic banh mi authentic offal bushwick forage five dollar toast dreamcatcher. Roof banh mi selfies microdosing kitsch.	Post	185	2018-02-03 22:28:24.534713	2018-02-03 22:28:24.534713	46
488	Dreamcatcher vinegar kogi 8-bit. Shabby chic brunch freegan ennui. Typewriter bicycle rights vegan truffaut fanny pack skateboard. Green juice blog brunch. 90's street ennui stumptown waistcoat.	Post	185	2018-02-03 22:28:24.541895	2018-02-03 22:28:24.541895	50
489	Pour-over post-ironic xoxo lomo thundercats craft beer before they sold out offal. Pickled waistcoat single-origin coffee raw denim cardigan photo booth. Kitsch truffaut tousled quinoa hella fanny pack. Biodiesel stumptown put a bird on it aesthetic tumblr.	Post	185	2018-02-03 22:28:24.549878	2018-02-03 22:28:24.549878	36
490	Organic park bicycle rights yuccie small batch yr tattooed dreamcatcher. Messenger bag kinfolk you probably haven't heard of them. Meh chia pop-up sustainable narwhal. Church-key sustainable organic. Franzen pickled master plaid wolf umami.	Post	185	2018-02-03 22:28:24.556808	2018-02-03 22:28:24.556808	21
491	Chia seitan drinking cliche actually. Retro lomo gastropub. Dreamcatcher lo-fi drinking helvetica ethical offal freegan truffaut. Small batch gentrify drinking green juice polaroid wayfarers stumptown.	Post	185	2018-02-03 22:28:24.562111	2018-02-03 22:28:24.562111	27
492	Mixtape pour-over next level before they sold out fingerstache. Squid knausgaard kinfolk kale chips cronut pinterest cardigan.	Post	186	2018-02-03 22:28:24.568897	2018-02-03 22:28:24.568897	1
493	Shoreditch mlkshk selfies hashtag brooklyn leggings pug seitan. Cold-pressed keffiyeh quinoa master waistcoat. Mixtape banh mi letterpress carry craft beer. Selfies keffiyeh letterpress artisan selvage mustache pickled schlitz. Vinegar locavore phlogiston yuccie biodiesel kombucha.	Post	186	2018-02-03 22:28:24.576129	2018-02-03 22:28:24.576129	3
494	Park fixie pour-over iphone trust fund. Pug waistcoat freegan flexitarian. Tote bag celiac portland meditation lo-fi authentic. Offal messenger bag ethical stumptown plaid single-origin coffee polaroid yuccie. Banh mi cronut cray.	Post	186	2018-02-03 22:28:24.583653	2018-02-03 22:28:24.583653	51
495	Five dollar toast leggings small batch 3 wolf moon truffaut bitters tote bag celiac. Freegan single-origin coffee austin banh mi godard. Polaroid synth neutra asymmetrical meh. Twee lomo neutra dreamcatcher migas wayfarers selfies hashtag.	Post	187	2018-02-03 22:28:24.59084	2018-02-03 22:28:24.59084	47
496	Gentrify umami phlogiston twee +1. Raw denim direct trade 3 wolf moon. Fixie migas put a bird on it banh mi. Mixtape muggle magic swag heirloom.	Post	187	2018-02-03 22:28:24.598701	2018-02-03 22:28:24.598701	30
497	Bicycle rights plaid pour-over deep v chicharrones. Umami cray forage vhs typewriter.	Post	188	2018-02-03 22:28:24.605611	2018-02-03 22:28:24.605611	14
498	Tattooed direct trade ramps wolf. Fanny pack banjo skateboard. Gastropub fixie chicharrones tilde actually 90's. Cold-pressed lomo kitsch sriracha chartreuse tilde. Meditation chia organic bitters. Fixie lomo blue bottle farm-to-table listicle etsy.	Post	188	2018-02-03 22:28:24.613281	2018-02-03 22:28:24.613281	54
499	Green juice poutine cronut migas. Semiotics portland brooklyn cold-pressed squid farm-to-table trust fund.	Post	189	2018-02-03 22:28:24.62026	2018-02-03 22:28:24.62026	68
500	Goth mixtape ugh five dollar toast. Cardigan waistcoat synth normcore leggings.	Post	189	2018-02-03 22:28:24.625425	2018-02-03 22:28:24.625425	16
501	Tilde sartorial disrupt scenester. Chia umami whatever vinyl lomo banjo tattooed. Selvage fingerstache bespoke listicle. Chillwave deep v craft beer church-key dreamcatcher goth messenger bag pickled.	Post	190	2018-02-03 22:28:24.632446	2018-02-03 22:28:24.632446	8
502	Disrupt tattooed pickled xoxo cleanse. Kinfolk williamsburg single-origin coffee occupy sartorial. Offal artisan letterpress. Kogi yuccie ennui flexitarian health.	Post	190	2018-02-03 22:28:24.639582	2018-02-03 22:28:24.639582	28
503	Church-key jean shorts kale chips. Vinegar cred scenester actually tousled etsy intelligentsia cold-pressed. Meh knausgaard chartreuse master photo booth squid.	Post	190	2018-02-03 22:28:24.646483	2018-02-03 22:28:24.646483	67
504	Intelligentsia lumbersexual hashtag. Tofu seitan stumptown slow-carb kombucha +1. Retro biodiesel keytar microdosing bicycle rights pug next level migas. Keffiyeh humblebrag irony waistcoat. Loko chicharrones cred whatever gentrify.	Post	190	2018-02-03 22:28:24.653515	2018-02-03 22:28:24.653515	52
505	Master blue bottle trust fund hella austin williamsburg chillwave. Roof banh mi plaid banjo neutra. Asymmetrical bicycle rights leggings deep v trust fund. Kitsch green juice irony sustainable skateboard readymade typewriter. Banh mi readymade shoreditch ugh godard occupy aesthetic.	Post	191	2018-02-03 22:28:24.660671	2018-02-03 22:28:24.660671	52
506	Gentrify beard intelligentsia. Organic actually shabby chic. Selfies heirloom fixie crucifix asymmetrical. Stumptown sartorial muggle magic master distillery park twee. Thundercats cleanse intelligentsia hoodie single-origin coffee kombucha. Microdosing iphone heirloom godard meggings waistcoat cred brunch.	Post	191	2018-02-03 22:28:24.66817	2018-02-03 22:28:24.66817	35
507	Vinyl truffaut chia blog green juice tattooed vice. Authentic pour-over ennui microdosing. Shabby chic keffiyeh semiotics quinoa. Vhs mlkshk pabst photo booth fanny pack cardigan meggings.	Post	192	2018-02-03 22:28:24.676161	2018-02-03 22:28:24.676161	18
508	Schlitz church-key iphone. Chambray sustainable master hashtag bushwick. Vinyl thundercats cornhole. Selvage gastropub umami poutine synth wes anderson put a bird on it street.	Post	193	2018-02-03 22:28:24.683347	2018-02-03 22:28:24.683347	60
509	Leggings keytar yolo butcher. Beard salvia knausgaard. Knausgaard truffaut thundercats iphone small batch tote bag raw denim bicycle rights. Distillery wes anderson 8-bit hella waistcoat austin. Migas occupy celiac readymade bicycle rights. Plaid ramps asymmetrical humblebrag slow-carb bespoke before they sold out gastropub.	Post	194	2018-02-03 22:28:24.688719	2018-02-03 22:28:24.688719	33
510	Keytar normcore trust fund viral flannel street retro irony. Keytar kitsch brunch pbr&b banjo. Quinoa food truck twee kickstarter. Slow-carb selvage vinegar biodiesel. Kickstarter plaid narwhal hashtag aesthetic jean shorts before they sold out.	Post	194	2018-02-03 22:28:24.698703	2018-02-03 22:28:24.698703	77
511	Put a bird on it hella direct trade artisan cred. Williamsburg neutra vegan bicycle rights distillery.	Post	195	2018-02-03 22:28:24.703592	2018-02-03 22:28:24.703592	21
512	Yolo cold-pressed mixtape aesthetic church-key occupy. Yr deep v irony neutra sriracha tote bag schlitz retro. Beard trust fund sartorial health gentrify wes anderson austin.	Post	195	2018-02-03 22:28:24.710513	2018-02-03 22:28:24.710513	62
513	Normcore whatever flannel chia. Scenester whatever bicycle rights waistcoat dreamcatcher humblebrag chicharrones. Brunch readymade ugh master twee scenester. +1 retro gluten-free yr. Wolf meggings tousled echo. Poutine iphone keytar swag flexitarian 90's wayfarers lumbersexual.	Post	195	2018-02-03 22:28:24.71781	2018-02-03 22:28:24.71781	74
514	Helvetica etsy truffaut lo-fi brunch lumbersexual. Carry irony bushwick cleanse cronut. Umami thundercats chambray. Pop-up fixie pbr&b. Kombucha quinoa 3 wolf moon kale chips thundercats.	Post	195	2018-02-03 22:28:24.724982	2018-02-03 22:28:24.724982	10
515	Pabst viral chartreuse wes anderson roof synth hoodie vhs. Next level blog pabst cred you probably haven't heard of them before they sold out everyday readymade. Flexitarian williamsburg small batch selvage. Mustache fanny pack xoxo banjo small batch. Kinfolk cardigan tumblr meggings chicharrones. Humblebrag put a bird on it godard single-origin coffee craft beer drinking fanny pack.	Post	196	2018-02-03 22:28:24.733341	2018-02-03 22:28:24.733341	57
516	Raw denim cardigan single-origin coffee echo drinking street tote bag 3 wolf moon. Franzen freegan tousled carry pop-up plaid keffiyeh waistcoat. Hoodie franzen raw denim fixie tattooed microdosing polaroid disrupt. Church-key loko biodiesel listicle. Tattooed aesthetic five dollar toast squid vhs loko paleo tofu. Distillery kitsch tattooed.	Post	196	2018-02-03 22:28:24.740667	2018-02-03 22:28:24.740667	32
517	Meh +1 retro viral. Wayfarers shabby chic vegan. +1 yr migas. Kitsch pickled wayfarers lo-fi ramps 3 wolf moon actually seitan.	Post	196	2018-02-03 22:28:24.749766	2018-02-03 22:28:24.749766	60
518	Slow-carb heirloom put a bird on it godard sartorial poutine beard. Literally scenester pug banh mi meh godard marfa retro. Truffaut twee leggings. Post-ironic pour-over cred carry.	Post	196	2018-02-03 22:28:24.7585	2018-02-03 22:28:24.7585	77
519	Neutra yolo seitan echo heirloom kombucha artisan. Meggings helvetica tote bag beard cray kitsch roof. Ugh chartreuse lomo austin wolf.	Post	197	2018-02-03 22:28:24.764133	2018-02-03 22:28:24.764133	55
520	Health kinfolk vice pinterest literally loko. Locavore loko marfa 3 wolf moon next level. Kitsch raw denim bicycle rights skateboard austin post-ironic schlitz. Health whatever hashtag fingerstache photo booth. Tacos shabby chic cliche fanny pack meh fingerstache before they sold out. Swag yolo kinfolk.	Post	198	2018-02-03 22:28:24.767367	2018-02-03 22:28:24.767367	59
521	Flannel kombucha blue bottle small batch migas. Swag umami pbr&b photo booth lomo biodiesel. Pop-up lo-fi neutra.	Post	198	2018-02-03 22:28:24.772494	2018-02-03 22:28:24.772494	34
522	Kickstarter flannel bitters goth irony. Fanny pack cray tattooed fixie mlkshk deep v. Cray crucifix chambray green juice ethical sriracha. Twee goth austin taxidermy.	Post	198	2018-02-03 22:28:24.77765	2018-02-03 22:28:24.77765	46
523	Scenester hoodie tousled locavore art party. Sartorial farm-to-table etsy pitchfork pinterest cronut. Photo booth cray sartorial bicycle rights. Pitchfork hashtag flannel lumbersexual cray portland tattooed.	Post	199	2018-02-03 22:28:24.782906	2018-02-03 22:28:24.782906	21
524	Chillwave shabby chic hella mlkshk. Food truck kale chips hammock asymmetrical drinking lomo. Crucifix umami five dollar toast ennui.	Post	199	2018-02-03 22:28:24.790758	2018-02-03 22:28:24.790758	32
525	Pour-over pop-up viral vhs disrupt kinfolk try-hard tofu. Shoreditch schlitz crucifix. Cold-pressed leggings fingerstache semiotics tacos williamsburg 8-bit shabby chic. Plaid mixtape deep v blog gluten-free try-hard bitters yolo.	Post	199	2018-02-03 22:28:24.796474	2018-02-03 22:28:24.796474	31
526	Ugh tumblr pour-over. Hashtag sustainable tilde etsy dreamcatcher umami messenger bag kitsch. Chartreuse sartorial chambray. Pickled squid craft beer distillery chicharrones trust fund typewriter plaid.	Post	199	2018-02-03 22:28:24.801984	2018-02-03 22:28:24.801984	56
527	Chillwave deep v fashion axe ennui tacos. Selvage kitsch tattooed meggings jean shorts. Fixie ethical wolf pinterest locavore.	Post	199	2018-02-03 22:28:24.807156	2018-02-03 22:28:24.807156	56
528	Gluten-free sustainable blue bottle butcher. Tattooed lo-fi kinfolk tote bag five dollar toast hammock vice leggings. Lomo neutra synth carry celiac taxidermy pour-over occupy. Sriracha lumbersexual polaroid literally butcher organic letterpress cold-pressed. Blog fanny pack seitan fashion axe mixtape disrupt 3 wolf moon cronut.	Post	200	2018-02-03 22:28:24.812984	2018-02-03 22:28:24.812984	74
529	Humblebrag chia aesthetic beard. Roof hammock leggings hoodie.	Post	201	2018-02-03 22:28:24.817171	2018-02-03 22:28:24.817171	7
530	Raw denim gluten-free ethical. Viral next level artisan. Drinking pinterest before they sold out twee hashtag raw denim everyday ugh. Muggle magic tousled microdosing.	Post	201	2018-02-03 22:28:24.82271	2018-02-03 22:28:24.82271	33
531	Everyday tacos poutine beard helvetica chartreuse shoreditch truffaut. Vegan tumblr vinegar hoodie +1 tofu stumptown. Yr tousled green juice carry twee disrupt cliche. Butcher photo booth fixie shoreditch phlogiston offal five dollar toast banh mi. Meh sustainable godard leggings deep v selvage blue bottle.	Post	201	2018-02-03 22:28:24.828828	2018-02-03 22:28:24.828828	55
532	Meh meditation vhs lumbersexual. Jean shorts squid bitters synth salvia shabby chic green juice phlogiston. Cliche hoodie kale chips. 90's kinfolk thundercats banjo cliche vice 3 wolf moon knausgaard.	Post	202	2018-02-03 22:28:24.832775	2018-02-03 22:28:24.832775	27
533	Quinoa letterpress disrupt. Shoreditch ennui blog fashion axe blue bottle pitchfork chambray leggings. You probably haven't heard of them jean shorts direct trade tousled loko green juice. Pork belly tumblr scenester try-hard pitchfork. Vhs trust fund you probably haven't heard of them stumptown.	Post	203	2018-02-03 22:28:24.838057	2018-02-03 22:28:24.838057	33
534	Tofu bicycle rights fanny pack humblebrag literally food truck flexitarian. Brunch plaid cleanse humblebrag vinegar. Cliche goth knausgaard. Offal waistcoat 8-bit beard. Hella literally cold-pressed schlitz carry photo booth. Lo-fi helvetica quinoa 90's chia.	Post	204	2018-02-03 22:28:24.84361	2018-02-03 22:28:24.84361	31
535	Tofu austin celiac godard salvia. Gluten-free 8-bit pabst pour-over. Cred pitchfork readymade. Bitters meditation flexitarian microdosing tattooed actually gastropub. Paleo tote bag lo-fi 90's kickstarter.	Post	204	2018-02-03 22:28:24.848964	2018-02-03 22:28:24.848964	64
536	Put a bird on it migas park. Retro you probably haven't heard of them mixtape. Church-key vhs migas roof. Tumblr retro stumptown etsy master thundercats. Tilde beard twee flexitarian polaroid.	Post	205	2018-02-03 22:28:24.854151	2018-02-03 22:28:24.854151	66
537	Direct trade semiotics pug carry yr pbr&b ennui. Cronut yr ethical salvia brooklyn small batch twee. Knausgaard mixtape vinegar tacos.	Post	205	2018-02-03 22:28:24.859333	2018-02-03 22:28:24.859333	44
538	Chia fingerstache franzen cronut pug. Tattooed vinegar yolo microdosing pabst. Messenger bag kombucha gastropub. Next level cleanse farm-to-table literally normcore blue bottle.	Post	205	2018-02-03 22:28:24.864828	2018-02-03 22:28:24.864828	20
539	Umami aesthetic keytar artisan poutine cray neutra. Church-key schlitz small batch put a bird on it.	Post	205	2018-02-03 22:28:24.867671	2018-02-03 22:28:24.867671	28
540	Truffaut carry vhs. Vegan sartorial goth 8-bit semiotics cronut. Wayfarers tumblr thundercats put a bird on it.	Post	206	2018-02-03 22:28:24.873259	2018-02-03 22:28:24.873259	67
541	Hoodie pinterest tote bag banh mi pour-over thundercats master helvetica. Jean shorts street chia wes anderson tattooed cronut freegan. Knausgaard irony organic biodiesel. Intelligentsia etsy chillwave bushwick celiac pitchfork.	Post	206	2018-02-03 22:28:24.879233	2018-02-03 22:28:24.879233	39
542	Roof neutra cred disrupt bicycle rights irony locavore crucifix. Post-ironic pitchfork vhs sustainable art party disrupt mixtape stumptown. Small batch direct trade kale chips you probably haven't heard of them tousled tilde swag muggle magic.	Post	206	2018-02-03 22:28:24.882493	2018-02-03 22:28:24.882493	8
543	Chicharrones schlitz seitan whatever irony brunch. Austin 3 wolf moon meditation pour-over tote bag bitters. Leggings kitsch cleanse goth. Retro flannel tattooed kickstarter lumbersexual gastropub. Food truck microdosing fashion axe distillery beard messenger bag aesthetic. Keffiyeh tote bag drinking paleo tacos tousled.	Post	206	2018-02-03 22:28:24.88766	2018-02-03 22:28:24.88766	52
544	Brooklyn gluten-free cardigan. Cliche banh mi waistcoat crucifix chambray small batch. Selfies single-origin coffee viral slow-carb kitsch polaroid cornhole. Hashtag chambray humblebrag listicle church-key.	Post	207	2018-02-03 22:28:24.893034	2018-02-03 22:28:24.893034	23
545	Hella vhs dreamcatcher. Everyday green juice scenester.	Post	207	2018-02-03 22:28:24.89842	2018-02-03 22:28:24.89842	38
546	Thundercats slow-carb authentic. Hammock cliche schlitz. Poutine diy pabst squid cliche twee meggings. Humblebrag narwhal godard viral forage sustainable.	Post	207	2018-02-03 22:28:24.903845	2018-02-03 22:28:24.903845	3
547	Whatever disrupt squid chambray thundercats irony vhs shoreditch. Brunch drinking migas kale chips cray. Hashtag sartorial muggle magic chicharrones flexitarian knausgaard poutine single-origin coffee.	Post	208	2018-02-03 22:28:24.908962	2018-02-03 22:28:24.908962	25
548	Truffaut migas flannel gluten-free. Sartorial scenester cray asymmetrical. Artisan plaid godard jean shorts pork belly dreamcatcher deep v pop-up.	Post	208	2018-02-03 22:28:24.914339	2018-02-03 22:28:24.914339	62
549	Yolo gluten-free vhs viral post-ironic stumptown phlogiston. Semiotics meggings kickstarter skateboard cliche.	Post	208	2018-02-03 22:28:24.919425	2018-02-03 22:28:24.919425	42
550	Aesthetic swag health try-hard cornhole. Salvia asymmetrical swag wolf intelligentsia deep v.	Post	208	2018-02-03 22:28:24.924516	2018-02-03 22:28:24.924516	17
551	Before they sold out tofu loko. Try-hard lomo wayfarers raw denim truffaut typewriter yr.	Post	208	2018-02-03 22:28:24.929756	2018-02-03 22:28:24.929756	73
552	Church-key tilde messenger bag typewriter. Chillwave pork belly next level truffaut tumblr wayfarers swag 8-bit. Vinegar yolo banjo brunch letterpress scenester. Kombucha tilde ramps waistcoat crucifix twee.	Post	209	2018-02-03 22:28:24.934991	2018-02-03 22:28:24.934991	69
553	Pop-up knausgaard park iphone chia banjo. Pinterest hammock poutine tacos tousled.	Post	210	2018-02-03 22:28:24.94025	2018-02-03 22:28:24.94025	59
554	Williamsburg loko fingerstache hella. Tousled tacos cray +1 retro you probably haven't heard of them helvetica twee. Deep v health street meditation pabst. Venmo pork belly 3 wolf moon. Humblebrag banjo street.	Post	210	2018-02-03 22:28:24.945396	2018-02-03 22:28:24.945396	21
555	Synth you probably haven't heard of them brunch cornhole tumblr viral artisan. Keffiyeh five dollar toast park freegan carry. Offal paleo irony yr street waistcoat direct trade chartreuse. Park etsy tousled 8-bit heirloom hashtag. Twee godard hashtag actually ugh vegan neutra.	Post	210	2018-02-03 22:28:24.954175	2018-02-03 22:28:24.954175	76
556	Tacos swag phlogiston selfies flannel skateboard. Viral heirloom blog meh lo-fi literally authentic. Listicle helvetica direct trade brooklyn mumblecore flexitarian chicharrones.	Post	210	2018-02-03 22:28:24.963556	2018-02-03 22:28:24.963556	64
45	Twee asymmetrical marfa. Mumblecore chicharrones neutra migas lo-fi seitan. Carry heirloom flexitarian fanny pack waistcoat pop-up.	Post	\N	2018-02-03 22:28:21.407628	2018-02-03 22:28:21.407628	74
557	Suscipit nihil est officiis suscipit voluptate voluptatibus doloremque aliquam occaecat consequat	Medium	57	2018-02-04 19:25:53.396974	2018-02-04 19:25:53.396974	6
559	Adipisci ratione tenetur vel qui provident commodi hic quia totam quibusdam necessitatibus reiciendis mollitia obcaecati	Post	2	2018-02-05 01:21:06.599441	2018-02-05 01:21:06.599441	6
561	Great article!	Post	187	2018-02-10 02:16:40.920124	2018-02-10 02:16:40.920124	7
563	Celiac master mumblecore pour-over hammock. Viral aesthetic chartreuse. Wolf bicycle rights paleo cray.	Post	220	2018-02-15 04:27:20.676114	2018-02-15 04:27:20.676114	25
564	Paleo fashion axe waistcoat 3 wolf moon pitchfork. Put a bird on it tumblr actually meggings meditation brooklyn freegan.	Post	220	2018-02-15 04:27:20.729368	2018-02-15 04:27:20.729368	29
565	Keffiyeh literally hoodie humblebrag cred umami. Chia chambray raw denim. Mixtape fixie migas yuccie synth roof yr. Waistcoat slow-carb deep v. Normcore art party gentrify. Art party shoreditch lo-fi meh.	Post	220	2018-02-15 04:27:20.737165	2018-02-15 04:27:20.737165	35
566	Lomo literally xoxo. Gluten-free organic bespoke artisan helvetica church-key. Xoxo franzen retro ramps sriracha crucifix waistcoat direct trade. Fixie cold-pressed leggings slow-carb marfa wayfarers. Mixtape actually fashion axe polaroid cardigan whatever keytar. Muggle magic before they sold out authentic you probably haven't heard of them farm-to-table godard.	Post	220	2018-02-15 04:27:20.752884	2018-02-15 04:27:20.752884	27
567	Hammock blog chartreuse cronut. Taxidermy farm-to-table meditation. Fanny pack sustainable lumbersexual. Pabst before they sold out park artisan. Yr whatever food truck.	Post	220	2018-02-15 04:28:12.73145	2018-02-15 04:28:12.73145	66
568	Kinfolk cray gluten-free roof master. Ethical kinfolk normcore goth umami hashtag. Small batch tousled letterpress locavore tacos yolo.	Post	220	2018-02-15 04:28:12.754418	2018-02-15 04:28:12.754418	27
569	Biodiesel artisan asymmetrical knausgaard plaid seitan vice. Meggings selvage leggings vinegar. Occupy try-hard actually selfies. Dreamcatcher xoxo echo artisan wayfarers tilde try-hard.	Post	220	2018-02-15 04:28:12.761607	2018-02-15 04:28:12.761607	30
570	Helvetica craft beer irony skateboard pinterest listicle. Pitchfork 3 wolf moon retro. Selfies neutra pinterest farm-to-table offal wayfarers. Hella loko yr vinyl narwhal hammock. Celiac whatever thundercats lumbersexual art party lomo slow-carb. Butcher asymmetrical organic ennui.	Post	221	2018-02-15 04:28:12.917478	2018-02-15 04:28:12.917478	45
571	Sriracha waistcoat literally freegan. Salvia vegan craft beer cleanse. Leggings disrupt craft beer pickled tote bag. Chartreuse twee cleanse ramps shoreditch. Vice small batch 90's synth neutra plaid try-hard. Migas squid microdosing chicharrones viral fanny pack chillwave leggings.	Post	221	2018-02-15 04:28:12.929049	2018-02-15 04:28:12.929049	62
575	Knausgaard bitters mixtape. Franzen raw denim roof kogi sustainable. Cleanse mustache farm-to-table. Photo booth 3 wolf moon goth lo-fi salvia. Cardigan ennui jean shorts pork belly. Neutra synth cleanse.	Post	224	2018-02-15 04:28:13.141847	2018-02-15 04:28:13.141847	66
576	Godard whatever cornhole vinegar synth church-key. Poutine stumptown synth. Normcore cronut neutra knausgaard. Tofu echo pug dreamcatcher art party single-origin coffee keffiyeh offal.	Medium	10	2018-02-15 04:28:13.288358	2018-02-15 04:28:13.288358	9
577	Cold-pressed xoxo wolf plaid taxidermy thundercats. Shoreditch chartreuse meh austin migas. Tote bag green juice butcher schlitz direct trade vinyl skateboard chambray. Blue bottle biodiesel muggle magic narwhal wayfarers.	Medium	10	2018-02-15 04:28:13.294385	2018-02-15 04:28:13.294385	7
578	Pabst cliche lumbersexual kinfolk whatever authentic. Cronut twee keytar austin migas street tousled slow-carb. Mustache letterpress muggle magic gentrify vhs green juice before they sold out.	Medium	10	2018-02-15 04:28:13.299733	2018-02-15 04:28:13.299733	28
579	Brooklyn pug selfies next level. Fingerstache stumptown disrupt hashtag twee banh mi austin. Asymmetrical readymade tattooed kitsch brunch echo lo-fi sriracha. Banh mi yr kinfolk mixtape.	Medium	10	2018-02-15 04:28:13.305156	2018-02-15 04:28:13.305156	44
580	Deep v cold-pressed roof. Poutine loko mustache butcher yuccie. Celiac williamsburg echo squid chia.	Medium	10	2018-02-15 04:28:13.310922	2018-02-15 04:28:13.310922	68
581	Wolf 90's yolo selvage godard. Meggings chambray organic disrupt plaid. Tilde neutra semiotics. Ugh godard occupy.	Medium	3	2018-02-15 04:28:13.409026	2018-02-15 04:28:13.409026	76
582	Whatever lo-fi portland yolo park carry phlogiston. Austin health helvetica craft beer plaid squid gentrify. Tacos gastropub hoodie kickstarter irony yolo farm-to-table goth.	Medium	3	2018-02-15 04:28:13.419536	2018-02-15 04:28:13.419536	42
583	Kogi tumblr stumptown vegan. Messenger bag vinyl tattooed pour-over pickled salvia beard.	Medium	3	2018-02-15 04:28:13.426918	2018-02-15 04:28:13.426918	16
584	Quinoa irony mixtape. Lumbersexual jean shorts pork belly yuccie ramps brunch blue bottle asymmetrical. Loko master cornhole cred. Selvage biodiesel forage next level dreamcatcher seitan ramps. 90's microdosing next level street mlkshk meggings chartreuse.	Medium	1	2018-02-15 04:28:13.502447	2018-02-15 04:28:13.502447	71
585	Ramps venmo +1 slow-carb. Humblebrag gluten-free readymade.	Medium	2	2018-02-15 04:28:13.66632	2018-02-15 04:28:13.66632	57
586	Goth kale chips wolf vinegar chartreuse. Meditation polaroid pop-up lumbersexual bespoke leggings. Food truck synth flannel cleanse chia schlitz meh. Tofu whatever loko deep v. Stumptown beard drinking. Food truck ennui leggings marfa occupy waistcoat offal.	Medium	2	2018-02-15 04:28:13.67426	2018-02-15 04:28:13.67426	55
587	Food truck cold-pressed fixie ethical paleo umami. Iphone yolo poutine cronut muggle magic tilde yr. Umami banh mi vinyl park lomo. Cleanse messenger bag plaid art party wayfarers. Waistcoat wayfarers pour-over.	Medium	2	2018-02-15 04:28:13.68157	2018-02-15 04:28:13.68157	16
588	Polaroid goth literally kitsch xoxo. Flexitarian blue bottle farm-to-table butcher retro shoreditch offal. Letterpress occupy tacos tattooed gentrify yuccie wolf readymade. Fingerstache aesthetic wes anderson brunch kombucha umami sartorial.	Medium	2	2018-02-15 04:28:13.689063	2018-02-15 04:28:13.689063	22
589	Listicle keytar selvage franzen cred hoodie umami fanny pack. Bicycle rights ethical venmo muggle magic narwhal distillery shabby chic. Heirloom paleo pbr&b ethical letterpress etsy.	Medium	4	2018-02-15 04:28:13.790219	2018-02-15 04:28:13.790219	35
574	Great post, CeeCee. I recently posted about health issues among registered nurses and noticed there are some similar trends in our findings. I would love to get in touch to discuss our data.	Post	222	2018-02-15 04:28:13.078647	2018-02-15 04:28:13.078647	24
590	Actually sriracha put a bird on it fanny pack selvage. Drinking forage ethical 3 wolf moon next level +1 waistcoat 90's. Keytar banh mi skateboard master. 8-bit vegan fashion axe bespoke scenester microdosing tacos. Photo booth narwhal quinoa goth roof trust fund. Paleo locavore master whatever health kogi hoodie chicharrones.	Medium	4	2018-02-15 04:28:13.79796	2018-02-15 04:28:13.79796	46
591	Direct trade small batch viral yolo you probably haven't heard of them venmo gentrify hoodie. Photo booth post-ironic chia typewriter cardigan. Waistcoat hammock vinyl banjo thundercats bicycle rights. Try-hard 90's kitsch tote bag crucifix marfa shabby chic. Wolf squid dreamcatcher bushwick narwhal shabby chic banh mi biodiesel.	Medium	4	2018-02-15 04:28:13.808177	2018-02-15 04:28:13.808177	33
592	Tofu irony leggings retro readymade pbr&b ennui. Mixtape banjo thundercats five dollar toast roof jean shorts twee swag. Chartreuse authentic cold-pressed pabst yuccie locavore slow-carb.	Medium	4	2018-02-15 04:28:13.815307	2018-02-15 04:28:13.815307	73
593	Sriracha butcher lo-fi cray. Photo booth kickstarter fingerstache.	Medium	4	2018-02-15 04:28:13.822373	2018-02-15 04:28:13.822373	43
594	Butcher bushwick pbr&b crucifix wayfarers chicharrones. Lumbersexual cold-pressed street flannel. Chia pickled pour-over. Mlkshk green juice vinyl venmo hashtag. Gastropub church-key forage chia you probably haven't heard of them gentrify kinfolk deep v. Kickstarter fanny pack occupy iphone venmo.	Medium	5	2018-02-15 04:28:13.881657	2018-02-15 04:28:13.881657	71
595	Aesthetic iphone pop-up authentic occupy banjo knausgaard. Blue bottle fixie banjo. Irony tilde meh freegan vinegar master cronut. Seitan dreamcatcher meditation church-key marfa listicle.	Medium	5	2018-02-15 04:28:13.889053	2018-02-15 04:28:13.889053	39
596	Tacos venmo next level loko yr post-ironic sartorial. Ennui single-origin coffee mixtape hashtag paleo yuccie scenester etsy. Pabst hella kitsch keffiyeh health vhs lo-fi pitchfork.	Medium	5	2018-02-15 04:28:13.896213	2018-02-15 04:28:13.896213	70
597	Asymmetrical thundercats chicharrones waistcoat loko. Tattooed authentic tousled messenger bag. Blog microdosing biodiesel brunch irony. Polaroid keffiyeh wolf austin wayfarers whatever cronut. Cold-pressed meditation kogi celiac street. Biodiesel seitan chartreuse.	Medium	7	2018-02-15 04:28:14.071639	2018-02-15 04:28:14.071639	14
598	Helvetica authentic yr cold-pressed. Leggings heirloom umami meggings stumptown. Farm-to-table muggle magic park street kickstarter sartorial irony tote bag.	Medium	7	2018-02-15 04:28:14.079041	2018-02-15 04:28:14.079041	65
599	+1 tofu kombucha narwhal brunch readymade. Stumptown before they sold out wayfarers microdosing etsy chambray church-key. Blog cray next level retro food truck whatever. Hashtag roof yuccie portland.	Medium	7	2018-02-15 04:28:14.086896	2018-02-15 04:28:14.086896	36
600	Cardigan hoodie pour-over hella readymade chicharrones. Selvage messenger bag wes anderson. Mixtape fixie bitters authentic meh yolo selfies. Keytar skateboard leggings. Vinegar truffaut helvetica thundercats pbr&b drinking biodiesel.	Medium	7	2018-02-15 04:28:14.094572	2018-02-15 04:28:14.094572	37
601	Williamsburg chartreuse hammock freegan cardigan sriracha offal cornhole. Dreamcatcher pug schlitz. Bicycle rights pitchfork tumblr lumbersexual fingerstache. Small batch cornhole asymmetrical austin five dollar toast tacos butcher.	Medium	7	2018-02-15 04:28:14.10201	2018-02-15 04:28:14.10201	2
602	Kale chips flexitarian umami meditation plaid franzen. Typewriter before they sold out dreamcatcher forage carry organic actually.	Medium	8	2018-02-15 04:28:14.191305	2018-02-15 04:28:14.191305	46
603	Stumptown vhs jean shorts bitters park fashion axe. Neutra artisan pitchfork goth raw denim fanny pack. Letterpress meh blog diy loko.	Medium	8	2018-02-15 04:28:14.196489	2018-02-15 04:28:14.196489	69
604	Fingerstache try-hard meditation chillwave banh mi banjo tattooed skateboard. Wolf gluten-free kinfolk jean shorts umami actually deep v. Pabst whatever fixie.	Medium	8	2018-02-15 04:28:14.207033	2018-02-15 04:28:14.207033	53
605	Sartorial kogi xoxo vinegar chicharrones bitters. Vinegar ennui keffiyeh migas everyday. Mlkshk bushwick ugh master etsy crucifix. Mixtape before they sold out bespoke gentrify microdosing street.	Medium	9	2018-02-15 04:28:14.290441	2018-02-15 04:28:14.290441	3
606	Sartorial wayfarers celiac brunch chicharrones kinfolk meditation pabst. Mlkshk drinking health hammock street artisan. Everyday pinterest pbr&b loko sartorial. Readymade bitters tilde.	Medium	9	2018-02-15 04:28:14.297853	2018-02-15 04:28:14.297853	42
607	Vinyl tacos chia master goth. Butcher thundercats actually. Deep v kombucha beard sustainable. Bitters offal gentrify. Knausgaard yolo whatever kale chips beard.	Medium	65	2018-02-15 04:28:14.399687	2018-02-15 04:28:14.399687	21
608	Meggings jean shorts deep v craft beer. Migas seitan blog tousled selvage gluten-free chia.	Medium	65	2018-02-15 04:28:14.406561	2018-02-15 04:28:14.406561	26
610	Green juice butcher mustache scenester. Paleo austin park cray offal.	Medium	65	2018-02-15 04:28:14.426201	2018-02-15 04:28:14.426201	12
612	Brooklyn vinyl leggings hella pbr&b fashion axe. Deep v biodiesel hashtag gluten-free. Diy meh pour-over cardigan. Health pug swag raw denim celiac wes anderson neutra cliche. Pitchfork health drinking thundercats williamsburg taxidermy. Raw denim actually intelligentsia gentrify.	Medium	53	2018-02-15 04:28:14.595582	2018-02-15 04:28:14.595582	11
613	Sartorial post-ironic direct trade health letterpress truffaut tattooed. Craft beer brunch literally hashtag photo booth mustache tattooed.	Medium	53	2018-02-15 04:28:14.602855	2018-02-15 04:28:14.602855	6
614	Waistcoat raw denim church-key austin polaroid. Poutine pitchfork authentic. 90's try-hard austin goth gluten-free bitters seitan. Fanny pack semiotics marfa ethical viral brooklyn. Umami disrupt cronut yolo tumblr blue bottle before they sold out polaroid.	Medium	67	2018-02-15 04:28:14.722319	2018-02-15 04:28:14.722319	66
615	Cred stumptown forage try-hard twee. Seitan offal pabst skateboard narwhal. Bushwick normcore seitan neutra tumblr bicycle rights williamsburg. Vinegar crucifix listicle. Goth beard locavore yolo mlkshk tattooed raw denim.	Medium	67	2018-02-15 04:28:14.728479	2018-02-15 04:28:14.728479	77
616	Authentic beard ugh vhs put a bird on it squid vice. Chicharrones iphone trust fund offal chia. Cronut 90's hammock chambray everyday wes anderson. Tofu godard echo pickled chambray.	Medium	67	2018-02-15 04:28:14.734297	2018-02-15 04:28:14.734297	57
617	Yolo wayfarers locavore forage kogi small batch. Photo booth hella twee microdosing shoreditch five dollar toast scenester. +1 vinegar art party irony put a bird on it blue bottle. Selfies street selvage dreamcatcher kogi. Phlogiston hella hashtag slow-carb. Small batch chillwave cliche lomo occupy truffaut.	Medium	58	2018-02-15 04:28:14.858194	2018-02-15 04:28:14.858194	21
618	Chia crucifix beard keytar williamsburg vinegar five dollar toast. Kinfolk intelligentsia locavore pour-over knausgaard. Mlkshk kitsch intelligentsia lo-fi kale chips blue bottle scenester.	Medium	58	2018-02-15 04:28:14.864319	2018-02-15 04:28:14.864319	72
619	Williamsburg hella yolo put a bird on it biodiesel before they sold out meditation you probably haven't heard of them. +1 cold-pressed asymmetrical single-origin coffee dreamcatcher normcore kogi iphone. Portland raw denim pug keytar. Vinyl vice wolf dreamcatcher whatever cray sriracha. Truffaut etsy +1.	Medium	58	2018-02-15 04:28:14.869632	2018-02-15 04:28:14.869632	17
620	Slow-carb squid farm-to-table. Semiotics fashion axe tilde mumblecore dreamcatcher poutine. Ethical 90's tote bag cornhole jean shorts listicle.	Medium	11	2018-02-15 04:28:14.992612	2018-02-15 04:28:14.992612	24
621	Vice asymmetrical austin. Church-key microdosing 90's distillery mixtape. Green juice xoxo +1 mlkshk. Chillwave goth occupy hashtag listicle swag. Heirloom +1 gentrify mlkshk pour-over loko.	Medium	11	2018-02-15 04:28:14.999384	2018-02-15 04:28:14.999384	63
622	Pickled plaid lo-fi. Echo narwhal mixtape shabby chic goth knausgaard. Roof direct trade slow-carb banh mi before they sold out. Hammock vice deep v.	Medium	11	2018-02-15 04:28:15.0046	2018-02-15 04:28:15.0046	38
623	Vinegar pork belly pickled marfa knausgaard. Selvage letterpress humblebrag. Gentrify lomo beard. Sriracha messenger bag brooklyn organic flexitarian. Cleanse slow-carb plaid brunch wes anderson. Bespoke aesthetic sartorial.	Medium	11	2018-02-15 04:28:15.010146	2018-02-15 04:28:15.010146	35
624	Roof park deep v waistcoat. Asymmetrical blog polaroid schlitz raw denim normcore crucifix. Cleanse narwhal carry ramps art party plaid. Gastropub migas banh mi dreamcatcher helvetica.	Medium	11	2018-02-15 04:28:15.016526	2018-02-15 04:28:15.016526	33
625	Mixtape street forage gluten-free scenester tumblr flexitarian food truck. Kitsch fashion axe keffiyeh locavore stumptown pork belly. Roof aesthetic banh mi lomo pinterest hoodie. Mustache freegan pitchfork hella.	Medium	44	2018-02-15 04:28:15.063227	2018-02-15 04:28:15.063227	49
626	Mumblecore ugh plaid seitan organic. Organic farm-to-table marfa kickstarter leggings. Leggings microdosing church-key. Squid flannel fashion axe pinterest fixie keffiyeh vinyl. Art party street lomo.	Medium	44	2018-02-15 04:28:15.068533	2018-02-15 04:28:15.068533	73
627	Schlitz taxidermy lumbersexual wes anderson. Kombucha cardigan pop-up plaid locavore twee. Craft beer health pop-up banh mi meditation. Kickstarter forage pug craft beer waistcoat. Post-ironic listicle occupy vice portland narwhal.	Medium	44	2018-02-15 04:28:15.073737	2018-02-15 04:28:15.073737	36
628	Migas craft beer plaid authentic marfa. Banjo portland synth.	Medium	44	2018-02-15 04:28:15.079728	2018-02-15 04:28:15.079728	16
629	Stumptown yuccie flexitarian. Swag vinyl hammock sartorial kitsch artisan. Carry austin fanny pack schlitz mixtape meh tattooed meggings.	Medium	51	2018-02-15 04:28:15.197339	2018-02-15 04:28:15.197339	45
630	Semiotics humblebrag literally shoreditch. Banh mi vice tumblr phlogiston banjo retro cronut pitchfork. Wayfarers seitan 8-bit quinoa. Church-key drinking single-origin coffee semiotics. Readymade wolf swag flexitarian bespoke keytar twee diy. Brunch disrupt mustache carry.	Medium	51	2018-02-15 04:28:15.207439	2018-02-15 04:28:15.207439	10
631	Small batch vhs fanny pack distillery vegan gluten-free fashion axe butcher. Marfa bespoke narwhal portland you probably haven't heard of them. Sartorial mumblecore master taxidermy mustache williamsburg shoreditch. Goth pour-over single-origin coffee diy squid asymmetrical. You probably haven't heard of them migas vhs flannel aesthetic cronut paleo.	Medium	51	2018-02-15 04:28:15.233007	2018-02-15 04:28:15.233007	9
632	Chambray occupy seitan carry brooklyn banjo. Butcher viral literally hashtag. Pinterest artisan tattooed cray loko sriracha cornhole whatever. Vice poutine deep v. Meggings phlogiston ethical hammock. Art party letterpress biodiesel next level.	Medium	51	2018-02-15 04:28:15.24037	2018-02-15 04:28:15.24037	30
633	Cliche kogi paleo organic you probably haven't heard of them. Scenester flannel aesthetic thundercats. Authentic fanny pack umami chicharrones echo. Normcore knausgaard yuccie typewriter small batch. Offal try-hard plaid next level gluten-free cronut food truck semiotics.	Medium	46	2018-02-15 04:28:15.336113	2018-02-15 04:28:15.336113	46
634	Viral sartorial forage meggings. Lumbersexual irony diy hoodie celiac franzen. Readymade vhs banh mi yuccie banjo brooklyn loko. Keytar whatever marfa sriracha flannel vinyl franzen quinoa. Pitchfork master kale chips actually health banjo 3 wolf moon sartorial. Tote bag readymade chia.	Medium	46	2018-02-15 04:28:15.341603	2018-02-15 04:28:15.341603	45
635	Farm-to-table bushwick locavore fingerstache try-hard. Kale chips brooklyn whatever ugh hella trust fund keffiyeh health. Knausgaard tattooed muggle magic trust fund banh mi.	Medium	57	2018-02-15 04:28:15.395702	2018-02-15 04:28:15.395702	6
636	Trust fund paleo chartreuse next level freegan hella viral mixtape. Carry locavore humblebrag normcore street heirloom.	Medium	57	2018-02-15 04:28:15.402906	2018-02-15 04:28:15.402906	9
637	Waistcoat brunch chambray heirloom bicycle rights iphone cleanse. Blog readymade ugh cred tattooed. Yr 3 wolf moon kombucha. Venmo microdosing etsy you probably haven't heard of them. Heirloom lumbersexual artisan schlitz twee umami chartreuse fixie. Disrupt leggings blog flannel cred.	Medium	57	2018-02-15 04:28:15.410256	2018-02-15 04:28:15.410256	11
638	Meh bitters umami vinegar forage fixie wes anderson keytar. Forage tilde small batch. Master kinfolk actually. Cliche pabst green juice tote bag echo organic. Tousled craft beer goth.	Medium	60	2018-02-15 04:28:15.606952	2018-02-15 04:28:15.606952	31
639	Cred organic actually. Austin vinyl chillwave pabst umami wolf before they sold out. Shabby chic raw denim cold-pressed. Brunch waistcoat fashion axe schlitz artisan biodiesel. Everyday wayfarers bushwick. Wes anderson echo sustainable.	Medium	60	2018-02-15 04:28:15.619867	2018-02-15 04:28:15.619867	20
640	Photo booth listicle bitters pitchfork chambray lo-fi beard portland. Skateboard bushwick kale chips humblebrag everyday next level austin try-hard. Narwhal cleanse single-origin coffee quinoa. Paleo pinterest literally flannel venmo organic chambray.	Medium	60	2018-02-15 04:28:15.63249	2018-02-15 04:28:15.63249	35
641	Neutra disrupt craft beer mixtape bitters pabst. Organic phlogiston locavore. Godard portland knausgaard semiotics twee kitsch park thundercats. Irony kinfolk vhs chicharrones williamsburg franzen try-hard pitchfork. Pinterest wayfarers migas salvia. Pinterest pork belly paleo kogi marfa sustainable.	Medium	60	2018-02-15 04:28:15.646818	2018-02-15 04:28:15.646818	7
642	Retro chartreuse portland cred. Banh mi gastropub jean shorts umami offal you probably haven't heard of them freegan cleanse. Gluten-free fixie bespoke jean shorts cardigan vhs.	Medium	52	2018-02-15 04:28:15.762237	2018-02-15 04:28:15.762237	48
643	Skateboard tattooed food truck normcore brunch you probably haven't heard of them iphone bitters. Yolo migas tousled roof yr pitchfork. Meditation ramps 3 wolf moon five dollar toast direct trade goth. Muggle magic vinegar literally readymade artisan.	Medium	52	2018-02-15 04:28:15.770163	2018-02-15 04:28:15.770163	18
644	Whatever bitters hammock knausgaard distillery tacos. Direct trade shabby chic cardigan mumblecore leggings. Distillery brunch letterpress banh mi. Knausgaard 8-bit fashion axe chicharrones thundercats.	Medium	52	2018-02-15 04:28:15.777686	2018-02-15 04:28:15.777686	68
645	Tousled banh mi yuccie squid. Cray venmo godard. Migas tattooed scenester wolf deep v. Portland brooklyn dreamcatcher literally food truck humblebrag blog drinking. Muggle magic portland semiotics wolf schlitz disrupt paleo hashtag. Poutine 3 wolf moon chicharrones brunch ethical.	Medium	52	2018-02-15 04:28:15.784993	2018-02-15 04:28:15.784993	24
646	Squid wes anderson put a bird on it kombucha. Banjo plaid semiotics slow-carb austin artisan. Five dollar toast salvia iphone tattooed cred microdosing +1 bushwick. Venmo muggle magic gastropub blog everyday ramps fixie. Brooklyn slow-carb pinterest godard craft beer farm-to-table austin.	Medium	52	2018-02-15 04:28:15.792389	2018-02-15 04:28:15.792389	11
647	Neutra chillwave pinterest marfa single-origin coffee goth. Mixtape cronut goth 90's mlkshk gentrify tumblr butcher. Diy viral meggings godard blog xoxo.	Medium	49	2018-02-15 04:28:15.868432	2018-02-15 04:28:15.868432	30
648	Ethical readymade shoreditch helvetica occupy sustainable. Trust fund ethical before they sold out crucifix chillwave.	Medium	49	2018-02-15 04:28:15.875862	2018-02-15 04:28:15.875862	40
649	Poutine hoodie knausgaard hashtag. Yolo plaid hoodie meditation listicle kale chips.	Medium	49	2018-02-15 04:28:15.883103	2018-02-15 04:28:15.883103	62
650	Skateboard kombucha wes anderson pug post-ironic brooklyn. Pinterest tattooed flexitarian lomo marfa microdosing dreamcatcher locavore. Sriracha plaid vegan drinking retro seitan godard synth.	Medium	59	2018-02-15 04:28:16.025911	2018-02-15 04:28:16.025911	56
651	Before they sold out meh 3 wolf moon. Cold-pressed 3 wolf moon freegan single-origin coffee hammock. Chartreuse viral church-key lomo.	Medium	59	2018-02-15 04:28:16.033139	2018-02-15 04:28:16.033139	9
652	Green juice 90's poutine. Venmo biodiesel put a bird on it disrupt wayfarers. Humblebrag umami meditation kogi leggings. Everyday kale chips fanny pack ugh.	Medium	62	2018-02-15 04:28:16.160703	2018-02-15 04:28:16.160703	73
653	Helvetica health celiac. Polaroid tattooed meh skateboard.	Medium	62	2018-02-15 04:28:16.167996	2018-02-15 04:28:16.167996	19
654	Tousled messenger bag deep v meditation cornhole drinking. Yuccie everyday mlkshk. Brooklyn actually beard salvia hella semiotics. Wolf literally gluten-free.	Medium	62	2018-02-15 04:28:16.175823	2018-02-15 04:28:16.175823	9
655	Lomo hella listicle yr. Mustache pug austin post-ironic mlkshk cred tattooed.	Medium	62	2018-02-15 04:28:16.182791	2018-02-15 04:28:16.182791	56
656	3 wolf moon migas ramps kogi. Try-hard portland meditation authentic disrupt. Authentic lo-fi tote bag quinoa tattooed pbr&b. Street ramps kombucha hella. Echo skateboard cray. Selvage keffiyeh craft beer knausgaard forage fixie five dollar toast bespoke.	Medium	64	2018-02-15 04:28:16.317551	2018-02-15 04:28:16.317551	70
657	Chillwave 8-bit single-origin coffee try-hard banjo selfies tofu. Quinoa venmo goth yr heirloom typewriter. Vinegar carry small batch humblebrag tattooed flexitarian blog lomo.	Medium	64	2018-02-15 04:28:16.324969	2018-02-15 04:28:16.324969	69
658	Yuccie master literally. Asymmetrical irony dreamcatcher health goth.	Medium	64	2018-02-15 04:28:16.332622	2018-02-15 04:28:16.332622	37
659	Lomo freegan mustache semiotics marfa deep v blue bottle. Chambray wayfarers biodiesel photo booth vhs pork belly pabst salvia. Bitters cray vhs cliche offal.	Medium	68	2018-02-15 04:28:16.384756	2018-02-15 04:28:16.384756	64
660	Aesthetic sriracha taxidermy pbr&b pitchfork meggings freegan retro. Chicharrones jean shorts fanny pack chia skateboard. Tacos williamsburg chambray salvia scenester distillery. Lo-fi +1 direct trade pinterest yr heirloom. Gastropub typewriter retro.	Medium	68	2018-02-15 04:28:16.390716	2018-02-15 04:28:16.390716	66
661	Flexitarian you probably haven't heard of them trust fund aesthetic swag. Swag food truck tofu shabby chic flexitarian cred venmo blue bottle. Hammock actually occupy meditation waistcoat. Pop-up intelligentsia gluten-free waistcoat craft beer. Venmo banh mi pop-up diy occupy tattooed scenester tacos.	Medium	68	2018-02-15 04:28:16.396057	2018-02-15 04:28:16.396057	70
662	Viral skateboard vhs. Gentrify tousled master cardigan single-origin coffee selfies fashion axe. Shoreditch park gluten-free. Vhs park 90's twee.	Medium	68	2018-02-15 04:28:16.401438	2018-02-15 04:28:16.401438	69
663	Cleanse church-key tofu etsy meh plaid. Organic banjo small batch ennui salvia put a bird on it. Biodiesel franzen gentrify.	Medium	68	2018-02-15 04:28:16.4069	2018-02-15 04:28:16.4069	20
664	Kogi polaroid cornhole literally wolf poutine. Park pinterest you probably haven't heard of them franzen lo-fi keytar wes anderson. Roof photo booth slow-carb irony.	Medium	66	2018-02-15 04:28:16.535689	2018-02-15 04:28:16.535689	54
665	Aesthetic irony scenester lumbersexual schlitz letterpress blog. Health keffiyeh trust fund thundercats. Hashtag 3 wolf moon quinoa tofu humblebrag pinterest irony kale chips. Put a bird on it stumptown selfies. Biodiesel twee tacos tote bag street aesthetic.	Medium	66	2018-02-15 04:28:16.54332	2018-02-15 04:28:16.54332	47
573	Thank you for this thoughtful post. As a software engineer with longstanding chronic neck pain, I have only recently started to understand my own disease. This is an issue that I feel many of my colleagues are not comfortable with openly talking about. I think it's about time that we remove the stigma with talking about mental wellness in this industry.	Post	222	2018-02-15 04:28:13.072352	2018-02-15 04:28:13.072352	32
\.


--
-- Data for Name: friendly_id_slugs; Type: TABLE DATA; Schema: public; Owner: jacklee
--

COPY friendly_id_slugs (id, slug, sluggable_id, sluggable_type, scope, created_at) FROM stdin;
158	aaron-ackroyd	1	User	\N	2018-02-03 16:56:33.735733
159	billy-bob-brown	2	User	\N	2018-02-03 16:56:33.757075
160	ceecee-conrad	3	User	\N	2018-02-03 16:56:33.774951
161	darlene-davis	6	User	\N	2018-02-03 16:56:33.791664
162	jovan	24	User	\N	2018-02-03 16:56:33.807536
163	amani	23	User	\N	2018-02-03 16:56:33.824654
164	jaydon	14	User	\N	2018-02-03 16:56:33.841437
165	domenica	13	User	\N	2018-02-03 16:56:33.85715
166	wallace	26	User	\N	2018-02-03 16:56:33.873043
167	giovani	8	User	\N	2018-02-03 16:56:33.88987
168	joanny	10	User	\N	2018-02-03 16:56:33.905146
169	felix	11	User	\N	2018-02-03 16:56:33.921524
170	reba	12	User	\N	2018-02-03 16:56:33.937665
171	sterling	28	User	\N	2018-02-03 16:56:33.955164
172	tyshawn	15	User	\N	2018-02-03 16:56:33.971107
173	vincent	27	User	\N	2018-02-03 16:56:33.989006
174	rollin	17	User	\N	2018-02-03 16:56:34.004728
175	sharon	18	User	\N	2018-02-03 16:56:34.019612
176	aaliyah	19	User	\N	2018-02-03 16:56:34.035762
177	emilio	20	User	\N	2018-02-03 16:56:34.052315
178	abe	21	User	\N	2018-02-03 16:56:34.069845
179	jack-lee	7	User	\N	2018-02-03 16:56:34.090861
180	kyler	22	User	\N	2018-02-03 16:56:34.108294
181	larue	36	User	\N	2018-02-03 16:56:34.128547
182	gloria	37	User	\N	2018-02-03 16:56:34.148582
183	delilah	38	User	\N	2018-02-03 16:56:34.165625
184	rachael	40	User	\N	2018-02-03 16:56:34.188428
185	vidal	41	User	\N	2018-02-03 16:56:34.206492
186	lavada	42	User	\N	2018-02-03 16:56:34.224669
187	gregoria	44	User	\N	2018-02-03 16:56:34.243568
188	lyric	45	User	\N	2018-02-03 16:56:34.265147
189	cassie	46	User	\N	2018-02-03 16:56:34.296137
190	deangelo	47	User	\N	2018-02-03 16:56:34.315961
191	deonte	48	User	\N	2018-02-03 16:56:34.335443
192	dillon	49	User	\N	2018-02-03 16:56:34.353547
193	jaylen	50	User	\N	2018-02-03 16:56:34.373915
194	marjory	51	User	\N	2018-02-03 16:56:34.423462
195	jennings	52	User	\N	2018-02-03 16:56:34.446959
196	jacklyn	53	User	\N	2018-02-03 16:56:34.46513
197	abdul	54	User	\N	2018-02-03 16:56:34.483342
198	sage	30	User	\N	2018-02-03 16:56:34.519853
199	brandon	31	User	\N	2018-02-03 16:56:34.536538
200	elvis	32	User	\N	2018-02-03 16:56:34.552874
201	layla	33	User	\N	2018-02-03 16:56:34.569747
202	katrina	34	User	\N	2018-02-03 16:56:34.585459
203	petra	61	User	\N	2018-02-03 16:56:34.601715
204	anabel	62	User	\N	2018-02-03 16:56:34.619059
205	brielle	63	User	\N	2018-02-03 16:56:34.637407
206	korey	65	User	\N	2018-02-03 16:56:34.654027
207	dayna	66	User	\N	2018-02-03 16:56:34.669907
208	darius	68	User	\N	2018-02-03 16:56:34.689553
209	nyah	69	User	\N	2018-02-03 16:56:34.705361
210	johnpaul	71	User	\N	2018-02-03 16:56:34.719705
211	johann	72	User	\N	2018-02-03 16:56:34.737182
212	asa	73	User	\N	2018-02-03 16:56:34.754871
213	terrill	74	User	\N	2018-02-03 16:56:34.77089
214	kale	75	User	\N	2018-02-03 16:56:34.785345
215	adolfo	76	User	\N	2018-02-03 16:56:34.803897
216	andie-hermann	64	User	\N	2018-02-03 16:56:34.818642
217	serena	16	User	\N	2018-02-03 16:56:34.83511
218	wyatt	29	User	\N	2018-02-03 16:56:34.850536
219	terrance	9	User	\N	2018-02-03 16:56:34.869427
220	margret	57	User	\N	2018-02-03 16:56:34.885572
221	ernestine	58	User	\N	2018-02-03 16:56:34.90371
222	lucio	55	User	\N	2018-02-03 16:56:34.922509
223	boyd	59	User	\N	2018-02-03 16:56:34.93833
224	cristian	60	User	\N	2018-02-03 16:56:34.954476
225	keshawn	77	User	\N	2018-02-03 16:56:34.972112
226	alysson	56	User	\N	2018-02-03 16:56:34.989846
227	margaret	67	User	\N	2018-02-03 16:56:35.005686
228	agustin	35	User	\N	2018-02-03 16:56:35.023095
229	ayana	39	User	\N	2018-02-03 16:56:35.048729
230	macy	25	User	\N	2018-02-03 16:56:35.06581
231	rafael	43	User	\N	2018-02-03 16:56:35.089255
232	carley	70	User	\N	2018-02-03 16:56:35.107164
236	eric	81	User	\N	2018-02-28 02:30:41.548255
\.


--
-- Data for Name: likes; Type: TABLE DATA; Schema: public; Owner: jacklee
--

COPY likes (id, likeable_type, likeable_id, user_id, created_at, updated_at) FROM stdin;
2	Post	2	6	2018-02-05 04:56:34.488345	2018-02-05 04:56:34.488345
5	Medium	1	6	2018-02-05 05:04:34.294041	2018-02-05 05:04:34.294041
7	Post	4	7	2018-02-07 02:18:21.242167	2018-02-07 02:18:21.242167
8	Post	210	6	2018-02-07 03:58:21.567408	2018-02-07 03:58:21.567408
9	Medium	5	6	2018-02-07 05:56:44.363716	2018-02-07 05:56:44.363716
15	Post	211	3	2018-02-08 18:00:15.252737	2018-02-08 18:00:15.252737
22	Post	207	6	2018-02-08 23:09:01.920767	2018-02-08 23:09:01.920767
23	Post	187	7	2018-02-10 02:16:28.454959	2018-02-10 02:16:28.454959
24	Post	57	7	2018-02-11 20:28:22.758261	2018-02-11 20:28:22.758261
25	Medium	9	7	2018-02-11 20:46:16.311503	2018-02-11 20:46:16.311503
26	Post	210	7	2018-02-11 21:28:15.468706	2018-02-11 21:28:15.468706
35	Medium	65	7	2018-02-14 05:07:02.135763	2018-02-14 05:07:02.135763
36	Post	220	71	2018-02-15 04:28:12.798788	2018-02-15 04:28:12.798788
37	Post	220	70	2018-02-15 04:28:12.825648	2018-02-15 04:28:12.825648
38	Post	220	33	2018-02-15 04:28:12.834171	2018-02-15 04:28:12.834171
39	Post	220	41	2018-02-15 04:28:12.842511	2018-02-15 04:28:12.842511
40	Post	220	13	2018-02-15 04:28:12.85076	2018-02-15 04:28:12.85076
41	Post	220	45	2018-02-15 04:28:12.859331	2018-02-15 04:28:12.859331
42	Post	220	69	2018-02-15 04:28:12.867677	2018-02-15 04:28:12.867677
43	Post	220	6	2018-02-15 04:28:12.875805	2018-02-15 04:28:12.875805
44	Post	220	25	2018-02-15 04:28:12.884621	2018-02-15 04:28:12.884621
45	Post	220	48	2018-02-15 04:28:12.892872	2018-02-15 04:28:12.892872
46	Post	220	72	2018-02-15 04:28:12.901339	2018-02-15 04:28:12.901339
47	Post	220	19	2018-02-15 04:28:12.909521	2018-02-15 04:28:12.909521
48	Post	221	3	2018-02-15 04:28:12.942084	2018-02-15 04:28:12.942084
49	Post	221	18	2018-02-15 04:28:12.950532	2018-02-15 04:28:12.950532
50	Post	221	65	2018-02-15 04:28:12.959572	2018-02-15 04:28:12.959572
51	Post	221	48	2018-02-15 04:28:12.967867	2018-02-15 04:28:12.967867
52	Post	221	60	2018-02-15 04:28:12.976243	2018-02-15 04:28:12.976243
53	Post	221	6	2018-02-15 04:28:12.9855	2018-02-15 04:28:12.9855
54	Post	221	34	2018-02-15 04:28:12.993954	2018-02-15 04:28:12.993954
55	Post	221	63	2018-02-15 04:28:13.002159	2018-02-15 04:28:13.002159
56	Post	221	74	2018-02-15 04:28:13.010637	2018-02-15 04:28:13.010637
57	Post	223	57	2018-02-15 04:28:13.028518	2018-02-15 04:28:13.028518
58	Post	223	56	2018-02-15 04:28:13.036891	2018-02-15 04:28:13.036891
59	Post	223	64	2018-02-15 04:28:13.046596	2018-02-15 04:28:13.046596
60	Post	223	27	2018-02-15 04:28:13.055283	2018-02-15 04:28:13.055283
61	Post	223	62	2018-02-15 04:28:13.063936	2018-02-15 04:28:13.063936
62	Post	222	74	2018-02-15 04:28:13.086502	2018-02-15 04:28:13.086502
63	Post	222	11	2018-02-15 04:28:13.093584	2018-02-15 04:28:13.093584
64	Post	222	71	2018-02-15 04:28:13.102386	2018-02-15 04:28:13.102386
65	Post	222	54	2018-02-15 04:28:13.109923	2018-02-15 04:28:13.109923
66	Post	222	49	2018-02-15 04:28:13.116232	2018-02-15 04:28:13.116232
67	Post	222	27	2018-02-15 04:28:13.12309	2018-02-15 04:28:13.12309
68	Post	222	24	2018-02-15 04:28:13.129069	2018-02-15 04:28:13.129069
69	Post	222	76	2018-02-15 04:28:13.135987	2018-02-15 04:28:13.135987
70	Post	224	47	2018-02-15 04:28:13.149089	2018-02-15 04:28:13.149089
71	Post	224	56	2018-02-15 04:28:13.154863	2018-02-15 04:28:13.154863
72	Post	224	77	2018-02-15 04:28:13.160668	2018-02-15 04:28:13.160668
73	Post	224	21	2018-02-15 04:28:13.166839	2018-02-15 04:28:13.166839
74	Post	224	63	2018-02-15 04:28:13.17297	2018-02-15 04:28:13.17297
75	Post	224	28	2018-02-15 04:28:13.178964	2018-02-15 04:28:13.178964
76	Post	224	22	2018-02-15 04:28:13.185846	2018-02-15 04:28:13.185846
77	Post	224	11	2018-02-15 04:28:13.193113	2018-02-15 04:28:13.193113
78	Post	224	53	2018-02-15 04:28:13.199248	2018-02-15 04:28:13.199248
79	Post	224	39	2018-02-15 04:28:13.205289	2018-02-15 04:28:13.205289
80	Post	224	12	2018-02-15 04:28:13.21146	2018-02-15 04:28:13.21146
81	Post	224	43	2018-02-15 04:28:13.218154	2018-02-15 04:28:13.218154
82	Post	224	64	2018-02-15 04:28:13.224176	2018-02-15 04:28:13.224176
83	Post	224	57	2018-02-15 04:28:13.230958	2018-02-15 04:28:13.230958
84	Post	224	49	2018-02-15 04:28:13.237088	2018-02-15 04:28:13.237088
85	Post	224	6	2018-02-15 04:28:13.244546	2018-02-15 04:28:13.244546
86	Post	224	1	2018-02-15 04:28:13.250661	2018-02-15 04:28:13.250661
87	Post	224	18	2018-02-15 04:28:13.256663	2018-02-15 04:28:13.256663
88	Medium	10	47	2018-02-15 04:28:13.322064	2018-02-15 04:28:13.322064
89	Medium	10	40	2018-02-15 04:28:13.331495	2018-02-15 04:28:13.331495
90	Medium	10	10	2018-02-15 04:28:13.339281	2018-02-15 04:28:13.339281
91	Medium	10	9	2018-02-15 04:28:13.348171	2018-02-15 04:28:13.348171
92	Medium	10	73	2018-02-15 04:28:13.356692	2018-02-15 04:28:13.356692
93	Medium	10	76	2018-02-15 04:28:13.368186	2018-02-15 04:28:13.368186
94	Medium	10	39	2018-02-15 04:28:13.376613	2018-02-15 04:28:13.376613
95	Medium	10	44	2018-02-15 04:28:13.384987	2018-02-15 04:28:13.384987
96	Medium	10	77	2018-02-15 04:28:13.393324	2018-02-15 04:28:13.393324
97	Medium	10	11	2018-02-15 04:28:13.401589	2018-02-15 04:28:13.401589
98	Medium	3	63	2018-02-15 04:28:13.435754	2018-02-15 04:28:13.435754
99	Medium	3	14	2018-02-15 04:28:13.444339	2018-02-15 04:28:13.444339
100	Medium	3	10	2018-02-15 04:28:13.452964	2018-02-15 04:28:13.452964
101	Medium	3	22	2018-02-15 04:28:13.461465	2018-02-15 04:28:13.461465
102	Medium	3	42	2018-02-15 04:28:13.469747	2018-02-15 04:28:13.469747
103	Medium	3	8	2018-02-15 04:28:13.478318	2018-02-15 04:28:13.478318
104	Medium	3	41	2018-02-15 04:28:13.486561	2018-02-15 04:28:13.486561
105	Medium	3	7	2018-02-15 04:28:13.49519	2018-02-15 04:28:13.49519
106	Medium	1	59	2018-02-15 04:28:13.512242	2018-02-15 04:28:13.512242
107	Medium	1	25	2018-02-15 04:28:13.520638	2018-02-15 04:28:13.520638
108	Medium	1	3	2018-02-15 04:28:13.529052	2018-02-15 04:28:13.529052
109	Medium	1	27	2018-02-15 04:28:13.537336	2018-02-15 04:28:13.537336
110	Medium	1	45	2018-02-15 04:28:13.545978	2018-02-15 04:28:13.545978
111	Medium	1	43	2018-02-15 04:28:13.554585	2018-02-15 04:28:13.554585
112	Medium	1	7	2018-02-15 04:28:13.563166	2018-02-15 04:28:13.563166
113	Medium	1	28	2018-02-15 04:28:13.57162	2018-02-15 04:28:13.57162
114	Medium	1	54	2018-02-15 04:28:13.579942	2018-02-15 04:28:13.579942
115	Medium	1	74	2018-02-15 04:28:13.590902	2018-02-15 04:28:13.590902
116	Medium	1	69	2018-02-15 04:28:13.599439	2018-02-15 04:28:13.599439
117	Medium	1	15	2018-02-15 04:28:13.607922	2018-02-15 04:28:13.607922
118	Medium	1	53	2018-02-15 04:28:13.61633	2018-02-15 04:28:13.61633
119	Medium	1	64	2018-02-15 04:28:13.624665	2018-02-15 04:28:13.624665
120	Medium	1	11	2018-02-15 04:28:13.633474	2018-02-15 04:28:13.633474
121	Medium	1	1	2018-02-15 04:28:13.641889	2018-02-15 04:28:13.641889
122	Medium	1	10	2018-02-15 04:28:13.65027	2018-02-15 04:28:13.65027
123	Medium	1	22	2018-02-15 04:28:13.65872	2018-02-15 04:28:13.65872
124	Medium	2	58	2018-02-15 04:28:13.69905	2018-02-15 04:28:13.69905
125	Medium	2	32	2018-02-15 04:28:13.708814	2018-02-15 04:28:13.708814
126	Medium	2	28	2018-02-15 04:28:13.718509	2018-02-15 04:28:13.718509
127	Medium	2	41	2018-02-15 04:28:13.729841	2018-02-15 04:28:13.729841
128	Medium	2	1	2018-02-15 04:28:13.740712	2018-02-15 04:28:13.740712
129	Medium	2	51	2018-02-15 04:28:13.749838	2018-02-15 04:28:13.749838
130	Medium	2	53	2018-02-15 04:28:13.758262	2018-02-15 04:28:13.758262
131	Medium	2	61	2018-02-15 04:28:13.783163	2018-02-15 04:28:13.783163
132	Medium	4	8	2018-02-15 04:28:13.831696	2018-02-15 04:28:13.831696
133	Medium	4	33	2018-02-15 04:28:13.840287	2018-02-15 04:28:13.840287
134	Medium	4	40	2018-02-15 04:28:13.848648	2018-02-15 04:28:13.848648
135	Medium	4	63	2018-02-15 04:28:13.857411	2018-02-15 04:28:13.857411
136	Medium	4	50	2018-02-15 04:28:13.865814	2018-02-15 04:28:13.865814
137	Medium	4	49	2018-02-15 04:28:13.874233	2018-02-15 04:28:13.874233
138	Medium	5	36	2018-02-15 04:28:13.905762	2018-02-15 04:28:13.905762
139	Medium	5	77	2018-02-15 04:28:13.916879	2018-02-15 04:28:13.916879
140	Medium	5	13	2018-02-15 04:28:13.925423	2018-02-15 04:28:13.925423
141	Medium	5	9	2018-02-15 04:28:13.934397	2018-02-15 04:28:13.934397
142	Medium	5	62	2018-02-15 04:28:13.94292	2018-02-15 04:28:13.94292
143	Medium	5	48	2018-02-15 04:28:13.951335	2018-02-15 04:28:13.951335
144	Medium	5	21	2018-02-15 04:28:13.959991	2018-02-15 04:28:13.959991
145	Medium	5	69	2018-02-15 04:28:13.968274	2018-02-15 04:28:13.968274
146	Medium	5	16	2018-02-15 04:28:13.97664	2018-02-15 04:28:13.97664
147	Medium	5	11	2018-02-15 04:28:13.985109	2018-02-15 04:28:13.985109
148	Medium	5	18	2018-02-15 04:28:13.993557	2018-02-15 04:28:13.993557
149	Medium	5	41	2018-02-15 04:28:14.002381	2018-02-15 04:28:14.002381
150	Medium	5	56	2018-02-15 04:28:14.01092	2018-02-15 04:28:14.01092
151	Medium	5	15	2018-02-15 04:28:14.019244	2018-02-15 04:28:14.019244
152	Medium	5	25	2018-02-15 04:28:14.027706	2018-02-15 04:28:14.027706
153	Medium	5	38	2018-02-15 04:28:14.036261	2018-02-15 04:28:14.036261
154	Medium	5	39	2018-02-15 04:28:14.04712	2018-02-15 04:28:14.04712
155	Medium	5	17	2018-02-15 04:28:14.055794	2018-02-15 04:28:14.055794
156	Medium	5	67	2018-02-15 04:28:14.064324	2018-02-15 04:28:14.064324
157	Medium	7	17	2018-02-15 04:28:14.1117	2018-02-15 04:28:14.1117
158	Medium	7	30	2018-02-15 04:28:14.130039	2018-02-15 04:28:14.130039
159	Medium	7	38	2018-02-15 04:28:14.136251	2018-02-15 04:28:14.136251
160	Medium	7	61	2018-02-15 04:28:14.142586	2018-02-15 04:28:14.142586
161	Medium	7	9	2018-02-15 04:28:14.148582	2018-02-15 04:28:14.148582
162	Medium	7	37	2018-02-15 04:28:14.154756	2018-02-15 04:28:14.154756
163	Medium	7	62	2018-02-15 04:28:14.160904	2018-02-15 04:28:14.160904
164	Medium	7	10	2018-02-15 04:28:14.167328	2018-02-15 04:28:14.167328
165	Medium	7	15	2018-02-15 04:28:14.173449	2018-02-15 04:28:14.173449
166	Medium	7	21	2018-02-15 04:28:14.17979	2018-02-15 04:28:14.17979
167	Medium	7	16	2018-02-15 04:28:14.185994	2018-02-15 04:28:14.185994
168	Medium	8	22	2018-02-15 04:28:14.216485	2018-02-15 04:28:14.216485
169	Medium	8	58	2018-02-15 04:28:14.225018	2018-02-15 04:28:14.225018
170	Medium	8	53	2018-02-15 04:28:14.233318	2018-02-15 04:28:14.233318
171	Medium	8	47	2018-02-15 04:28:14.241819	2018-02-15 04:28:14.241819
172	Medium	8	52	2018-02-15 04:28:14.250342	2018-02-15 04:28:14.250342
173	Medium	8	64	2018-02-15 04:28:14.258607	2018-02-15 04:28:14.258607
174	Medium	8	51	2018-02-15 04:28:14.266798	2018-02-15 04:28:14.266798
175	Medium	8	70	2018-02-15 04:28:14.275138	2018-02-15 04:28:14.275138
176	Medium	8	65	2018-02-15 04:28:14.283456	2018-02-15 04:28:14.283456
177	Medium	9	26	2018-02-15 04:28:14.306627	2018-02-15 04:28:14.306627
178	Medium	9	45	2018-02-15 04:28:14.31974	2018-02-15 04:28:14.31974
179	Medium	9	67	2018-02-15 04:28:14.330719	2018-02-15 04:28:14.330719
180	Medium	9	3	2018-02-15 04:28:14.339338	2018-02-15 04:28:14.339338
181	Medium	9	22	2018-02-15 04:28:14.347636	2018-02-15 04:28:14.347636
182	Medium	9	66	2018-02-15 04:28:14.355997	2018-02-15 04:28:14.355997
183	Medium	9	32	2018-02-15 04:28:14.364341	2018-02-15 04:28:14.364341
184	Medium	9	74	2018-02-15 04:28:14.372481	2018-02-15 04:28:14.372481
185	Medium	9	38	2018-02-15 04:28:14.3807	2018-02-15 04:28:14.3807
186	Medium	9	16	2018-02-15 04:28:14.389818	2018-02-15 04:28:14.389818
187	Medium	65	40	2018-02-15 04:28:14.442966	2018-02-15 04:28:14.442966
188	Medium	65	1	2018-02-15 04:28:14.451384	2018-02-15 04:28:14.451384
189	Medium	65	32	2018-02-15 04:28:14.460485	2018-02-15 04:28:14.460485
190	Medium	65	52	2018-02-15 04:28:14.469298	2018-02-15 04:28:14.469298
191	Medium	65	55	2018-02-15 04:28:14.478857	2018-02-15 04:28:14.478857
192	Medium	65	2	2018-02-15 04:28:14.487883	2018-02-15 04:28:14.487883
193	Medium	65	36	2018-02-15 04:28:14.496848	2018-02-15 04:28:14.496848
194	Medium	65	17	2018-02-15 04:28:14.507756	2018-02-15 04:28:14.507756
195	Medium	65	3	2018-02-15 04:28:14.522239	2018-02-15 04:28:14.522239
196	Medium	65	46	2018-02-15 04:28:14.530823	2018-02-15 04:28:14.530823
197	Medium	65	35	2018-02-15 04:28:14.539336	2018-02-15 04:28:14.539336
198	Medium	65	75	2018-02-15 04:28:14.550647	2018-02-15 04:28:14.550647
199	Medium	65	54	2018-02-15 04:28:14.560769	2018-02-15 04:28:14.560769
200	Medium	65	19	2018-02-15 04:28:14.568277	2018-02-15 04:28:14.568277
201	Medium	65	48	2018-02-15 04:28:14.574766	2018-02-15 04:28:14.574766
202	Medium	65	63	2018-02-15 04:28:14.582429	2018-02-15 04:28:14.582429
203	Medium	65	47	2018-02-15 04:28:14.588489	2018-02-15 04:28:14.588489
204	Medium	53	74	2018-02-15 04:28:14.610804	2018-02-15 04:28:14.610804
205	Medium	53	13	2018-02-15 04:28:14.618186	2018-02-15 04:28:14.618186
206	Medium	53	61	2018-02-15 04:28:14.624586	2018-02-15 04:28:14.624586
207	Medium	53	77	2018-02-15 04:28:14.632598	2018-02-15 04:28:14.632598
208	Medium	53	16	2018-02-15 04:28:14.639011	2018-02-15 04:28:14.639011
209	Medium	53	22	2018-02-15 04:28:14.647037	2018-02-15 04:28:14.647037
210	Medium	53	3	2018-02-15 04:28:14.65463	2018-02-15 04:28:14.65463
211	Medium	53	38	2018-02-15 04:28:14.662443	2018-02-15 04:28:14.662443
212	Medium	53	43	2018-02-15 04:28:14.669131	2018-02-15 04:28:14.669131
213	Medium	53	65	2018-02-15 04:28:14.67539	2018-02-15 04:28:14.67539
214	Medium	53	1	2018-02-15 04:28:14.681935	2018-02-15 04:28:14.681935
215	Medium	53	11	2018-02-15 04:28:14.688013	2018-02-15 04:28:14.688013
216	Medium	53	26	2018-02-15 04:28:14.697113	2018-02-15 04:28:14.697113
217	Medium	53	25	2018-02-15 04:28:14.703386	2018-02-15 04:28:14.703386
218	Medium	53	34	2018-02-15 04:28:14.710367	2018-02-15 04:28:14.710367
219	Medium	53	12	2018-02-15 04:28:14.717102	2018-02-15 04:28:14.717102
220	Medium	67	12	2018-02-15 04:28:14.741195	2018-02-15 04:28:14.741195
221	Medium	67	74	2018-02-15 04:28:14.74817	2018-02-15 04:28:14.74817
222	Medium	67	25	2018-02-15 04:28:14.754558	2018-02-15 04:28:14.754558
223	Medium	67	15	2018-02-15 04:28:14.761448	2018-02-15 04:28:14.761448
224	Medium	67	10	2018-02-15 04:28:14.767725	2018-02-15 04:28:14.767725
225	Medium	67	41	2018-02-15 04:28:14.773619	2018-02-15 04:28:14.773619
226	Medium	67	8	2018-02-15 04:28:14.780829	2018-02-15 04:28:14.780829
227	Medium	67	26	2018-02-15 04:28:14.787287	2018-02-15 04:28:14.787287
228	Medium	67	55	2018-02-15 04:28:14.793857	2018-02-15 04:28:14.793857
229	Medium	67	1	2018-02-15 04:28:14.800647	2018-02-15 04:28:14.800647
230	Medium	67	66	2018-02-15 04:28:14.809041	2018-02-15 04:28:14.809041
231	Medium	67	56	2018-02-15 04:28:14.816018	2018-02-15 04:28:14.816018
232	Medium	67	65	2018-02-15 04:28:14.821979	2018-02-15 04:28:14.821979
233	Medium	67	76	2018-02-15 04:28:14.829121	2018-02-15 04:28:14.829121
234	Medium	67	24	2018-02-15 04:28:14.835654	2018-02-15 04:28:14.835654
235	Medium	67	63	2018-02-15 04:28:14.841878	2018-02-15 04:28:14.841878
236	Medium	67	23	2018-02-15 04:28:14.848585	2018-02-15 04:28:14.848585
237	Medium	67	16	2018-02-15 04:28:14.854871	2018-02-15 04:28:14.854871
238	Medium	58	75	2018-02-15 04:28:14.877667	2018-02-15 04:28:14.877667
239	Medium	58	34	2018-02-15 04:28:14.884446	2018-02-15 04:28:14.884446
240	Medium	58	37	2018-02-15 04:28:14.890955	2018-02-15 04:28:14.890955
241	Medium	58	44	2018-02-15 04:28:14.900584	2018-02-15 04:28:14.900584
242	Medium	58	45	2018-02-15 04:28:14.917135	2018-02-15 04:28:14.917135
243	Medium	58	39	2018-02-15 04:28:14.923585	2018-02-15 04:28:14.923585
244	Medium	58	63	2018-02-15 04:28:14.930613	2018-02-15 04:28:14.930613
245	Medium	58	40	2018-02-15 04:28:14.936511	2018-02-15 04:28:14.936511
246	Medium	58	1	2018-02-15 04:28:14.942972	2018-02-15 04:28:14.942972
247	Medium	58	28	2018-02-15 04:28:14.952596	2018-02-15 04:28:14.952596
248	Medium	58	38	2018-02-15 04:28:14.959614	2018-02-15 04:28:14.959614
249	Medium	58	14	2018-02-15 04:28:14.967634	2018-02-15 04:28:14.967634
250	Medium	58	23	2018-02-15 04:28:14.973499	2018-02-15 04:28:14.973499
251	Medium	58	42	2018-02-15 04:28:14.980608	2018-02-15 04:28:14.980608
252	Medium	58	53	2018-02-15 04:28:14.986509	2018-02-15 04:28:14.986509
253	Medium	11	13	2018-02-15 04:28:15.023323	2018-02-15 04:28:15.023323
254	Medium	11	12	2018-02-15 04:28:15.030779	2018-02-15 04:28:15.030779
255	Medium	11	16	2018-02-15 04:28:15.03675	2018-02-15 04:28:15.03675
256	Medium	11	21	2018-02-15 04:28:15.043574	2018-02-15 04:28:15.043574
257	Medium	11	34	2018-02-15 04:28:15.050725	2018-02-15 04:28:15.050725
258	Medium	11	36	2018-02-15 04:28:15.057234	2018-02-15 04:28:15.057234
259	Medium	44	70	2018-02-15 04:28:15.086475	2018-02-15 04:28:15.086475
260	Medium	44	15	2018-02-15 04:28:15.092882	2018-02-15 04:28:15.092882
261	Medium	44	41	2018-02-15 04:28:15.102524	2018-02-15 04:28:15.102524
262	Medium	44	73	2018-02-15 04:28:15.113914	2018-02-15 04:28:15.113914
263	Medium	44	77	2018-02-15 04:28:15.125099	2018-02-15 04:28:15.125099
264	Medium	44	68	2018-02-15 04:28:15.134092	2018-02-15 04:28:15.134092
265	Medium	44	69	2018-02-15 04:28:15.142717	2018-02-15 04:28:15.142717
266	Medium	44	54	2018-02-15 04:28:15.153564	2018-02-15 04:28:15.153564
267	Medium	44	60	2018-02-15 04:28:15.185948	2018-02-15 04:28:15.185948
268	Medium	51	76	2018-02-15 04:28:15.250542	2018-02-15 04:28:15.250542
269	Medium	51	46	2018-02-15 04:28:15.262131	2018-02-15 04:28:15.262131
270	Medium	51	61	2018-02-15 04:28:15.270263	2018-02-15 04:28:15.270263
271	Medium	51	32	2018-02-15 04:28:15.278376	2018-02-15 04:28:15.278376
272	Medium	51	69	2018-02-15 04:28:15.283972	2018-02-15 04:28:15.283972
273	Medium	51	77	2018-02-15 04:28:15.289867	2018-02-15 04:28:15.289867
274	Medium	51	25	2018-02-15 04:28:15.295957	2018-02-15 04:28:15.295957
275	Medium	51	34	2018-02-15 04:28:15.30169	2018-02-15 04:28:15.30169
276	Medium	51	48	2018-02-15 04:28:15.307797	2018-02-15 04:28:15.307797
277	Medium	51	56	2018-02-15 04:28:15.314021	2018-02-15 04:28:15.314021
278	Medium	51	51	2018-02-15 04:28:15.317699	2018-02-15 04:28:15.317699
279	Medium	51	26	2018-02-15 04:28:15.323819	2018-02-15 04:28:15.323819
280	Medium	51	20	2018-02-15 04:28:15.330092	2018-02-15 04:28:15.330092
281	Medium	46	19	2018-02-15 04:28:15.348076	2018-02-15 04:28:15.348076
282	Medium	46	68	2018-02-15 04:28:15.353904	2018-02-15 04:28:15.353904
283	Medium	46	22	2018-02-15 04:28:15.360772	2018-02-15 04:28:15.360772
284	Medium	46	73	2018-02-15 04:28:15.371877	2018-02-15 04:28:15.371877
285	Medium	46	29	2018-02-15 04:28:15.377853	2018-02-15 04:28:15.377853
286	Medium	46	77	2018-02-15 04:28:15.38862	2018-02-15 04:28:15.38862
287	Medium	57	57	2018-02-15 04:28:15.419686	2018-02-15 04:28:15.419686
288	Medium	57	1	2018-02-15 04:28:15.428338	2018-02-15 04:28:15.428338
289	Medium	57	31	2018-02-15 04:28:15.436731	2018-02-15 04:28:15.436731
290	Medium	57	56	2018-02-15 04:28:15.44531	2018-02-15 04:28:15.44531
291	Medium	57	26	2018-02-15 04:28:15.45378	2018-02-15 04:28:15.45378
292	Medium	57	72	2018-02-15 04:28:15.462267	2018-02-15 04:28:15.462267
293	Medium	57	42	2018-02-15 04:28:15.474302	2018-02-15 04:28:15.474302
294	Medium	57	47	2018-02-15 04:28:15.486584	2018-02-15 04:28:15.486584
295	Medium	57	55	2018-02-15 04:28:15.498485	2018-02-15 04:28:15.498485
296	Medium	57	44	2018-02-15 04:28:15.509588	2018-02-15 04:28:15.509588
297	Medium	57	2	2018-02-15 04:28:15.519545	2018-02-15 04:28:15.519545
298	Medium	57	37	2018-02-15 04:28:15.529305	2018-02-15 04:28:15.529305
299	Medium	57	13	2018-02-15 04:28:15.542275	2018-02-15 04:28:15.542275
300	Medium	57	65	2018-02-15 04:28:15.555529	2018-02-15 04:28:15.555529
301	Medium	57	38	2018-02-15 04:28:15.568383	2018-02-15 04:28:15.568383
302	Medium	57	71	2018-02-15 04:28:15.580379	2018-02-15 04:28:15.580379
303	Medium	57	30	2018-02-15 04:28:15.594173	2018-02-15 04:28:15.594173
304	Medium	60	25	2018-02-15 04:28:15.659572	2018-02-15 04:28:15.659572
305	Medium	60	30	2018-02-15 04:28:15.669191	2018-02-15 04:28:15.669191
306	Medium	60	59	2018-02-15 04:28:15.679501	2018-02-15 04:28:15.679501
307	Medium	60	39	2018-02-15 04:28:15.690694	2018-02-15 04:28:15.690694
308	Medium	60	54	2018-02-15 04:28:15.702352	2018-02-15 04:28:15.702352
309	Medium	60	36	2018-02-15 04:28:15.712158	2018-02-15 04:28:15.712158
310	Medium	60	18	2018-02-15 04:28:15.722111	2018-02-15 04:28:15.722111
311	Medium	60	38	2018-02-15 04:28:15.733095	2018-02-15 04:28:15.733095
312	Medium	60	61	2018-02-15 04:28:15.745039	2018-02-15 04:28:15.745039
313	Medium	60	23	2018-02-15 04:28:15.753921	2018-02-15 04:28:15.753921
314	Medium	52	49	2018-02-15 04:28:15.801032	2018-02-15 04:28:15.801032
315	Medium	52	71	2018-02-15 04:28:15.809497	2018-02-15 04:28:15.809497
316	Medium	52	39	2018-02-15 04:28:15.817881	2018-02-15 04:28:15.817881
317	Medium	52	72	2018-02-15 04:28:15.826568	2018-02-15 04:28:15.826568
318	Medium	52	50	2018-02-15 04:28:15.834896	2018-02-15 04:28:15.834896
319	Medium	52	77	2018-02-15 04:28:15.843791	2018-02-15 04:28:15.843791
320	Medium	52	19	2018-02-15 04:28:15.852317	2018-02-15 04:28:15.852317
321	Medium	52	47	2018-02-15 04:28:15.860836	2018-02-15 04:28:15.860836
322	Medium	49	60	2018-02-15 04:28:15.892504	2018-02-15 04:28:15.892504
323	Medium	49	16	2018-02-15 04:28:15.901543	2018-02-15 04:28:15.901543
324	Medium	49	69	2018-02-15 04:28:15.910251	2018-02-15 04:28:15.910251
325	Medium	49	41	2018-02-15 04:28:15.919294	2018-02-15 04:28:15.919294
326	Medium	49	6	2018-02-15 04:28:15.927747	2018-02-15 04:28:15.927747
327	Medium	49	24	2018-02-15 04:28:15.938798	2018-02-15 04:28:15.938798
328	Medium	49	34	2018-02-15 04:28:15.947382	2018-02-15 04:28:15.947382
329	Medium	49	75	2018-02-15 04:28:15.958454	2018-02-15 04:28:15.958454
330	Medium	49	44	2018-02-15 04:28:15.967217	2018-02-15 04:28:15.967217
331	Medium	49	7	2018-02-15 04:28:15.975784	2018-02-15 04:28:15.975784
332	Medium	49	33	2018-02-15 04:28:15.984197	2018-02-15 04:28:15.984197
333	Medium	49	62	2018-02-15 04:28:15.992804	2018-02-15 04:28:15.992804
334	Medium	49	70	2018-02-15 04:28:16.001583	2018-02-15 04:28:16.001583
335	Medium	49	35	2018-02-15 04:28:16.010241	2018-02-15 04:28:16.010241
336	Medium	49	26	2018-02-15 04:28:16.018734	2018-02-15 04:28:16.018734
337	Medium	59	52	2018-02-15 04:28:16.042491	2018-02-15 04:28:16.042491
338	Medium	59	53	2018-02-15 04:28:16.05107	2018-02-15 04:28:16.05107
339	Medium	59	73	2018-02-15 04:28:16.059676	2018-02-15 04:28:16.059676
340	Medium	59	65	2018-02-15 04:28:16.068542	2018-02-15 04:28:16.068542
341	Medium	59	66	2018-02-15 04:28:16.077056	2018-02-15 04:28:16.077056
342	Medium	59	39	2018-02-15 04:28:16.085333	2018-02-15 04:28:16.085333
343	Medium	59	16	2018-02-15 04:28:16.093765	2018-02-15 04:28:16.093765
344	Medium	59	11	2018-02-15 04:28:16.102405	2018-02-15 04:28:16.102405
345	Medium	59	32	2018-02-15 04:28:16.111082	2018-02-15 04:28:16.111082
346	Medium	59	2	2018-02-15 04:28:16.119458	2018-02-15 04:28:16.119458
347	Medium	59	29	2018-02-15 04:28:16.12833	2018-02-15 04:28:16.12833
348	Medium	59	12	2018-02-15 04:28:16.13658	2018-02-15 04:28:16.13658
349	Medium	59	25	2018-02-15 04:28:16.145065	2018-02-15 04:28:16.145065
350	Medium	59	58	2018-02-15 04:28:16.153312	2018-02-15 04:28:16.153312
351	Medium	62	15	2018-02-15 04:28:16.192153	2018-02-15 04:28:16.192153
352	Medium	62	57	2018-02-15 04:28:16.200673	2018-02-15 04:28:16.200673
353	Medium	62	62	2018-02-15 04:28:16.209138	2018-02-15 04:28:16.209138
354	Medium	62	10	2018-02-15 04:28:16.217395	2018-02-15 04:28:16.217395
355	Medium	62	1	2018-02-15 04:28:16.225888	2018-02-15 04:28:16.225888
356	Medium	62	9	2018-02-15 04:28:16.234245	2018-02-15 04:28:16.234245
357	Medium	62	69	2018-02-15 04:28:16.242912	2018-02-15 04:28:16.242912
358	Medium	62	12	2018-02-15 04:28:16.25126	2018-02-15 04:28:16.25126
359	Medium	62	51	2018-02-15 04:28:16.259717	2018-02-15 04:28:16.259717
360	Medium	62	26	2018-02-15 04:28:16.268219	2018-02-15 04:28:16.268219
361	Medium	62	14	2018-02-15 04:28:16.276864	2018-02-15 04:28:16.276864
362	Medium	62	31	2018-02-15 04:28:16.285172	2018-02-15 04:28:16.285172
363	Medium	62	13	2018-02-15 04:28:16.293448	2018-02-15 04:28:16.293448
364	Medium	62	30	2018-02-15 04:28:16.301824	2018-02-15 04:28:16.301824
365	Medium	62	73	2018-02-15 04:28:16.310388	2018-02-15 04:28:16.310388
366	Medium	64	26	2018-02-15 04:28:16.341994	2018-02-15 04:28:16.341994
367	Medium	64	28	2018-02-15 04:28:16.348566	2018-02-15 04:28:16.348566
368	Medium	64	1	2018-02-15 04:28:16.354811	2018-02-15 04:28:16.354811
369	Medium	64	6	2018-02-15 04:28:16.361263	2018-02-15 04:28:16.361263
370	Medium	64	43	2018-02-15 04:28:16.367402	2018-02-15 04:28:16.367402
371	Medium	64	68	2018-02-15 04:28:16.373337	2018-02-15 04:28:16.373337
372	Medium	64	18	2018-02-15 04:28:16.379614	2018-02-15 04:28:16.379614
373	Medium	68	45	2018-02-15 04:28:16.413566	2018-02-15 04:28:16.413566
374	Medium	68	47	2018-02-15 04:28:16.43943	2018-02-15 04:28:16.43943
375	Medium	68	35	2018-02-15 04:28:16.44624	2018-02-15 04:28:16.44624
376	Medium	68	65	2018-02-15 04:28:16.452568	2018-02-15 04:28:16.452568
377	Medium	68	49	2018-02-15 04:28:16.459325	2018-02-15 04:28:16.459325
378	Medium	68	56	2018-02-15 04:28:16.465827	2018-02-15 04:28:16.465827
379	Medium	68	41	2018-02-15 04:28:16.472405	2018-02-15 04:28:16.472405
380	Medium	68	27	2018-02-15 04:28:16.479368	2018-02-15 04:28:16.479368
381	Medium	68	44	2018-02-15 04:28:16.485651	2018-02-15 04:28:16.485651
382	Medium	68	54	2018-02-15 04:28:16.492171	2018-02-15 04:28:16.492171
383	Medium	68	62	2018-02-15 04:28:16.519713	2018-02-15 04:28:16.519713
384	Medium	68	14	2018-02-15 04:28:16.528491	2018-02-15 04:28:16.528491
385	Medium	66	54	2018-02-15 04:28:16.552203	2018-02-15 04:28:16.552203
386	Medium	66	20	2018-02-15 04:28:16.5608	2018-02-15 04:28:16.5608
387	Medium	66	56	2018-02-15 04:28:16.569427	2018-02-15 04:28:16.569427
388	Medium	66	41	2018-02-15 04:28:16.578273	2018-02-15 04:28:16.578273
389	Medium	66	32	2018-02-15 04:28:16.586904	2018-02-15 04:28:16.586904
390	Medium	66	12	2018-02-15 04:28:16.5955	2018-02-15 04:28:16.5955
391	Medium	66	59	2018-02-15 04:28:16.604138	2018-02-15 04:28:16.604138
392	Medium	66	70	2018-02-15 04:28:16.612572	2018-02-15 04:28:16.612572
393	Post	222	1	2018-02-15 04:56:58.514681	2018-02-15 04:56:58.514681
\.


--
-- Data for Name: media; Type: TABLE DATA; Schema: public; Owner: jacklee
--

COPY media (id, title, description, user_id, attachment_file_id, attachment_file_filename, attachment_file_content_type, attachment_file_size, created_at, updated_at, is_video, is_image, is_audio, post_id) FROM stdin;
10	Dolor dolor voluptates		3	1d3209a6dac6367dc8e718cb1d63efae608e8b41d730f9faf2814f838a74	doge.jpg	image/jpeg	69666	2018-01-30 08:03:23.811589	2018-02-09 07:04:48.456361	f	t	f	\N
3	Totam doloremque quia sed do facilis consequuntur sapiente quis et pariatur sequi blanditiis	Modi ducimus quae officia voluptatem dolores et pariatur Ea ullam consequatur Commodo recusandae Amet dignissimos quam voluptates ut amet	1	548433736ddccfb7ecd61574cd2896529d7643276c5733fd5250cebc5cb3	lose_audio_alt.mp3	audio/mp3	135735	2018-01-19 08:13:48.796707	2018-01-19 08:13:48.796707	f	f	t	\N
1	Relaxing on the water like 💁🏽‍♂️	Sequi est consectetur totam aspernatur dolor molestiae odit neque qui ad nobis tempor	1	88f56ef56575e5a53825fc595b8bf7155efe5aa148dc1f48200bcab0e622	Amalfi.mp4	video/mp4	11080508	2018-01-19 07:36:22.066373	2018-01-19 07:36:22.066373	t	f	f	\N
2	Doge	the most amazing dog in the world!	1	b55a4ddf35cece25062a76c04d85d04ea0bebb4b3cd35f815738e9f34293	doge.jpg	image/jpeg	69666	2018-01-19 08:01:31.931777	2018-01-19 08:01:31.931777	f	t	f	\N
4	Doge 2	Aliqua Ea illum libero ut dolorem qui dolor iste eligendi dolorem	1	3ebddd2314963b64ba4e60bbd2054c6ff1447e6a8321272ddd81794edf4b	doge3.jpg	image/jpeg	20011	2018-01-19 08:18:19.28075	2018-01-19 08:18:19.28075	f	t	f	\N
9	Molestiae consequatur sint voluptatem ea		3	4d6585548ffab9457375a8cbe96c2f113211c75b07b9073d3ee1661c0bbc	pokemon.jpg	image/jpeg	193904	2018-01-30 07:25:52.854809	2018-01-30 07:25:52.854809	f	t	f	\N
65	Percentage of health problems in information technology employees	Around 56% had musculoskeletal symptoms. 22% had newly diagnosed hypertension, 10% had diabetes, 36% had dyslipidemia, 54% had depression, anxiety and insomnia, 40% had obesity. Musculoskeletal symptoms included cervical and lumbar strain with or without disc disease, polyarthralgia, and muscle spasm and heel pain.	1	c2592bfee3d8fe525d876e1ba286b10ea039f1342b2abcf549e876eb4c37	image-healthproblemsinit.jpg	image/jpeg	23308	2018-02-13 23:44:01.026984	2018-02-15 05:45:22.032569	f	t	f	222
67	Diet changes and food swaps figure 2		3	fe0a18ef5da5c1bf0fcb04edc16ca75a64dc4265b396c03f79d060c6908b	image-diabetes-eatwell2.png	image/png	25689	2018-02-15 01:31:27.536691	2018-02-15 01:41:18.598738	f	t	f	224
58	Subtle ecg changes not to miss in the emergency department	so proud	6	5e91404c50e10c1db0ba9f1adac2d5fe6256c843cbb456a1c71992ac8fae	doge.jpg	image/jpeg	69666	2018-02-04 17:31:18.692311	2018-02-15 05:25:01.160868	f	t	f	\N
11	Qui repellendus eaque ducimus ipsum omnis dolorem voluptatem repellendus quo eiusmod sit nisi omnis		3	980ad12d4b59c5f21db6d3964f7cf702a523a2d4ba4d2e4ac72dc3194ba1	pokemon.jpg	image/jpeg	193904	2018-01-30 08:13:46.265324	2018-02-09 07:04:48.472976	f	t	f	10
44	Attached media on post #1		3	151d4c84b13c6dd214b7e07ca334ffcc5d55f074ccd70c822a403883fab9	doge.jpg	image/jpeg	69666	2018-01-30 17:19:00.498657	2018-02-09 07:04:48.482788	f	t	f	43
51	Mollit quia perspiciatis a ut sequi exercitation voluptate libero ut vel aut corrupti aut beatae adipisci officia		3	49ca31620b4d899b9dee38a04f22b121cb74920876038b0b62521cae0dd9	doge3.jpg	image/jpeg	20011	2018-01-30 17:59:46.197495	2018-02-09 07:04:48.495254	f	t	f	49
46	Pokemon		3	2320862f357b645fdfa5d7c200ec0c84e7349a319fcce66ed50f91d160f3	pokemon.jpg	image/jpeg	193904	2018-01-30 17:35:56.052588	2018-02-09 07:04:48.509721	f	t	f	45
57	Success kid		6	4bffe157831f304301ba343e248595d9126040169a4a2df41245efe3cdb6	success-56a9fd1f3df78cf772abee09.jpg	image/jpeg	43582	2018-02-04 08:33:08.161489	2018-02-04 19:29:02.242124	f	t	f	60
60	Error minim dolor veniam aliquip quis in voluptas tempore minima dolores duis magna ipsum esse	Soluta odio consequatur animi laboriosam esse ratione molestiae	2	d5eeb78ddfc712ee5db4a22e3219a06372123cabf2de135148ca79812587	success-56a9fd1f3df78cf772abee09.jpg	image/jpeg	43582	2018-02-08 01:10:35.641474	2018-02-08 01:10:56.037342	f	t	f	\N
52	Eiusmod hic aliquam aute nulla in		3	c19fea2f69f7a012cd0f56d50cc1ca7796c597076498e5ee8e8ca87c3329	pokemon.jpg	image/jpeg	193904	2018-01-30 18:06:15.516021	2018-02-09 07:04:48.524237	f	t	f	49
49	Doge		3	eaccfedc46c49f114d4e910d9dab0342a96668b99382b076f8153ebd3c61	doge.jpg	image/jpeg	69666	2018-01-30 17:54:13.783861	2018-02-09 07:04:48.53403	f	t	f	48
62	How to use metered-dose-inhalers (mdi)		2	adf6ad5e08b0d494bfe0ba3e03a64df982277726ee57a062042d920ef518	video - how to use MDI.mp4	video/mp4	5543436	2018-02-13 22:32:48.560331	2018-02-13 23:01:31.594996	t	f	f	221
64	How to use an inhaler	Utah Department Health Asthma Program on how to properly use an asthma inhaler.\r\n\r\nhttp://health.utah.gov/asthma/	3	46c182534388cc579fd28fbd5a0045005248631870d00f9467903d751590	video - how to use an inhaler.mp4	video/mp4	5173687	2018-02-13 23:33:32.578625	2018-02-13 23:33:32.578625	t	f	f	\N
53	Follow-up rate of patients diagnosed with major depressive episode	Poor follow-up rate. Worse in men compared to women.	7	80b9c18a08d24a137ec9f3bc3c85111a77965884a88a91008b6523f5aad1	doge.jpg	image/jpeg	69666	2018-02-03 01:29:29.813123	2018-02-15 04:35:15.23998	f	t	f	47
68	How to self-inject with insulin using novopen	This is the official Quick Guide from Novo Nordisk on how to give insulin injections using NovoPen®	3	e328c047aacbffe1e5a7579abc060c190837585f90b2b7f13eff0ecfad62	video - insulin novopen instruction.mp4	video/mp4	17961906	2018-02-15 01:48:40.994636	2018-02-15 02:08:05.255682	t	f	f	59
66	Diet changes and food swaps figure 1		3	9d0af772506e7bf1e98a38ef9701c3e6c15d6763dec3b132ba61aba3188d	image-diabeteseatwell1.png	image/png	27064	2018-02-15 01:31:27.475686	2018-02-15 01:41:18.595991	f	t	f	224
5	Gluten intolerance vs. true celiac - keys to the right diagnosis	Celiac disease (CD), non-celiac gluten sensitivity (NCGS) and wheat allergy are all conditions whose primary treatment is avoidance of specific dietary components. Celiac disease and non-celiac gluten sensitivity have many symptoms in common, whereas those of wheat allergy are usually distinct. Possible  symptoms of CD and NCGS include gastrointestinal symptoms such as cramping, diarrhea and constipation, as well as symptoms in other parts of the body such as bone or joint pain, headaches, or fatigue, to name a few. Symptoms of an allergy to wheat can include itching, hives, or anaphylaxis, a life-threatening reaction. Treatment for CD and NCGS is to remove gluten from the diet. Gluten is a protein naturally found in wheat, rye and barley, as well as in hybrids and products made from these grains. Treatment for wheat allergy is removal of all forms of wheat from the diet. People with CD, NCGS, or wheat allergy are fortunate because they don’t need complicated medical treatments to get well, but they must avoid the food or foods that are problematic. Let’s take a closer look at each of these types of reactions to food.\r\n\r\nCeliac disease (CD) is a genetic, autoimmune disorder that occurs in reaction to the ingestion of gluten. To develop celiac disease a person must inherit the genetic predisposition, be consuming gluten, and have the disease activated. Activation triggers may include stress, trauma (surgeries, etc.) and possibly viral infections. The reaction to gluten causes villous atrophy or flattening of the cells lining the small intestine, which can lead to malabsorption of nutrients and related health issues.  There are over 200 identified symptoms of CD, which  include those listed above as well as anemia, behavioral changes, stunted growth and infertility. Dermatitis herpetiformis is celiac disease that manifests as a skin rash. The rate of CD is higher among relatives of those who are diagnosed, but anyone with the genetic predisposition can develop celiac disease at any age. Currently it is estimated that about 1% of the population has celiac disease, although 83% of those people are still undiagnosed. While research continues to work towards pharmaceutical or other treatments, at this time the only treatment for celiac disease is to maintain a gluten-free diet for life.\r\n\r\nNon-Celiac Gluten Sensitivity (NCGS), also referred to as gluten sensitivity (GS) or non-celiac wheat sensitivity (NCWS), is not well defined. It is not an immunoglobulin E (IgE) (as with wheat allergy, see below) nor autoimmune reaction (as with CD, see above). NCGS may have an innate immune component, but this has not been firmly established. There are no tests or biomarkers to identify NCGS. Since NCGS is not well understood it is still not clear whether other components of gluten-containing grains may be involved in causing symptoms, at least in some cases. In order for gluten sensitivity to be diagnosed, it is first necessary to rule out CD, wheat allergy or other possible causes of symptoms. Then, if improvement is seen when following a gluten-free diet, gluten sensitivity may be diagnosed. Adherence to a gluten-free diet is the only treatment for NCGS at this time.\r\n\r\nWheat allergy is an immune reaction to any of the hundreds of proteins in wheat. When a person has a wheat allergy, one type of white blood cells, called B-cells, send out immunoglobulin E (IgE) antibodies to “attack” the wheat. At the same time, local tissues in the body send out natural chemical messengers to alert the rest of the body that there is a problem. This reaction happens very fast (within minutes to a few hours) and can involve a range of symptoms from nausea, abdominal pain, itching, swelling of the lips and tongue, to trouble breathing, or anaphylaxis (a life-threatening reaction). A person with a wheat allergy must avoid eating any form of wheat, but does not have trouble tolerating gluten from non-wheat sources. (It is possible for a person to be both allergic to wheat and have CD or NCGS.) In the United States, wheat is one of the eight most common foods to which people are allergic. Children who are allergic to wheat may out-grow the allergy, but adults with an allergy to wheat usually have it for life. The only treatment is a wheat-free diet. 	1	9094d31bcbfbd1c9806030d3d14239d82086da72d64dfff6efbca973740d	doge3.jpg	image/jpeg	20011	2018-01-22 19:13:40.028691	2018-02-15 04:43:07.097498	f	t	f	\N
8	Aha guideline on first-line antihypertensives	Esse do dolor voluptatem quam accusamus consequatur consequatur omnis proident architecto repudiandae consequatur quis unde veniam est nisi consequatur	7	4aca0f4f553c69ab40bf8cfa33b0fa1206ae372d340539ea2e59c64f953c	pokemon.jpg	image/jpeg	193904	2018-01-25 00:53:16.589037	2018-02-15 20:01:18.58439	f	t	f	\N
69	Facts about non-celiac gluten-sensitivity		1	b508fbecd169a9a850289a6f07195b6a52a29a2c8d791ad37446b0936c80	image-non-celiac-gluten-sensitivity.jpg	image/jpeg	114225	2018-02-15 04:49:25.238377	2018-02-15 04:53:56.199131	f	t	f	225
7	Diagnostic approach to gastroenteritis	Quas ipsum nulla quis est	7	f54bb160d0d0b07eadbfc450e98d43c4978c6d8d86e0fd48ab65eaa95b51	doge.jpg	image/jpeg	69666	2018-01-24 20:39:53.520867	2018-02-15 20:02:11.762032	f	t	f	\N
59	The key to happiness: ristretto stock video		6	0f6e812a18a89bd6730ec6374183bc9e9fc83cf521d7b50c9f2e8351c579	Ristretto.mp4	video/mp4	5635133	2018-02-04 17:34:31.001678	2018-02-15 20:41:03.696327	t	f	f	211
70	Non-celiac gluten sensitivity and ibs symptoms comparison		1	74ba0654e20bb2b1f25566de27b2ebc897a05ea0ea3accd57795d7e61496	non-celiac-gluten-sensitivity-vs-ibs.png	image/png	49870	2018-02-15 04:49:25.258371	2018-02-15 04:53:56.204283	f	t	f	225
71	Common mistakes in self-administration of inhalers		6	58ef4e7d0ba93cefd8579990734478db44ac59549eb2fcd9562a5113afef	video - inhalers biggest mistakes.mp4	video/mp4	12417246	2018-02-15 20:33:36.642787	2018-02-15 20:35:35.672233	t	f	f	226
72	Summary - fixes for ten most-common inhaler-use mistakes		6	1736102f3dfd9e5129ff81c1f39267df23feb9d313d6f8a70c7b92e71c23	image-inhaler-mistakes.jpg	image/jpeg	1690068	2018-02-15 20:33:36.713944	2018-02-15 20:35:35.678924	f	t	f	226
73	Mean percentage symptom reduction from un-blinded and blinded treatment arms from published depression trials compared to data from pivotal registration depression trials as reported by the fda.		7	3a563c3ac2b121757c40681fe487e81d0cf1d2c508a5e341976105b4b724	image-depression-trials.jpg	image/jpeg	66290	2018-02-16 00:02:01.379358	2018-02-16 03:22:22.256991	f	t	f	227
\.


--
-- Data for Name: posts; Type: TABLE DATA; Schema: public; Owner: jacklee
--

COPY posts (id, title, body, published, created_at, updated_at, user_id) FROM stdin;
48	dsagadgadsg	<p>asdgadgadgasg</p>\r\n	f	2018-01-30 17:54:13.780324	2018-01-30 17:54:13.780324	3
1	Fuga Ut nisi atque voluptates sed perspiciatis non velit minim quo sed blanditiis quis dolor sequi accusantium	<p>Sed nostrud recusandae Asperiores fugit consequuntur officia eius lorem ut quaerat officia exercitationem tempore eligendi dolore ex est</p>\r\n	t	2018-01-19 07:26:37.485246	2018-01-22 20:34:40.072164	1
2	Impedit aliquam quisquam deserunt est	<h2><span style="color:#e74c3c"><span style="font-family:Georgia,serif">Minim maxime inventore consequatur Quo officia exercitationem sed eius eum laborum est dicta nemo</span></span></h2>\r\n\r\n<p><span style="color:#2980b9">Eiusmod fugit</span> mollit distinctio Consequat Dolorum harum minus omnis</p>\r\n	t	2018-01-19 07:27:19.803125	2018-01-23 00:58:36.133189	1
4	My fourth Post	<p>Please comment and provide feedback</p>\r\n	f	2018-01-23 02:40:19.205779	2018-01-23 02:41:41.445714	1
3	Ut rerum vel exercitationem	<h1><span style="color:#d35400">Ut rerum vel exercitationem quidem cupiditate corporis praesentium deserunt dolor minim dicta sit eos omnis consequat. Velit officiis.</span></h1>\r\n\r\n<p>dasgasdgsa</p>\r\n\r\n<p><span style="color:#d35400"><img alt="" src="http://localhost:3000/attachments/de130489e675732b9b14e2a4b9481c249504c60f/store/b55a4ddf35cece25062a76c04d85d04ea0bebb4b3cd35f815738e9f34293/doge.jpg" /></span></p>\r\n	t	2018-01-23 01:29:35.519002	2018-01-23 19:55:18.195035	1
49	Explicabo Libero in eius incidunt	<p>sdagadgdagdgdasgadg</p>\r\n	t	2018-01-30 17:59:46.181643	2018-01-30 18:06:15.478286	3
50	Rerum officiis eaque rerum qui earum aspernatur enim	<p>dsagadsgdagdasgsg</p>\r\n	f	2018-01-31 00:46:17.714539	2018-01-31 00:46:17.714539	3
51	jgglgjklhkhk	<p>kjgljgljgkgklj</p>\r\n	f	2018-01-31 01:19:11.378611	2018-01-31 01:19:11.378611	3
47	Doloremque saepe eum incidunt est qui irure velit deserunt officia maiores quaerat	<h2>Sadgad gadgdaghkj</h2>\r\n\r\n<p>dasgalsgasg</p>\r\n\r\n<p>asgadgadfgf</p>\r\n\r\n<ul>\r\n\t<li>adasgadg</li>\r\n\t<li>asdgadd</li>\r\n</ul>\r\n\r\n<h2>kdkf ddsd gd dgagl hsadg</h2>\r\n\r\n<p>dagsdd sagdaggda</p>\r\n\r\n<p>dasgad sgdasg</p>\r\n\r\n<ol>\r\n\t<li>dudx dos eio d hz zxc vh dasgd</li>\r\n\t<li>dasgdgff dsfdsgd dgergvfdcxvfht</li>\r\n</ol>\r\n	f	2018-01-30 17:52:56.604405	2018-02-03 06:35:25.792395	3
52	Comparison of short-acting and intermediate-acting insulin formulations	<p>adsgdagdafgfdagdagdaggda</p>\r\n	f	2018-02-01 01:23:20.009341	2018-02-15 04:05:46.713623	3
53	Comparison of NOACs	<p><strong>Rivaroxaban</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Dabigatran</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Apixaban</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Warfarin</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n	t	2018-02-01 01:54:30.351935	2018-02-01 03:39:06.913464	3
54	Corrupti non dolor rerum nemo provident tenetur esse delectus qui esse vitae dolore tempore	<p>asdfasfdsaf</p>\r\n	f	2018-02-01 04:09:50.862927	2018-02-01 04:09:50.862927	3
60	Pour-over put a bird on it scenester ethical meditation.	<p>Cliche ugh stumptown kinfolk. Taxidermy bushwick mlkshk tofu locavore freegan shabby chic. Art party humblebrag fanny pack next level williamsburg.</p>\r\n	t	2018-02-03 05:03:24.453486	2018-02-04 07:28:44.440086	6
55	Listicle wes anderson blog migas.	Flexitarian sustainable vinyl diy salvia disrupt. Tattooed pbr&b bespoke. Beard seitan flannel wes anderson umami keytar. Five dollar toast offal humblebrag selfies bitters hashtag. Direct trade five dollar toast street aesthetic umami. Vhs semiotics yolo fashion axe.	t	2018-02-03 05:03:24.373358	2018-02-03 05:03:24.373358	1
56	Iphone everyday church-key kogi.	Mlkshk portland ennui sartorial organic put a bird on it kitsch. Typewriter cardigan flannel put a bird on it raw denim pop-up. Semiotics pop-up street beard scenester meh narwhal. Vegan plaid readymade tilde.	t	2018-02-03 05:03:24.430466	2018-02-03 05:03:24.430466	1
57	Austin pop-up +1 keytar neutra banjo.	Schlitz put a bird on it forage. Keffiyeh pinterest wayfarers asymmetrical roof actually.	t	2018-02-03 05:03:24.436078	2018-02-03 05:03:24.436078	1
58	Pop-up seitan before they sold out helvetica bitters.	Iphone authentic fingerstache scenester vinyl portland. You probably haven't heard of them chambray green juice mumblecore art party kale chips tattooed. Jean shorts hammock cardigan goth flannel.	t	2018-02-03 05:03:24.441651	2018-02-03 05:03:24.441651	2
61	90's park normcore.	You probably haven't heard of them tofu ennui hoodie kickstarter mixtape. You probably haven't heard of them yuccie kogi pour-over 90's kombucha chambray. Cold-pressed scenester pour-over synth twee. Ramps fingerstache flexitarian swag kogi small batch. Keffiyeh godard blog distillery authentic master 3 wolf moon pabst. Meh forage kinfolk shoreditch helvetica.	t	2018-02-03 05:03:24.459611	2018-02-03 05:03:24.459611	6
46	Amet sed quis laborum expedita dolores	<p>asdgasdg;hadsglkaghdas</p>\r\n\r\n<p>asdglkadhgkadghad</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>asdlghadklgasd</p>\r\n	t	2018-01-30 17:48:19.075937	2018-01-30 17:48:19.075937	\N
5	Commodi voluptates ut sit dolore	<h2><span style="color:#2980b9">Commodi voluptates ut sit dolore.</span></h2>\r\n\r\n<p>Consequuntur voluptas qui laboriosam dolorum qui et consectetur quaerat nostrud et id corporis numquam.</p>\r\n\r\n<p>Illo ullam dolore exercitationem at commodo corrupti sit ad rem quae enim.</p>\r\n	t	2018-01-23 19:53:50.398644	2018-01-23 19:53:50.398644	\N
8	Dignissimos aspernatur omnis velit sit est eveniet iste dolore facere quia molestiae enim	<p>Voluptas amet optio quod aut rerum iste quis molestias delectus distinctio Aliquam sit consectetur numquam anim debitis excepteur at incidunt</p>\r\n	t	2018-01-30 08:01:09.545818	2018-01-30 08:01:09.545818	\N
65	Forage sustainable tattooed everyday franzen gastropub.	Truffaut pinterest banh mi cray. Brunch readymade park literally craft beer.	t	2018-02-03 05:03:24.486179	2018-02-03 05:03:24.486179	23
66	Skateboard intelligentsia 90's.	Single-origin coffee phlogiston diy brunch. Vinyl iphone poutine yr helvetica. Viral pork belly try-hard 8-bit listicle. Food truck tilde readymade umami bicycle rights artisan cred ennui.	t	2018-02-03 05:03:24.492276	2018-02-03 05:03:24.492276	23
67	Kitsch muggle magic jean shorts.	Venmo brunch listicle goth dreamcatcher. Salvia flexitarian pabst readymade leggings. Salvia austin occupy sustainable. Biodiesel small batch try-hard chambray locavore sartorial godard. Kombucha pour-over narwhal flexitarian slow-carb wayfarers. Hella sartorial meditation cold-pressed 8-bit skateboard butcher.	t	2018-02-03 05:03:24.497728	2018-02-03 05:03:24.497728	23
68	Pork belly williamsburg diy.	Butcher disrupt humblebrag artisan slow-carb try-hard. Offal tousled distillery. Truffaut umami messenger bag shabby chic marfa flannel.	t	2018-02-03 05:03:24.503441	2018-02-03 05:03:24.503441	24
69	Raw denim cleanse vinyl flexitarian tote bag.	Occupy vinyl pinterest pour-over pbr&b. Hoodie freegan selfies schlitz venmo 90's umami. Vice everyday disrupt cardigan park. Mumblecore hammock you probably haven't heard of them lo-fi kogi.	t	2018-02-03 05:03:24.508491	2018-02-03 05:03:24.508491	24
70	Hammock letterpress tattooed pabst.	Shoreditch godard bushwick mixtape before they sold out retro pug. Vice cold-pressed kitsch distillery 90's tacos.	t	2018-02-03 05:03:24.513751	2018-02-03 05:03:24.513751	25
71	Cardigan chartreuse single-origin coffee intelligentsia.	Vegan pitchfork keytar meggings tattooed. Vegan bespoke salvia pickled keffiyeh forage.	t	2018-02-03 05:03:24.517904	2018-02-03 05:03:24.517904	25
72	Biodiesel craft beer poutine iphone pour-over jean shorts.	Xoxo kickstarter master sustainable meditation disrupt. Bespoke cray 90's. Franzen jean shorts yr vinyl cliche cronut gastropub chambray. Chillwave bitters pinterest kinfolk meh marfa flexitarian ramps.	t	2018-02-03 05:03:24.523185	2018-02-03 05:03:24.523185	26
73	Selvage literally 8-bit.	Kitsch tofu venmo. Artisan cold-pressed brunch listicle. Cred tumblr bitters pour-over letterpress yuccie whatever. 90's sartorial flexitarian selvage waistcoat bespoke banh mi twee. Gluten-free hashtag banh mi pop-up tote bag.	t	2018-02-03 05:03:24.528274	2018-02-03 05:03:24.528274	26
74	Wolf +1 tattooed brooklyn shoreditch.	Humblebrag retro wes anderson semiotics put a bird on it salvia cardigan mumblecore. Occupy art party ramps.	t	2018-02-03 05:03:24.533343	2018-02-03 05:03:24.533343	26
75	Ethical pop-up tumblr meh typewriter.	Normcore locavore farm-to-table seitan chambray pork belly tacos health. Letterpress kickstarter art party helvetica jean shorts everyday cardigan.	t	2018-02-03 05:03:24.538576	2018-02-03 05:03:24.538576	8
76	Kale chips swag gluten-free seitan vhs.	Banh mi single-origin coffee ethical chia wes anderson freegan. Wes anderson portland chicharrones pug. Lo-fi hoodie salvia butcher.	t	2018-02-03 05:03:24.543766	2018-02-03 05:03:24.543766	10
77	Lo-fi waistcoat tumblr.	Meditation photo booth fingerstache messenger bag chia artisan. Park lo-fi flannel typewriter crucifix.	t	2018-02-03 05:03:24.549068	2018-02-03 05:03:24.549068	10
78	Cliche before they sold out chartreuse.	Twee diy cray. Butcher bushwick beard selfies.	t	2018-02-03 05:03:24.55443	2018-02-03 05:03:24.55443	10
79	Quinoa tousled chia cardigan.	Try-hard selfies semiotics. Butcher offal chillwave. Chicharrones meditation single-origin coffee. Photo booth swag synth diy meggings. Gentrify selvage quinoa scenester. Schlitz chillwave loko forage.	t	2018-02-03 05:03:24.559632	2018-02-03 05:03:24.559632	11
80	Stumptown craft beer goth.	Pabst bitters yuccie tote bag poutine narwhal. Biodiesel freegan umami. Asymmetrical sriracha organic wayfarers microdosing pinterest.	t	2018-02-03 05:03:24.565165	2018-02-03 05:03:24.565165	11
81	Dreamcatcher hella 8-bit poutine.	Tousled artisan cold-pressed you probably haven't heard of them tacos umami. Five dollar toast umami try-hard mlkshk cleanse knausgaard fixie ramps. Carry aesthetic vinegar chicharrones quinoa. Squid kogi mixtape vegan neutra.	t	2018-02-03 05:03:24.570667	2018-02-03 05:03:24.570667	11
82	Waistcoat kickstarter pabst tacos farm-to-table.	Occupy flexitarian gentrify fashion axe chambray letterpress. Mumblecore put a bird on it leggings kinfolk flexitarian. Salvia actually stumptown. Jean shorts paleo banh mi beard synth park microdosing keytar.	t	2018-02-03 05:03:24.575804	2018-02-03 05:03:24.575804	12
83	Dreamcatcher craft beer tofu ethical letterpress.	Tote bag williamsburg 3 wolf moon. Polaroid cronut small batch.	t	2018-02-03 05:03:24.581232	2018-02-03 05:03:24.581232	12
84	Bespoke messenger bag +1.	Williamsburg cornhole banh mi raw denim kombucha. Biodiesel drinking yolo.	t	2018-02-03 05:03:24.584768	2018-02-03 05:03:24.584768	12
85	Neutra kitsch meh pitchfork pour-over irony.	Heirloom umami ethical forage hashtag authentic semiotics dreamcatcher. Chambray mlkshk five dollar toast typewriter. Thundercats art party listicle tumblr pinterest taxidermy pickled waistcoat. Occupy art party roof shabby chic brunch polaroid yr letterpress.	t	2018-02-03 05:03:24.59156	2018-02-03 05:03:24.59156	13
86	Synth tilde semiotics umami.	Venmo authentic retro waistcoat narwhal squid butcher truffaut. Shoreditch asymmetrical farm-to-table. Quinoa artisan helvetica retro cronut schlitz yuccie typewriter.	t	2018-02-03 05:03:24.598307	2018-02-03 05:03:24.598307	14
87	Tote bag taxidermy meditation typewriter leggings 90's.	Pug messenger bag kogi chia synth kinfolk ennui meh. Disrupt master freegan humblebrag. Heirloom chia hoodie microdosing 8-bit fanny pack. Diy crucifix squid. Truffaut salvia fingerstache schlitz.	t	2018-02-03 05:03:24.605671	2018-02-03 05:03:24.605671	15
88	Put a bird on it butcher messenger bag you probably haven't heard of them schlitz master.	Vice street selvage kinfolk iphone. Green juice bitters marfa sartorial chicharrones freegan. Messenger bag carry deep v asymmetrical tattooed single-origin coffee banjo gastropub.	t	2018-02-03 05:03:24.613938	2018-02-03 05:03:24.613938	15
89	Diy goth brunch salvia.	Occupy banjo +1. Carry try-hard fixie skateboard bicycle rights pork belly.	t	2018-02-03 05:03:24.621038	2018-02-03 05:03:24.621038	27
90	Green juice offal pug jean shorts paleo.	Semiotics bicycle rights kale chips ramps crucifix. 3 wolf moon art party occupy whatever pickled flexitarian put a bird on it.	t	2018-02-03 05:03:24.627714	2018-02-03 05:03:24.627714	28
91	Craft beer chia before they sold out phlogiston.	Green juice fixie cornhole asymmetrical. Plaid hammock lo-fi sriracha.	t	2018-02-03 05:03:24.634857	2018-02-03 05:03:24.634857	28
92	Forage cardigan gentrify umami williamsburg viral.	Normcore lumbersexual street microdosing. Poutine retro vhs. Offal ennui xoxo next level leggings meh neutra. Before they sold out try-hard bushwick crucifix wolf paleo distillery keffiyeh.	t	2018-02-03 05:03:24.642193	2018-02-03 05:03:24.642193	17
93	Stumptown blue bottle jean shorts.	Pickled wayfarers meditation cold-pressed +1 quinoa. Vinegar blog humblebrag keffiyeh. Scenester drinking small batch cleanse intelligentsia post-ironic goth. Viral franzen brunch dreamcatcher meditation truffaut whatever cred. Retro yolo blog flexitarian. Tacos microdosing fashion axe park.	t	2018-02-03 05:03:24.649594	2018-02-03 05:03:24.649594	17
94	Neutra quinoa art party bitters pbr&b scenester.	Bicycle rights tilde meh viral post-ironic plaid. Gluten-free post-ironic iphone pork belly pop-up bespoke banjo microdosing. Cred readymade tote bag taxidermy flannel etsy. Art party ennui kickstarter cliche lo-fi selfies disrupt meditation. Selfies flexitarian cronut farm-to-table wolf.	t	2018-02-03 05:03:24.656663	2018-02-03 05:03:24.656663	18
95	Offal plaid ennui cold-pressed.	Leggings biodiesel vice tote bag goth pabst artisan. Bicycle rights tattooed carry lumbersexual kombucha. Master cleanse wolf keffiyeh everyday dreamcatcher small batch try-hard. Thundercats chartreuse meditation pabst tilde. Food truck cornhole keytar pour-over.	t	2018-02-03 05:03:24.66415	2018-02-03 05:03:24.66415	19
96	Slow-carb asymmetrical scenester.	3 wolf moon cardigan yr lumbersexual pitchfork. Pitchfork bushwick before they sold out kickstarter knausgaard. Crucifix flannel cold-pressed.	t	2018-02-03 05:03:24.671425	2018-02-03 05:03:24.671425	19
97	Small batch fanny pack pork belly disrupt.	Hella deep v squid before they sold out cleanse. Slow-carb scenester polaroid tattooed keffiyeh carry taxidermy. Crucifix artisan organic banh mi wayfarers. Master +1 gastropub kitsch before they sold out blue bottle. Gluten-free butcher mlkshk. Beard narwhal blue bottle williamsburg.	t	2018-02-03 05:03:24.678719	2018-02-03 05:03:24.678719	20
98	Bushwick xoxo jean shorts artisan waistcoat.	Bespoke you probably haven't heard of them yr jean shorts meggings. Pitchfork seitan venmo shabby chic ethical. Quinoa loko yr raw denim kickstarter taxidermy banjo. Whatever photo booth wolf roof hella flexitarian slow-carb.	t	2018-02-03 05:03:24.68499	2018-02-03 05:03:24.68499	21
99	Viral single-origin coffee keffiyeh.	Post-ironic gentrify pitchfork neutra godard yolo offal jean shorts. Vinegar raw denim lo-fi. Biodiesel meditation organic helvetica godard pop-up chartreuse beard. Small batch truffaut single-origin coffee butcher put a bird on it tofu occupy. Kinfolk meditation blog drinking. Art party xoxo chia meditation letterpress.	t	2018-02-03 05:03:24.69241	2018-02-03 05:03:24.69241	21
100	Post-ironic muggle magic fashion axe art party fingerstache.	Bitters health authentic food truck. Fixie umami authentic leggings. Mustache swag intelligentsia blue bottle pabst echo. +1 park humblebrag.	t	2018-02-03 05:03:24.699406	2018-02-03 05:03:24.699406	21
101	Beard paleo bicycle rights.	Venmo paleo next level kale chips asymmetrical distillery blog seitan. Carry authentic beard whatever vinyl.	t	2018-02-03 05:03:24.707002	2018-02-03 05:03:24.707002	22
102	Vhs intelligentsia meggings.	Franzen mixtape cold-pressed marfa quinoa tattooed. Small batch park shoreditch seitan before they sold out vinyl photo booth. Intelligentsia normcore vhs. Cornhole pork belly godard wayfarers green juice. Deep v mustache readymade hammock selfies.	t	2018-02-03 05:03:24.714011	2018-02-03 05:03:24.714011	22
103	Goth twee paleo blog semiotics bespoke.	Ethical keffiyeh brunch. Pinterest carry truffaut art party heirloom aesthetic shoreditch. Xoxo occupy hoodie carry try-hard ennui. Roof scenester cronut vice pitchfork single-origin coffee. Food truck yr health echo post-ironic.	t	2018-02-03 05:03:24.721493	2018-02-03 05:03:24.721493	36
104	Cray ugh church-key crucifix.	8-bit celiac brunch godard church-key gentrify cornhole. 90's keytar pork belly put a bird on it biodiesel yolo chambray wes anderson. Gastropub quinoa cold-pressed chillwave bushwick cronut.	t	2018-02-03 05:03:24.728275	2018-02-03 05:03:24.728275	36
105	3 wolf moon humblebrag try-hard.	Pitchfork heirloom diy small batch. Health pug freegan drinking master. Ramps bushwick offal meditation.	t	2018-02-03 05:03:24.735431	2018-02-03 05:03:24.735431	36
106	Mixtape listicle viral.	Loko quinoa venmo. Chartreuse godard fingerstache distillery street gastropub hella plaid. Franzen fixie leggings dreamcatcher.	t	2018-02-03 05:03:24.742343	2018-02-03 05:03:24.742343	37
107	Try-hard kickstarter freegan.	Letterpress muggle magic loko lomo listicle polaroid swag five dollar toast. Master ennui phlogiston portland chicharrones yr mixtape. Wayfarers freegan lumbersexual.	t	2018-02-03 05:03:24.749107	2018-02-03 05:03:24.749107	38
108	Meh muggle magic trust fund cornhole +1.	Health scenester tattooed swag mumblecore art party single-origin coffee. Fashion axe post-ironic park pabst cold-pressed pork belly pickled. Authentic you probably haven't heard of them ugh. Austin biodiesel five dollar toast. Cred gluten-free put a bird on it kickstarter ugh tumblr.	t	2018-02-03 05:03:24.756033	2018-02-03 05:03:24.756033	38
109	Hoodie 8-bit shoreditch cold-pressed food truck.	Fingerstache literally street artisan thundercats dreamcatcher. Trust fund crucifix chillwave scenester pickled vinyl typewriter narwhal. Polaroid slow-carb thundercats iphone art party mumblecore. Cred paleo sriracha. Shoreditch health portland kogi. Dreamcatcher tilde keffiyeh green juice vinegar.	t	2018-02-03 05:03:24.763059	2018-02-03 05:03:24.763059	38
110	Locavore polaroid occupy readymade kogi next level.	Bitters before they sold out etsy chartreuse kitsch lomo farm-to-table. Schlitz bicycle rights gluten-free tilde kogi gastropub asymmetrical. Brunch meditation pour-over quinoa brooklyn distillery.	t	2018-02-03 05:03:24.770748	2018-02-03 05:03:24.770748	40
111	Heirloom helvetica thundercats ugh.	Next level listicle cronut. Offal occupy crucifix kale chips +1 cred. Migas street vhs keytar. Tacos master salvia. Authentic tattooed sustainable vinegar skateboard selfies ethical. Chillwave crucifix pbr&b williamsburg.	t	2018-02-03 05:03:24.778135	2018-02-03 05:03:24.778135	41
112	Yolo pinterest pop-up goth sustainable disrupt.	Humblebrag umami mumblecore bushwick iphone banh mi wayfarers tote bag. Fashion axe meggings whatever seitan. Asymmetrical humblebrag etsy quinoa hammock waistcoat kickstarter. Deep v humblebrag leggings carry butcher.	t	2018-02-03 05:03:24.785321	2018-02-03 05:03:24.785321	41
113	Fixie kinfolk deep v blue bottle godard.	Literally hella twee poutine plaid. Phlogiston biodiesel lo-fi blue bottle lomo kombucha cliche crucifix.	t	2018-02-03 05:03:24.792881	2018-02-03 05:03:24.792881	42
114	Taxidermy polaroid goth schlitz locavore keytar.	Photo booth cronut direct trade keytar. Keffiyeh swag paleo. Wayfarers bicycle rights flannel kitsch hammock seitan meditation selfies.	t	2018-02-03 05:03:24.800364	2018-02-03 05:03:24.800364	42
115	Whatever gentrify wayfarers 3 wolf moon marfa helvetica.	Humblebrag umami microdosing readymade. Photo booth health mixtape cold-pressed vhs letterpress portland. Hammock post-ironic echo freegan hella yolo.	t	2018-02-03 05:03:24.807171	2018-02-03 05:03:24.807171	43
143	Muggle magic brooklyn meh kale chips.	Heirloom pug keytar chia food truck vegan health brooklyn. Mustache slow-carb 90's chicharrones lumbersexual yuccie. Organic street try-hard kale chips seitan. Asymmetrical brunch franzen mixtape vegan etsy synth waistcoat.	t	2018-02-03 05:03:25.015887	2018-02-03 05:03:25.015887	31
116	Five dollar toast biodiesel gastropub single-origin coffee.	Humblebrag tofu squid direct trade beard bicycle rights craft beer scenester. Mixtape freegan brooklyn retro kombucha flexitarian +1 next level. Salvia actually ethical pork belly vegan pinterest kombucha. Locavore microdosing iphone. Kogi marfa sriracha tumblr narwhal squid.	t	2018-02-03 05:03:24.814347	2018-02-03 05:03:24.814347	44
117	Disrupt synth carry pop-up shoreditch farm-to-table.	Sustainable listicle gluten-free tattooed bespoke ennui chia. Taxidermy aesthetic flannel neutra tofu godard. Chambray small batch pour-over brunch tilde. Sriracha readymade lumbersexual stumptown craft beer try-hard. Franzen marfa swag. Bespoke vice iphone xoxo cleanse twee bicycle rights heirloom.	t	2018-02-03 05:03:24.82166	2018-02-03 05:03:24.82166	44
118	Mumblecore flannel church-key +1.	Stumptown normcore cleanse yuccie 90's thundercats. Try-hard shabby chic five dollar toast.	t	2018-02-03 05:03:24.831108	2018-02-03 05:03:24.831108	45
119	Chambray 90's semiotics migas.	Sriracha meh banh mi vinegar slow-carb locavore try-hard. Cray banjo salvia tofu. Viral marfa portland everyday neutra. Schlitz pinterest brunch heirloom shabby chic farm-to-table forage. Stumptown xoxo disrupt gentrify carry narwhal deep v. Yr roof swag.	t	2018-02-03 05:03:24.838834	2018-02-03 05:03:24.838834	45
120	Cold-pressed xoxo retro flexitarian.	Plaid ennui leggings before they sold out. Intelligentsia goth 90's cardigan +1 organic tattooed pour-over. Normcore leggings quinoa banjo. Stumptown carry vegan everyday quinoa. Franzen 3 wolf moon blog quinoa tofu disrupt.	t	2018-02-03 05:03:24.846319	2018-02-03 05:03:24.846319	45
121	Pinterest microdosing vice chia park crucifix.	90's tousled sartorial migas. Deep v polaroid echo. Health deep v twee cornhole truffaut next level lomo. Hoodie tofu normcore park. Pop-up meh pinterest. Health wayfarers banjo five dollar toast.	t	2018-02-03 05:03:24.856208	2018-02-03 05:03:24.856208	46
122	Direct trade readymade sustainable dreamcatcher carry williamsburg.	Tattooed swag gentrify pickled lomo pbr&b hammock. Umami humblebrag leggings skateboard everyday vhs freegan bespoke. Put a bird on it whatever photo booth everyday vinyl pop-up farm-to-table locavore. Shabby chic banjo ennui selfies butcher ugh. Asymmetrical pork belly dreamcatcher 8-bit distillery green juice. Put a bird on it selvage carry.	t	2018-02-03 05:03:24.863303	2018-02-03 05:03:24.863303	47
123	Wayfarers cray viral knausgaard 8-bit yuccie.	Vhs artisan goth. Offal kogi tacos diy. Cardigan pitchfork narwhal. Messenger bag distillery master hashtag.	t	2018-02-03 05:03:24.87	2018-02-03 05:03:24.87	47
124	Flexitarian banjo gastropub gluten-free.	Lo-fi lumbersexual keytar tousled crucifix beard cardigan synth. Mixtape slow-carb paleo austin typewriter. Typewriter aesthetic ethical. Phlogiston drinking gluten-free muggle magic scenester pug organic food truck.	t	2018-02-03 05:03:24.876964	2018-02-03 05:03:24.876964	48
125	Sustainable cred bicycle rights hella.	Deep v forage kombucha flannel fanny pack chillwave poutine. Meh gluten-free poutine everyday venmo. You probably haven't heard of them 8-bit gluten-free. Iphone kickstarter drinking. Vhs kickstarter narwhal.	t	2018-02-03 05:03:24.883853	2018-02-03 05:03:24.883853	48
126	Godard seitan bespoke.	Cliche tumblr butcher keytar. Selvage tote bag fixie pabst. Fingerstache gentrify brunch tote bag keytar lo-fi. Twee park you probably haven't heard of them wayfarers forage. Fashion axe wayfarers selvage trust fund phlogiston.	t	2018-02-03 05:03:24.890924	2018-02-03 05:03:24.890924	49
127	Plaid photo booth everyday roof authentic.	Diy selfies irony art party distillery deep v. Carry banh mi pickled slow-carb you probably haven't heard of them roof drinking. Williamsburg butcher plaid knausgaard gastropub. Kickstarter everyday cred meggings.	t	2018-02-03 05:03:24.900907	2018-02-03 05:03:24.900907	50
128	Fixie occupy vhs chartreuse.	Paleo pork belly sustainable vinyl vice bespoke messenger bag. Dreamcatcher fanny pack chambray. Tacos readymade yolo.	t	2018-02-03 05:03:24.907845	2018-02-03 05:03:24.907845	50
129	Scenester sartorial dreamcatcher five dollar toast.	Slow-carb sartorial vinegar kinfolk retro. Brooklyn banjo goth pickled. Cardigan tousled bicycle rights phlogiston squid pbr&b master. Pickled typewriter shabby chic bespoke whatever. Next level bicycle rights blog sartorial swag aesthetic chicharrones. Slow-carb brunch kickstarter disrupt whatever fixie.	t	2018-02-03 05:03:24.915741	2018-02-03 05:03:24.915741	50
130	Street post-ironic yolo.	Park lo-fi cliche. Schlitz swag stumptown etsy godard.	t	2018-02-03 05:03:24.922784	2018-02-03 05:03:24.922784	51
131	Readymade whatever fixie.	Phlogiston celiac keffiyeh. Raw denim letterpress tote bag tattooed heirloom mlkshk pour-over hammock.	t	2018-02-03 05:03:24.929866	2018-02-03 05:03:24.929866	51
132	Pug gastropub ethical gentrify disrupt mixtape.	Kinfolk polaroid wolf everyday skateboard craft beer. Messenger bag pop-up migas. Forage beard wayfarers selfies sustainable kinfolk photo booth health. Raw denim carry ramps humblebrag austin viral aesthetic. Hoodie salvia normcore cold-pressed freegan pickled viral. Letterpress forage butcher.	t	2018-02-03 05:03:24.936993	2018-02-03 05:03:24.936993	51
133	Kogi forage echo blog.	Chillwave mlkshk flexitarian knausgaard. Sriracha brooklyn messenger bag celiac microdosing marfa. Butcher truffaut farm-to-table distillery +1 lumbersexual cornhole brunch.	t	2018-02-03 05:03:24.944281	2018-02-03 05:03:24.944281	52
134	Cred direct trade cronut.	Fanny pack art party keytar. Tofu kickstarter deep v cold-pressed slow-carb williamsburg single-origin coffee sriracha. Gluten-free yolo iphone messenger bag venmo literally. Phlogiston heirloom synth pop-up. Taxidermy freegan salvia. Church-key gentrify hoodie plaid typewriter retro.	t	2018-02-03 05:03:24.951498	2018-02-03 05:03:24.951498	53
135	Occupy selfies vhs celiac.	Goth 3 wolf moon master gastropub tofu. Irony mustache pbr&b xoxo loko. Muggle magic meditation tumblr diy.	t	2018-02-03 05:03:24.958795	2018-02-03 05:03:24.958795	53
136	Readymade freegan cred vice.	Tousled pbr&b raw denim blog actually microdosing 90's cleanse. Shabby chic ramps wes anderson bitters meh portland fashion axe selvage.	t	2018-02-03 05:03:24.965717	2018-02-03 05:03:24.965717	53
137	Put a bird on it try-hard bushwick thundercats poutine yuccie.	3 wolf moon venmo cold-pressed beard fixie portland synth church-key. Mumblecore green juice kinfolk.	t	2018-02-03 05:03:24.972572	2018-02-03 05:03:24.972572	54
138	Bitters ramps master.	Knausgaard twee chambray tumblr. Pour-over bitters kogi.	t	2018-02-03 05:03:24.979302	2018-02-03 05:03:24.979302	54
139	Etsy retro helvetica narwhal kombucha.	Loko heirloom williamsburg gastropub chillwave. Tumblr polaroid humblebrag helvetica.	t	2018-02-03 05:03:24.987018	2018-02-03 05:03:24.987018	54
140	Swag meditation twee tote bag forage cliche.	Disrupt hashtag truffaut. Phlogiston diy occupy cred. Squid kitsch asymmetrical. Yolo green juice shoreditch blog chartreuse.	t	2018-02-03 05:03:24.994078	2018-02-03 05:03:24.994078	30
141	Etsy retro seitan scenester you probably haven't heard of them.	Shoreditch letterpress umami selfies offal blue bottle single-origin coffee ennui. Distillery listicle viral semiotics cliche kombucha.	t	2018-02-03 05:03:25.001312	2018-02-03 05:03:25.001312	30
142	Portland ramps meditation church-key.	Green juice occupy fingerstache artisan cliche tousled street organic. Post-ironic shabby chic mustache.	t	2018-02-03 05:03:25.008172	2018-02-03 05:03:25.008172	30
144	Occupy gastropub small batch cornhole microdosing messenger bag.	Street 3 wolf moon tofu chicharrones mixtape tote bag keytar chillwave. Biodiesel yr twee +1. Trust fund paleo skateboard chia squid.	t	2018-02-03 05:03:25.022883	2018-02-03 05:03:25.022883	32
145	Ramps whatever retro helvetica vhs.	Portland intelligentsia neutra everyday sartorial disrupt scenester. Hammock tote bag muggle magic stumptown marfa. Biodiesel mumblecore ugh franzen yolo. Beard truffaut hoodie pinterest goth. Brooklyn knausgaard post-ironic. Pug next level cronut cray.	t	2018-02-03 05:03:25.030653	2018-02-03 05:03:25.030653	32
146	Direct trade pbr&b cray vhs ennui.	Bespoke chicharrones cray fashion axe. Pug wayfarers mustache carry park shoreditch pork belly thundercats.	t	2018-02-03 05:03:25.037378	2018-02-03 05:03:25.037378	32
147	Lo-fi listicle tote bag venmo.	Vinyl meh tote bag street pickled. Jean shorts echo cronut ethical kitsch fingerstache street wayfarers. Cornhole scenester wolf ramps brooklyn church-key knausgaard. Gentrify taxidermy waistcoat loko five dollar toast celiac. Lumbersexual church-key ethical marfa venmo locavore banjo. Vinegar mumblecore flexitarian.	t	2018-02-03 05:03:25.044455	2018-02-03 05:03:25.044455	33
148	Godard green juice selfies.	Schlitz whatever plaid. Post-ironic selvage selfies health retro narwhal godard. Art party pinterest meditation lo-fi five dollar toast.	t	2018-02-03 05:03:25.052226	2018-02-03 05:03:25.052226	33
149	Organic swag austin.	Synth craft beer sriracha humblebrag venmo chillwave chicharrones. Plaid cliche master pickled crucifix selfies. Pickled pabst portland knausgaard schlitz. Kitsch normcore hammock tattooed. Mustache gluten-free godard bicycle rights keytar xoxo. Beard leggings farm-to-table pickled authentic heirloom asymmetrical.	t	2018-02-03 05:03:25.059812	2018-02-03 05:03:25.059812	33
150	Cronut cardigan vinyl before they sold out mumblecore.	Knausgaard keytar chartreuse viral trust fund raw denim. Mlkshk sriracha green juice raw denim tumblr.	t	2018-02-03 05:03:25.067052	2018-02-03 05:03:25.067052	34
151	Pop-up offal franzen ramps messenger bag cred.	Photo booth bicycle rights farm-to-table kogi. Kinfolk brooklyn heirloom tote bag pabst.	t	2018-02-03 05:03:25.073836	2018-02-03 05:03:25.073836	34
152	Forage art party next level knausgaard.	Selfies venmo +1 bitters vinyl chambray austin. Bitters fanny pack chicharrones chartreuse 8-bit.	t	2018-02-03 05:03:25.080782	2018-02-03 05:03:25.080782	34
153	Locavore food truck bitters.	Ugh street franzen tote bag venmo umami diy. Salvia street portland raw denim biodiesel poutine.	t	2018-02-03 05:03:25.087687	2018-02-03 05:03:25.087687	35
154	Typewriter yr stumptown bushwick pop-up pabst.	3 wolf moon heirloom cliche narwhal drinking pitchfork. Swag muggle magic street dreamcatcher direct trade. Freegan ethical paleo brunch portland biodiesel. Tattooed ugh ethical yolo paleo.	t	2018-02-03 05:03:25.095236	2018-02-03 05:03:25.095236	35
155	Stumptown chartreuse typewriter.	Narwhal blog readymade. Meggings pop-up drinking mlkshk shoreditch.	t	2018-02-03 05:03:25.102553	2018-02-03 05:03:25.102553	61
156	Tacos slow-carb swag cardigan.	Before they sold out intelligentsia vinyl heirloom. Helvetica fashion axe migas 3 wolf moon poutine trust fund twee. Quinoa freegan tumblr. Everyday tofu celiac you probably haven't heard of them mustache. Fixie roof pitchfork.	t	2018-02-03 05:03:25.112532	2018-02-03 05:03:25.112532	61
157	Typewriter fashion axe meh mixtape chicharrones deep v.	Craft beer art party direct trade swag flannel yr pickled cleanse. Literally 3 wolf moon taxidermy single-origin coffee swag tote bag. Neutra offal knausgaard xoxo hella twee kitsch. Neutra pour-over salvia hoodie helvetica cornhole. Distillery health quinoa letterpress tattooed aesthetic. Portland cliche synth.	t	2018-02-03 05:03:25.119878	2018-02-03 05:03:25.119878	61
158	Lomo five dollar toast poutine tousled gentrify listicle.	Raw denim pabst poutine echo aesthetic etsy yuccie. Venmo retro irony plaid gastropub chia bitters cronut. Sriracha vhs lumbersexual occupy. You probably haven't heard of them bitters raw denim yr humblebrag chambray mumblecore listicle.	t	2018-02-03 05:03:25.127206	2018-02-03 05:03:25.127206	62
159	Health blog authentic.	Whatever put a bird on it mlkshk. Plaid health tousled letterpress paleo kinfolk drinking butcher. Pitchfork gluten-free franzen knausgaard. Flexitarian forage mustache chartreuse craft beer. Heirloom keffiyeh yr. Hoodie venmo hella poutine.	t	2018-02-03 05:03:25.134423	2018-02-03 05:03:25.134423	62
161	Franzen viral ramps.	Shabby chic art party pour-over authentic whatever tousled tacos cold-pressed. Chicharrones williamsburg blue bottle etsy polaroid. Quinoa hoodie artisan seitan. Post-ironic fixie cred.	t	2018-02-03 05:03:25.148154	2018-02-03 05:03:25.148154	63
164	Park thundercats everyday pug before they sold out.	Loko cardigan banh mi keffiyeh art party cred truffaut everyday. Marfa stumptown bushwick tote bag fashion axe mixtape. Fanny pack crucifix asymmetrical meggings messenger bag.	t	2018-02-03 05:03:25.170108	2018-02-03 05:03:25.170108	65
165	Pour-over ethical cold-pressed bespoke vinyl.	Cronut flexitarian blue bottle art party wes anderson semiotics tofu jean shorts. Actually shoreditch meh hoodie fixie pinterest vhs. Cleanse pickled biodiesel dreamcatcher butcher kogi 8-bit +1. Swag lumbersexual drinking 3 wolf moon mixtape ramps.	t	2018-02-03 05:03:25.176974	2018-02-03 05:03:25.176974	65
166	Tilde wes anderson mumblecore yuccie aesthetic.	Pug yolo intelligentsia pork belly tote bag venmo. Godard chambray art party retro knausgaard cornhole. Biodiesel vice diy godard humblebrag echo blue bottle.	t	2018-02-03 05:03:25.187424	2018-02-03 05:03:25.187424	66
167	3 wolf moon pickled waistcoat.	Cronut yolo cold-pressed. Retro wes anderson offal brunch. +1 wolf vhs vinegar before they sold out mumblecore squid forage. Dreamcatcher celiac phlogiston single-origin coffee yr waistcoat. Post-ironic listicle hammock bespoke waistcoat. Vice bicycle rights meditation +1 slow-carb gluten-free ugh aesthetic.	t	2018-02-03 05:03:25.193633	2018-02-03 05:03:25.193633	68
168	Everyday twee trust fund waistcoat pabst blue bottle.	Brooklyn distillery keffiyeh forage humblebrag. Bicycle rights stumptown taxidermy next level everyday swag pbr&b church-key. Tattooed chicharrones bicycle rights tacos locavore wayfarers messenger bag. Swag waistcoat yr mixtape whatever occupy leggings normcore. Fanny pack mlkshk sriracha.	t	2018-02-03 05:03:25.199679	2018-02-03 05:03:25.199679	69
169	Phlogiston biodiesel wayfarers.	Echo goth synth sartorial schlitz. Chia ennui leggings flannel mixtape shabby chic flexitarian authentic. Farm-to-table fashion axe xoxo forage sriracha skateboard cred cronut. Pork belly wayfarers church-key. Helvetica vhs cronut. Locavore ethical jean shorts echo whatever meggings cold-pressed butcher.	t	2018-02-03 05:03:25.205298	2018-02-03 05:03:25.205298	69
162	Diaphragmatic hernia: a case study	<p>Cred celiac single-origin coffee. Asymmetrical polaroid seitan disrupt blue bottle leggings fanny pack pbr&amp;b.</p>\r\n	t	2018-02-03 05:03:25.155734	2018-02-15 20:13:14.668384	64
160	Re-thinking superfoods: literature review	<p>Try-hard forage wolf intelligentsia ramps carry tousled. Cray five dollar toast jean shorts banh mi. Distillery occupy bespoke ugh taxidermy sustainable cred.</p>\r\n	t	2018-02-03 05:03:25.141177	2018-02-15 20:18:11.431497	62
170	Cliche muggle magic scenester austin listicle goth.	Forage squid chartreuse drinking shoreditch raw denim cronut bitters. Tilde biodiesel slow-carb humblebrag leggings sartorial health messenger bag.	t	2018-02-03 05:03:25.210676	2018-02-03 05:03:25.210676	70
171	Yuccie cold-pressed organic.	Cliche everyday letterpress diy before they sold out vinyl. Street fingerstache trust fund direct trade marfa schlitz distillery. Messenger bag chartreuse marfa.	t	2018-02-03 05:03:25.218932	2018-02-03 05:03:25.218932	71
172	Cray celiac sustainable crucifix.	Brooklyn occupy +1 roof. Chambray direct trade keffiyeh. Fashion axe chia kinfolk 90's chartreuse.	t	2018-02-03 05:03:25.224426	2018-02-03 05:03:25.224426	71
173	Brooklyn scenester butcher forage fingerstache cardigan.	Flannel neutra cold-pressed vhs. Authentic normcore aesthetic food truck viral crucifix. Brunch cliche paleo sartorial heirloom shoreditch xoxo put a bird on it. Tofu 8-bit mlkshk skateboard umami meggings blog organic.	t	2018-02-03 05:03:25.230248	2018-02-03 05:03:25.230248	71
174	Marfa yolo readymade.	Direct trade you probably haven't heard of them schlitz post-ironic marfa plaid gentrify lo-fi. Kogi marfa bicycle rights muggle magic disrupt hashtag. Knausgaard vice small batch taxidermy truffaut asymmetrical ethical. Cred hoodie carry +1 tousled intelligentsia. Hammock kickstarter butcher vice hoodie street.	t	2018-02-03 05:03:25.236116	2018-02-03 05:03:25.236116	72
175	Bespoke kitsch iphone pork belly roof.	Brunch etsy seitan. Asymmetrical disrupt jean shorts chartreuse. Ennui quinoa celiac kitsch post-ironic sartorial fanny pack. Health typewriter authentic lomo bitters.	t	2018-02-03 05:03:25.241952	2018-02-03 05:03:25.241952	72
176	Meggings venmo health.	Health cardigan carry master ethical cronut kitsch 90's. Tousled raw denim +1 humblebrag pug pbr&b plaid tofu. Retro carry meditation. Next level keffiyeh shabby chic williamsburg loko jean shorts bitters. Muggle magic +1 ramps. Slow-carb etsy chia listicle kale chips xoxo typewriter.	t	2018-02-03 05:03:25.248015	2018-02-03 05:03:25.248015	72
177	Pour-over craft beer vice try-hard readymade.	Narwhal tousled ramps tilde. 90's gentrify semiotics ethical cronut williamsburg distillery yr.	t	2018-02-03 05:03:25.253552	2018-02-03 05:03:25.253552	73
178	Tousled offal vice hashtag beard.	Next level tousled bicycle rights lumbersexual. Pour-over twee photo booth venmo.	t	2018-02-03 05:03:25.258592	2018-02-03 05:03:25.258592	73
179	Gentrify skateboard offal cornhole photo booth.	Kale chips hella farm-to-table you probably haven't heard of them taxidermy selfies. Try-hard marfa etsy forage. Pinterest chia pitchfork cardigan taxidermy godard. Authentic deep v tilde trust fund. Small batch gluten-free disrupt whatever green juice park banjo yolo. Five dollar toast wes anderson 90's post-ironic actually squid.	t	2018-02-03 05:03:25.264159	2018-02-03 05:03:25.264159	73
180	Actually occupy vinegar twee sustainable hashtag.	Messenger bag celiac park occupy. Crucifix hashtag farm-to-table brooklyn muggle magic raw denim leggings. Xoxo aesthetic swag echo pinterest loko. Kitsch chambray messenger bag blue bottle tattooed small batch scenester everyday.	t	2018-02-03 05:03:25.269387	2018-02-03 05:03:25.269387	74
181	Humblebrag poutine stumptown swag locavore art party.	Twee flexitarian tote bag ennui paleo kinfolk locavore disrupt. Kitsch biodiesel chia ugh. Thundercats iphone chicharrones godard whatever bespoke mixtape. Poutine ugh next level gastropub single-origin coffee narwhal. Direct trade beard bespoke pbr&b tumblr art party goth.	t	2018-02-03 05:03:25.274557	2018-02-03 05:03:25.274557	74
182	Freegan kickstarter migas neutra diy.	Shoreditch vice semiotics cleanse skateboard cray letterpress waistcoat. Cray vinyl typewriter direct trade gentrify phlogiston small batch twee.	t	2018-02-03 05:03:25.279763	2018-02-03 05:03:25.279763	74
183	Taxidermy pour-over carry kale chips pop-up farm-to-table.	Ennui freegan selvage salvia. Bespoke waistcoat occupy pork belly.	t	2018-02-03 05:03:25.284915	2018-02-03 05:03:25.284915	75
184	Flexitarian freegan you probably haven't heard of them ennui chambray crucifix.	Brooklyn poutine hella mlkshk. Before they sold out brooklyn flannel 3 wolf moon. Brunch bicycle rights plaid direct trade pbr&b tilde etsy.	t	2018-02-03 05:03:25.290201	2018-02-03 05:03:25.290201	75
185	Deep v try-hard diy scenester.	Fixie paleo actually kickstarter hashtag. Vinegar 3 wolf moon lumbersexual. Vegan waistcoat gluten-free phlogiston hashtag. Whatever echo keytar.	t	2018-02-03 05:03:25.295926	2018-02-03 05:03:25.295926	76
186	Pbr&b mumblecore stumptown echo hoodie.	Aesthetic tote bag chillwave cornhole pinterest. Ugh quinoa goth wayfarers twee stumptown. Leggings yuccie retro master umami irony. Waistcoat swag health xoxo offal shabby chic. Scenester cliche you probably haven't heard of them tumblr. Mustache chicharrones distillery austin yolo bespoke.	t	2018-02-03 05:03:25.301949	2018-02-03 05:03:25.301949	76
188	Retro blue bottle pitchfork disrupt selfies.	Swag skateboard humblebrag venmo stumptown. Hashtag pug pabst austin cronut sustainable poutine literally. Fanny pack fashion axe pinterest shoreditch.	t	2018-02-03 05:03:25.313964	2018-02-03 05:03:25.313964	16
189	Asymmetrical keytar neutra helvetica sartorial artisan.	Knausgaard semiotics narwhal gastropub truffaut. Shabby chic chia swag bicycle rights park before they sold out. Crucifix cred health meditation letterpress. Banh mi hoodie waistcoat muggle magic dreamcatcher heirloom chillwave. Brooklyn portland normcore park you probably haven't heard of them humblebrag shabby chic farm-to-table. Venmo fanny pack portland sustainable.	t	2018-02-03 05:03:25.319887	2018-02-03 05:03:25.319887	16
190	Normcore taxidermy pickled shoreditch humblebrag you probably haven't heard of them.	Ennui hammock quinoa small batch williamsburg. Single-origin coffee thundercats blue bottle vice next level pabst. Five dollar toast williamsburg diy truffaut health blue bottle. Messenger bag put a bird on it freegan cold-pressed scenester pitchfork.	t	2018-02-03 05:03:25.325332	2018-02-03 05:03:25.325332	16
191	Lo-fi whatever salvia.	Fixie tattooed chia yuccie locavore wayfarers 8-bit kitsch. Ennui pinterest yuccie farm-to-table mumblecore. Tumblr shoreditch direct trade.	t	2018-02-03 05:03:25.330987	2018-02-03 05:03:25.330987	29
192	You probably haven't heard of them aesthetic banh mi.	Meditation tote bag franzen truffaut hammock. Slow-carb crucifix heirloom echo lomo hashtag cold-pressed.	t	2018-02-03 05:03:25.33642	2018-02-03 05:03:25.33642	29
193	Synth deep v kombucha.	Meh banh mi cardigan drinking. Tofu typewriter chia mustache offal asymmetrical wes anderson butcher.	t	2018-02-03 05:03:25.341554	2018-02-03 05:03:25.341554	9
194	Art party crucifix seitan.	Lo-fi trust fund irony sartorial. Brunch fingerstache gastropub banjo bespoke. Kitsch hella food truck. Everyday lo-fi shabby chic forage hoodie next level. Forage disrupt literally craft beer ethical cred.	t	2018-02-03 05:03:25.347065	2018-02-03 05:03:25.347065	9
195	Paleo literally pitchfork.	Seitan helvetica paleo plaid brunch cardigan. Street pinterest occupy twee. Migas williamsburg synth humblebrag ethical plaid. Tilde tacos offal 8-bit. Ramps poutine salvia celiac. Squid deep v pitchfork narwhal.	t	2018-02-03 05:03:25.352957	2018-02-03 05:03:25.352957	9
196	Wolf salvia poutine occupy.	Swag lumbersexual vhs wes anderson. Hoodie humblebrag austin hashtag butcher franzen. Tousled shoreditch vhs heirloom. Gastropub artisan tumblr lomo cronut biodiesel. Chillwave dreamcatcher next level seitan umami.	t	2018-02-03 05:03:25.362318	2018-02-03 05:03:25.362318	57
197	Listicle wolf authentic tumblr gastropub small batch.	Hashtag chartreuse gentrify vinyl. Migas bicycle rights salvia before they sold out schlitz ethical. Wolf ethical paleo scenester food truck.	t	2018-02-03 05:03:25.370042	2018-02-03 05:03:25.370042	57
200	Tilde typewriter fanny pack selvage sustainable.	Organic tacos umami master venmo beard tilde scenester. Banh mi phlogiston green juice single-origin coffee locavore everyday venmo. Echo tofu sustainable drinking synth cronut cold-pressed tattooed.	t	2018-02-03 05:03:25.391544	2018-02-03 05:03:25.391544	55
201	Phlogiston letterpress vice bitters cliche.	+1 pour-over kinfolk health. Chia cliche green juice crucifix street wayfarers authentic.	t	2018-02-03 05:03:25.398589	2018-02-03 05:03:25.398589	59
202	Aesthetic hammock umami keytar church-key mixtape.	Squid humblebrag paleo hella selfies pug tattooed poutine. Single-origin coffee keytar pinterest. Tote bag +1 asymmetrical xoxo street. Park waistcoat marfa fashion axe single-origin coffee typewriter next level.	t	2018-02-03 05:03:25.406165	2018-02-03 05:03:25.406165	59
203	Muggle magic wes anderson semiotics.	Sriracha fingerstache pitchfork bespoke iphone blue bottle. Heirloom skateboard lumbersexual pop-up crucifix. Raw denim beard truffaut fashion axe lumbersexual organic fanny pack. Disrupt asymmetrical pour-over marfa blue bottle. Cronut single-origin coffee offal mlkshk vinegar. Photo booth food truck humblebrag austin offal 8-bit.	t	2018-02-03 05:03:25.413433	2018-02-03 05:03:25.413433	60
204	Typewriter celiac narwhal twee chicharrones.	Bicycle rights trust fund scenester yuccie. Helvetica portland thundercats brooklyn cornhole banh mi green juice. Shoreditch trust fund taxidermy aesthetic pickled messenger bag dreamcatcher. Food truck bushwick yolo. Drinking art party letterpress crucifix lumbersexual tousled.	t	2018-02-03 05:03:25.421315	2018-02-03 05:03:25.421315	60
205	Typewriter echo aesthetic squid sriracha celiac.	Aesthetic pour-over trust fund meditation distillery celiac xoxo. Typewriter +1 cardigan keffiyeh. Yr blog pbr&b art party ennui polaroid.	t	2018-02-03 05:03:25.428359	2018-02-03 05:03:25.428359	39
206	Salvia banh mi single-origin coffee cornhole farm-to-table direct trade.	Mlkshk pork belly vice schlitz master. Health everyday actually muggle magic craft beer photo booth hashtag forage. Ethical beard single-origin coffee letterpress austin chia photo booth biodiesel. Plaid selfies keffiyeh flannel sustainable.	t	2018-02-03 05:03:25.435411	2018-02-03 05:03:25.435411	39
207	Letterpress forage seitan banh mi.	Meditation hammock ennui vegan photo booth. Tousled cornhole everyday fixie raw denim.	t	2018-02-03 05:03:25.442506	2018-02-03 05:03:25.442506	39
209	Organic occupy letterpress.	Xoxo shoreditch five dollar toast biodiesel. Raw denim squid humblebrag deep v taxidermy drinking yuccie. Ramps chambray sartorial you probably haven't heard of them skateboard schlitz cred street. Muggle magic fixie waistcoat pour-over kitsch goth loko.	t	2018-02-03 05:03:25.457507	2018-02-03 05:03:25.457507	56
210	Put a bird on it roof marfa.	Squid muggle magic pabst lumbersexual letterpress craft beer kale chips narwhal. Viral pinterest cornhole waistcoat raw denim quinoa kitsch squid. Chartreuse kale chips typewriter wayfarers tacos cleanse celiac. Shoreditch fixie wes anderson godard kombucha waistcoat carry.	t	2018-02-03 05:03:25.465287	2018-02-03 05:03:25.465287	67
211	Hello World	<p>Hello</p>\r\n\r\n<p>Bonjour</p>\r\n\r\n<p>Salut</p>\r\n\r\n<p>Ni Hao</p>\r\n\r\n<p>Hola</p>\r\n	f	2018-02-04 17:33:45.002352	2018-02-04 17:33:45.002352	6
212	Occaecat totam cumque lorem eum similique architecto sequi in enim quae blanditiis perferendis dolor	<p>This is a serious problem.</p>\r\n	t	2018-02-08 00:56:35.564656	2018-02-08 00:56:35.564656	2
214	Rerum possimus ut unde irure atque ut enim eius quia autem	<p>Voluptatem Debitis dolores rerum non enim dolore omnis enim perferendis</p>\r\n	f	2018-02-08 01:20:48.946911	2018-02-08 01:20:48.946911	2
216	Est sint eu id perferendis ex non facere qui assumenda officia quis ipsum id	<p>asgadgadgdsg</p>\r\n	f	2018-02-08 01:28:00.92723	2018-02-08 01:28:00.92723	2
10	Magnam consectetur sed ipsa proident quod aute quia labore voluptate omnis ad culpa qui cupiditate explicabo Sit sunt amet nisi	<p>dagfdagadfg</p>\r\n	t	2018-01-30 08:13:46.239592	2018-01-30 08:13:46.239592	\N
43	The post with attached media	<p>Check if media associations are made.</p>\r\n	f	2018-01-30 17:19:00.464269	2018-01-30 17:19:00.464269	\N
45	Asperiores esse asperiores ut consequatur Ut exercitation	<p>agadgadgdagdag</p>\r\n	t	2018-01-30 17:35:56.029554	2018-01-30 17:35:56.029554	\N
218	Survey to assess statistical literacy among physicians	<p>asasdgagsdag</p>\r\n	t	2018-02-08 03:56:03.5975	2018-02-15 04:32:51.655337	7
220	Mental health engagement among millennials	<p>Pretty good!</p>\r\n	t	2018-02-10 02:19:04.348046	2018-02-15 04:17:40.310252	7
219	Caregiver burnout in geriatric populations living with chronic disease	<p>Non aut dignissimos autem exercitationem eveniet amet ut ut et libero mollitia in ex</p>\r\n\r\n<p>adsgadsggad</p>\r\n	f	2018-02-08 05:06:34.871022	2018-02-15 20:08:17.230377	3
198	Non-pharmacologic treatment options for irritable bowel syndrome (IBS)	<p>Cornhole migas waistcoat loko flexitarian hella brooklyn celiac. Waistcoat health bitters ennui. Raw denim chicharrones direct trade lumbersexual art party 3 wolf moon. Banh mi narwhal heirloom put a bird on it truffaut. Next level street ethical. Ethical truffaut literally blue bottle mustache schlitz you probably haven&#39;t heard of them banjo.</p>\r\n	t	2018-02-03 05:03:25.377286	2018-02-15 05:22:16.574263	58
208	Antibiotic prescription for non-exudative otitis - review of best practice	<p>Goth meggings chia neutra kickstarter fixie flexitarian. Cred street ugh. Vinyl kinfolk sustainable viral mlkshk goth meh marfa. Cardigan chartreuse letterpress. Polaroid swag umami cold-pressed.</p>\r\n	t	2018-02-03 05:03:25.449754	2018-02-15 05:30:32.209929	56
199	Reviewing safety of dabigatran: metanalysis	<p>Phlogiston williamsburg cronut letterpress gastropub artisan. Disrupt try-hard bushwick lo-fi. Tofu xoxo vhs authentic vice you probably haven&#39;t heard of them brooklyn disrupt. Cray kickstarter lo-fi twee. Iphone chillwave whatever tilde umami park. Hammock pbr&amp;b stumptown celiac.</p>\r\n	t	2018-02-03 05:03:25.38452	2018-02-15 20:14:40.66207	58
221	How to use metered dose inhalers (MDI)	<p>Proper use of inhaler is very important for better medicine outcomes. Missing out on a step may lead to inefficient dosage delivery which inadvertently affects your health. &nbsp;In case of a Metered Dose Inhaler (MDI) like ProAir and Ventolin, getting the actuation and inhaling timing right is very important for getting the right dose. The video is precisely timed so that you can practice taking your mdi inhaler whenever you want to take a dose. &nbsp;</p>\r\n\r\n<p>At http://www.use-inhalers.com/ we provide inhaler instructions for all major asthma inhalers in a fun and interactive way. We have tools that teach you correct breathing technique for your inhaler, help you practice inhaler technique and then test your inhaler technique for better retention. Above all inhaler instructions are available in major languages like English, Spanish, Portuguese, French and many others.</p>\r\n\r\n<p>We offer other inhaler training:<br />\r\n&bull; MDI with Spacer<br />\r\n&bull; Diskus<br />\r\n&bull; Handihaler<br />\r\n&bull; Respimat<br />\r\n&bull; Pressair<br />\r\n&bull; Twisthaler<br />\r\n&bull; Flexhaler<br />\r\n&bull; Autohaler<br />\r\n&bull; Aerolizer<br />\r\n&bull; Neohaler</p>\r\n\r\n<p>Want inhaler instructions on the go? Download our iOS apps &quot;How to Use Inhalers&quot; from <a href="https://itunes.apple.com/app/id581502">https://itunes.apple.com/app/id581502</a>... never forget a step.</p>\r\n\r\n<p>The attached video helps you learn how to use metered dose inhaler like ProAir, Ventolin and other MDI inhalers.</p>\r\n\r\n<p>Watch moreinhaler videos on <a href="http://www.use-inhalers.com/">http://www.use-inhalers.com/</a></p>\r\n	t	2018-02-13 22:32:48.363461	2018-02-13 22:32:48.363461	2
222	Health problems and stress in Information Technology	<p><span style="font-size:16px">Stress is high in software profession because of their nature of work, target, achievements, night shift, over work load. </span></p>\r\n\r\n<h4>Objectives</h4>\r\n\r\n<ol>\r\n\t<li>To study the demographic profile of the employees.</li>\r\n\t<li>To access the level of job stress and quality of life of the respondents.</li>\r\n\t<li>To study in detail the health problems of the employees.</li>\r\n</ol>\r\n\r\n<p><span style="font-size:16px">All employees working in IT and BPO industry for more than two years were included into the study. A detailed questionnaire of around 1000 IT and BPO employees including their personal details, stress score by Holmes and Rahe to assess the level of stress and master health checkup profile were taken and the results were analysed. Around 56% had musculoskeletal symptoms. 22% had newly diagnosed hypertension,10% had diabetes, 36% had dyslipidemia, 54% had depression, anxiety and insomnia, 40% had obesity. The stress score was higher in employees who developed diabetes, hypertension and depression. Early diagnosis of stress induced health problems can be made out by stress scores, intense lifestyle modification, diet advice along with psychological counselling would reduce the incidence of health problems in IT sector and improve the quality of work force.</span></p>\r\n\r\n<p><span style="font-size:16px"><img alt="" src="http://localhost:3000/attachments/39bb938d185991c4c8d98121f3abee6cdd49029c/store/c2592bfee3d8fe525d876e1ba286b10ea039f1342b2abcf549e876eb4c37/image-healthproblemsinit.jpg" style="image-rendering:crisp-edges; width:100%" /></span><br />\r\n<strong>Figure 1.&nbsp;Percentage of health problems in information technology employees.</strong></p>\r\n\r\n<p><span style="font-size:16px">The daily impact of IT on our lives continues unabated. As innovations and computer capacities increase this influence will continue to grow in the coming years at an increasing rate. As technology advances, there is also increased stress that is associated with it called as &ldquo;technology stress.&rdquo; IT is here to stay. This brings extra pressure on people to adapt to new advancements and update their knowledge in their field.</span></p>\r\n\r\n<p><span style="font-size:16px">Annual stress scoring has to be done and a score above 300 needs stress management program like yoga, meditation and other destressing activities like aerobics, dance etc., would prevent or reduce risk of disease due to stress in IT people which in turn will produce a healthy community.</span></p>\r\n\r\n<h4>Conclusion</h4>\r\n\r\n<p><span style="font-size:16px">To manage stress these people need to play sport, have a hobby or just have a good holiday. Stress score helps us to screen who would be prone to stress related physical illness and people with a score more than 300 are at risk of illness and care should be taken at the earliest to relive their stress. Healthy employees mean better performance by employee that in turn produce a healthy community. Annual stress scoring has to be done, and employees are having a score more than 300 should be involved in active antistress&nbsp;</span></p>\r\n	t	2018-02-15 23:40:30.396471	2018-02-15 05:45:21.95315	3
223	Noncomparative evidence in HTA decision making.	<h4><strong>BACKGROUND:</strong></h4>\r\n\r\n<p>Many&nbsp;health technology assessment&nbsp;(HTA) agencies express a preference for randomized controlled trial evidence when appraising health technologies; nevertheless, it is not always feasible or ethical to conduct such comparative trials.</p>\r\n\r\n<h4><strong>OBJECTIVES:</strong></h4>\r\n\r\n<p>To assess the role of noncomparative evidence in HTA decision making.</p>\r\n\r\n<h4><strong>METHODS:</strong></h4>\r\n\r\n<p>The Web sites of the National Institute for Health and Care Excellence (NICE) in the United Kingdom, the Canadian Agency for Drugs and Technologies in Health (CADTH) in&nbsp;Canada, and the Institute for Quality and Efficiency in Health Care (Institut f&uuml;r Qualit&auml;t und Wirtschaftlichkeit im Gesundheitswesen [IQWiG]) in Germany were searched for single HTA reports (published between January 2010 and December 2015). The product, indication, outcome, and clinical evidence presented (comparative/noncomparative) were double-extracted, with any discrepancies reconciled. A noncomparative study was defined as any study not presenting results against another treatment (including placebo or best supportive care), regardless of phase or setting, including dose-ranging studies.</p>\r\n\r\n<h4><strong>RESULTS:</strong></h4>\r\n\r\n<p>A total of 549 appraisals were extracted. Noncomparative evidence was considered in 38% (45 of 118) of NICE submissions, 13% (34 of 262) of CADTH submissions, and 12% (20 of 169) of IQWiG submissions. Evidence submissions based exclusively on noncomparative evidence were presented in only 4% (5 of 118) of NICE appraisals, 6% (16 of 262) of CADTH appraisals, and 4% (6 of 169) of IQWiG appraisals. Most drugs appraised solely on the basis of noncomparative evidence were indicated for cancer or hepatitis C. Positive outcome rates (encompassing recommended/restricted/added-benefit decisions) for submissions presenting only noncomparative evidence were similar to overall recommendation rates for CADTH (69% vs. 68%, respectively), but were numerically lower for NICE (60% vs. 84%, respectively) and IQWiG (17% vs. 38%, respectively) (P &gt; 0.05 for all).</p>\r\n\r\n<h4><strong>CONCLUSIONS:</strong></h4>\r\n\r\n<p>Noncomparative studies can be viewed as acceptable clinical evidence by HTA agencies when these study designs are justifiable and when treatment effect can be convincingly demonstrated, but their use is currently limited.</p>\r\n	f	2018-02-14 00:36:06.855196	2018-02-15 23:25:33.610412	7
224	Living with Type 2 Diabetes - Patient Information	<p>Choosing a healthy, balanced diet and regular physical activity is an important part of your overall diabetes care and can help you keep your blood sugar levels under control.</p>\r\n\r\n<p><strong>It&rsquo;s important for people with type 2 diabetes for two reasons:</strong></p>\r\n\r\n<ol>\r\n\t<li><strong>It can help to keep your blood sugars on target:</strong>\r\n\r\n\t<ul>\r\n\t\t<li>by choosing food that will not cause blood sugar levels to rise as much</li>\r\n\t\t<li>by being active to use sugar for energy</li>\r\n\t</ul>\r\n\t</li>\r\n\t<li><strong>If you are overweight, it can help you bring your weight down:</strong>\r\n\t<ul>\r\n\t\t<li>this can help manage your diabetes, and</li>\r\n\t\t<li>improve your overall health</li>\r\n\t</ul>\r\n\t</li>\r\n</ol>\r\n\r\n<p>Taking care of your body in this way can also have an additional positive impact on your emotional wellbeing, increase energy and relieve stress.</p>\r\n\r\n<h3>Eating well</h3>\r\n\r\n<p>This can feel like one of the hardest things to do, as it often seems easier or quicker to choose particular foods because they are convenient, or because that&rsquo;s what everyone else is having. Eating well is about learning how to make healthy choices for you. You need to figure out what works for you and how to make healthy food choices, even when you are out with your friends.</p>\r\n\r\n<p>Eating well doesn&rsquo;t have to take a lot of time, cost a lot of money or be complicated. Your diabetes care team can help you create a meal plan that&rsquo;s right for you and find ways to work healthy eating into your life.</p>\r\n\r\n<p>The important things to remember are:</p>\r\n\r\n<ul>\r\n\t<li>Eat a variety of foods in the right amounts</li>\r\n\t<li>Eat regularly</li>\r\n\t<li>Balance how much you eat with your physical activity and your medication (if you take any) to help control blood sugar levels</li>\r\n</ul>\r\n\r\n<h3>Diet changes and food swaps</h3>\r\n\r\n<p>There&rsquo;s lots of small changes you can make that make a big difference to your diet; for example, changing the way something is prepared (such as grilling instead of frying in oil), choosing low-sugar or low-fat alternatives, and making swaps such as:</p>\r\n\r\n<p><img alt="" src="/attachments/b30ca040dc14b0feb1f373457a6a15367898a70b/store/9d0af772506e7bf1e98a38ef9701c3e6c15d6763dec3b132ba61aba3188d/image-diabeteseatwell1.png" style="width:50%" /><img alt="" src="/attachments/3c9aab1ad2765fa810d3d78182b6f4af731abbe7/store/fe0a18ef5da5c1bf0fcb04edc16ca75a64dc4265b396c03f79d060c6908b/image-diabetes-eatwell2.png" style="width:50%" /></p>\r\n\r\n<h3>Staying active</h3>\r\n\r\n<p>Physical activity is important not only to your blood sugar control, but to your general health too. If you find something you enjoy and that fits with your life, you&rsquo;ll be much more likely to stick to it.</p>\r\n\r\n<p>Even a small increase in physical activity may help with your diabetes management &ndash; you don&rsquo;t need to start running marathons to see a difference! If you haven&rsquo;t been active, it&rsquo;s fine to start with 5 to 10 minutes a day and increase your activity a few minutes each week until you reach your goal.</p>\r\n\r\n<p>The good thing is that there are so many options, that it&rsquo;s just a matter of trying different things until you find one that suits you. Plus, trying new things can help to keep it interesting. If you prefer to have company, ask a friend or family member to go with you.</p>\r\n	t	2018-02-15 01:15:32.778896	2018-02-15 01:41:18.581814	3
187	Cognitive behavioural therapy (CBT) modalities	<p>Cray lumbersexual chambray venmo craft beer aesthetic squid blog. Flannel ethical readymade. Taxidermy phlogiston mustache kale chips retro xoxo selfies drinking. Skateboard locavore shoreditch mlkshk green juice.</p>\r\n	t	2018-02-03 05:03:25.307699	2018-02-15 05:29:04.006905	77
59	Self-injection with insulin/novopen - Patient information	<ol>\r\n\t<li>Make sure your skin is clean and dry. &nbsp;You do not have to use alcohol on your skin unless you have been in a hospital or unable to have your skin cleaned and dried with ordinary soap and water. Wait for the alcohol from the swab to dry completely before you inject&nbsp;</li>\r\n\t<li>Inject insulin that is at room temperature &ndash; it is more comfortable than when it is cold. Try and remember to take your insulin out of the fridge well before you need it</li>\r\n\t<li>Make your injection site &ldquo;numb&rdquo;. Using a frozen spoon or ice cube (wrapped up in some cloth), numbing cream from the pharmacy, or even simply applying pressure with your thumb to the injection site for a few seconds just before injecting can make the injection hurt less</li>\r\n\t<li>Change your needle with each injection. Reusing your needle increases the risk for infection and new needles are sharper and cause less pain</li>\r\n\t<li>Try and relax the muscles in the injection area</li>\r\n\t<li>Rotate your injection site frequently to avoid damage to your tissues</li>\r\n</ol>\r\n\r\n<p><iframe frameborder="0" height="250px" scrolling="no" src="http://localhost:3000/attachments/250c4646683f52ff2880d9914e708ca41a921853/store/e328c047aacbffe1e5a7579abc060c190837585f90b2b7f13eff0ecfad62/video+-+insulin+novopen+instruction.mp4" width="400px"></iframe></p>\r\n	t	2018-02-03 05:03:24.447872	2018-02-15 02:08:05.250468	3
64	Ways to address physician burnout among junior resident doctors	<p>Kale chips yolo iphone schlitz. Williamsburg bushwick austin vinyl authentic 8-bit jean shorts. Selvage hoodie umami authentic post-ironic tumblr intelligentsia portland. Lomo mlkshk salvia messenger bag cornhole try-hard.</p>\r\n	t	2018-02-03 05:03:24.480458	2018-02-15 04:31:13.443053	7
163	Approach to fibromyalgia treatment: systematic review	<p>Cold-pressed cronut vhs gluten-free chartreuse park knausgaard next level. Schlitz scenester franzen paleo lumbersexual.</p>\r\n	t	2018-02-03 05:03:25.16269	2018-02-15 20:11:05.143341	64
225	Celiac disease, non-celiac gluten sensitivity or wheat allergy: what is the difference?	<p>Celiac disease (CD), non-celiac gluten sensitivity (NCGS) and wheat allergy are all conditions whose primary treatment is avoidance of specific dietary components. Celiac disease and non-celiac gluten sensitivity have many symptoms in common, whereas those of wheat allergy are usually distinct. Possible &nbsp;symptoms of CD and NCGS include gastrointestinal symptoms such as cramping, diarrhea and constipation, as well as symptoms in other parts of the body such as bone or joint pain, headaches, or fatigue, to name a few. Symptoms of an allergy to wheat can include itching, hives, or anaphylaxis, a life-threatening reaction. Treatment for CD and NCGS is to remove gluten from the diet. Gluten is a protein naturally found in wheat, rye and barley, as well as in hybrids and products made from these grains. Treatment for wheat allergy is removal of all forms of wheat from the diet. People with CD, NCGS, or wheat allergy are fortunate because they don&rsquo;t need complicated medical treatments to get well, but they must avoid the food or foods that are problematic. Let&rsquo;s take a closer look at each of these types of reactions to food.</p>\r\n\r\n<p><img alt="" src="http://localhost:3000/attachments/6441f77c986e97b894b382e24076e9d6fc9429d2/store/74ba0654e20bb2b1f25566de27b2ebc897a05ea0ea3accd57795d7e61496/non-celiac-gluten-sensitivity-vs-ibs.png" style="width:100%" /></p>\r\n\r\n<p><strong>Figure 1. Establishing non-celiac gluten&nbsp;sensitivy symptoms through comparison with IBS and true celiac disease.</strong></p>\r\n\r\n<p><strong>Celiac disease (CD)</strong>&nbsp;is a genetic, autoimmune disorder that occurs in reaction to the ingestion of gluten. To develop celiac disease a person must inherit the genetic predisposition, be consuming gluten, and have the disease activated. Activation triggers may include stress, trauma (surgeries, etc.) and possibly viral infections. The reaction to gluten causes villous atrophy or flattening of the cells lining the small intestine, which can lead to malabsorption of nutrients and related health issues. &nbsp;There are over 200 identified symptoms of CD, which &nbsp;include those listed above as well as anemia, behavioral changes, stunted growth and infertility. Dermatitis herpetiformis is celiac disease that manifests as a skin rash. The rate of CD is higher among relatives of those who are diagnosed, but anyone with the genetic predisposition can develop celiac disease at any age. Currently it is estimated that about 1% of the population has celiac disease, although 83% of those people are still undiagnosed. While research continues to work towards pharmaceutical or other treatments, at this time the only treatment for celiac disease is to maintain a gluten-free diet for life.</p>\r\n\r\n<p><img alt="" src="http://localhost:3000/attachments/6f6f2dd725864863f5c794f97794dfc2264aebed/store/b508fbecd169a9a850289a6f07195b6a52a29a2c8d791ad37446b0936c80/image-non-celiac-gluten-sensitivity.jpg" style="width:100%" /></p>\r\n\r\n<p><strong>Figure 2. Five facts about non-celiac gluten sensitivity</strong></p>\r\n\r\n<p><strong>Non-Celiac Gluten Sensitivity (NCGS)</strong>, also referred to as gluten sensitivity (GS) or non-celiac wheat sensitivity (NCWS), is not well defined. It is not an immunoglobulin E (IgE) (as with wheat allergy, see below) nor autoimmune reaction (as with CD, see above). NCGS may have an innate immune component, but this has not been firmly established. There are no tests or biomarkers to identify NCGS. Since NCGS is not well understood it is still not clear whether other components of gluten-containing grains may be involved in causing symptoms, at least in some cases. In order for gluten sensitivity to be diagnosed, it is first necessary to rule out CD, wheat allergy or other possible causes of symptoms. Then, if improvement is seen when following a gluten-free diet, gluten sensitivity may be diagnosed. Adherence to a gluten-free diet is the only treatment for NCGS at this time.</p>\r\n\r\n<p><strong>Wheat allergy&nbsp;</strong>is an immune reaction to any of the hundreds of proteins in wheat. When a person has a wheat allergy, one type of white blood cells, called B-cells, send out immunoglobulin E (IgE) antibodies to &ldquo;attack&rdquo; the wheat. At the same time, local tissues in the body send out natural chemical messengers to alert the rest of the body that there is a problem. This reaction happens very fast (within minutes to a few hours) and can involve a range of symptoms from nausea, abdominal pain, itching, swelling of the lips and tongue, to trouble breathing, or anaphylaxis (a life-threatening reaction). A person with a wheat allergy must avoid eating any form of wheat, but does not have trouble tolerating gluten from non-wheat sources. (It is possible for a person to be both allergic to wheat and have CD or NCGS.) In the United States, wheat is one of the eight most common foods to which people are allergic. Children who are allergic to wheat may out-grow the allergy, but adults with an allergy to wheat usually have it for life. The only treatment is a wheat-free diet.&nbsp;</p>\r\n	t	2018-02-15 04:46:02.563441	2018-02-15 04:53:56.182785	1
226	Ten most-common inhaler mistakes adults make	<p>Inhaled asthma medicine needs to reach the airways to work.<br />\r\nHere are 10 common mistakes made when using a&nbsp;metered-dose inhaler (MDI) and how to correct them.<br />\r\n<br />\r\n<strong>1. Slouching</strong><br />\r\nFIX IT: Sitting up straight or standing allows the lungs&nbsp;to fully inhale and provides more power to exhale.</p>\r\n\r\n<p><strong>2. Using an empty inhaler</strong><br />\r\nFIX IT: Request a refill when the inhaler has&nbsp;30 puffs or doses left.</p>\r\n\r\n<p><strong>3. Not shaking or priming the inhaler</strong><br />\r\nFIX IT: Shake the inhaler canister 10 to 15 times for the&nbsp;medication to be ready to work. When using a new inhaler,&nbsp;prime it by releasing three to four test sprays. Prime again&nbsp;if not used for several weeks.</p>\r\n\r\n<p><strong>4. Using an MDI inhaler without a spacer</strong><br />\r\nFIX IT: A spacer helps more of the medicine get to the airways.&nbsp;Insert the inhaler into the spacer. Spray one puff of &nbsp;medicine and&nbsp;inhale slowly. Hold your breath for a count of 10 and exhale slowly.</p>\r\n\r\n<p><strong>5. Spraying several puffs of inhaler into spacer</strong><br />\r\nFIX IT: Spray only one puff of the inhaler into the spacer&nbsp;for each breath. Breathe out before inhaling. Inhale and&nbsp;hold your breath for a count of 10, then exhale. Repeat for&nbsp;the number of puffs the doctor prescribed.<br />\r\n<br />\r\n<strong>6. Holding the head too far forward&nbsp;or backward</strong><br />\r\nFIX IT: The head needs to be in a normal position, not too far&nbsp;back or too far forward, to help make a direct path for the&nbsp;medicine to reach the airways.<br />\r\n<br />\r\n<strong>7. Tongue or teeth in the way of&nbsp;spacer/inhaler opening</strong><br />\r\nFIX IT: Put the mouthpiece of the spacer/inhaler in the mouth&nbsp;above the tongue, under the top teeth.<br />\r\n<br />\r\n<strong>8. Mouth not tight enough&nbsp;around spacer/inhaler</strong><br />\r\nFIX IT: Close the lips around the mouthpiece of the&nbsp;spacer or inhaler so air does not escape.<br />\r\n<br />\r\n<strong>9. Directing spacer/inhaler at&nbsp;tongue or roof of mouth</strong><br />\r\nFIX IT: Aim the spacer/inhaler at the back of the&nbsp;throat, so the medicine reaches the lungs.<br />\r\n<br />\r\n<strong>10. Inhaling medicine too fast</strong><br />\r\nFIX IT: Inhale slowly. A whistle sound made when using a&nbsp;spacer means the inhalation is too fast.</p>\r\n\r\n<h4>Reminders</h4>\r\n\r\n<ul>\r\n\t<li>Follow instructions for using your inhaler.</li>\r\n\t<li>Gargle and spit after inhaling a steroid.</li>\r\n\t<li>Show your inhaler technique to your provider.</li>\r\n\t<li>Clean the inhaler and spacer according to instructions.</li>\r\n</ul>\r\n	t	2018-02-15 20:33:36.439285	2018-02-15 20:35:35.639626	6
227	Treatment options for depression	<p>Medications and psychotherapy are effective for most people with depression. Your primary care doctor or psychiatrist can prescribe medications to relieve symptoms. However, many people with depression also benefit from seeing a psychiatrist, psychologist or other mental health professional If you have severe depression, you may need a hospital stay, or you may need to participate in an outpatient treatment program until your symptoms improve.</p>\r\n\r\n<p>Here&#39;s a closer look at depression treatment options.</p>\r\n\r\n<h4>Finding the right medication</h4>\r\n\r\n<p>If a family member has responded well to an antidepressant, it may be one that could help you. Or you may need to try several medications or a combination of medications before you find one that works. This requires patience, as some medications need several weeks or longer to take full effect and for side effects to ease as your body adjusts.</p>\r\n\r\n<p>Inherited traits play a role in how antidepressants affect you. In some cases, where available, results of genetic tests (done by a blood test or cheek swab) may offer clues about how your body may respond to a particular antidepressant. However, other variables besides genetics can affect your response to medication.</p>\r\n\r\n<h4>Psychotherapy</h4>\r\n\r\n<p>Psychotherapy is a general term for treating depression by talking about your condition and related issues with a mental health professional. Psychotherapy is also known as talk therapy or psychological therapy.</p>\r\n\r\n<p>Different types of psychotherapy can be effective for depression, such as cognitive behavioral therapy or interpersonal therapy. Your mental health professional may also recommend other types of therapies. Psychotherapy can help you:</p>\r\n\r\n<ul>\r\n\t<li>Adjust to a crisis or other current difficulty</li>\r\n\t<li>Identify negative beliefs and behaviors and replace them with healthy, positive ones</li>\r\n\t<li>Explore relationships and experiences, and develop positive interactions with others</li>\r\n\t<li>Find better ways to cope and solve problems</li>\r\n\t<li>Identify issues that contribute to your depression and change behaviors that make it worse</li>\r\n\t<li>Regain a sense of satisfaction and control in your life and help ease depression symptoms, such as hopelessness and anger</li>\r\n\t<li>Learn to set realistic goals for your life</li>\r\n\t<li>Develop the ability to tolerate and accept distress using healthier behaviors</li>\r\n</ul>\r\n\r\n<p><img alt="" src="http://localhost:3000/attachments/8a284ce4a9299b67bab84de457f05033868fefe5/store/3a563c3ac2b121757c40681fe487e81d0cf1d2c508a5e341976105b4b724/image-depression-trials.jpg" style="width:100%" /><br />\r\n<strong>Figure 1. </strong>Mean Percentage Symptom Reduction from Un-blinded and Blinded Treatment Arms from Published Depression Trials Compared to Data from Pivotal Registration Depression Trials as Reported by the FDA. (Adapted from Khan et al. 2012)</p>\r\n\r\n<h4>Alternate formats for therapy</h4>\r\n\r\n<p>Formats for depression therapy as an alternative to face-to-face office sessions are available and may be an effective option for some people. Therapy can be provided, for example, as a computer program, by online sessions, or using videos or workbooks. Programs can be guided by a therapist or be partially or totally independent.</p>\r\n\r\n<p>Before you choose one of these options, discuss these formats with your therapist to determine if they may be helpful for you. Also, ask your therapist if he or she can recommend a trusted source or program. Some may not be covered by your insurance and not all developers and online therapists have the proper credentials or training.</p>\r\n\r\n<p>Smartphones and tablets that offer mobile health apps, such as support and general education about depression, are not a substitute for seeing your doctor or therapist.</p>\r\n\r\n<h4>Mind-body connections</h4>\r\n\r\n<p>Integrative medicine practitioners believe the mind and body must be in harmony for you to stay healthy. Examples of mind-body techniques that may be helpful for depression include:</p>\r\n\r\n<ul>\r\n\t<li>Acupuncture</li>\r\n\t<li>Relaxation techniques such as yoga or tai chi</li>\r\n\t<li>Meditation</li>\r\n\t<li>Guided imagery</li>\r\n\t<li>Massage therapy</li>\r\n\t<li>Music or art therapy</li>\r\n\t<li>Spirituality</li>\r\n\t<li>Aerobic exercise</li>\r\n</ul>\r\n\r\n<p>Relying solely on these therapies is generally not enough to treat depression. They may be helpful when used in addition to medication and psychotherapy.</p>\r\n\r\n<h4>Coping and support</h4>\r\n\r\n<p>Talk with your doctor or therapist about improving your coping skills, and try these tips:</p>\r\n\r\n<ul>\r\n\t<li><strong>Simplify your life.</strong>&nbsp;Cut back on obligations when possible, and set reasonable goals for yourself. Give yourself permission to do less when you feel down.</li>\r\n\t<li><strong>Write in a journal.</strong>&nbsp;Journaling, as part of your treatment, may improve mood by allowing you to express pain, anger, fear or other emotions.</li>\r\n\t<li><strong>Read reputable self-help books and websites.</strong>&nbsp;Your doctor or therapist may be able to recommend books or websites to read.</li>\r\n\t<li><strong>Locate helpful groups.</strong>&nbsp;Many organizations, such as the National Alliance on Mental Illness (NAMI) and the Depression and Bipolar Support Alliance, offer education, support groups, counseling and other resources to help with depression. Employee assistance programs and religious groups also may offer help for mental health concerns.</li>\r\n\t<li><strong>Don&#39;t become isolated.</strong>&nbsp;Try to participate in social activities, and get together with family or friends regularly. Support groups for people with depression can help you connect to others facing similar challenges and share experiences.</li>\r\n\t<li><strong>Learn ways to relax and manage your stress.</strong>&nbsp;Examples include meditation, progressive muscle relaxation, yoga and tai chi.</li>\r\n\t<li><strong>Structure your time.</strong>&nbsp;Plan your day. You may find it helps to make a list of daily tasks, use sticky notes as reminders or use a planner to stay organized.</li>\r\n\t<li><strong>Don&#39;t make important decisions when you&#39;re down.</strong>&nbsp;Avoid decision-making when you&#39;re feeling depressed, since you may not be thinking clearly.</li>\r\n</ul>\r\n	t	2018-02-15 23:56:39.548228	2018-02-16 02:17:26.034416	7
\.


--
-- Data for Name: references; Type: TABLE DATA; Schema: public; Owner: jacklee
--

COPY "references" (id, body, url, doi, created_at, updated_at, referenceable_type, referenceable_id) FROM stdin;
13	Romanelli, R. J., Nolting, L., Dolginsky, M., Kym, E., & Orrico, K. B. (2016). Dabigatran Versus Warfarin for Atrial Fibrillation in Real-World Clinical Practice. Circulation: Cardiovascular Quality and Outcomes, 9(2), 126–134. doi:10.1161/circoutcomes.115.002369\n	https://doi.org/10.1161/CIRCOUTCOMES.115.002369	10.1161/CIRCOUTCOMES.115.002369	2018-02-01 01:54:32.316143	2018-02-01 03:58:16.493144	\N	\N
9	Hankey GJ, Eikelboom JW. Dabigatran etexilate: A new oral thrombin inhibitor. Circulation 2011;123:1436-50.			2018-01-31 01:19:11.467669	2018-01-31 01:19:11.467669	\N	\N
10	adsgadgdgaggdag	adsgadgadg	asgadggad	2018-02-01 01:23:20.084078	2018-02-01 01:23:20.084078	\N	\N
35	Kus, J. V., Tadros, M., Simor, A., Low, D. E., McGeer, A. J., Willey, B. M., … Poutanen, S. M. (2011). New Delhi metallo- -lactamase-1: local acquisition in Ontario, Canada, and challenges in detection. Canadian Medical Association Journal, 183(11), 1257–1261. doi:10.1503/cmaj.110477\n	https://doi.org/10.1503/cmaj.110477	10.1503/cmaj.110477	2018-02-01 07:39:02.335744	2018-02-02 21:03:43.6149	\N	\N
21	Julia Child&#39;s Roasted Chicken - Roast Chicken Recipe - YouTube	https://www.youtube.com/watch?v=6Wk2cYarjOI		2018-02-01 02:58:23.774608	2018-02-01 03:24:34.455581	\N	\N
22	CodeCore Bootcamp - Learn Web Development	http://codecore.ca/		2018-02-01 03:01:30.516638	2018-02-01 03:24:34.463067	\N	\N
23	Trump-FBI feud over classified memo erupts into open conflict - The Washington Post	https://www.washingtonpost.com/politics/trump-fbi-feud-over-classified-memo-erupts-into-open-conflict/2018/01/31/64362038-06c2-11e8-b48c-b07fea957bd5_story.html?utm_term=.6d04d2eba7f0		2018-02-01 03:27:42.087684	2018-02-01 03:27:42.087684	\N	\N
19	Incentivizing young doctors to practise in underserved areas | CMAJ News	http://cmajnews.com/2018/01/31/incentivizing-young-doctors-to-practise-in-underserved-areas-cmaj-109-5563/		2018-02-01 02:40:22.975471	2018-02-01 02:57:35.81372	\N	\N
24	https://i.ytimg.com/vi/W-PBFMECvTE/maxresdefault.jpg	https://i.ytimg.com/vi/W-PBFMECvTE/maxresdefault.jpg		2018-02-01 03:35:09.830426	2018-02-01 03:35:09.830426	\N	\N
27	Romanelli, R. J., Nolting, L., Dolginsky, M., Kym, E., & Orrico, K. B. (2016). Dabigatran Versus Warfarin for Atrial Fibrillation in Real-World Clinical Practice. Circulation: Cardiovascular Quality and Outcomes, 9(2), 126–134. doi:10.1161/circoutcomes.115.002369\n	https://doi.org/10.1161/CIRCOUTCOMES.115.002369	10.1161/CIRCOUTCOMES.115.002369	2018-02-01 04:26:38.973048	2018-02-01 04:27:29.758439	\N	\N
28	Landing Zero Theme at BootstrapZero	https://www.bootstrapzero.com/bootstrap-template/landing-zero-free-bootstrap-theme		2018-02-01 04:27:29.801076	2018-02-01 04:27:29.801076	\N	\N
33	Dwyer, C., Damodaran, O., Heckelmann, M., & Sheridan, M. (2015). What neurosurgeons need to know about dabigatran etexilate (pradax®/pradaxa®/prazaxa®). Asian Journal of Neurosurgery, 10(2), 66. doi:10.4103/1793-5482.144156\n	https://doi.org/10.4103/1793-5482.144156	10.4103/1793-5482.144156	2018-02-01 07:39:02.231869	2018-02-02 21:03:43.618539	\N	\N
20	Yao, X., Abraham, N. S., Sangaralingham, L. R., Bellolio, M. F., McBane, R. D., Shah, N. D., & Noseworthy, P. A. (2016). Effectiveness and Safety of Dabigatran, Rivaroxaban, and Apixaban Versus Warfarin in Nonvalvular Atrial Fibrillation. Journal of the American Heart Association, 5(6), e003725. doi:10.1161/jaha.116.003725\n	https://doi.org/10.1161/JAHA.116.003725	10.1161/JAHA.116.003725	2018-02-01 02:41:24.115909	2018-02-01 03:56:29.0519	\N	\N
14	Korenstra, J., Wijtvliet, E. P. J., Veeger, N. J. G. M., Geluk, C. A., Bartels, G. L., Posma, J. L., … Tieleman, R. G. (2016). Effectiveness and safety of dabigatran versus acenocoumarol in “real-world” patients with atrial fibrillation. Europace, 18(9), 1319–1327. doi:10.1093/europace/euv397\n	https://doi.org/10.1093/europace/euv397	10.1093/europace/euv397	2018-02-01 01:54:33.481123	2018-02-01 03:58:16.480958	\N	\N
18	Abraham, N. S., Singh, S., Alexander, G. C., Heien, H., Haas, L. R., Crown, W., & Shah, N. D. (2015). Comparative risk of gastrointestinal bleeding with dabigatran, rivaroxaban, and warfarin: population based cohort study. BMJ, 350(apr24 2), h1857–h1857. doi:10.1136/bmj.h1857\n	https://doi.org/10.1136/bmj.h1857	10.1136/bmj.h1857	2018-02-01 02:22:26.851406	2018-02-01 03:58:16.490243	\N	\N
34	CodeCore Bootcamp - Learn Web Development	http://www.codecore.ca		2018-02-01 07:39:02.332443	2018-02-02 21:03:43.622046	\N	\N
8	gfdgdfsgdfgsdfgffddgf			2018-01-31 00:47:33.915234	2018-01-31 00:47:33.915234	Post	1
1	The Official Pokémon Website | Pokemon.com | \n  \n    Explore the World of Pokémon\n  \n	https://www.pokemon.com/us/		2018-01-30 22:57:14.078908	2018-02-03 18:45:07.724835	Post	1
36	    Imgur: The magic of the Internet\n	http://www.imgur.com		2018-02-03 01:29:29.856803	2018-02-03 06:35:25.828337	\N	\N
4	\N	\N	abc	2018-01-31 00:11:50.646244	2018-01-31 00:11:50.646244	Post	88
7	dfgdfsggdfaggadfgfda		fgfdgfdgresddsd	2018-01-31 00:47:18.934863	2018-01-31 00:47:33.912487	Post	70
2	abc one two three			2018-01-30 22:57:25.654334	2018-02-03 18:45:07.732109	Post	80
3	123	\N	\N	2018-01-31 00:11:43.060233	2018-01-31 00:11:43.060233	Post	81
39	123			2018-02-04 09:13:40.072202	2018-02-04 09:13:40.072202	Post	57
57	Honig, L. S., Vellas, B., Woodward, M., Boada, M., Bullock, R., Borrie, M., … Siemers, E. (2018). Trial of Solanezumab for Mild Dementia Due to Alzheimer’s Disease. New England Journal of Medicine, 378(4), 321–330. doi:10.1056/nejmoa1705971\n	https://doi.org/10.1056/NEJMoa1705971	10.1056/NEJMoa1705971	2018-02-07 02:26:01.67545	2018-02-07 02:26:01.67545	Post	3
50	abcdef			2018-02-04 17:31:18.867469	2018-02-04 17:31:40.338706	Medium	58
51	123456			2018-02-04 17:31:18.870999	2018-02-04 17:31:40.343535	Medium	58
52	Incentivizing young doctors to practise in underserved areas | CMAJ News	http://cmajnews.com/2018/01/31/incentivizing-young-doctors-to-practise-in-underserved-areas-cmaj-109-5563/		2018-02-04 17:33:45.032179	2018-02-04 17:33:45.032179	Post	211
56	fgdhgffshgfhgsh			2018-02-04 19:29:02.245408	2018-02-04 19:29:02.245408	Medium	57
5	Quebec medical residents threaten strike over hours and pay | CMAJ News	http://cmajnews.com/2018/02/06/quebec-medical-residents-threaten-strike-over-hours-and-pay-cmaj-109-5570/		2018-01-31 00:46:17.789421	2018-02-07 02:25:02.59146	Post	3
59	abc			2018-02-08 01:21:46.232903	2018-02-08 01:21:46.232903	Post	214
60	def			2018-02-08 01:21:46.237448	2018-02-08 01:21:46.237448	Post	214
62	abc			2018-02-08 05:06:35.310295	2018-02-08 05:07:57.079425	Post	219
63	123			2018-02-08 05:06:35.322119	2018-02-08 05:07:57.092631	Post	219
66	Beel, A. J., Demos, D. S., Chung, A., Liao, C., & Lui, N. S. (2018). Ground-glass opacity heralding invasive lung adenocarcinoma with prodromal dermatomyositis: a case report. Journal of Cardiothoracic Surgery, 13(1). doi:10.1186/s13019-018-0705-x\n	https://doi.org/10.1186/s13019-018-0705-x	10.1186/s13019-018-0705-x	2018-02-08 19:08:15.200173	2018-02-08 19:08:15.200173	Post	54
68	CodeCore Bootcamp - Learn Web Development	http://www.codecore.ca		2018-02-10 02:26:42.441887	2018-02-10 02:26:42.441887	Post	220
69	How to use Asthma inhalers properly | Inhaler Videos | MDI | DPI	http://www.use-inhalers.com		2018-02-13 22:32:48.61158	2018-02-13 22:32:48.61158	Post	221
70	How to use Asthma inhalers properly | Inhaler Videos | MDI | DPI	http://www.use-inhalers.com/		2018-02-13 22:40:37.367488	2018-02-13 22:40:37.367488	Medium	62
71	Utah Asthma ProgramUtah Asthma Program	http://health.utah.gov/asthma/		2018-02-13 23:33:32.720714	2018-02-13 23:33:32.720714	Medium	64
72	Padma, V., Anand, N., Gurukul, S. M. G. S., Javid, S. M. A. S. M., Prasad, A., & Arun, S. (2015). Health problems and stress in Information Technology and Business Process Outsourcing employees. Journal of Pharmacy and Bioallied Sciences, 7(5), 9. doi:10.4103/0975-7406.155764\n	https://doi.org/10.4103/0975-7406.155764	10.4103/0975-7406.155764	2018-02-13 23:40:30.46436	2018-02-13 23:40:30.46436	Post	222
84	Celiac Disease, Non-Celiac Gluten Sensitivity or Wheat Allergy: What is the Difference? - The Gluten Intolerance Group of North America	https://www.gluten.org/resources/getting-started/celiac-disease-non-celiac-sensitivity-or-wheat-allergy-what-is-the-difference/		2018-02-15 04:46:02.611104	2018-02-15 04:46:02.611104	Post	225
85	Wheat Allergy | Food Allergy Research & Education	https://www.foodallergy.org/common-allergens/wheat		2018-02-15 04:46:02.621878	2018-02-15 04:46:02.621878	Post	225
86	Food Allergy | NIH: National Institute of Allergy and Infectious Diseases	https://www.niaid.nih.gov/diseases-conditions/food-allergy		2018-02-15 04:46:02.624992	2018-02-15 04:46:02.624992	Post	225
87	Food Allergy | Anaphylaxis | Food Allergies | MedlinePlus	https://medlineplus.gov/foodallergy.html		2018-02-15 04:46:02.629605	2018-02-15 04:46:02.629605	Post	225
75	Padma, V., Anand, N., Gurukul, S. M. G. S., Javid, S. M. A. S. M., Prasad, A., & Arun, S. (2015). Health problems and stress in Information Technology and Business Process Outsourcing employees. Journal of Pharmacy and Bioallied Sciences, 7(5), 9. doi:10.4103/0975-7406.155764\n	https://doi.org/10.4103/0975-7406.155764	10.4103/0975-7406.155764	2018-02-13 23:44:57.694204	2018-02-13 23:44:57.694204	Medium	65
74	Marmot, M., Bosma, H., Hemingway, H., Brunner, E., & Stansfeld, S. (1997). Contribution of job control and other risk factors to social variations in coronary heart disease incidence. The Lancet, 350(9073), 235–239. doi:10.1016/s0140-6736(97)04244-x\n	https://doi.org/10.1016/S0140-6736(97)04244-X	10.1016/S0140-6736(97)04244-X	2018-02-13 23:40:30.520347	2018-02-15 05:45:22.006959	Post	222
78	Dekkers, O. M., Egger, M., Altman, D. G., & Vandenbroucke, J. P. (2012). Distinguishing Case Series From Cohort Studies. Annals of Internal Medicine, 156(1_Part_1), 37. doi:10.7326/0003-4819-156-1-201201030-00006\n	https://doi.org/10.7326/0003-4819-156-1-201201030-00006	10.7326/0003-4819-156-1-201201030-00006	2018-02-14 00:36:06.914137	2018-02-14 00:36:06.914137	Post	223
79	Diabetes Canada	http://www.diabetes.ca		2018-02-15 01:31:27.541724	2018-02-15 01:32:54.785436	Post	224
80	Type 2 Diabetes Patient Information | Novo Nordisk	https://www.novonordisk.com/patients/diabetes-care/type-2.html		2018-02-15 01:31:27.564551	2018-02-15 01:32:54.794667	Post	224
73	Rosengren, A., Hawken, S., Ôunpuu, S., Sliwa, K., Zubaid, M., Almahmeed, W. A., … Yusuf, S. (2004). Association of psychosocial risk factors with risk of acute myocardial infarction in 11 119 cases and 13 648 controls from 52 countries (the INTERHEART study): case-control study. The Lancet, 364(9438), 953–962. doi:10.1016/s0140-6736(04)17019-0\n	https://doi.org/10.1016/S0140-6736(04)17019-0	10.1016/S0140-6736(04)17019-0	2018-02-13 23:40:30.466377	2018-02-15 05:45:22.01386	Post	222
81	Diabetes Canada	http://www.diabetes.ca		2018-02-15 01:48:16.151295	2018-02-15 01:48:16.151295	Post	59
82	Self-Injecting | Novo Nordisk	https://www.novonordisk.com/patients/diabetes-care/pens--needles-and-injection-support/self-injecting.html		2018-02-15 01:48:16.15666	2018-02-15 01:48:16.15666	Post	59
83	Source video on novopen injection on YouTube	https://www.youtube.com/watch?v=cMjV9u6bfcM		2018-02-15 01:48:16.158606	2018-02-15 01:49:39.336256	Post	59
90	Price, D., Bosnic-Anticevich, S., Briggs, A., Chrystyn, H., Rand, C., Scheuch, G., & Bousquet, J. (2013). Inhaler competence in asthma: Common errors, barriers to use and recommended solutions. Respiratory Medicine, 107(1), 37–46. doi:10.1016/j.rmed.2012.09.017\n	https://doi.org/10.1016/j.rmed.2012.09.017	10.1016/j.rmed.2012.09.017	2018-02-15 20:33:36.762716	2018-02-15 20:35:35.688375	Post	226
76	Griffiths, E. A., Macaulay, R., Vadlamudi, N. K., Uddin, J., & Samuels, E. R. (2017). The Role of Noncomparative Evidence in Health Technology Assessment Decisions. Value in Health, 20(10), 1245–1251. doi:10.1016/j.jval.2017.06.015\n	https://doi.org/10.1016/j.jval.2017.06.015	10.1016/j.jval.2017.06.015	2018-02-14 00:36:06.891605	2018-02-15 23:25:33.634344	Post	223
88	Top 10 Inhaler Mistakes Adults Make | National Jewish Health	https://www.nationaljewish.org/health-insights/health-infographics/top-10-inhaler-mistakes-adults-make		2018-02-15 20:33:36.716998	2018-02-15 20:34:33.779558	Post	226
89	Using your inhalers | Asthma UK	https://www.asthma.org.uk/advice/inhalers-medicines-treatments/using-inhalers/		2018-02-15 20:33:36.759643	2018-02-15 20:34:33.787991	Post	226
77	Milne, C.-P., Cohen, J. P., Felix, A., & Chakravarthy, R. (2015). Impact of Postapproval Evidence Generation on the Biopharmaceutical Industry. Clinical Therapeutics, 37(8), 1852–1858. doi:10.1016/j.clinthera.2015.05.514\n	https://doi.org/10.1016/j.clinthera.2015.05.514	10.1016/j.clinthera.2015.05.514	2018-02-14 00:36:06.904994	2018-02-15 23:25:33.660603	Post	223
92	Khan, A., Faucett, J., Lichtenberg, P., Kirsch, I., & Brown, W. A. (2012). A Systematic Review of Comparative Efficacy of Treatments and Controls for Depression. PLoS ONE, 7(7), e41778. doi:10.1371/journal.pone.0041778\n	https://doi.org/10.1371/journal.pone.0041778	10.1371/journal.pone.0041778	2018-02-15 23:56:39.635104	2018-02-15 23:56:39.635104	Post	227
91	        Depression (major depressive disorder) - Diagnosis and treatment - Mayo Clinic	https://www.mayoclinic.org/diseases-conditions/depression/diagnosis-treatment/drc-20356013		2018-02-15 23:56:39.629309	2018-02-16 03:22:22.261542	Post	227
93	Mead, G. E., Morley, W., Campbell, P., Greig, C. A., McMurdo, M., & Lawlor, D. A. (2009). Exercise for depression. Cochrane Database of Systematic Reviews. doi:10.1002/14651858.cd004366.pub4\n	https://doi.org/10.1002/14651858.CD004366.pub4	10.1002/14651858.CD004366.pub4	2018-02-16 00:05:40.318152	2018-02-16 00:05:40.318152	Post	227
94	Smith, C. A., Hay, P. P., & MacPherson, H. (2010). Acupuncture for depression. Cochrane Database of Systematic Reviews. doi:10.1002/14651858.cd004046.pub3\n	https://doi.org/10.1002/14651858.CD004046.pub3	10.1002/14651858.CD004046.pub3	2018-02-16 00:05:40.323775	2018-02-16 00:05:40.323775	Post	227
\.


--
-- Data for Name: relationships; Type: TABLE DATA; Schema: public; Owner: jacklee
--

COPY relationships (id, follower_id, followed_id, created_at, updated_at) FROM stdin;
427	70	24	2018-02-07 02:04:25.090713	2018-02-07 02:04:25.090713
428	61	24	2018-02-07 02:04:25.111362	2018-02-07 02:04:25.111362
429	47	24	2018-02-07 02:04:25.123065	2018-02-07 02:04:25.123065
430	72	24	2018-02-07 02:04:25.132462	2018-02-07 02:04:25.132462
431	37	24	2018-02-07 02:04:25.140515	2018-02-07 02:04:25.140515
432	67	24	2018-02-07 02:04:25.148637	2018-02-07 02:04:25.148637
433	74	24	2018-02-07 02:04:25.156496	2018-02-07 02:04:25.156496
434	75	24	2018-02-07 02:04:25.164128	2018-02-07 02:04:25.164128
435	31	24	2018-02-07 02:04:25.172415	2018-02-07 02:04:25.172415
436	51	24	2018-02-07 02:04:25.183006	2018-02-07 02:04:25.183006
437	16	24	2018-02-07 02:04:25.192989	2018-02-07 02:04:25.192989
438	9	24	2018-02-07 02:04:25.200897	2018-02-07 02:04:25.200897
439	50	24	2018-02-07 02:04:25.209428	2018-02-07 02:04:25.209428
440	71	24	2018-02-07 02:04:25.218311	2018-02-07 02:04:25.218311
441	43	24	2018-02-07 02:04:25.224994	2018-02-07 02:04:25.224994
1200	6	50	2018-02-07 03:47:00.317208	2018-02-07 03:47:00.317208
1246	6	7	2018-02-07 06:59:02.109746	2018-02-07 06:59:02.109746
1259	7	77	2018-02-10 02:16:24.727768	2018-02-10 02:16:24.727768
1260	7	62	2018-02-13 20:37:26.261466	2018-02-13 20:37:26.261466
442	58	24	2018-02-07 02:04:25.231623	2018-02-07 02:04:25.231623
443	12	23	2018-02-07 02:04:25.239593	2018-02-07 02:04:25.239593
444	31	23	2018-02-07 02:04:25.246599	2018-02-07 02:04:25.246599
445	54	23	2018-02-07 02:04:25.254364	2018-02-07 02:04:25.254364
446	62	23	2018-02-07 02:04:25.263077	2018-02-07 02:04:25.263077
447	33	23	2018-02-07 02:04:25.270756	2018-02-07 02:04:25.270756
448	35	23	2018-02-07 02:04:25.279329	2018-02-07 02:04:25.279329
449	39	23	2018-02-07 02:04:25.287079	2018-02-07 02:04:25.287079
450	60	23	2018-02-07 02:04:25.295608	2018-02-07 02:04:25.295608
451	19	23	2018-02-07 02:04:25.30313	2018-02-07 02:04:25.30313
452	24	23	2018-02-07 02:04:25.311456	2018-02-07 02:04:25.311456
453	41	23	2018-02-07 02:04:25.320914	2018-02-07 02:04:25.320914
454	9	23	2018-02-07 02:04:25.327784	2018-02-07 02:04:25.327784
455	18	23	2018-02-07 02:04:25.33663	2018-02-07 02:04:25.33663
456	25	23	2018-02-07 02:04:25.344059	2018-02-07 02:04:25.344059
457	64	23	2018-02-07 02:04:25.351632	2018-02-07 02:04:25.351632
458	42	23	2018-02-07 02:04:25.359902	2018-02-07 02:04:25.359902
459	70	23	2018-02-07 02:04:25.366975	2018-02-07 02:04:25.366975
460	56	23	2018-02-07 02:04:25.375018	2018-02-07 02:04:25.375018
461	54	14	2018-02-07 02:04:25.382232	2018-02-07 02:04:25.382232
462	41	14	2018-02-07 02:04:25.389501	2018-02-07 02:04:25.389501
463	59	13	2018-02-07 02:04:25.398558	2018-02-07 02:04:25.398558
464	45	13	2018-02-07 02:04:25.406095	2018-02-07 02:04:25.406095
465	38	13	2018-02-07 02:04:25.41419	2018-02-07 02:04:25.41419
466	35	13	2018-02-07 02:04:25.419155	2018-02-07 02:04:25.419155
467	39	13	2018-02-07 02:04:25.427294	2018-02-07 02:04:25.427294
468	16	13	2018-02-07 02:04:25.434185	2018-02-07 02:04:25.434185
469	12	13	2018-02-07 02:04:25.441611	2018-02-07 02:04:25.441611
470	22	13	2018-02-07 02:04:25.450903	2018-02-07 02:04:25.450903
471	1	13	2018-02-07 02:04:25.458722	2018-02-07 02:04:25.458722
472	6	13	2018-02-07 02:04:25.466988	2018-02-07 02:04:25.466988
473	58	13	2018-02-07 02:04:25.474075	2018-02-07 02:04:25.474075
474	68	13	2018-02-07 02:04:25.481868	2018-02-07 02:04:25.481868
475	64	26	2018-02-07 02:04:25.489074	2018-02-07 02:04:25.489074
476	43	26	2018-02-07 02:04:25.496277	2018-02-07 02:04:25.496277
477	29	26	2018-02-07 02:04:25.503845	2018-02-07 02:04:25.503845
478	49	26	2018-02-07 02:04:25.51198	2018-02-07 02:04:25.51198
479	9	26	2018-02-07 02:04:25.519199	2018-02-07 02:04:25.519199
480	34	26	2018-02-07 02:04:25.527112	2018-02-07 02:04:25.527112
481	61	26	2018-02-07 02:04:25.534143	2018-02-07 02:04:25.534143
482	18	26	2018-02-07 02:04:25.541215	2018-02-07 02:04:25.541215
483	30	26	2018-02-07 02:04:25.549134	2018-02-07 02:04:25.549134
484	72	26	2018-02-07 02:04:25.556131	2018-02-07 02:04:25.556131
485	32	26	2018-02-07 02:04:25.563877	2018-02-07 02:04:25.563877
486	56	26	2018-02-07 02:04:25.570952	2018-02-07 02:04:25.570952
487	77	8	2018-02-07 02:04:25.579279	2018-02-07 02:04:25.579279
488	56	8	2018-02-07 02:04:25.586462	2018-02-07 02:04:25.586462
489	62	8	2018-02-07 02:04:25.594305	2018-02-07 02:04:25.594305
490	16	8	2018-02-07 02:04:25.60135	2018-02-07 02:04:25.60135
491	23	8	2018-02-07 02:04:25.609553	2018-02-07 02:04:25.609553
492	75	8	2018-02-07 02:04:25.616547	2018-02-07 02:04:25.616547
493	58	8	2018-02-07 02:04:25.623602	2018-02-07 02:04:25.623602
494	9	8	2018-02-07 02:04:25.632021	2018-02-07 02:04:25.632021
495	14	8	2018-02-07 02:04:25.639814	2018-02-07 02:04:25.639814
496	36	8	2018-02-07 02:04:25.64814	2018-02-07 02:04:25.64814
497	18	8	2018-02-07 02:04:25.655783	2018-02-07 02:04:25.655783
498	48	10	2018-02-07 02:04:25.664033	2018-02-07 02:04:25.664033
499	36	10	2018-02-07 02:04:25.671941	2018-02-07 02:04:25.671941
500	42	10	2018-02-07 02:04:25.680222	2018-02-07 02:04:25.680222
501	32	10	2018-02-07 02:04:25.687536	2018-02-07 02:04:25.687536
502	76	10	2018-02-07 02:04:25.697612	2018-02-07 02:04:25.697612
503	49	10	2018-02-07 02:04:25.707537	2018-02-07 02:04:25.707537
504	1	10	2018-02-07 02:04:25.722266	2018-02-07 02:04:25.722266
505	28	10	2018-02-07 02:04:25.729842	2018-02-07 02:04:25.729842
506	72	10	2018-02-07 02:04:25.736816	2018-02-07 02:04:25.736816
507	30	10	2018-02-07 02:04:25.743815	2018-02-07 02:04:25.743815
508	64	11	2018-02-07 02:04:25.755656	2018-02-07 02:04:25.755656
509	15	11	2018-02-07 02:04:25.767054	2018-02-07 02:04:25.767054
510	50	11	2018-02-07 02:04:25.776219	2018-02-07 02:04:25.776219
511	20	11	2018-02-07 02:04:25.784579	2018-02-07 02:04:25.784579
512	54	11	2018-02-07 02:04:25.792407	2018-02-07 02:04:25.792407
513	25	11	2018-02-07 02:04:25.799398	2018-02-07 02:04:25.799398
514	73	11	2018-02-07 02:04:25.806965	2018-02-07 02:04:25.806965
515	75	11	2018-02-07 02:04:25.814128	2018-02-07 02:04:25.814128
516	75	12	2018-02-07 02:04:25.821161	2018-02-07 02:04:25.821161
517	15	12	2018-02-07 02:04:25.828837	2018-02-07 02:04:25.828837
518	30	12	2018-02-07 02:04:25.836095	2018-02-07 02:04:25.836095
519	72	12	2018-02-07 02:04:25.843901	2018-02-07 02:04:25.843901
520	27	12	2018-02-07 02:04:25.85157	2018-02-07 02:04:25.85157
521	45	12	2018-02-07 02:04:25.858585	2018-02-07 02:04:25.858585
522	56	12	2018-02-07 02:04:25.86562	2018-02-07 02:04:25.86562
523	16	12	2018-02-07 02:04:25.87249	2018-02-07 02:04:25.87249
524	11	12	2018-02-07 02:04:25.879785	2018-02-07 02:04:25.879785
525	29	12	2018-02-07 02:04:25.886674	2018-02-07 02:04:25.886674
526	2	12	2018-02-07 02:04:25.893982	2018-02-07 02:04:25.893982
1208	6	25	2018-02-07 03:54:28.198618	2018-02-07 03:54:28.198618
1209	6	20	2018-02-07 03:56:24.727251	2018-02-07 03:56:24.727251
1220	6	57	2018-02-07 06:03:53.532022	2018-02-07 06:03:53.532022
1261	3	7	2018-02-15 00:06:06.157099	2018-02-15 00:06:06.157099
1262	7	1	2018-02-15 04:54:47.623024	2018-02-15 04:54:47.623024
1263	1	7	2018-02-15 05:18:29.13381	2018-02-15 05:18:29.13381
527	27	28	2018-02-07 02:04:25.901616	2018-02-07 02:04:25.901616
528	14	28	2018-02-07 02:04:25.909014	2018-02-07 02:04:25.909014
529	39	28	2018-02-07 02:04:25.916049	2018-02-07 02:04:25.916049
530	26	28	2018-02-07 02:04:25.92407	2018-02-07 02:04:25.92407
531	57	15	2018-02-07 02:04:25.932456	2018-02-07 02:04:25.932456
532	35	15	2018-02-07 02:04:25.941394	2018-02-07 02:04:25.941394
533	63	15	2018-02-07 02:04:25.949727	2018-02-07 02:04:25.949727
534	62	15	2018-02-07 02:04:25.956385	2018-02-07 02:04:25.956385
535	9	15	2018-02-07 02:04:25.963143	2018-02-07 02:04:25.963143
536	23	15	2018-02-07 02:04:25.969846	2018-02-07 02:04:25.969846
537	8	15	2018-02-07 02:04:25.977311	2018-02-07 02:04:25.977311
538	59	15	2018-02-07 02:04:25.984169	2018-02-07 02:04:25.984169
539	17	27	2018-02-07 02:04:25.992169	2018-02-07 02:04:25.992169
540	2	27	2018-02-07 02:04:25.999196	2018-02-07 02:04:25.999196
541	11	27	2018-02-07 02:04:26.005947	2018-02-07 02:04:26.005947
542	46	27	2018-02-07 02:04:26.013774	2018-02-07 02:04:26.013774
543	55	27	2018-02-07 02:04:26.02127	2018-02-07 02:04:26.02127
544	56	27	2018-02-07 02:04:26.028463	2018-02-07 02:04:26.028463
545	7	27	2018-02-07 02:04:26.035878	2018-02-07 02:04:26.035878
546	6	27	2018-02-07 02:04:26.045705	2018-02-07 02:04:26.045705
547	50	27	2018-02-07 02:04:26.052675	2018-02-07 02:04:26.052675
548	24	27	2018-02-07 02:04:26.060159	2018-02-07 02:04:26.060159
549	47	27	2018-02-07 02:04:26.066811	2018-02-07 02:04:26.066811
550	74	27	2018-02-07 02:04:26.073958	2018-02-07 02:04:26.073958
551	19	27	2018-02-07 02:04:26.080873	2018-02-07 02:04:26.080873
552	73	27	2018-02-07 02:04:26.087763	2018-02-07 02:04:26.087763
553	12	27	2018-02-07 02:04:26.094584	2018-02-07 02:04:26.094584
554	75	27	2018-02-07 02:04:26.101661	2018-02-07 02:04:26.101661
555	71	17	2018-02-07 02:04:26.108997	2018-02-07 02:04:26.108997
556	43	17	2018-02-07 02:04:26.116068	2018-02-07 02:04:26.116068
557	35	17	2018-02-07 02:04:26.122797	2018-02-07 02:04:26.122797
558	69	17	2018-02-07 02:04:26.130922	2018-02-07 02:04:26.130922
559	25	17	2018-02-07 02:04:26.137718	2018-02-07 02:04:26.137718
560	40	18	2018-02-07 02:04:26.145904	2018-02-07 02:04:26.145904
561	23	18	2018-02-07 02:04:26.15268	2018-02-07 02:04:26.15268
562	9	18	2018-02-07 02:04:26.160343	2018-02-07 02:04:26.160343
563	12	18	2018-02-07 02:04:26.167149	2018-02-07 02:04:26.167149
564	67	18	2018-02-07 02:04:26.174099	2018-02-07 02:04:26.174099
565	63	18	2018-02-07 02:04:26.181388	2018-02-07 02:04:26.181388
566	43	18	2018-02-07 02:04:26.193322	2018-02-07 02:04:26.193322
567	74	18	2018-02-07 02:04:26.203254	2018-02-07 02:04:26.203254
568	6	18	2018-02-07 02:04:26.21194	2018-02-07 02:04:26.21194
569	32	18	2018-02-07 02:04:26.218816	2018-02-07 02:04:26.218816
570	19	18	2018-02-07 02:04:26.226541	2018-02-07 02:04:26.226541
571	41	18	2018-02-07 02:04:26.233638	2018-02-07 02:04:26.233638
572	39	18	2018-02-07 02:04:26.240752	2018-02-07 02:04:26.240752
573	21	19	2018-02-07 02:04:26.249223	2018-02-07 02:04:26.249223
574	53	19	2018-02-07 02:04:26.256653	2018-02-07 02:04:26.256653
575	44	19	2018-02-07 02:04:26.264393	2018-02-07 02:04:26.264393
576	36	19	2018-02-07 02:04:26.271313	2018-02-07 02:04:26.271313
577	73	19	2018-02-07 02:04:26.278518	2018-02-07 02:04:26.278518
578	1	19	2018-02-07 02:04:26.285536	2018-02-07 02:04:26.285536
579	17	19	2018-02-07 02:04:26.292384	2018-02-07 02:04:26.292384
580	61	19	2018-02-07 02:04:26.299249	2018-02-07 02:04:26.299249
581	65	19	2018-02-07 02:04:26.306602	2018-02-07 02:04:26.306602
582	23	19	2018-02-07 02:04:26.313629	2018-02-07 02:04:26.313629
583	32	19	2018-02-07 02:04:26.320762	2018-02-07 02:04:26.320762
584	66	19	2018-02-07 02:04:26.329111	2018-02-07 02:04:26.329111
585	56	19	2018-02-07 02:04:26.335816	2018-02-07 02:04:26.335816
586	40	19	2018-02-07 02:04:26.343223	2018-02-07 02:04:26.343223
587	59	20	2018-02-07 02:04:26.350809	2018-02-07 02:04:26.350809
588	3	20	2018-02-07 02:04:26.358393	2018-02-07 02:04:26.358393
589	48	20	2018-02-07 02:04:26.365386	2018-02-07 02:04:26.365386
590	73	20	2018-02-07 02:04:26.373756	2018-02-07 02:04:26.373756
591	25	20	2018-02-07 02:04:26.381028	2018-02-07 02:04:26.381028
592	56	20	2018-02-07 02:04:26.387719	2018-02-07 02:04:26.387719
593	75	20	2018-02-07 02:04:26.394459	2018-02-07 02:04:26.394459
594	32	20	2018-02-07 02:04:26.401723	2018-02-07 02:04:26.401723
595	46	20	2018-02-07 02:04:26.408594	2018-02-07 02:04:26.408594
596	58	20	2018-02-07 02:04:26.415337	2018-02-07 02:04:26.415337
597	13	20	2018-02-07 02:04:26.422284	2018-02-07 02:04:26.422284
598	12	20	2018-02-07 02:04:26.429722	2018-02-07 02:04:26.429722
600	21	20	2018-02-07 02:04:26.444425	2018-02-07 02:04:26.444425
601	63	20	2018-02-07 02:04:26.451826	2018-02-07 02:04:26.451826
602	7	20	2018-02-07 02:04:26.459141	2018-02-07 02:04:26.459141
603	25	21	2018-02-07 02:04:26.466716	2018-02-07 02:04:26.466716
604	32	21	2018-02-07 02:04:26.473354	2018-02-07 02:04:26.473354
605	48	21	2018-02-07 02:04:26.480184	2018-02-07 02:04:26.480184
606	36	21	2018-02-07 02:04:26.486886	2018-02-07 02:04:26.486886
607	73	21	2018-02-07 02:04:26.496773	2018-02-07 02:04:26.496773
608	41	21	2018-02-07 02:04:26.507891	2018-02-07 02:04:26.507891
609	16	21	2018-02-07 02:04:26.520631	2018-02-07 02:04:26.520631
610	2	21	2018-02-07 02:04:26.530842	2018-02-07 02:04:26.530842
611	74	21	2018-02-07 02:04:26.538993	2018-02-07 02:04:26.538993
612	38	21	2018-02-07 02:04:26.550476	2018-02-07 02:04:26.550476
613	71	21	2018-02-07 02:04:26.558081	2018-02-07 02:04:26.558081
614	75	21	2018-02-07 02:04:26.565292	2018-02-07 02:04:26.565292
615	23	21	2018-02-07 02:04:26.571656	2018-02-07 02:04:26.571656
616	57	21	2018-02-07 02:04:26.578166	2018-02-07 02:04:26.578166
617	64	21	2018-02-07 02:04:26.585104	2018-02-07 02:04:26.585104
618	24	21	2018-02-07 02:04:26.592744	2018-02-07 02:04:26.592744
619	26	21	2018-02-07 02:04:26.599519	2018-02-07 02:04:26.599519
620	12	22	2018-02-07 02:04:26.606908	2018-02-07 02:04:26.606908
621	54	22	2018-02-07 02:04:26.613833	2018-02-07 02:04:26.613833
622	29	22	2018-02-07 02:04:26.620621	2018-02-07 02:04:26.620621
623	76	22	2018-02-07 02:04:26.627421	2018-02-07 02:04:26.627421
624	30	22	2018-02-07 02:04:26.634174	2018-02-07 02:04:26.634174
625	72	22	2018-02-07 02:04:26.641333	2018-02-07 02:04:26.641333
626	53	22	2018-02-07 02:04:26.648313	2018-02-07 02:04:26.648313
627	65	22	2018-02-07 02:04:26.655173	2018-02-07 02:04:26.655173
628	11	22	2018-02-07 02:04:26.662156	2018-02-07 02:04:26.662156
629	48	22	2018-02-07 02:04:26.66933	2018-02-07 02:04:26.66933
630	20	22	2018-02-07 02:04:26.677029	2018-02-07 02:04:26.677029
631	21	22	2018-02-07 02:04:26.683795	2018-02-07 02:04:26.683795
632	24	22	2018-02-07 02:04:26.690917	2018-02-07 02:04:26.690917
633	16	22	2018-02-07 02:04:26.701611	2018-02-07 02:04:26.701611
634	47	22	2018-02-07 02:04:26.709343	2018-02-07 02:04:26.709343
635	49	22	2018-02-07 02:04:26.716184	2018-02-07 02:04:26.716184
636	42	36	2018-02-07 02:04:26.723311	2018-02-07 02:04:26.723311
637	77	36	2018-02-07 02:04:26.730487	2018-02-07 02:04:26.730487
638	6	36	2018-02-07 02:04:26.737266	2018-02-07 02:04:26.737266
639	48	36	2018-02-07 02:04:26.744722	2018-02-07 02:04:26.744722
640	7	36	2018-02-07 02:04:26.751567	2018-02-07 02:04:26.751567
641	19	36	2018-02-07 02:04:26.758572	2018-02-07 02:04:26.758572
642	23	36	2018-02-07 02:04:26.776503	2018-02-07 02:04:26.776503
643	2	36	2018-02-07 02:04:26.786491	2018-02-07 02:04:26.786491
644	34	36	2018-02-07 02:04:26.797165	2018-02-07 02:04:26.797165
645	15	36	2018-02-07 02:04:26.805105	2018-02-07 02:04:26.805105
646	72	36	2018-02-07 02:04:26.812027	2018-02-07 02:04:26.812027
647	31	36	2018-02-07 02:04:26.818825	2018-02-07 02:04:26.818825
648	30	36	2018-02-07 02:04:26.826116	2018-02-07 02:04:26.826116
649	66	36	2018-02-07 02:04:26.833043	2018-02-07 02:04:26.833043
650	36	37	2018-02-07 02:04:26.840247	2018-02-07 02:04:26.840247
651	74	37	2018-02-07 02:04:26.847038	2018-02-07 02:04:26.847038
652	2	37	2018-02-07 02:04:26.853925	2018-02-07 02:04:26.853925
653	75	37	2018-02-07 02:04:26.863575	2018-02-07 02:04:26.863575
654	10	37	2018-02-07 02:04:26.871283	2018-02-07 02:04:26.871283
655	58	37	2018-02-07 02:04:26.878012	2018-02-07 02:04:26.878012
656	13	37	2018-02-07 02:04:26.885017	2018-02-07 02:04:26.885017
657	73	37	2018-02-07 02:04:26.892576	2018-02-07 02:04:26.892576
658	50	37	2018-02-07 02:04:26.899793	2018-02-07 02:04:26.899793
659	69	37	2018-02-07 02:04:26.907116	2018-02-07 02:04:26.907116
660	55	37	2018-02-07 02:04:26.920144	2018-02-07 02:04:26.920144
661	29	37	2018-02-07 02:04:26.927812	2018-02-07 02:04:26.927812
662	65	37	2018-02-07 02:04:26.93476	2018-02-07 02:04:26.93476
663	68	37	2018-02-07 02:04:26.941906	2018-02-07 02:04:26.941906
664	48	37	2018-02-07 02:04:26.949598	2018-02-07 02:04:26.949598
665	75	38	2018-02-07 02:04:26.956386	2018-02-07 02:04:26.956386
666	33	38	2018-02-07 02:04:26.963171	2018-02-07 02:04:26.963171
667	2	38	2018-02-07 02:04:26.970188	2018-02-07 02:04:26.970188
668	47	38	2018-02-07 02:04:26.977466	2018-02-07 02:04:26.977466
669	43	38	2018-02-07 02:04:26.98431	2018-02-07 02:04:26.98431
670	12	38	2018-02-07 02:04:26.99141	2018-02-07 02:04:26.99141
671	30	38	2018-02-07 02:04:26.998382	2018-02-07 02:04:26.998382
672	69	38	2018-02-07 02:04:27.00534	2018-02-07 02:04:27.00534
673	51	38	2018-02-07 02:04:27.012437	2018-02-07 02:04:27.012437
674	29	38	2018-02-07 02:04:27.01918	2018-02-07 02:04:27.01918
675	39	38	2018-02-07 02:04:27.026147	2018-02-07 02:04:27.026147
676	77	38	2018-02-07 02:04:27.032798	2018-02-07 02:04:27.032798
677	41	38	2018-02-07 02:04:27.039577	2018-02-07 02:04:27.039577
678	31	38	2018-02-07 02:04:27.046697	2018-02-07 02:04:27.046697
679	11	40	2018-02-07 02:04:27.054122	2018-02-07 02:04:27.054122
680	36	40	2018-02-07 02:04:27.061385	2018-02-07 02:04:27.061385
681	59	40	2018-02-07 02:04:27.068117	2018-02-07 02:04:27.068117
682	61	40	2018-02-07 02:04:27.080077	2018-02-07 02:04:27.080077
683	44	40	2018-02-07 02:04:27.090719	2018-02-07 02:04:27.090719
684	2	40	2018-02-07 02:04:27.100772	2018-02-07 02:04:27.100772
685	43	40	2018-02-07 02:04:27.114308	2018-02-07 02:04:27.114308
686	63	40	2018-02-07 02:04:27.122637	2018-02-07 02:04:27.122637
687	66	40	2018-02-07 02:04:27.129158	2018-02-07 02:04:27.129158
688	3	40	2018-02-07 02:04:27.135883	2018-02-07 02:04:27.135883
689	41	40	2018-02-07 02:04:27.14282	2018-02-07 02:04:27.14282
690	7	3	2018-02-07 02:04:27.150215	2018-02-07 02:04:27.150215
691	58	3	2018-02-07 02:04:27.158116	2018-02-07 02:04:27.158116
692	19	3	2018-02-07 02:04:27.165579	2018-02-07 02:04:27.165579
693	21	3	2018-02-07 02:04:27.172717	2018-02-07 02:04:27.172717
694	62	3	2018-02-07 02:04:27.180554	2018-02-07 02:04:27.180554
695	36	3	2018-02-07 02:04:27.188191	2018-02-07 02:04:27.188191
696	20	3	2018-02-07 02:04:27.195719	2018-02-07 02:04:27.195719
697	50	3	2018-02-07 02:04:27.202521	2018-02-07 02:04:27.202521
698	17	3	2018-02-07 02:04:27.209672	2018-02-07 02:04:27.209672
699	18	3	2018-02-07 02:04:27.216654	2018-02-07 02:04:27.216654
700	67	2	2018-02-07 02:04:27.223713	2018-02-07 02:04:27.223713
701	22	2	2018-02-07 02:04:27.230598	2018-02-07 02:04:27.230598
702	38	2	2018-02-07 02:04:27.237357	2018-02-07 02:04:27.237357
703	16	2	2018-02-07 02:04:27.244121	2018-02-07 02:04:27.244121
704	71	2	2018-02-07 02:04:27.251034	2018-02-07 02:04:27.251034
705	46	2	2018-02-07 02:04:27.257934	2018-02-07 02:04:27.257934
706	1	2	2018-02-07 02:04:27.264856	2018-02-07 02:04:27.264856
707	53	2	2018-02-07 02:04:27.271889	2018-02-07 02:04:27.271889
708	23	2	2018-02-07 02:04:27.278954	2018-02-07 02:04:27.278954
709	17	41	2018-02-07 02:04:27.285854	2018-02-07 02:04:27.285854
710	41	41	2018-02-07 02:04:27.293379	2018-02-07 02:04:27.293379
711	45	41	2018-02-07 02:04:27.305564	2018-02-07 02:04:27.305564
712	28	41	2018-02-07 02:04:27.31572	2018-02-07 02:04:27.31572
713	20	41	2018-02-07 02:04:27.323812	2018-02-07 02:04:27.323812
714	13	41	2018-02-07 02:04:27.331135	2018-02-07 02:04:27.331135
715	69	42	2018-02-07 02:04:27.338098	2018-02-07 02:04:27.338098
716	2	42	2018-02-07 02:04:27.345247	2018-02-07 02:04:27.345247
717	43	42	2018-02-07 02:04:27.352446	2018-02-07 02:04:27.352446
718	35	42	2018-02-07 02:04:27.359742	2018-02-07 02:04:27.359742
719	63	42	2018-02-07 02:04:27.366596	2018-02-07 02:04:27.366596
720	66	42	2018-02-07 02:04:27.373399	2018-02-07 02:04:27.373399
721	16	42	2018-02-07 02:04:27.380271	2018-02-07 02:04:27.380271
722	6	42	2018-02-07 02:04:27.386932	2018-02-07 02:04:27.386932
723	15	42	2018-02-07 02:04:27.394294	2018-02-07 02:04:27.394294
724	22	42	2018-02-07 02:04:27.401544	2018-02-07 02:04:27.401544
725	48	42	2018-02-07 02:04:27.408486	2018-02-07 02:04:27.408486
726	22	44	2018-02-07 02:04:27.415554	2018-02-07 02:04:27.415554
727	72	44	2018-02-07 02:04:27.422509	2018-02-07 02:04:27.422509
728	44	44	2018-02-07 02:04:27.429292	2018-02-07 02:04:27.429292
729	3	44	2018-02-07 02:04:27.441929	2018-02-07 02:04:27.441929
730	37	44	2018-02-07 02:04:27.454807	2018-02-07 02:04:27.454807
731	64	45	2018-02-07 02:04:27.464868	2018-02-07 02:04:27.464868
732	47	46	2018-02-07 02:04:27.475734	2018-02-07 02:04:27.475734
733	29	47	2018-02-07 02:04:27.487476	2018-02-07 02:04:27.487476
734	59	47	2018-02-07 02:04:27.497892	2018-02-07 02:04:27.497892
735	6	47	2018-02-07 02:04:27.507798	2018-02-07 02:04:27.507798
736	69	47	2018-02-07 02:04:27.516248	2018-02-07 02:04:27.516248
737	16	47	2018-02-07 02:04:27.523169	2018-02-07 02:04:27.523169
738	39	47	2018-02-07 02:04:27.529776	2018-02-07 02:04:27.529776
739	44	47	2018-02-07 02:04:27.536619	2018-02-07 02:04:27.536619
740	49	47	2018-02-07 02:04:27.543968	2018-02-07 02:04:27.543968
741	71	47	2018-02-07 02:04:27.550694	2018-02-07 02:04:27.550694
742	32	47	2018-02-07 02:04:27.558255	2018-02-07 02:04:27.558255
743	47	47	2018-02-07 02:04:27.565022	2018-02-07 02:04:27.565022
744	3	47	2018-02-07 02:04:27.571793	2018-02-07 02:04:27.571793
745	46	47	2018-02-07 02:04:27.578574	2018-02-07 02:04:27.578574
746	53	48	2018-02-07 02:04:27.585557	2018-02-07 02:04:27.585557
747	9	48	2018-02-07 02:04:27.592404	2018-02-07 02:04:27.592404
748	29	48	2018-02-07 02:04:27.599247	2018-02-07 02:04:27.599247
749	51	48	2018-02-07 02:04:27.606222	2018-02-07 02:04:27.606222
750	1	48	2018-02-07 02:04:27.613099	2018-02-07 02:04:27.613099
751	72	48	2018-02-07 02:04:27.619856	2018-02-07 02:04:27.619856
752	60	48	2018-02-07 02:04:27.627479	2018-02-07 02:04:27.627479
753	47	48	2018-02-07 02:04:27.639083	2018-02-07 02:04:27.639083
754	10	48	2018-02-07 02:04:27.648941	2018-02-07 02:04:27.648941
755	12	48	2018-02-07 02:04:27.658895	2018-02-07 02:04:27.658895
756	68	48	2018-02-07 02:04:27.669512	2018-02-07 02:04:27.669512
757	1	49	2018-02-07 02:04:27.678459	2018-02-07 02:04:27.678459
758	76	49	2018-02-07 02:04:27.685239	2018-02-07 02:04:27.685239
759	32	49	2018-02-07 02:04:27.692401	2018-02-07 02:04:27.692401
760	39	49	2018-02-07 02:04:27.699155	2018-02-07 02:04:27.699155
761	66	49	2018-02-07 02:04:27.705877	2018-02-07 02:04:27.705877
762	34	49	2018-02-07 02:04:27.712696	2018-02-07 02:04:27.712696
763	19	49	2018-02-07 02:04:27.719929	2018-02-07 02:04:27.719929
764	45	49	2018-02-07 02:04:27.727413	2018-02-07 02:04:27.727413
765	27	49	2018-02-07 02:04:27.734205	2018-02-07 02:04:27.734205
766	38	49	2018-02-07 02:04:27.741279	2018-02-07 02:04:27.741279
767	56	49	2018-02-07 02:04:27.748965	2018-02-07 02:04:27.748965
768	6	49	2018-02-07 02:04:27.75579	2018-02-07 02:04:27.75579
769	30	49	2018-02-07 02:04:27.762919	2018-02-07 02:04:27.762919
770	68	49	2018-02-07 02:04:27.769853	2018-02-07 02:04:27.769853
771	75	49	2018-02-07 02:04:27.780546	2018-02-07 02:04:27.780546
772	58	49	2018-02-07 02:04:27.787701	2018-02-07 02:04:27.787701
773	72	50	2018-02-07 02:04:27.794676	2018-02-07 02:04:27.794676
774	30	50	2018-02-07 02:04:27.80141	2018-02-07 02:04:27.80141
775	21	50	2018-02-07 02:04:27.813484	2018-02-07 02:04:27.813484
776	50	50	2018-02-07 02:04:27.823406	2018-02-07 02:04:27.823406
777	9	50	2018-02-07 02:04:27.833858	2018-02-07 02:04:27.833858
778	45	50	2018-02-07 02:04:27.843102	2018-02-07 02:04:27.843102
779	75	50	2018-02-07 02:04:27.854793	2018-02-07 02:04:27.854793
780	56	50	2018-02-07 02:04:27.865158	2018-02-07 02:04:27.865158
781	21	51	2018-02-07 02:04:27.876342	2018-02-07 02:04:27.876342
782	48	51	2018-02-07 02:04:27.886439	2018-02-07 02:04:27.886439
783	27	51	2018-02-07 02:04:27.896385	2018-02-07 02:04:27.896385
784	14	51	2018-02-07 02:04:27.904694	2018-02-07 02:04:27.904694
785	17	51	2018-02-07 02:04:27.911465	2018-02-07 02:04:27.911465
786	15	51	2018-02-07 02:04:27.918274	2018-02-07 02:04:27.918274
787	24	51	2018-02-07 02:04:27.925178	2018-02-07 02:04:27.925178
788	61	51	2018-02-07 02:04:27.932625	2018-02-07 02:04:27.932625
789	77	51	2018-02-07 02:04:27.939508	2018-02-07 02:04:27.939508
790	10	51	2018-02-07 02:04:27.946202	2018-02-07 02:04:27.946202
791	46	51	2018-02-07 02:04:27.95459	2018-02-07 02:04:27.95459
792	12	52	2018-02-07 02:04:27.962171	2018-02-07 02:04:27.962171
793	19	52	2018-02-07 02:04:27.969083	2018-02-07 02:04:27.969083
794	33	52	2018-02-07 02:04:27.976432	2018-02-07 02:04:27.976432
795	18	52	2018-02-07 02:04:27.983356	2018-02-07 02:04:27.983356
796	3	52	2018-02-07 02:04:27.99049	2018-02-07 02:04:27.99049
797	9	52	2018-02-07 02:04:27.998033	2018-02-07 02:04:27.998033
798	21	52	2018-02-07 02:04:28.004917	2018-02-07 02:04:28.004917
799	67	52	2018-02-07 02:04:28.011777	2018-02-07 02:04:28.011777
800	32	52	2018-02-07 02:04:28.018602	2018-02-07 02:04:28.018602
801	11	53	2018-02-07 02:04:28.026939	2018-02-07 02:04:28.026939
802	9	53	2018-02-07 02:04:28.03392	2018-02-07 02:04:28.03392
803	74	53	2018-02-07 02:04:28.041478	2018-02-07 02:04:28.041478
804	13	53	2018-02-07 02:04:28.049215	2018-02-07 02:04:28.049215
805	56	53	2018-02-07 02:04:28.056607	2018-02-07 02:04:28.056607
806	67	53	2018-02-07 02:04:28.063083	2018-02-07 02:04:28.063083
807	55	53	2018-02-07 02:04:28.07005	2018-02-07 02:04:28.07005
808	48	53	2018-02-07 02:04:28.077083	2018-02-07 02:04:28.077083
809	69	53	2018-02-07 02:04:28.084357	2018-02-07 02:04:28.084357
810	65	53	2018-02-07 02:04:28.100127	2018-02-07 02:04:28.100127
811	52	53	2018-02-07 02:04:28.10755	2018-02-07 02:04:28.10755
812	33	53	2018-02-07 02:04:28.114378	2018-02-07 02:04:28.114378
813	29	54	2018-02-07 02:04:28.121424	2018-02-07 02:04:28.121424
814	53	54	2018-02-07 02:04:28.128163	2018-02-07 02:04:28.128163
815	31	54	2018-02-07 02:04:28.134867	2018-02-07 02:04:28.134867
816	36	54	2018-02-07 02:04:28.14212	2018-02-07 02:04:28.14212
817	74	54	2018-02-07 02:04:28.149737	2018-02-07 02:04:28.149737
818	6	54	2018-02-07 02:04:28.156676	2018-02-07 02:04:28.156676
819	55	54	2018-02-07 02:04:28.163919	2018-02-07 02:04:28.163919
820	63	54	2018-02-07 02:04:28.172588	2018-02-07 02:04:28.172588
821	13	54	2018-02-07 02:04:28.179545	2018-02-07 02:04:28.179545
822	44	54	2018-02-07 02:04:28.186559	2018-02-07 02:04:28.186559
823	64	54	2018-02-07 02:04:28.19343	2018-02-07 02:04:28.19343
824	3	54	2018-02-07 02:04:28.200486	2018-02-07 02:04:28.200486
825	21	54	2018-02-07 02:04:28.207384	2018-02-07 02:04:28.207384
826	66	54	2018-02-07 02:04:28.214248	2018-02-07 02:04:28.214248
827	11	54	2018-02-07 02:04:28.221168	2018-02-07 02:04:28.221168
828	47	30	2018-02-07 02:04:28.228085	2018-02-07 02:04:28.228085
829	70	30	2018-02-07 02:04:28.240216	2018-02-07 02:04:28.240216
830	16	30	2018-02-07 02:04:28.251489	2018-02-07 02:04:28.251489
831	48	30	2018-02-07 02:04:28.262642	2018-02-07 02:04:28.262642
832	10	30	2018-02-07 02:04:28.269584	2018-02-07 02:04:28.269584
833	68	30	2018-02-07 02:04:28.277398	2018-02-07 02:04:28.277398
834	8	30	2018-02-07 02:04:28.284197	2018-02-07 02:04:28.284197
835	64	30	2018-02-07 02:04:28.299183	2018-02-07 02:04:28.299183
836	34	30	2018-02-07 02:04:28.310088	2018-02-07 02:04:28.310088
837	11	30	2018-02-07 02:04:28.320174	2018-02-07 02:04:28.320174
838	36	31	2018-02-07 02:04:28.330245	2018-02-07 02:04:28.330245
839	33	31	2018-02-07 02:04:28.340014	2018-02-07 02:04:28.340014
840	43	31	2018-02-07 02:04:28.348838	2018-02-07 02:04:28.348838
841	21	32	2018-02-07 02:04:28.356159	2018-02-07 02:04:28.356159
842	57	32	2018-02-07 02:04:28.362626	2018-02-07 02:04:28.362626
843	18	32	2018-02-07 02:04:28.369367	2018-02-07 02:04:28.369367
844	34	32	2018-02-07 02:04:28.376512	2018-02-07 02:04:28.376512
845	71	32	2018-02-07 02:04:28.383187	2018-02-07 02:04:28.383187
846	13	32	2018-02-07 02:04:28.390104	2018-02-07 02:04:28.390104
847	63	32	2018-02-07 02:04:28.397037	2018-02-07 02:04:28.397037
848	33	32	2018-02-07 02:04:28.403497	2018-02-07 02:04:28.403497
849	75	32	2018-02-07 02:04:28.410666	2018-02-07 02:04:28.410666
850	44	32	2018-02-07 02:04:28.417347	2018-02-07 02:04:28.417347
851	45	32	2018-02-07 02:04:28.424366	2018-02-07 02:04:28.424366
852	14	32	2018-02-07 02:04:28.43124	2018-02-07 02:04:28.43124
853	27	32	2018-02-07 02:04:28.438254	2018-02-07 02:04:28.438254
854	7	33	2018-02-07 02:04:28.445863	2018-02-07 02:04:28.445863
855	15	33	2018-02-07 02:04:28.452933	2018-02-07 02:04:28.452933
856	62	33	2018-02-07 02:04:28.459897	2018-02-07 02:04:28.459897
857	56	33	2018-02-07 02:04:28.467372	2018-02-07 02:04:28.467372
858	8	33	2018-02-07 02:04:28.474251	2018-02-07 02:04:28.474251
859	74	33	2018-02-07 02:04:28.48109	2018-02-07 02:04:28.48109
860	12	33	2018-02-07 02:04:28.487902	2018-02-07 02:04:28.487902
861	50	33	2018-02-07 02:04:28.495203	2018-02-07 02:04:28.495203
862	67	33	2018-02-07 02:04:28.502618	2018-02-07 02:04:28.502618
863	60	33	2018-02-07 02:04:28.510032	2018-02-07 02:04:28.510032
864	9	33	2018-02-07 02:04:28.516911	2018-02-07 02:04:28.516911
865	55	33	2018-02-07 02:04:28.524483	2018-02-07 02:04:28.524483
866	65	34	2018-02-07 02:04:28.53241	2018-02-07 02:04:28.53241
867	37	34	2018-02-07 02:04:28.539748	2018-02-07 02:04:28.539748
868	1	34	2018-02-07 02:04:28.546656	2018-02-07 02:04:28.546656
869	70	34	2018-02-07 02:04:28.553521	2018-02-07 02:04:28.553521
870	6	34	2018-02-07 02:04:28.560754	2018-02-07 02:04:28.560754
871	61	34	2018-02-07 02:04:28.567738	2018-02-07 02:04:28.567738
872	69	34	2018-02-07 02:04:28.580309	2018-02-07 02:04:28.580309
873	17	34	2018-02-07 02:04:28.590502	2018-02-07 02:04:28.590502
874	52	34	2018-02-07 02:04:28.600443	2018-02-07 02:04:28.600443
875	58	34	2018-02-07 02:04:28.608859	2018-02-07 02:04:28.608859
876	56	61	2018-02-07 02:04:28.616012	2018-02-07 02:04:28.616012
877	36	61	2018-02-07 02:04:28.623031	2018-02-07 02:04:28.623031
878	73	61	2018-02-07 02:04:28.630085	2018-02-07 02:04:28.630085
879	62	61	2018-02-07 02:04:28.63686	2018-02-07 02:04:28.63686
880	68	61	2018-02-07 02:04:28.64378	2018-02-07 02:04:28.64378
881	11	61	2018-02-07 02:04:28.650819	2018-02-07 02:04:28.650819
882	76	61	2018-02-07 02:04:28.657976	2018-02-07 02:04:28.657976
883	54	61	2018-02-07 02:04:28.664806	2018-02-07 02:04:28.664806
884	48	61	2018-02-07 02:04:28.671632	2018-02-07 02:04:28.671632
885	40	61	2018-02-07 02:04:28.678479	2018-02-07 02:04:28.678479
886	60	62	2018-02-07 02:04:28.685859	2018-02-07 02:04:28.685859
887	14	62	2018-02-07 02:04:28.693309	2018-02-07 02:04:28.693309
889	64	63	2018-02-07 02:04:28.711297	2018-02-07 02:04:28.711297
890	58	63	2018-02-07 02:04:28.717819	2018-02-07 02:04:28.717819
891	63	63	2018-02-07 02:04:28.724124	2018-02-07 02:04:28.724124
892	69	63	2018-02-07 02:04:28.731027	2018-02-07 02:04:28.731027
893	24	63	2018-02-07 02:04:28.737884	2018-02-07 02:04:28.737884
894	44	63	2018-02-07 02:04:28.744679	2018-02-07 02:04:28.744679
895	6	63	2018-02-07 02:04:28.752004	2018-02-07 02:04:28.752004
896	21	63	2018-02-07 02:04:28.759088	2018-02-07 02:04:28.759088
897	66	63	2018-02-07 02:04:28.765817	2018-02-07 02:04:28.765817
898	36	63	2018-02-07 02:04:28.772813	2018-02-07 02:04:28.772813
899	70	63	2018-02-07 02:04:28.779656	2018-02-07 02:04:28.779656
900	20	65	2018-02-07 02:04:28.786658	2018-02-07 02:04:28.786658
901	77	66	2018-02-07 02:04:28.793846	2018-02-07 02:04:28.793846
902	29	68	2018-02-07 02:04:28.800544	2018-02-07 02:04:28.800544
903	58	69	2018-02-07 02:04:28.808676	2018-02-07 02:04:28.808676
904	76	69	2018-02-07 02:04:28.81622	2018-02-07 02:04:28.81622
905	6	69	2018-02-07 02:04:28.822913	2018-02-07 02:04:28.822913
906	66	69	2018-02-07 02:04:28.830161	2018-02-07 02:04:28.830161
907	73	69	2018-02-07 02:04:28.836955	2018-02-07 02:04:28.836955
908	69	69	2018-02-07 02:04:28.84545	2018-02-07 02:04:28.84545
909	45	69	2018-02-07 02:04:28.853617	2018-02-07 02:04:28.853617
910	68	69	2018-02-07 02:04:28.860951	2018-02-07 02:04:28.860951
911	26	69	2018-02-07 02:04:28.8679	2018-02-07 02:04:28.8679
912	24	69	2018-02-07 02:04:28.879407	2018-02-07 02:04:28.879407
913	41	69	2018-02-07 02:04:28.889562	2018-02-07 02:04:28.889562
914	2	69	2018-02-07 02:04:28.899933	2018-02-07 02:04:28.899933
915	54	69	2018-02-07 02:04:28.908327	2018-02-07 02:04:28.908327
916	11	69	2018-02-07 02:04:28.916019	2018-02-07 02:04:28.916019
917	16	71	2018-02-07 02:04:28.92319	2018-02-07 02:04:28.92319
918	52	71	2018-02-07 02:04:28.930817	2018-02-07 02:04:28.930817
919	30	71	2018-02-07 02:04:28.937984	2018-02-07 02:04:28.937984
920	34	71	2018-02-07 02:04:28.945327	2018-02-07 02:04:28.945327
921	72	71	2018-02-07 02:04:28.952536	2018-02-07 02:04:28.952536
922	3	71	2018-02-07 02:04:28.960856	2018-02-07 02:04:28.960856
923	77	71	2018-02-07 02:04:28.972369	2018-02-07 02:04:28.972369
924	8	72	2018-02-07 02:04:28.982985	2018-02-07 02:04:28.982985
925	49	72	2018-02-07 02:04:28.993864	2018-02-07 02:04:28.993864
926	69	72	2018-02-07 02:04:29.003907	2018-02-07 02:04:29.003907
927	56	72	2018-02-07 02:04:29.015389	2018-02-07 02:04:29.015389
928	26	73	2018-02-07 02:04:29.026636	2018-02-07 02:04:29.026636
929	61	73	2018-02-07 02:04:29.036674	2018-02-07 02:04:29.036674
930	39	73	2018-02-07 02:04:29.047436	2018-02-07 02:04:29.047436
931	48	73	2018-02-07 02:04:29.055607	2018-02-07 02:04:29.055607
932	58	73	2018-02-07 02:04:29.063356	2018-02-07 02:04:29.063356
933	49	73	2018-02-07 02:04:29.070487	2018-02-07 02:04:29.070487
934	47	73	2018-02-07 02:04:29.077528	2018-02-07 02:04:29.077528
935	20	74	2018-02-07 02:04:29.084664	2018-02-07 02:04:29.084664
936	77	74	2018-02-07 02:04:29.091805	2018-02-07 02:04:29.091805
937	63	74	2018-02-07 02:04:29.098669	2018-02-07 02:04:29.098669
938	29	74	2018-02-07 02:04:29.105735	2018-02-07 02:04:29.105735
939	69	74	2018-02-07 02:04:29.112876	2018-02-07 02:04:29.112876
940	68	74	2018-02-07 02:04:29.124573	2018-02-07 02:04:29.124573
941	55	74	2018-02-07 02:04:29.134798	2018-02-07 02:04:29.134798
942	6	74	2018-02-07 02:04:29.145447	2018-02-07 02:04:29.145447
943	38	74	2018-02-07 02:04:29.155287	2018-02-07 02:04:29.155287
944	60	74	2018-02-07 02:04:29.163713	2018-02-07 02:04:29.163713
945	24	74	2018-02-07 02:04:29.170881	2018-02-07 02:04:29.170881
946	75	74	2018-02-07 02:04:29.178428	2018-02-07 02:04:29.178428
947	59	74	2018-02-07 02:04:29.190459	2018-02-07 02:04:29.190459
948	66	75	2018-02-07 02:04:29.201419	2018-02-07 02:04:29.201419
949	52	75	2018-02-07 02:04:29.214058	2018-02-07 02:04:29.214058
950	49	75	2018-02-07 02:04:29.225276	2018-02-07 02:04:29.225276
951	9	75	2018-02-07 02:04:29.237964	2018-02-07 02:04:29.237964
952	42	75	2018-02-07 02:04:29.244537	2018-02-07 02:04:29.244537
953	23	75	2018-02-07 02:04:29.251819	2018-02-07 02:04:29.251819
954	10	75	2018-02-07 02:04:29.260592	2018-02-07 02:04:29.260592
955	22	75	2018-02-07 02:04:29.267742	2018-02-07 02:04:29.267742
956	58	75	2018-02-07 02:04:29.276782	2018-02-07 02:04:29.276782
957	39	75	2018-02-07 02:04:29.289705	2018-02-07 02:04:29.289705
958	51	75	2018-02-07 02:04:29.30324	2018-02-07 02:04:29.30324
959	11	75	2018-02-07 02:04:29.320807	2018-02-07 02:04:29.320807
960	28	75	2018-02-07 02:04:29.334209	2018-02-07 02:04:29.334209
961	18	76	2018-02-07 02:04:29.351308	2018-02-07 02:04:29.351308
962	12	76	2018-02-07 02:04:29.364922	2018-02-07 02:04:29.364922
963	37	76	2018-02-07 02:04:29.393608	2018-02-07 02:04:29.393608
964	68	76	2018-02-07 02:04:29.40702	2018-02-07 02:04:29.40702
965	34	64	2018-02-07 02:04:29.423737	2018-02-07 02:04:29.423737
966	19	64	2018-02-07 02:04:29.450129	2018-02-07 02:04:29.450129
967	25	64	2018-02-07 02:04:29.463242	2018-02-07 02:04:29.463242
968	66	64	2018-02-07 02:04:29.493075	2018-02-07 02:04:29.493075
969	42	64	2018-02-07 02:04:29.530726	2018-02-07 02:04:29.530726
970	39	64	2018-02-07 02:04:29.538647	2018-02-07 02:04:29.538647
971	1	64	2018-02-07 02:04:29.547885	2018-02-07 02:04:29.547885
972	7	64	2018-02-07 02:04:29.555281	2018-02-07 02:04:29.555281
973	27	64	2018-02-07 02:04:29.567103	2018-02-07 02:04:29.567103
974	28	64	2018-02-07 02:04:29.576086	2018-02-07 02:04:29.576086
975	40	64	2018-02-07 02:04:29.589464	2018-02-07 02:04:29.589464
976	61	64	2018-02-07 02:04:29.620556	2018-02-07 02:04:29.620556
977	13	64	2018-02-07 02:04:29.6334	2018-02-07 02:04:29.6334
978	8	64	2018-02-07 02:04:29.643918	2018-02-07 02:04:29.643918
979	35	64	2018-02-07 02:04:29.651329	2018-02-07 02:04:29.651329
980	23	16	2018-02-07 02:04:29.660559	2018-02-07 02:04:29.660559
981	34	16	2018-02-07 02:04:29.668514	2018-02-07 02:04:29.668514
982	52	16	2018-02-07 02:04:29.676227	2018-02-07 02:04:29.676227
983	33	16	2018-02-07 02:04:29.685169	2018-02-07 02:04:29.685169
984	59	16	2018-02-07 02:04:29.692887	2018-02-07 02:04:29.692887
985	66	16	2018-02-07 02:04:29.69871	2018-02-07 02:04:29.69871
986	74	16	2018-02-07 02:04:29.705601	2018-02-07 02:04:29.705601
987	47	16	2018-02-07 02:04:29.713148	2018-02-07 02:04:29.713148
988	14	16	2018-02-07 02:04:29.720845	2018-02-07 02:04:29.720845
989	37	16	2018-02-07 02:04:29.730279	2018-02-07 02:04:29.730279
990	62	16	2018-02-07 02:04:29.737262	2018-02-07 02:04:29.737262
991	44	16	2018-02-07 02:04:29.745347	2018-02-07 02:04:29.745347
992	72	16	2018-02-07 02:04:29.754059	2018-02-07 02:04:29.754059
993	20	16	2018-02-07 02:04:29.762128	2018-02-07 02:04:29.762128
994	41	16	2018-02-07 02:04:29.770108	2018-02-07 02:04:29.770108
995	73	16	2018-02-07 02:04:29.777515	2018-02-07 02:04:29.777515
996	77	16	2018-02-07 02:04:29.783262	2018-02-07 02:04:29.783262
997	18	16	2018-02-07 02:04:29.790553	2018-02-07 02:04:29.790553
998	75	29	2018-02-07 02:04:29.799844	2018-02-07 02:04:29.799844
999	33	29	2018-02-07 02:04:29.807377	2018-02-07 02:04:29.807377
1000	48	29	2018-02-07 02:04:29.815677	2018-02-07 02:04:29.815677
1001	62	29	2018-02-07 02:04:29.822853	2018-02-07 02:04:29.822853
1002	27	29	2018-02-07 02:04:29.830394	2018-02-07 02:04:29.830394
1003	31	29	2018-02-07 02:04:29.837687	2018-02-07 02:04:29.837687
1004	43	29	2018-02-07 02:04:29.845559	2018-02-07 02:04:29.845559
1005	54	29	2018-02-07 02:04:29.981346	2018-02-07 02:04:29.981346
1006	24	29	2018-02-07 02:04:29.99637	2018-02-07 02:04:29.99637
1007	59	29	2018-02-07 02:04:30.005104	2018-02-07 02:04:30.005104
1008	2	29	2018-02-07 02:04:30.012305	2018-02-07 02:04:30.012305
1009	50	29	2018-02-07 02:04:30.020106	2018-02-07 02:04:30.020106
1010	70	29	2018-02-07 02:04:30.026581	2018-02-07 02:04:30.026581
1011	37	29	2018-02-07 02:04:30.034749	2018-02-07 02:04:30.034749
1012	57	29	2018-02-07 02:04:30.044433	2018-02-07 02:04:30.044433
1013	42	29	2018-02-07 02:04:30.05205	2018-02-07 02:04:30.05205
1014	23	29	2018-02-07 02:04:30.058139	2018-02-07 02:04:30.058139
1015	19	29	2018-02-07 02:04:30.06597	2018-02-07 02:04:30.06597
1016	53	9	2018-02-07 02:04:30.074216	2018-02-07 02:04:30.074216
1017	13	57	2018-02-07 02:04:30.082568	2018-02-07 02:04:30.082568
1018	71	57	2018-02-07 02:04:30.090193	2018-02-07 02:04:30.090193
1019	56	57	2018-02-07 02:04:30.098284	2018-02-07 02:04:30.098284
1020	52	57	2018-02-07 02:04:30.106252	2018-02-07 02:04:30.106252
1021	32	57	2018-02-07 02:04:30.114331	2018-02-07 02:04:30.114331
1022	21	57	2018-02-07 02:04:30.123211	2018-02-07 02:04:30.123211
1023	36	57	2018-02-07 02:04:30.133762	2018-02-07 02:04:30.133762
1024	2	57	2018-02-07 02:04:30.140501	2018-02-07 02:04:30.140501
1025	75	57	2018-02-07 02:04:30.147956	2018-02-07 02:04:30.147956
1026	61	58	2018-02-07 02:04:30.15472	2018-02-07 02:04:30.15472
1027	37	58	2018-02-07 02:04:30.161896	2018-02-07 02:04:30.161896
1028	7	58	2018-02-07 02:04:30.166319	2018-02-07 02:04:30.166319
1029	44	58	2018-02-07 02:04:30.173266	2018-02-07 02:04:30.173266
1030	71	55	2018-02-07 02:04:30.18021	2018-02-07 02:04:30.18021
1031	44	55	2018-02-07 02:04:30.188686	2018-02-07 02:04:30.188686
1032	20	55	2018-02-07 02:04:30.195582	2018-02-07 02:04:30.195582
1033	12	55	2018-02-07 02:04:30.207086	2018-02-07 02:04:30.207086
1034	11	55	2018-02-07 02:04:30.21681	2018-02-07 02:04:30.21681
1035	17	55	2018-02-07 02:04:30.228732	2018-02-07 02:04:30.228732
1036	68	55	2018-02-07 02:04:30.236796	2018-02-07 02:04:30.236796
1037	75	59	2018-02-07 02:04:30.244282	2018-02-07 02:04:30.244282
1038	23	59	2018-02-07 02:04:30.251527	2018-02-07 02:04:30.251527
1039	54	59	2018-02-07 02:04:30.25832	2018-02-07 02:04:30.25832
1040	31	60	2018-02-07 02:04:30.265858	2018-02-07 02:04:30.265858
1041	50	60	2018-02-07 02:04:30.27377	2018-02-07 02:04:30.27377
1042	71	60	2018-02-07 02:04:30.282255	2018-02-07 02:04:30.282255
1043	15	60	2018-02-07 02:04:30.289231	2018-02-07 02:04:30.289231
1044	29	60	2018-02-07 02:04:30.300857	2018-02-07 02:04:30.300857
1045	27	60	2018-02-07 02:04:30.309314	2018-02-07 02:04:30.309314
1046	22	60	2018-02-07 02:04:30.317658	2018-02-07 02:04:30.317658
1047	25	60	2018-02-07 02:04:30.327301	2018-02-07 02:04:30.327301
1048	54	60	2018-02-07 02:04:30.33432	2018-02-07 02:04:30.33432
1049	24	60	2018-02-07 02:04:30.339974	2018-02-07 02:04:30.339974
1050	47	60	2018-02-07 02:04:30.34762	2018-02-07 02:04:30.34762
1051	16	60	2018-02-07 02:04:30.354554	2018-02-07 02:04:30.354554
1052	46	60	2018-02-07 02:04:30.361525	2018-02-07 02:04:30.361525
1053	9	60	2018-02-07 02:04:30.368165	2018-02-07 02:04:30.368165
1054	69	77	2018-02-07 02:04:30.375093	2018-02-07 02:04:30.375093
1055	52	77	2018-02-07 02:04:30.382211	2018-02-07 02:04:30.382211
1056	2	56	2018-02-07 02:04:30.389627	2018-02-07 02:04:30.389627
1057	68	56	2018-02-07 02:04:30.396758	2018-02-07 02:04:30.396758
1058	36	56	2018-02-07 02:04:30.40133	2018-02-07 02:04:30.40133
1059	69	56	2018-02-07 02:04:30.408623	2018-02-07 02:04:30.408623
1060	72	56	2018-02-07 02:04:30.415555	2018-02-07 02:04:30.415555
1061	45	56	2018-02-07 02:04:30.421768	2018-02-07 02:04:30.421768
1062	57	56	2018-02-07 02:04:30.428851	2018-02-07 02:04:30.428851
1063	29	56	2018-02-07 02:04:30.433431	2018-02-07 02:04:30.433431
1064	11	56	2018-02-07 02:04:30.4404	2018-02-07 02:04:30.4404
1065	9	67	2018-02-07 02:04:30.448185	2018-02-07 02:04:30.448185
1066	18	67	2018-02-07 02:04:30.455032	2018-02-07 02:04:30.455032
1067	36	67	2018-02-07 02:04:30.465306	2018-02-07 02:04:30.465306
1068	53	67	2018-02-07 02:04:30.472117	2018-02-07 02:04:30.472117
1069	6	67	2018-02-07 02:04:30.479113	2018-02-07 02:04:30.479113
1070	25	67	2018-02-07 02:04:30.487163	2018-02-07 02:04:30.487163
1071	8	67	2018-02-07 02:04:30.494117	2018-02-07 02:04:30.494117
1072	68	67	2018-02-07 02:04:30.501625	2018-02-07 02:04:30.501625
1073	30	67	2018-02-07 02:04:30.509102	2018-02-07 02:04:30.509102
1074	15	67	2018-02-07 02:04:30.515451	2018-02-07 02:04:30.515451
1075	26	67	2018-02-07 02:04:30.522245	2018-02-07 02:04:30.522245
1076	49	35	2018-02-07 02:04:30.529339	2018-02-07 02:04:30.529339
1077	12	35	2018-02-07 02:04:30.536278	2018-02-07 02:04:30.536278
1078	40	35	2018-02-07 02:04:30.543986	2018-02-07 02:04:30.543986
1079	3	35	2018-02-07 02:04:30.551737	2018-02-07 02:04:30.551737
1080	32	35	2018-02-07 02:04:30.558893	2018-02-07 02:04:30.558893
1081	69	35	2018-02-07 02:04:30.566107	2018-02-07 02:04:30.566107
1082	76	35	2018-02-07 02:04:30.577787	2018-02-07 02:04:30.577787
1083	24	35	2018-02-07 02:04:30.58458	2018-02-07 02:04:30.58458
1084	30	35	2018-02-07 02:04:30.591028	2018-02-07 02:04:30.591028
1085	34	35	2018-02-07 02:04:30.598176	2018-02-07 02:04:30.598176
1086	43	35	2018-02-07 02:04:30.60555	2018-02-07 02:04:30.60555
1087	71	35	2018-02-07 02:04:30.614275	2018-02-07 02:04:30.614275
1088	8	35	2018-02-07 02:04:30.622492	2018-02-07 02:04:30.622492
1089	18	35	2018-02-07 02:04:30.63182	2018-02-07 02:04:30.63182
1090	52	35	2018-02-07 02:04:30.639982	2018-02-07 02:04:30.639982
1091	13	35	2018-02-07 02:04:30.649502	2018-02-07 02:04:30.649502
1092	38	35	2018-02-07 02:04:30.662849	2018-02-07 02:04:30.662849
1093	11	39	2018-02-07 02:04:30.672038	2018-02-07 02:04:30.672038
1094	19	39	2018-02-07 02:04:30.683364	2018-02-07 02:04:30.683364
1095	34	39	2018-02-07 02:04:30.691448	2018-02-07 02:04:30.691448
1096	8	39	2018-02-07 02:04:30.700375	2018-02-07 02:04:30.700375
1097	64	39	2018-02-07 02:04:30.710516	2018-02-07 02:04:30.710516
1098	26	39	2018-02-07 02:04:30.719134	2018-02-07 02:04:30.719134
1099	68	39	2018-02-07 02:04:30.73339	2018-02-07 02:04:30.73339
1100	37	39	2018-02-07 02:04:30.745775	2018-02-07 02:04:30.745775
1101	17	39	2018-02-07 02:04:30.754843	2018-02-07 02:04:30.754843
1102	41	39	2018-02-07 02:04:30.766342	2018-02-07 02:04:30.766342
1103	13	39	2018-02-07 02:04:30.777513	2018-02-07 02:04:30.777513
1104	2	39	2018-02-07 02:04:30.789481	2018-02-07 02:04:30.789481
1105	24	25	2018-02-07 02:04:30.803651	2018-02-07 02:04:30.803651
1106	17	25	2018-02-07 02:04:30.819246	2018-02-07 02:04:30.819246
1107	58	25	2018-02-07 02:04:30.832449	2018-02-07 02:04:30.832449
1108	12	25	2018-02-07 02:04:30.83875	2018-02-07 02:04:30.83875
1109	73	25	2018-02-07 02:04:30.850294	2018-02-07 02:04:30.850294
1110	54	25	2018-02-07 02:04:30.866425	2018-02-07 02:04:30.866425
1111	37	25	2018-02-07 02:04:30.876268	2018-02-07 02:04:30.876268
1112	33	25	2018-02-07 02:04:30.886055	2018-02-07 02:04:30.886055
1113	14	25	2018-02-07 02:04:30.898709	2018-02-07 02:04:30.898709
1114	19	25	2018-02-07 02:04:30.907031	2018-02-07 02:04:30.907031
1115	55	25	2018-02-07 02:04:30.918282	2018-02-07 02:04:30.918282
1116	50	25	2018-02-07 02:04:30.931002	2018-02-07 02:04:30.931002
1117	10	25	2018-02-07 02:04:30.938546	2018-02-07 02:04:30.938546
1118	26	25	2018-02-07 02:04:30.949421	2018-02-07 02:04:30.949421
1119	8	25	2018-02-07 02:04:30.956649	2018-02-07 02:04:30.956649
1120	63	25	2018-02-07 02:04:30.965976	2018-02-07 02:04:30.965976
1121	42	25	2018-02-07 02:04:30.980276	2018-02-07 02:04:30.980276
1122	71	43	2018-02-07 02:04:30.988878	2018-02-07 02:04:30.988878
1123	7	43	2018-02-07 02:04:30.99953	2018-02-07 02:04:30.99953
1124	26	43	2018-02-07 02:04:31.006942	2018-02-07 02:04:31.006942
1125	72	43	2018-02-07 02:04:31.017647	2018-02-07 02:04:31.017647
1126	50	43	2018-02-07 02:04:31.026886	2018-02-07 02:04:31.026886
1127	16	43	2018-02-07 02:04:31.035268	2018-02-07 02:04:31.035268
1128	56	43	2018-02-07 02:04:31.045885	2018-02-07 02:04:31.045885
1129	8	43	2018-02-07 02:04:31.054272	2018-02-07 02:04:31.054272
1130	44	43	2018-02-07 02:04:31.064531	2018-02-07 02:04:31.064531
1131	66	43	2018-02-07 02:04:31.072184	2018-02-07 02:04:31.072184
1132	33	43	2018-02-07 02:04:31.081174	2018-02-07 02:04:31.081174
1133	75	43	2018-02-07 02:04:31.088552	2018-02-07 02:04:31.088552
1134	6	43	2018-02-07 02:04:31.096563	2018-02-07 02:04:31.096563
1135	25	43	2018-02-07 02:04:31.104165	2018-02-07 02:04:31.104165
1136	68	43	2018-02-07 02:04:31.114418	2018-02-07 02:04:31.114418
1137	63	43	2018-02-07 02:04:31.11966	2018-02-07 02:04:31.11966
1138	24	43	2018-02-07 02:04:31.131685	2018-02-07 02:04:31.131685
1139	59	43	2018-02-07 02:04:31.139332	2018-02-07 02:04:31.139332
1140	36	70	2018-02-07 02:04:31.148855	2018-02-07 02:04:31.148855
1141	61	70	2018-02-07 02:04:31.156947	2018-02-07 02:04:31.156947
1142	77	70	2018-02-07 02:04:31.166573	2018-02-07 02:04:31.166573
1143	49	70	2018-02-07 02:04:31.178401	2018-02-07 02:04:31.178401
1144	3	70	2018-02-07 02:04:31.187627	2018-02-07 02:04:31.187627
1145	68	70	2018-02-07 02:04:31.195811	2018-02-07 02:04:31.195811
1146	69	70	2018-02-07 02:04:31.209987	2018-02-07 02:04:31.209987
1147	33	70	2018-02-07 02:04:31.219652	2018-02-07 02:04:31.219652
1148	72	70	2018-02-07 02:04:31.229903	2018-02-07 02:04:31.229903
1149	20	70	2018-02-07 02:04:31.237907	2018-02-07 02:04:31.237907
1150	48	70	2018-02-07 02:04:31.244946	2018-02-07 02:04:31.244946
1151	66	70	2018-02-07 02:04:31.25269	2018-02-07 02:04:31.25269
1152	38	1	2018-02-07 02:04:31.264278	2018-02-07 02:04:31.264278
1153	15	1	2018-02-07 02:04:31.273083	2018-02-07 02:04:31.273083
1154	35	1	2018-02-07 02:04:31.282063	2018-02-07 02:04:31.282063
1155	54	1	2018-02-07 02:04:31.289338	2018-02-07 02:04:31.289338
1156	34	1	2018-02-07 02:04:31.297271	2018-02-07 02:04:31.297271
1157	46	1	2018-02-07 02:04:31.304689	2018-02-07 02:04:31.304689
1158	9	1	2018-02-07 02:04:31.31398	2018-02-07 02:04:31.31398
1159	24	1	2018-02-07 02:04:31.321307	2018-02-07 02:04:31.321307
1160	3	1	2018-02-07 02:04:31.330148	2018-02-07 02:04:31.330148
1161	73	1	2018-02-07 02:04:31.335927	2018-02-07 02:04:31.335927
1162	71	1	2018-02-07 02:04:31.345202	2018-02-07 02:04:31.345202
1163	34	7	2018-02-07 02:04:31.35322	2018-02-07 02:04:31.35322
1164	40	7	2018-02-07 02:04:31.363642	2018-02-07 02:04:31.363642
1165	69	7	2018-02-07 02:04:31.371449	2018-02-07 02:04:31.371449
1167	27	6	2018-02-07 02:04:31.386549	2018-02-07 02:04:31.386549
1168	22	6	2018-02-07 02:04:31.396524	2018-02-07 02:04:31.396524
1169	75	6	2018-02-07 02:04:31.405331	2018-02-07 02:04:31.405331
1170	76	6	2018-02-07 02:04:31.414426	2018-02-07 02:04:31.414426
1171	66	6	2018-02-07 02:04:31.422271	2018-02-07 02:04:31.422271
1172	50	6	2018-02-07 02:04:31.430522	2018-02-07 02:04:31.430522
1173	35	6	2018-02-07 02:04:31.438871	2018-02-07 02:04:31.438871
1174	28	6	2018-02-07 02:04:31.447292	2018-02-07 02:04:31.447292
1175	67	6	2018-02-07 02:04:31.455497	2018-02-07 02:04:31.455497
1176	36	6	2018-02-07 02:04:31.464996	2018-02-07 02:04:31.464996
1177	44	6	2018-02-07 02:04:31.475285	2018-02-07 02:04:31.475285
1178	47	6	2018-02-07 02:04:31.485097	2018-02-07 02:04:31.485097
1179	54	6	2018-02-07 02:04:31.491256	2018-02-07 02:04:31.491256
1180	26	6	2018-02-07 02:04:31.498976	2018-02-07 02:04:31.498976
1181	69	6	2018-02-07 02:04:31.50557	2018-02-07 02:04:31.50557
1182	56	6	2018-02-07 02:04:31.512648	2018-02-07 02:04:31.512648
\.


--
-- Data for Name: reviewlists; Type: TABLE DATA; Schema: public; Owner: jacklee
--

COPY reviewlists (id, user_id, reviewable_type, reviewable_id, start_date, created_at, updated_at, "position") FROM stdin;
5	3	Post	211	2018-02-17 00:00:00	2018-02-08 17:59:55.109319	2018-02-08 17:59:55.109319	1
7	6	Post	207	2018-02-18 00:00:00	2018-02-08 23:09:06.195607	2018-02-15 04:29:41.117806	1
35	6	Post	220	2018-02-22 22:19:49.225201	2018-02-15 22:19:49.246704	2018-02-15 22:19:49.246704	5
33	7	Post	198	2018-02-20 20:12:27.668711	2018-02-13 12:06:06.293427	2018-02-15 04:29:41.117806	1
30	7	Post	208	2018-02-21 08:00:00	2018-02-12 02:57:53.235025	2018-02-15 20:24:46.90516	3
11	7	Post	187	2018-02-17 08:00:00	2018-02-10 02:16:31.204497	2018-02-15 20:24:40.475691	4
6	3	Post	207	2018-02-17 00:00:00	2018-02-08 18:55:43.146138	2018-02-13 04:24:32.111519	1
29	7	Medium	58	2018-02-21 08:00:00	2018-02-11 21:38:40.440683	2018-02-16 02:14:54.648141	2
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: jacklee
--

COPY schema_migrations (version) FROM stdin;
20180115183025
20180115190252
20180115203150
20180116015556
20180116032407
20180117181630
20180119072146
20180119074453
20180119074955
20180119080958
20180122203243
20180123034346
20180123035100
20180123073000
20180123210925
20180124192535
20180124192902
20180130055756
20180130203643
20180202004258
20180202004329
20180203031704
20180203171606
20180204071750
20180204071843
20180204174106
20180204180204
20180207011408
20180208023935
20180212002041
\.


--
-- Data for Name: taggings; Type: TABLE DATA; Schema: public; Owner: jacklee
--

COPY taggings (id, tag_id, taggable_type, taggable_id, created_at, updated_at) FROM stdin;
1	2	Post	54	2018-02-02 01:14:38.855002	2018-02-02 01:14:38.855002
2	2	Medium	52	2018-02-02 01:15:45.684296	2018-02-02 01:15:45.684296
3	4	Post	46	2018-02-07 19:57:23.909185	2018-02-07 19:57:23.909185
4	3	Post	46	2018-02-07 19:57:23.955776	2018-02-07 19:57:23.955776
5	4	Post	48	2018-02-07 19:57:23.960845	2018-02-07 19:57:23.960845
6	7	Post	48	2018-02-07 19:57:23.965941	2018-02-07 19:57:23.965941
7	7	Post	1	2018-02-07 19:57:23.97189	2018-02-07 19:57:23.97189
8	5	Post	1	2018-02-07 19:57:23.981199	2018-02-07 19:57:23.981199
9	10	Post	1	2018-02-07 19:57:23.986804	2018-02-07 19:57:23.986804
10	8	Post	1	2018-02-07 19:57:23.991728	2018-02-07 19:57:23.991728
11	5	Post	2	2018-02-07 19:57:23.996834	2018-02-07 19:57:23.996834
12	2	Post	4	2018-02-07 19:57:24.002753	2018-02-07 19:57:24.002753
13	5	Post	4	2018-02-07 19:57:24.009842	2018-02-07 19:57:24.009842
14	10	Post	4	2018-02-07 19:57:24.017091	2018-02-07 19:57:24.017091
15	3	Post	4	2018-02-07 19:57:24.027193	2018-02-07 19:57:24.027193
16	1	Post	3	2018-02-07 19:57:24.037484	2018-02-07 19:57:24.037484
17	4	Post	3	2018-02-07 19:57:24.046691	2018-02-07 19:57:24.046691
18	7	Post	3	2018-02-07 19:57:24.055995	2018-02-07 19:57:24.055995
19	7	Post	5	2018-02-07 19:57:24.066046	2018-02-07 19:57:24.066046
20	6	Post	5	2018-02-07 19:57:24.074803	2018-02-07 19:57:24.074803
21	8	Post	8	2018-02-07 19:57:24.083689	2018-02-07 19:57:24.083689
22	3	Post	10	2018-02-07 19:57:24.093551	2018-02-07 19:57:24.093551
23	7	Post	43	2018-02-07 19:57:24.103623	2018-02-07 19:57:24.103623
24	8	Post	43	2018-02-07 19:57:24.112494	2018-02-07 19:57:24.112494
25	4	Post	43	2018-02-07 19:57:24.1216	2018-02-07 19:57:24.1216
26	9	Post	43	2018-02-07 19:57:24.131225	2018-02-07 19:57:24.131225
27	7	Post	45	2018-02-07 19:57:24.140684	2018-02-07 19:57:24.140684
28	4	Post	45	2018-02-07 19:57:24.152269	2018-02-07 19:57:24.152269
29	8	Post	45	2018-02-07 19:57:24.162286	2018-02-07 19:57:24.162286
30	5	Post	45	2018-02-07 19:57:24.170775	2018-02-07 19:57:24.170775
33	1	Post	49	2018-02-07 19:57:24.199318	2018-02-07 19:57:24.199318
34	4	Post	49	2018-02-07 19:57:24.209094	2018-02-07 19:57:24.209094
35	9	Post	49	2018-02-07 19:57:24.218485	2018-02-07 19:57:24.218485
36	10	Post	50	2018-02-07 19:57:24.228659	2018-02-07 19:57:24.228659
37	7	Post	51	2018-02-07 19:57:24.245231	2018-02-07 19:57:24.245231
38	2	Post	51	2018-02-07 19:57:24.256693	2018-02-07 19:57:24.256693
40	7	Post	52	2018-02-07 19:57:24.276588	2018-02-07 19:57:24.276588
42	10	Post	47	2018-02-07 19:57:24.295594	2018-02-07 19:57:24.295594
43	3	Post	47	2018-02-07 19:57:24.304603	2018-02-07 19:57:24.304603
44	7	Post	59	2018-02-07 19:57:24.313597	2018-02-07 19:57:24.313597
45	3	Post	53	2018-02-07 19:57:24.324692	2018-02-07 19:57:24.324692
46	3	Post	54	2018-02-07 19:57:24.334755	2018-02-07 19:57:24.334755
47	10	Post	60	2018-02-07 19:57:24.344811	2018-02-07 19:57:24.344811
48	4	Post	60	2018-02-07 19:57:24.361759	2018-02-07 19:57:24.361759
49	4	Post	55	2018-02-07 19:57:24.370331	2018-02-07 19:57:24.370331
50	1	Post	55	2018-02-07 19:57:24.378844	2018-02-07 19:57:24.378844
51	7	Post	55	2018-02-07 19:57:24.384877	2018-02-07 19:57:24.384877
52	2	Post	56	2018-02-07 19:57:24.389973	2018-02-07 19:57:24.389973
53	3	Post	56	2018-02-07 19:57:24.395251	2018-02-07 19:57:24.395251
54	9	Post	56	2018-02-07 19:57:24.400799	2018-02-07 19:57:24.400799
55	6	Post	57	2018-02-07 19:57:24.406306	2018-02-07 19:57:24.406306
56	9	Post	58	2018-02-07 19:57:24.414413	2018-02-07 19:57:24.414413
57	4	Post	58	2018-02-07 19:57:24.420029	2018-02-07 19:57:24.420029
58	3	Post	58	2018-02-07 19:57:24.425212	2018-02-07 19:57:24.425212
59	10	Post	58	2018-02-07 19:57:24.430176	2018-02-07 19:57:24.430176
60	8	Post	61	2018-02-07 19:57:24.435381	2018-02-07 19:57:24.435381
61	2	Post	61	2018-02-07 19:57:24.440572	2018-02-07 19:57:24.440572
66	8	Post	64	2018-02-07 19:57:24.47135	2018-02-07 19:57:24.47135
67	6	Post	64	2018-02-07 19:57:24.476363	2018-02-07 19:57:24.476363
68	1	Post	64	2018-02-07 19:57:24.481407	2018-02-07 19:57:24.481407
69	9	Post	64	2018-02-07 19:57:24.486798	2018-02-07 19:57:24.486798
70	6	Post	65	2018-02-07 19:57:24.491668	2018-02-07 19:57:24.491668
71	2	Post	66	2018-02-07 19:57:24.496849	2018-02-07 19:57:24.496849
72	9	Post	66	2018-02-07 19:57:24.502174	2018-02-07 19:57:24.502174
73	4	Post	66	2018-02-07 19:57:24.507229	2018-02-07 19:57:24.507229
74	10	Post	66	2018-02-07 19:57:24.512236	2018-02-07 19:57:24.512236
75	4	Post	67	2018-02-07 19:57:24.517517	2018-02-07 19:57:24.517517
76	2	Post	67	2018-02-07 19:57:24.522837	2018-02-07 19:57:24.522837
77	10	Post	67	2018-02-07 19:57:24.528334	2018-02-07 19:57:24.528334
78	9	Post	68	2018-02-07 19:57:24.533969	2018-02-07 19:57:24.533969
79	6	Post	68	2018-02-07 19:57:24.539141	2018-02-07 19:57:24.539141
80	1	Post	68	2018-02-07 19:57:24.545015	2018-02-07 19:57:24.545015
81	7	Post	68	2018-02-07 19:57:24.550396	2018-02-07 19:57:24.550396
82	10	Post	69	2018-02-07 19:57:24.555443	2018-02-07 19:57:24.555443
83	2	Post	70	2018-02-07 19:57:24.560563	2018-02-07 19:57:24.560563
84	3	Post	70	2018-02-07 19:57:24.565524	2018-02-07 19:57:24.565524
85	4	Post	70	2018-02-07 19:57:24.571317	2018-02-07 19:57:24.571317
86	10	Post	70	2018-02-07 19:57:24.576284	2018-02-07 19:57:24.576284
87	10	Post	71	2018-02-07 19:57:24.581494	2018-02-07 19:57:24.581494
88	1	Post	71	2018-02-07 19:57:24.587201	2018-02-07 19:57:24.587201
89	1	Post	72	2018-02-07 19:57:24.592172	2018-02-07 19:57:24.592172
90	5	Post	72	2018-02-07 19:57:24.597272	2018-02-07 19:57:24.597272
91	2	Post	73	2018-02-07 19:57:24.602333	2018-02-07 19:57:24.602333
92	7	Post	73	2018-02-07 19:57:24.607214	2018-02-07 19:57:24.607214
93	9	Post	73	2018-02-07 19:57:24.612361	2018-02-07 19:57:24.612361
94	9	Post	74	2018-02-07 19:57:24.61789	2018-02-07 19:57:24.61789
95	3	Post	74	2018-02-07 19:57:24.62278	2018-02-07 19:57:24.62278
96	5	Post	74	2018-02-07 19:57:24.627676	2018-02-07 19:57:24.627676
97	8	Post	75	2018-02-07 19:57:24.632769	2018-02-07 19:57:24.632769
98	4	Post	75	2018-02-07 19:57:24.63775	2018-02-07 19:57:24.63775
99	9	Post	75	2018-02-07 19:57:24.643361	2018-02-07 19:57:24.643361
100	7	Post	76	2018-02-07 19:57:24.648436	2018-02-07 19:57:24.648436
101	3	Post	76	2018-02-07 19:57:24.65358	2018-02-07 19:57:24.65358
102	6	Post	76	2018-02-07 19:57:24.658576	2018-02-07 19:57:24.658576
103	2	Post	76	2018-02-07 19:57:24.663565	2018-02-07 19:57:24.663565
104	2	Post	77	2018-02-07 19:57:24.669132	2018-02-07 19:57:24.669132
105	1	Post	77	2018-02-07 19:57:24.674963	2018-02-07 19:57:24.674963
106	8	Post	77	2018-02-07 19:57:24.680433	2018-02-07 19:57:24.680433
107	10	Post	78	2018-02-07 19:57:24.686521	2018-02-07 19:57:24.686521
108	10	Post	79	2018-02-07 19:57:24.695492	2018-02-07 19:57:24.695492
109	9	Post	79	2018-02-07 19:57:24.710967	2018-02-07 19:57:24.710967
110	2	Post	80	2018-02-07 19:57:24.716896	2018-02-07 19:57:24.716896
111	1	Post	80	2018-02-07 19:57:24.722364	2018-02-07 19:57:24.722364
112	4	Post	80	2018-02-07 19:57:24.72763	2018-02-07 19:57:24.72763
113	7	Post	81	2018-02-07 19:57:24.733524	2018-02-07 19:57:24.733524
114	9	Post	81	2018-02-07 19:57:24.739089	2018-02-07 19:57:24.739089
115	3	Post	81	2018-02-07 19:57:24.743995	2018-02-07 19:57:24.743995
116	6	Post	81	2018-02-07 19:57:24.749895	2018-02-07 19:57:24.749895
117	3	Post	82	2018-02-07 19:57:24.754944	2018-02-07 19:57:24.754944
118	2	Post	82	2018-02-07 19:57:24.760573	2018-02-07 19:57:24.760573
119	10	Post	82	2018-02-07 19:57:24.765356	2018-02-07 19:57:24.765356
120	8	Post	83	2018-02-07 19:57:24.770607	2018-02-07 19:57:24.770607
121	3	Post	83	2018-02-07 19:57:24.775679	2018-02-07 19:57:24.775679
122	1	Post	84	2018-02-07 19:57:24.780874	2018-02-07 19:57:24.780874
123	3	Post	84	2018-02-07 19:57:24.786104	2018-02-07 19:57:24.786104
124	8	Post	84	2018-02-07 19:57:24.791168	2018-02-07 19:57:24.791168
125	4	Post	85	2018-02-07 19:57:24.7962	2018-02-07 19:57:24.7962
126	10	Post	85	2018-02-07 19:57:24.801835	2018-02-07 19:57:24.801835
127	5	Post	86	2018-02-07 19:57:24.806865	2018-02-07 19:57:24.806865
128	1	Post	86	2018-02-07 19:57:24.811844	2018-02-07 19:57:24.811844
129	3	Post	86	2018-02-07 19:57:24.82043	2018-02-07 19:57:24.82043
130	2	Post	87	2018-02-07 19:57:24.825773	2018-02-07 19:57:24.825773
131	9	Post	87	2018-02-07 19:57:24.83104	2018-02-07 19:57:24.83104
132	10	Post	88	2018-02-07 19:57:24.83774	2018-02-07 19:57:24.83774
133	9	Post	88	2018-02-07 19:57:24.84387	2018-02-07 19:57:24.84387
134	10	Post	89	2018-02-07 19:57:24.849324	2018-02-07 19:57:24.849324
135	10	Post	90	2018-02-07 19:57:24.854457	2018-02-07 19:57:24.854457
136	6	Post	90	2018-02-07 19:57:24.859738	2018-02-07 19:57:24.859738
137	9	Post	90	2018-02-07 19:57:24.864712	2018-02-07 19:57:24.864712
138	7	Post	90	2018-02-07 19:57:24.870235	2018-02-07 19:57:24.870235
139	4	Post	91	2018-02-07 19:57:24.875379	2018-02-07 19:57:24.875379
140	8	Post	91	2018-02-07 19:57:24.880475	2018-02-07 19:57:24.880475
141	4	Post	92	2018-02-07 19:57:24.886138	2018-02-07 19:57:24.886138
142	9	Post	92	2018-02-07 19:57:24.891045	2018-02-07 19:57:24.891045
143	3	Post	92	2018-02-07 19:57:24.89643	2018-02-07 19:57:24.89643
144	8	Post	93	2018-02-07 19:57:24.901742	2018-02-07 19:57:24.901742
145	9	Post	93	2018-02-07 19:57:24.906697	2018-02-07 19:57:24.906697
146	2	Post	93	2018-02-07 19:57:24.911725	2018-02-07 19:57:24.911725
147	4	Post	94	2018-02-07 19:57:24.917098	2018-02-07 19:57:24.917098
148	9	Post	94	2018-02-07 19:57:24.922977	2018-02-07 19:57:24.922977
149	8	Post	94	2018-02-07 19:57:24.929115	2018-02-07 19:57:24.929115
150	6	Post	95	2018-02-07 19:57:24.93441	2018-02-07 19:57:24.93441
151	4	Post	95	2018-02-07 19:57:24.939772	2018-02-07 19:57:24.939772
152	4	Post	96	2018-02-07 19:57:24.945001	2018-02-07 19:57:24.945001
153	7	Post	97	2018-02-07 19:57:24.950672	2018-02-07 19:57:24.950672
154	2	Post	97	2018-02-07 19:57:24.956291	2018-02-07 19:57:24.956291
155	10	Post	97	2018-02-07 19:57:24.961221	2018-02-07 19:57:24.961221
156	8	Post	97	2018-02-07 19:57:24.966184	2018-02-07 19:57:24.966184
157	10	Post	98	2018-02-07 19:57:24.97143	2018-02-07 19:57:24.97143
158	1	Post	98	2018-02-07 19:57:24.976799	2018-02-07 19:57:24.976799
159	7	Post	98	2018-02-07 19:57:24.982045	2018-02-07 19:57:24.982045
160	8	Post	98	2018-02-07 19:57:24.987136	2018-02-07 19:57:24.987136
161	1	Post	99	2018-02-07 19:57:24.99222	2018-02-07 19:57:24.99222
162	10	Post	100	2018-02-07 19:57:24.997147	2018-02-07 19:57:24.997147
163	7	Post	100	2018-02-07 19:57:25.002801	2018-02-07 19:57:25.002801
164	3	Post	100	2018-02-07 19:57:25.007773	2018-02-07 19:57:25.007773
165	10	Post	101	2018-02-07 19:57:25.012876	2018-02-07 19:57:25.012876
166	9	Post	101	2018-02-07 19:57:25.018314	2018-02-07 19:57:25.018314
167	6	Post	101	2018-02-07 19:57:25.023379	2018-02-07 19:57:25.023379
168	3	Post	102	2018-02-07 19:57:25.028336	2018-02-07 19:57:25.028336
169	5	Post	103	2018-02-07 19:57:25.033702	2018-02-07 19:57:25.033702
170	10	Post	104	2018-02-07 19:57:25.039568	2018-02-07 19:57:25.039568
171	2	Post	105	2018-02-07 19:57:25.044807	2018-02-07 19:57:25.044807
172	7	Post	106	2018-02-07 19:57:25.050045	2018-02-07 19:57:25.050045
173	5	Post	106	2018-02-07 19:57:25.055032	2018-02-07 19:57:25.055032
174	2	Post	107	2018-02-07 19:57:25.060043	2018-02-07 19:57:25.060043
175	8	Post	107	2018-02-07 19:57:25.065072	2018-02-07 19:57:25.065072
176	7	Post	107	2018-02-07 19:57:25.070153	2018-02-07 19:57:25.070153
177	6	Post	108	2018-02-07 19:57:25.075153	2018-02-07 19:57:25.075153
178	7	Post	108	2018-02-07 19:57:25.080395	2018-02-07 19:57:25.080395
179	5	Post	108	2018-02-07 19:57:25.085329	2018-02-07 19:57:25.085329
180	2	Post	109	2018-02-07 19:57:25.090379	2018-02-07 19:57:25.090379
181	4	Post	109	2018-02-07 19:57:25.095574	2018-02-07 19:57:25.095574
182	9	Post	109	2018-02-07 19:57:25.10139	2018-02-07 19:57:25.10139
183	1	Post	110	2018-02-07 19:57:25.106352	2018-02-07 19:57:25.106352
184	3	Post	110	2018-02-07 19:57:25.110972	2018-02-07 19:57:25.110972
185	7	Post	111	2018-02-07 19:57:25.116429	2018-02-07 19:57:25.116429
186	3	Post	112	2018-02-07 19:57:25.121749	2018-02-07 19:57:25.121749
187	10	Post	113	2018-02-07 19:57:25.126742	2018-02-07 19:57:25.126742
188	7	Post	113	2018-02-07 19:57:25.131648	2018-02-07 19:57:25.131648
189	5	Post	114	2018-02-07 19:57:25.137215	2018-02-07 19:57:25.137215
190	10	Post	114	2018-02-07 19:57:25.142616	2018-02-07 19:57:25.142616
191	1	Post	115	2018-02-07 19:57:25.147684	2018-02-07 19:57:25.147684
192	8	Post	143	2018-02-07 19:57:25.153488	2018-02-07 19:57:25.153488
193	4	Post	143	2018-02-07 19:57:25.158426	2018-02-07 19:57:25.158426
194	9	Post	116	2018-02-07 19:57:25.163344	2018-02-07 19:57:25.163344
195	1	Post	116	2018-02-07 19:57:25.168802	2018-02-07 19:57:25.168802
196	6	Post	116	2018-02-07 19:57:25.173668	2018-02-07 19:57:25.173668
197	7	Post	116	2018-02-07 19:57:25.179695	2018-02-07 19:57:25.179695
198	6	Post	117	2018-02-07 19:57:25.184938	2018-02-07 19:57:25.184938
199	10	Post	118	2018-02-07 19:57:25.189638	2018-02-07 19:57:25.189638
200	2	Post	119	2018-02-07 19:57:25.194555	2018-02-07 19:57:25.194555
201	5	Post	119	2018-02-07 19:57:25.199646	2018-02-07 19:57:25.199646
202	9	Post	119	2018-02-07 19:57:25.204772	2018-02-07 19:57:25.204772
203	5	Post	120	2018-02-07 19:57:25.210064	2018-02-07 19:57:25.210064
204	6	Post	120	2018-02-07 19:57:25.215037	2018-02-07 19:57:25.215037
205	2	Post	120	2018-02-07 19:57:25.220402	2018-02-07 19:57:25.220402
206	10	Post	121	2018-02-07 19:57:25.225165	2018-02-07 19:57:25.225165
207	9	Post	121	2018-02-07 19:57:25.230004	2018-02-07 19:57:25.230004
208	7	Post	121	2018-02-07 19:57:25.235124	2018-02-07 19:57:25.235124
209	8	Post	122	2018-02-07 19:57:25.240414	2018-02-07 19:57:25.240414
210	8	Post	123	2018-02-07 19:57:25.24547	2018-02-07 19:57:25.24547
211	6	Post	124	2018-02-07 19:57:25.251076	2018-02-07 19:57:25.251076
212	3	Post	125	2018-02-07 19:57:25.256461	2018-02-07 19:57:25.256461
213	9	Post	125	2018-02-07 19:57:25.261491	2018-02-07 19:57:25.261491
214	5	Post	125	2018-02-07 19:57:25.266407	2018-02-07 19:57:25.266407
215	1	Post	125	2018-02-07 19:57:25.271484	2018-02-07 19:57:25.271484
216	8	Post	126	2018-02-07 19:57:25.276586	2018-02-07 19:57:25.276586
217	4	Post	126	2018-02-07 19:57:25.281458	2018-02-07 19:57:25.281458
218	6	Post	127	2018-02-07 19:57:25.28691	2018-02-07 19:57:25.28691
219	3	Post	127	2018-02-07 19:57:25.291996	2018-02-07 19:57:25.291996
220	2	Post	127	2018-02-07 19:57:25.296964	2018-02-07 19:57:25.296964
221	5	Post	127	2018-02-07 19:57:25.304741	2018-02-07 19:57:25.304741
222	10	Post	128	2018-02-07 19:57:25.309943	2018-02-07 19:57:25.309943
223	7	Post	128	2018-02-07 19:57:25.314942	2018-02-07 19:57:25.314942
224	8	Post	129	2018-02-07 19:57:25.320407	2018-02-07 19:57:25.320407
225	9	Post	129	2018-02-07 19:57:25.325259	2018-02-07 19:57:25.325259
226	5	Post	129	2018-02-07 19:57:25.330299	2018-02-07 19:57:25.330299
227	1	Post	129	2018-02-07 19:57:25.335468	2018-02-07 19:57:25.335468
228	1	Post	130	2018-02-07 19:57:25.340458	2018-02-07 19:57:25.340458
229	10	Post	131	2018-02-07 19:57:25.345386	2018-02-07 19:57:25.345386
230	7	Post	131	2018-02-07 19:57:25.350478	2018-02-07 19:57:25.350478
231	4	Post	132	2018-02-07 19:57:25.359296	2018-02-07 19:57:25.359296
232	3	Post	132	2018-02-07 19:57:25.36433	2018-02-07 19:57:25.36433
233	9	Post	132	2018-02-07 19:57:25.369395	2018-02-07 19:57:25.369395
234	6	Post	132	2018-02-07 19:57:25.374452	2018-02-07 19:57:25.374452
235	2	Post	133	2018-02-07 19:57:25.379686	2018-02-07 19:57:25.379686
236	8	Post	133	2018-02-07 19:57:25.38515	2018-02-07 19:57:25.38515
237	8	Post	134	2018-02-07 19:57:25.39054	2018-02-07 19:57:25.39054
238	3	Post	134	2018-02-07 19:57:25.395521	2018-02-07 19:57:25.395521
239	1	Post	134	2018-02-07 19:57:25.400552	2018-02-07 19:57:25.400552
240	3	Post	135	2018-02-07 19:57:25.405432	2018-02-07 19:57:25.405432
241	5	Post	135	2018-02-07 19:57:25.411043	2018-02-07 19:57:25.411043
242	3	Post	136	2018-02-07 19:57:25.416757	2018-02-07 19:57:25.416757
243	8	Post	136	2018-02-07 19:57:25.421878	2018-02-07 19:57:25.421878
244	4	Post	137	2018-02-07 19:57:25.426944	2018-02-07 19:57:25.426944
245	8	Post	137	2018-02-07 19:57:25.431926	2018-02-07 19:57:25.431926
246	4	Post	138	2018-02-07 19:57:25.437564	2018-02-07 19:57:25.437564
247	10	Post	138	2018-02-07 19:57:25.442439	2018-02-07 19:57:25.442439
248	7	Post	139	2018-02-07 19:57:25.447819	2018-02-07 19:57:25.447819
249	1	Post	139	2018-02-07 19:57:25.453772	2018-02-07 19:57:25.453772
250	5	Post	139	2018-02-07 19:57:25.458813	2018-02-07 19:57:25.458813
251	3	Post	140	2018-02-07 19:57:25.464145	2018-02-07 19:57:25.464145
252	7	Post	140	2018-02-07 19:57:25.469423	2018-02-07 19:57:25.469423
253	8	Post	140	2018-02-07 19:57:25.474563	2018-02-07 19:57:25.474563
254	4	Post	141	2018-02-07 19:57:25.480068	2018-02-07 19:57:25.480068
255	8	Post	141	2018-02-07 19:57:25.485651	2018-02-07 19:57:25.485651
256	9	Post	141	2018-02-07 19:57:25.490456	2018-02-07 19:57:25.490456
257	5	Post	141	2018-02-07 19:57:25.495664	2018-02-07 19:57:25.495664
258	4	Post	142	2018-02-07 19:57:25.501129	2018-02-07 19:57:25.501129
259	3	Post	142	2018-02-07 19:57:25.506223	2018-02-07 19:57:25.506223
260	10	Post	142	2018-02-07 19:57:25.511264	2018-02-07 19:57:25.511264
261	2	Post	144	2018-02-07 19:57:25.519312	2018-02-07 19:57:25.519312
262	9	Post	145	2018-02-07 19:57:25.524829	2018-02-07 19:57:25.524829
263	7	Post	145	2018-02-07 19:57:25.532755	2018-02-07 19:57:25.532755
264	3	Post	145	2018-02-07 19:57:25.537519	2018-02-07 19:57:25.537519
265	3	Post	146	2018-02-07 19:57:25.542309	2018-02-07 19:57:25.542309
266	6	Post	146	2018-02-07 19:57:25.547094	2018-02-07 19:57:25.547094
267	1	Post	146	2018-02-07 19:57:25.55194	2018-02-07 19:57:25.55194
268	8	Post	147	2018-02-07 19:57:25.556824	2018-02-07 19:57:25.556824
269	5	Post	147	2018-02-07 19:57:25.561977	2018-02-07 19:57:25.561977
270	4	Post	148	2018-02-07 19:57:25.567063	2018-02-07 19:57:25.567063
271	8	Post	148	2018-02-07 19:57:25.572228	2018-02-07 19:57:25.572228
272	7	Post	149	2018-02-07 19:57:25.577469	2018-02-07 19:57:25.577469
273	2	Post	149	2018-02-07 19:57:25.582172	2018-02-07 19:57:25.582172
274	8	Post	150	2018-02-07 19:57:25.588019	2018-02-07 19:57:25.588019
275	2	Post	150	2018-02-07 19:57:25.592973	2018-02-07 19:57:25.592973
276	7	Post	150	2018-02-07 19:57:25.598595	2018-02-07 19:57:25.598595
277	6	Post	151	2018-02-07 19:57:25.604155	2018-02-07 19:57:25.604155
278	8	Post	151	2018-02-07 19:57:25.609303	2018-02-07 19:57:25.609303
279	3	Post	152	2018-02-07 19:57:25.614234	2018-02-07 19:57:25.614234
280	1	Post	152	2018-02-07 19:57:25.619479	2018-02-07 19:57:25.619479
281	7	Post	153	2018-02-07 19:57:25.62438	2018-02-07 19:57:25.62438
282	10	Post	154	2018-02-07 19:57:25.629742	2018-02-07 19:57:25.629742
283	4	Post	154	2018-02-07 19:57:25.635559	2018-02-07 19:57:25.635559
284	5	Post	155	2018-02-07 19:57:25.640591	2018-02-07 19:57:25.640591
285	7	Post	156	2018-02-07 19:57:25.645276	2018-02-07 19:57:25.645276
286	4	Post	156	2018-02-07 19:57:25.650506	2018-02-07 19:57:25.650506
287	10	Post	157	2018-02-07 19:57:25.655712	2018-02-07 19:57:25.655712
288	7	Post	157	2018-02-07 19:57:25.661015	2018-02-07 19:57:25.661015
289	8	Post	157	2018-02-07 19:57:25.666632	2018-02-07 19:57:25.666632
290	9	Post	157	2018-02-07 19:57:25.671997	2018-02-07 19:57:25.671997
291	6	Post	158	2018-02-07 19:57:25.677175	2018-02-07 19:57:25.677175
292	3	Post	159	2018-02-07 19:57:25.682465	2018-02-07 19:57:25.682465
293	7	Post	159	2018-02-07 19:57:25.693996	2018-02-07 19:57:25.693996
295	7	Post	160	2018-02-07 19:57:25.70547	2018-02-07 19:57:25.70547
297	4	Post	161	2018-02-07 19:57:25.71523	2018-02-07 19:57:25.71523
298	9	Post	161	2018-02-07 19:57:25.720389	2018-02-07 19:57:25.720389
299	4	Post	162	2018-02-07 19:57:25.725507	2018-02-07 19:57:25.725507
300	8	Post	162	2018-02-07 19:57:25.730611	2018-02-07 19:57:25.730611
301	3	Post	162	2018-02-07 19:57:25.735689	2018-02-07 19:57:25.735689
302	10	Post	163	2018-02-07 19:57:25.740976	2018-02-07 19:57:25.740976
303	1	Post	163	2018-02-07 19:57:25.745927	2018-02-07 19:57:25.745927
304	10	Post	164	2018-02-07 19:57:25.751224	2018-02-07 19:57:25.751224
305	1	Post	164	2018-02-07 19:57:25.756903	2018-02-07 19:57:25.756903
306	3	Post	164	2018-02-07 19:57:25.762911	2018-02-07 19:57:25.762911
307	7	Post	164	2018-02-07 19:57:25.768997	2018-02-07 19:57:25.768997
308	2	Post	165	2018-02-07 19:57:25.774276	2018-02-07 19:57:25.774276
309	4	Post	165	2018-02-07 19:57:25.779428	2018-02-07 19:57:25.779428
310	3	Post	165	2018-02-07 19:57:25.785305	2018-02-07 19:57:25.785305
311	9	Post	166	2018-02-07 19:57:25.790396	2018-02-07 19:57:25.790396
312	10	Post	166	2018-02-07 19:57:25.795336	2018-02-07 19:57:25.795336
313	9	Post	167	2018-02-07 19:57:25.800756	2018-02-07 19:57:25.800756
314	10	Post	167	2018-02-07 19:57:25.821418	2018-02-07 19:57:25.821418
315	9	Post	168	2018-02-07 19:57:25.826149	2018-02-07 19:57:25.826149
316	3	Post	168	2018-02-07 19:57:25.830984	2018-02-07 19:57:25.830984
317	6	Post	168	2018-02-07 19:57:25.836243	2018-02-07 19:57:25.836243
318	7	Post	169	2018-02-07 19:57:25.841183	2018-02-07 19:57:25.841183
319	2	Post	170	2018-02-07 19:57:25.846078	2018-02-07 19:57:25.846078
320	1	Post	170	2018-02-07 19:57:25.851516	2018-02-07 19:57:25.851516
321	9	Post	170	2018-02-07 19:57:25.857016	2018-02-07 19:57:25.857016
322	2	Post	171	2018-02-07 19:57:25.865023	2018-02-07 19:57:25.865023
323	1	Post	171	2018-02-07 19:57:25.870422	2018-02-07 19:57:25.870422
324	7	Post	171	2018-02-07 19:57:25.875084	2018-02-07 19:57:25.875084
325	9	Post	171	2018-02-07 19:57:25.879901	2018-02-07 19:57:25.879901
326	4	Post	172	2018-02-07 19:57:25.885137	2018-02-07 19:57:25.885137
327	7	Post	173	2018-02-07 19:57:25.890416	2018-02-07 19:57:25.890416
328	7	Post	174	2018-02-07 19:57:25.895371	2018-02-07 19:57:25.895371
329	4	Post	174	2018-02-07 19:57:25.90099	2018-02-07 19:57:25.90099
330	2	Post	174	2018-02-07 19:57:25.909076	2018-02-07 19:57:25.909076
331	8	Post	175	2018-02-07 19:57:25.914309	2018-02-07 19:57:25.914309
332	4	Post	175	2018-02-07 19:57:25.919193	2018-02-07 19:57:25.919193
333	6	Post	176	2018-02-07 19:57:25.923939	2018-02-07 19:57:25.923939
334	5	Post	176	2018-02-07 19:57:25.928986	2018-02-07 19:57:25.928986
335	10	Post	177	2018-02-07 19:57:25.934025	2018-02-07 19:57:25.934025
336	7	Post	177	2018-02-07 19:57:25.938962	2018-02-07 19:57:25.938962
337	6	Post	178	2018-02-07 19:57:25.94385	2018-02-07 19:57:25.94385
338	7	Post	178	2018-02-07 19:57:25.94854	2018-02-07 19:57:25.94854
339	1	Post	178	2018-02-07 19:57:25.953604	2018-02-07 19:57:25.953604
340	7	Post	179	2018-02-07 19:57:25.958397	2018-02-07 19:57:25.958397
341	3	Post	179	2018-02-07 19:57:25.963732	2018-02-07 19:57:25.963732
342	1	Post	179	2018-02-07 19:57:25.968928	2018-02-07 19:57:25.968928
343	9	Post	180	2018-02-07 19:57:25.973927	2018-02-07 19:57:25.973927
344	7	Post	180	2018-02-07 19:57:25.978739	2018-02-07 19:57:25.978739
345	6	Post	180	2018-02-07 19:57:25.983704	2018-02-07 19:57:25.983704
346	1	Post	181	2018-02-07 19:57:25.988874	2018-02-07 19:57:25.988874
347	7	Post	182	2018-02-07 19:57:25.992288	2018-02-07 19:57:25.992288
348	3	Post	182	2018-02-07 19:57:25.996968	2018-02-07 19:57:25.996968
349	3	Post	183	2018-02-07 19:57:26.002363	2018-02-07 19:57:26.002363
350	8	Post	184	2018-02-07 19:57:26.007272	2018-02-07 19:57:26.007272
351	4	Post	184	2018-02-07 19:57:26.012211	2018-02-07 19:57:26.012211
352	5	Post	184	2018-02-07 19:57:26.016287	2018-02-07 19:57:26.016287
353	1	Post	184	2018-02-07 19:57:26.021212	2018-02-07 19:57:26.021212
354	6	Post	185	2018-02-07 19:57:26.026062	2018-02-07 19:57:26.026062
355	5	Post	185	2018-02-07 19:57:26.030898	2018-02-07 19:57:26.030898
356	3	Post	186	2018-02-07 19:57:26.035699	2018-02-07 19:57:26.035699
359	2	Post	188	2018-02-07 19:57:26.050761	2018-02-07 19:57:26.050761
360	3	Post	188	2018-02-07 19:57:26.055477	2018-02-07 19:57:26.055477
361	6	Post	189	2018-02-07 19:57:26.060266	2018-02-07 19:57:26.060266
362	4	Post	190	2018-02-07 19:57:26.065863	2018-02-07 19:57:26.065863
363	4	Post	191	2018-02-07 19:57:26.070285	2018-02-07 19:57:26.070285
364	7	Post	191	2018-02-07 19:57:26.075997	2018-02-07 19:57:26.075997
365	10	Post	191	2018-02-07 19:57:26.08093	2018-02-07 19:57:26.08093
366	6	Post	192	2018-02-07 19:57:26.086036	2018-02-07 19:57:26.086036
367	4	Post	193	2018-02-07 19:57:26.091189	2018-02-07 19:57:26.091189
368	9	Post	193	2018-02-07 19:57:26.099399	2018-02-07 19:57:26.099399
369	10	Post	193	2018-02-07 19:57:26.104521	2018-02-07 19:57:26.104521
370	2	Post	194	2018-02-07 19:57:26.109627	2018-02-07 19:57:26.109627
371	4	Post	194	2018-02-07 19:57:26.114451	2018-02-07 19:57:26.114451
372	3	Post	194	2018-02-07 19:57:26.119554	2018-02-07 19:57:26.119554
373	8	Post	195	2018-02-07 19:57:26.127637	2018-02-07 19:57:26.127637
374	3	Post	195	2018-02-07 19:57:26.134106	2018-02-07 19:57:26.134106
375	8	Post	196	2018-02-07 19:57:26.139599	2018-02-07 19:57:26.139599
376	6	Post	196	2018-02-07 19:57:26.144377	2018-02-07 19:57:26.144377
377	9	Post	196	2018-02-07 19:57:26.149351	2018-02-07 19:57:26.149351
378	8	Post	197	2018-02-07 19:57:26.154762	2018-02-07 19:57:26.154762
379	9	Post	197	2018-02-07 19:57:26.15939	2018-02-07 19:57:26.15939
380	3	Post	197	2018-02-07 19:57:26.16406	2018-02-07 19:57:26.16406
381	7	Post	198	2018-02-07 19:57:26.169247	2018-02-07 19:57:26.169247
382	4	Post	198	2018-02-07 19:57:26.174285	2018-02-07 19:57:26.174285
383	8	Post	198	2018-02-07 19:57:26.179168	2018-02-07 19:57:26.179168
384	4	Post	199	2018-02-07 19:57:26.184692	2018-02-07 19:57:26.184692
385	3	Post	200	2018-02-07 19:57:26.19006	2018-02-07 19:57:26.19006
386	8	Post	200	2018-02-07 19:57:26.19489	2018-02-07 19:57:26.19489
387	9	Post	201	2018-02-07 19:57:26.200581	2018-02-07 19:57:26.200581
388	4	Post	201	2018-02-07 19:57:26.205395	2018-02-07 19:57:26.205395
389	7	Post	201	2018-02-07 19:57:26.210309	2018-02-07 19:57:26.210309
390	7	Post	202	2018-02-07 19:57:26.215057	2018-02-07 19:57:26.215057
391	8	Post	202	2018-02-07 19:57:26.219991	2018-02-07 19:57:26.219991
392	3	Post	203	2018-02-07 19:57:26.224851	2018-02-07 19:57:26.224851
393	4	Post	203	2018-02-07 19:57:26.229824	2018-02-07 19:57:26.229824
394	2	Post	203	2018-02-07 19:57:26.234971	2018-02-07 19:57:26.234971
395	7	Post	203	2018-02-07 19:57:26.23993	2018-02-07 19:57:26.23993
396	3	Post	204	2018-02-07 19:57:26.24471	2018-02-07 19:57:26.24471
397	8	Post	204	2018-02-07 19:57:26.249591	2018-02-07 19:57:26.249591
398	7	Post	204	2018-02-07 19:57:26.254347	2018-02-07 19:57:26.254347
399	4	Post	204	2018-02-07 19:57:26.25958	2018-02-07 19:57:26.25958
400	9	Post	205	2018-02-07 19:57:26.264537	2018-02-07 19:57:26.264537
401	7	Post	205	2018-02-07 19:57:26.269595	2018-02-07 19:57:26.269595
402	5	Post	205	2018-02-07 19:57:26.274463	2018-02-07 19:57:26.274463
403	7	Post	206	2018-02-07 19:57:26.279092	2018-02-07 19:57:26.279092
404	1	Post	207	2018-02-07 19:57:26.284025	2018-02-07 19:57:26.284025
405	3	Post	207	2018-02-07 19:57:26.289192	2018-02-07 19:57:26.289192
406	3	Post	208	2018-02-07 19:57:26.294062	2018-02-07 19:57:26.294062
408	9	Post	209	2018-02-07 19:57:26.304359	2018-02-07 19:57:26.304359
409	10	Post	209	2018-02-07 19:57:26.316207	2018-02-07 19:57:26.316207
410	5	Post	210	2018-02-07 19:57:26.321025	2018-02-07 19:57:26.321025
411	8	Post	211	2018-02-07 19:57:26.325983	2018-02-07 19:57:26.325983
412	2	Post	211	2018-02-07 19:57:26.330935	2018-02-07 19:57:26.330935
413	6	Post	211	2018-02-07 19:57:26.335823	2018-02-07 19:57:26.335823
415	4	Medium	53	2018-02-07 19:57:26.372409	2018-02-07 19:57:26.372409
416	10	Medium	3	2018-02-07 19:57:26.377802	2018-02-07 19:57:26.377802
417	10	Medium	1	2018-02-07 19:57:26.383606	2018-02-07 19:57:26.383606
418	5	Medium	1	2018-02-07 19:57:26.38882	2018-02-07 19:57:26.38882
419	7	Medium	2	2018-02-07 19:57:26.393843	2018-02-07 19:57:26.393843
420	3	Medium	2	2018-02-07 19:57:26.398851	2018-02-07 19:57:26.398851
421	8	Medium	2	2018-02-07 19:57:26.403832	2018-02-07 19:57:26.403832
422	2	Medium	2	2018-02-07 19:57:26.408653	2018-02-07 19:57:26.408653
423	2	Medium	4	2018-02-07 19:57:26.413555	2018-02-07 19:57:26.413555
427	4	Medium	7	2018-02-07 19:57:26.447361	2018-02-07 19:57:26.447361
428	10	Medium	7	2018-02-07 19:57:26.45246	2018-02-07 19:57:26.45246
429	7	Medium	8	2018-02-07 19:57:26.457395	2018-02-07 19:57:26.457395
430	1	Medium	8	2018-02-07 19:57:26.462533	2018-02-07 19:57:26.462533
431	4	Medium	8	2018-02-07 19:57:26.467333	2018-02-07 19:57:26.467333
432	1	Medium	9	2018-02-07 19:57:26.47219	2018-02-07 19:57:26.47219
433	6	Medium	9	2018-02-07 19:57:26.477166	2018-02-07 19:57:26.477166
434	4	Medium	10	2018-02-07 19:57:26.482059	2018-02-07 19:57:26.482059
435	9	Medium	10	2018-02-07 19:57:26.487009	2018-02-07 19:57:26.487009
436	4	Medium	11	2018-02-07 19:57:26.491841	2018-02-07 19:57:26.491841
437	2	Medium	11	2018-02-07 19:57:26.496761	2018-02-07 19:57:26.496761
438	6	Medium	44	2018-02-07 19:57:26.501825	2018-02-07 19:57:26.501825
439	5	Medium	44	2018-02-07 19:57:26.506927	2018-02-07 19:57:26.506927
440	6	Medium	51	2018-02-07 19:57:26.512042	2018-02-07 19:57:26.512042
441	3	Medium	51	2018-02-07 19:57:26.517228	2018-02-07 19:57:26.517228
442	5	Medium	46	2018-02-07 19:57:26.522813	2018-02-07 19:57:26.522813
443	2	Medium	46	2018-02-07 19:57:26.527771	2018-02-07 19:57:26.527771
444	1	Medium	46	2018-02-07 19:57:26.533727	2018-02-07 19:57:26.533727
445	7	Medium	52	2018-02-07 19:57:26.542015	2018-02-07 19:57:26.542015
446	9	Medium	52	2018-02-07 19:57:26.547017	2018-02-07 19:57:26.547017
447	4	Medium	52	2018-02-07 19:57:26.551991	2018-02-07 19:57:26.551991
448	2	Medium	49	2018-02-07 19:57:26.556799	2018-02-07 19:57:26.556799
449	9	Medium	49	2018-02-07 19:57:26.561765	2018-02-07 19:57:26.561765
450	7	Medium	49	2018-02-07 19:57:26.569421	2018-02-07 19:57:26.569421
451	6	Medium	49	2018-02-07 19:57:26.57488	2018-02-07 19:57:26.57488
452	3	Medium	58	2018-02-07 19:57:26.580165	2018-02-07 19:57:26.580165
454	6	Medium	59	2018-02-07 19:57:26.590107	2018-02-07 19:57:26.590107
455	9	Medium	57	2018-02-07 19:57:26.595183	2018-02-07 19:57:26.595183
456	10	Medium	57	2018-02-07 19:57:26.603018	2018-02-07 19:57:26.603018
457	1	Medium	57	2018-02-07 19:57:26.607844	2018-02-07 19:57:26.607844
458	5	User	24	2018-02-07 19:57:26.653024	2018-02-07 19:57:26.653024
459	9	User	23	2018-02-07 19:57:26.658018	2018-02-07 19:57:26.658018
460	8	User	23	2018-02-07 19:57:26.663009	2018-02-07 19:57:26.663009
461	10	User	14	2018-02-07 19:57:26.668409	2018-02-07 19:57:26.668409
462	8	User	14	2018-02-07 19:57:26.673449	2018-02-07 19:57:26.673449
463	6	User	13	2018-02-07 19:57:26.678838	2018-02-07 19:57:26.678838
464	4	User	26	2018-02-07 19:57:26.68449	2018-02-07 19:57:26.68449
465	10	User	26	2018-02-07 19:57:26.689746	2018-02-07 19:57:26.689746
466	6	User	8	2018-02-07 19:57:26.694499	2018-02-07 19:57:26.694499
467	10	User	8	2018-02-07 19:57:26.699541	2018-02-07 19:57:26.699541
468	2	User	8	2018-02-07 19:57:26.7044	2018-02-07 19:57:26.7044
469	9	User	10	2018-02-07 19:57:26.709701	2018-02-07 19:57:26.709701
470	7	User	10	2018-02-07 19:57:26.714421	2018-02-07 19:57:26.714421
471	2	User	11	2018-02-07 19:57:26.719405	2018-02-07 19:57:26.719405
472	5	User	11	2018-02-07 19:57:26.724293	2018-02-07 19:57:26.724293
473	1	User	28	2018-02-07 19:57:26.729367	2018-02-07 19:57:26.729367
474	9	User	15	2018-02-07 19:57:26.734271	2018-02-07 19:57:26.734271
475	5	User	15	2018-02-07 19:57:26.740378	2018-02-07 19:57:26.740378
476	6	User	15	2018-02-07 19:57:26.745103	2018-02-07 19:57:26.745103
477	3	User	27	2018-02-07 19:57:26.750261	2018-02-07 19:57:26.750261
478	6	User	27	2018-02-07 19:57:26.755971	2018-02-07 19:57:26.755971
479	10	User	27	2018-02-07 19:57:26.760821	2018-02-07 19:57:26.760821
480	2	User	27	2018-02-07 19:57:26.765749	2018-02-07 19:57:26.765749
481	9	User	17	2018-02-07 19:57:26.770684	2018-02-07 19:57:26.770684
482	7	User	20	2018-02-07 19:57:26.775778	2018-02-07 19:57:26.775778
483	6	User	20	2018-02-07 19:57:26.78051	2018-02-07 19:57:26.78051
484	1	User	21	2018-02-07 19:57:26.785352	2018-02-07 19:57:26.785352
485	5	User	21	2018-02-07 19:57:26.790117	2018-02-07 19:57:26.790117
486	2	User	22	2018-02-07 19:57:26.794969	2018-02-07 19:57:26.794969
487	10	User	22	2018-02-07 19:57:26.80039	2018-02-07 19:57:26.80039
488	9	User	36	2018-02-07 19:57:26.805161	2018-02-07 19:57:26.805161
489	3	User	37	2018-02-07 19:57:26.810019	2018-02-07 19:57:26.810019
490	6	User	37	2018-02-07 19:57:26.815084	2018-02-07 19:57:26.815084
491	3	User	38	2018-02-07 19:57:26.820473	2018-02-07 19:57:26.820473
492	6	User	38	2018-02-07 19:57:26.825207	2018-02-07 19:57:26.825207
493	9	User	40	2018-02-07 19:57:26.830205	2018-02-07 19:57:26.830205
494	6	User	40	2018-02-07 19:57:26.835305	2018-02-07 19:57:26.835305
496	8	User	2	2018-02-07 19:57:26.844873	2018-02-07 19:57:26.844873
497	2	User	18	2018-02-07 19:57:26.850132	2018-02-07 19:57:26.850132
498	8	User	18	2018-02-07 19:57:26.855057	2018-02-07 19:57:26.855057
500	2	User	3	2018-02-07 19:57:26.865098	2018-02-07 19:57:26.865098
501	5	User	3	2018-02-07 19:57:26.870512	2018-02-07 19:57:26.870512
502	9	User	12	2018-02-07 19:57:26.875315	2018-02-07 19:57:26.875315
503	7	User	12	2018-02-07 19:57:26.880147	2018-02-07 19:57:26.880147
504	4	User	12	2018-02-07 19:57:26.884857	2018-02-07 19:57:26.884857
505	1	User	19	2018-02-07 19:57:26.889882	2018-02-07 19:57:26.889882
506	1	User	41	2018-02-07 19:57:26.894828	2018-02-07 19:57:26.894828
507	9	User	41	2018-02-07 19:57:26.90056	2018-02-07 19:57:26.90056
508	3	User	41	2018-02-07 19:57:26.905265	2018-02-07 19:57:26.905265
509	4	User	42	2018-02-07 19:57:26.910255	2018-02-07 19:57:26.910255
510	1	User	42	2018-02-07 19:57:26.915076	2018-02-07 19:57:26.915076
511	3	User	44	2018-02-07 19:57:26.920466	2018-02-07 19:57:26.920466
512	7	User	44	2018-02-07 19:57:26.925228	2018-02-07 19:57:26.925228
513	9	User	44	2018-02-07 19:57:26.929875	2018-02-07 19:57:26.929875
514	8	User	45	2018-02-07 19:57:26.935105	2018-02-07 19:57:26.935105
515	8	User	46	2018-02-07 19:57:26.939946	2018-02-07 19:57:26.939946
516	5	User	46	2018-02-07 19:57:26.944654	2018-02-07 19:57:26.944654
517	8	User	47	2018-02-07 19:57:26.949917	2018-02-07 19:57:26.949917
518	7	User	47	2018-02-07 19:57:26.95471	2018-02-07 19:57:26.95471
519	1	User	48	2018-02-07 19:57:26.959481	2018-02-07 19:57:26.959481
520	5	User	48	2018-02-07 19:57:26.964243	2018-02-07 19:57:26.964243
521	7	User	48	2018-02-07 19:57:26.969353	2018-02-07 19:57:26.969353
522	3	User	48	2018-02-07 19:57:26.974256	2018-02-07 19:57:26.974256
523	7	User	49	2018-02-07 19:57:26.979585	2018-02-07 19:57:26.979585
524	6	User	49	2018-02-07 19:57:26.985362	2018-02-07 19:57:26.985362
525	4	User	49	2018-02-07 19:57:26.990636	2018-02-07 19:57:26.990636
526	8	User	50	2018-02-07 19:57:26.99588	2018-02-07 19:57:26.99588
527	3	User	51	2018-02-07 19:57:27.000963	2018-02-07 19:57:27.000963
528	4	User	51	2018-02-07 19:57:27.006068	2018-02-07 19:57:27.006068
529	8	User	52	2018-02-07 19:57:27.011387	2018-02-07 19:57:27.011387
530	4	User	52	2018-02-07 19:57:27.016572	2018-02-07 19:57:27.016572
531	7	User	52	2018-02-07 19:57:27.021472	2018-02-07 19:57:27.021472
532	3	User	52	2018-02-07 19:57:27.029089	2018-02-07 19:57:27.029089
533	8	User	54	2018-02-07 19:57:27.034504	2018-02-07 19:57:27.034504
534	1	User	54	2018-02-07 19:57:27.039747	2018-02-07 19:57:27.039747
535	2	User	54	2018-02-07 19:57:27.044715	2018-02-07 19:57:27.044715
536	6	User	54	2018-02-07 19:57:27.049814	2018-02-07 19:57:27.049814
537	10	User	30	2018-02-07 19:57:27.05567	2018-02-07 19:57:27.05567
538	5	User	30	2018-02-07 19:57:27.060519	2018-02-07 19:57:27.060519
539	6	User	31	2018-02-07 19:57:27.06589	2018-02-07 19:57:27.06589
540	7	User	31	2018-02-07 19:57:27.070849	2018-02-07 19:57:27.070849
541	4	User	31	2018-02-07 19:57:27.075931	2018-02-07 19:57:27.075931
542	8	User	31	2018-02-07 19:57:27.083869	2018-02-07 19:57:27.083869
543	6	User	32	2018-02-07 19:57:27.089213	2018-02-07 19:57:27.089213
544	8	User	33	2018-02-07 19:57:27.093981	2018-02-07 19:57:27.093981
545	9	User	34	2018-02-07 19:57:27.099109	2018-02-07 19:57:27.099109
546	3	User	34	2018-02-07 19:57:27.104135	2018-02-07 19:57:27.104135
547	8	User	34	2018-02-07 19:57:27.109013	2018-02-07 19:57:27.109013
548	4	User	61	2018-02-07 19:57:27.113889	2018-02-07 19:57:27.113889
549	10	User	61	2018-02-07 19:57:27.118853	2018-02-07 19:57:27.118853
550	2	User	62	2018-02-07 19:57:27.123788	2018-02-07 19:57:27.123788
551	9	User	62	2018-02-07 19:57:27.128749	2018-02-07 19:57:27.128749
552	1	User	62	2018-02-07 19:57:27.1339	2018-02-07 19:57:27.1339
553	3	User	62	2018-02-07 19:57:27.139332	2018-02-07 19:57:27.139332
554	9	User	63	2018-02-07 19:57:27.147258	2018-02-07 19:57:27.147258
555	4	User	63	2018-02-07 19:57:27.152937	2018-02-07 19:57:27.152937
556	10	User	65	2018-02-07 19:57:27.157904	2018-02-07 19:57:27.157904
557	9	User	65	2018-02-07 19:57:27.162883	2018-02-07 19:57:27.162883
558	4	User	66	2018-02-07 19:57:27.168786	2018-02-07 19:57:27.168786
559	10	User	66	2018-02-07 19:57:27.173897	2018-02-07 19:57:27.173897
560	6	User	66	2018-02-07 19:57:27.178865	2018-02-07 19:57:27.178865
561	2	User	68	2018-02-07 19:57:27.184041	2018-02-07 19:57:27.184041
562	9	User	69	2018-02-07 19:57:27.189339	2018-02-07 19:57:27.189339
563	5	User	69	2018-02-07 19:57:27.194142	2018-02-07 19:57:27.194142
564	2	User	69	2018-02-07 19:57:27.198994	2018-02-07 19:57:27.198994
565	1	User	53	2018-02-07 19:57:27.20429	2018-02-07 19:57:27.20429
566	5	User	53	2018-02-07 19:57:27.209037	2018-02-07 19:57:27.209037
567	8	User	53	2018-02-07 19:57:27.214301	2018-02-07 19:57:27.214301
568	8	User	71	2018-02-07 19:57:27.219588	2018-02-07 19:57:27.219588
569	8	User	72	2018-02-07 19:57:27.224403	2018-02-07 19:57:27.224403
570	1	User	72	2018-02-07 19:57:27.2291	2018-02-07 19:57:27.2291
571	3	User	72	2018-02-07 19:57:27.233957	2018-02-07 19:57:27.233957
572	7	User	73	2018-02-07 19:57:27.238862	2018-02-07 19:57:27.238862
573	5	User	73	2018-02-07 19:57:27.243771	2018-02-07 19:57:27.243771
574	2	User	73	2018-02-07 19:57:27.248858	2018-02-07 19:57:27.248858
575	5	User	74	2018-02-07 19:57:27.254511	2018-02-07 19:57:27.254511
576	8	User	74	2018-02-07 19:57:27.259591	2018-02-07 19:57:27.259591
577	1	User	74	2018-02-07 19:57:27.264385	2018-02-07 19:57:27.264385
578	3	User	74	2018-02-07 19:57:27.269496	2018-02-07 19:57:27.269496
579	7	User	75	2018-02-07 19:57:27.274293	2018-02-07 19:57:27.274293
580	6	User	75	2018-02-07 19:57:27.279388	2018-02-07 19:57:27.279388
581	3	User	76	2018-02-07 19:57:27.28493	2018-02-07 19:57:27.28493
582	10	User	64	2018-02-07 19:57:27.290125	2018-02-07 19:57:27.290125
583	3	User	16	2018-02-07 19:57:27.295686	2018-02-07 19:57:27.295686
584	10	User	16	2018-02-07 19:57:27.301093	2018-02-07 19:57:27.301093
585	1	User	16	2018-02-07 19:57:27.30636	2018-02-07 19:57:27.30636
586	8	User	16	2018-02-07 19:57:27.311122	2018-02-07 19:57:27.311122
587	8	User	29	2018-02-07 19:57:27.316045	2018-02-07 19:57:27.316045
588	4	User	29	2018-02-07 19:57:27.32092	2018-02-07 19:57:27.32092
589	2	User	29	2018-02-07 19:57:27.32581	2018-02-07 19:57:27.32581
590	4	User	9	2018-02-07 19:57:27.330821	2018-02-07 19:57:27.330821
591	7	User	9	2018-02-07 19:57:27.335745	2018-02-07 19:57:27.335745
592	5	User	57	2018-02-07 19:57:27.340563	2018-02-07 19:57:27.340563
593	9	User	57	2018-02-07 19:57:27.345558	2018-02-07 19:57:27.345558
594	10	User	57	2018-02-07 19:57:27.350719	2018-02-07 19:57:27.350719
595	1	User	58	2018-02-07 19:57:27.356065	2018-02-07 19:57:27.356065
596	8	User	55	2018-02-07 19:57:27.36101	2018-02-07 19:57:27.36101
597	7	User	55	2018-02-07 19:57:27.366171	2018-02-07 19:57:27.366171
598	7	User	59	2018-02-07 19:57:27.37137	2018-02-07 19:57:27.37137
599	6	User	59	2018-02-07 19:57:27.376062	2018-02-07 19:57:27.376062
600	9	User	59	2018-02-07 19:57:27.380957	2018-02-07 19:57:27.380957
601	5	User	59	2018-02-07 19:57:27.38638	2018-02-07 19:57:27.38638
602	10	User	60	2018-02-07 19:57:27.391095	2018-02-07 19:57:27.391095
603	2	User	60	2018-02-07 19:57:27.396258	2018-02-07 19:57:27.396258
604	6	User	77	2018-02-07 19:57:27.40125	2018-02-07 19:57:27.40125
605	8	User	77	2018-02-07 19:57:27.406295	2018-02-07 19:57:27.406295
606	2	User	56	2018-02-07 19:57:27.411398	2018-02-07 19:57:27.411398
607	6	User	56	2018-02-07 19:57:27.416488	2018-02-07 19:57:27.416488
608	3	User	56	2018-02-07 19:57:27.422239	2018-02-07 19:57:27.422239
609	9	User	67	2018-02-07 19:57:27.428084	2018-02-07 19:57:27.428084
610	10	User	67	2018-02-07 19:57:27.433896	2018-02-07 19:57:27.433896
611	8	User	67	2018-02-07 19:57:27.439034	2018-02-07 19:57:27.439034
612	5	User	35	2018-02-07 19:57:27.44654	2018-02-07 19:57:27.44654
613	4	User	39	2018-02-07 19:57:27.451668	2018-02-07 19:57:27.451668
614	6	User	39	2018-02-07 19:57:27.456685	2018-02-07 19:57:27.456685
615	1	User	39	2018-02-07 19:57:27.464454	2018-02-07 19:57:27.464454
616	3	User	25	2018-02-07 19:57:27.470107	2018-02-07 19:57:27.470107
617	7	User	43	2018-02-07 19:57:27.475267	2018-02-07 19:57:27.475267
618	6	User	70	2018-02-07 19:57:27.48021	2018-02-07 19:57:27.48021
619	10	User	1	2018-02-07 19:57:27.485966	2018-02-07 19:57:27.485966
620	8	User	1	2018-02-07 19:57:27.491084	2018-02-07 19:57:27.491084
621	7	User	6	2018-02-07 19:57:27.495899	2018-02-07 19:57:27.495899
622	4	User	6	2018-02-07 19:57:27.501743	2018-02-07 19:57:27.501743
623	5	User	6	2018-02-07 19:57:27.507036	2018-02-07 19:57:27.507036
625	7	User	7	2018-02-07 19:57:27.517156	2018-02-07 19:57:27.517156
627	11	User	1	2018-02-07 20:31:49.059709	2018-02-07 20:31:49.059709
628	2	Post	212	2018-02-08 01:04:36.43512	2018-02-08 01:04:36.43512
629	6	Post	212	2018-02-08 01:04:36.483411	2018-02-08 01:04:36.483411
630	4	Medium	60	2018-02-08 01:10:56.021151	2018-02-08 01:10:56.021151
632	2	Post	216	2018-02-08 01:30:39.371048	2018-02-08 01:30:39.371048
633	8	Post	216	2018-02-08 01:30:39.38641	2018-02-08 01:30:39.38641
634	2	Post	\N	2018-02-08 01:47:27.377663	2018-02-08 01:47:27.377663
635	6	Post	\N	2018-02-08 01:47:27.426614	2018-02-08 01:47:27.426614
636	3	User	2	2018-02-08 03:01:49.671913	2018-02-08 03:01:49.671913
637	4	Post	218	2018-02-08 03:56:03.643938	2018-02-08 03:56:03.643938
638	4	Post	219	2018-02-08 05:06:34.891382	2018-02-08 05:06:34.891382
642	8	Post	219	2018-02-08 05:07:57.054824	2018-02-08 05:07:57.054824
643	20	User	3	2018-02-08 05:09:09.435036	2018-02-08 05:09:09.435036
646	6	User	7	2018-02-08 22:34:33.280195	2018-02-08 22:34:33.280195
647	10	User	7	2018-02-08 22:34:33.346907	2018-02-08 22:34:33.346907
649	6	Post	220	2018-02-12 08:42:10.484395	2018-02-12 08:42:10.484395
650	10	Post	220	2018-02-12 08:42:10.535881	2018-02-12 08:42:10.535881
651	5	Post	221	2018-02-13 22:32:48.41041	2018-02-13 22:32:48.41041
652	7	Post	221	2018-02-13 22:32:48.445501	2018-02-13 22:32:48.445501
653	7	Medium	62	2018-02-13 22:39:34.211858	2018-02-13 22:39:34.211858
654	24	Medium	62	2018-02-13 22:39:34.250906	2018-02-13 22:39:34.250906
655	25	Medium	62	2018-02-13 22:39:34.26044	2018-02-13 22:39:34.26044
656	24	Post	221	2018-02-13 23:01:31.565683	2018-02-13 23:01:31.565683
657	25	Post	221	2018-02-13 23:01:31.581035	2018-02-13 23:01:31.581035
658	3	Medium	64	2018-02-13 23:33:32.701983	2018-02-13 23:33:32.701983
659	5	Medium	64	2018-02-13 23:33:32.706236	2018-02-13 23:33:32.706236
660	7	Medium	64	2018-02-13 23:33:32.709238	2018-02-13 23:33:32.709238
661	24	Medium	64	2018-02-13 23:33:32.712246	2018-02-13 23:33:32.712246
662	25	Medium	64	2018-02-13 23:33:32.716807	2018-02-13 23:33:32.716807
664	5	Post	222	2018-02-13 23:40:30.458324	2018-02-13 23:40:30.458324
665	6	Post	222	2018-02-13 23:40:30.460224	2018-02-13 23:40:30.460224
666	7	Post	222	2018-02-13 23:40:30.461947	2018-02-13 23:40:30.461947
667	26	Post	222	2018-02-13 23:41:02.251609	2018-02-13 23:41:02.251609
668	27	Post	222	2018-02-13 23:41:39.742505	2018-02-13 23:41:39.742505
669	6	Medium	65	2018-02-13 23:46:17.575613	2018-02-13 23:46:17.575613
670	26	Medium	65	2018-02-13 23:46:17.603869	2018-02-13 23:46:17.603869
671	27	Medium	65	2018-02-13 23:46:17.610835	2018-02-13 23:46:17.610835
672	3	Post	223	2018-02-14 00:36:06.875467	2018-02-14 00:36:06.875467
673	5	Post	223	2018-02-14 00:36:06.886441	2018-02-14 00:36:06.886441
674	2	Post	224	2018-02-15 01:15:32.877879	2018-02-15 01:15:32.877879
675	5	Post	224	2018-02-15 01:15:32.917652	2018-02-15 01:15:32.917652
676	7	Post	224	2018-02-15 01:15:32.923383	2018-02-15 01:15:32.923383
677	20	Post	224	2018-02-15 01:15:32.934799	2018-02-15 01:15:32.934799
682	2	Post	59	2018-02-15 01:48:11.712718	2018-02-15 01:48:11.712718
683	5	Post	59	2018-02-15 01:48:11.719812	2018-02-15 01:48:11.719812
684	20	Post	59	2018-02-15 01:48:11.728981	2018-02-15 01:48:11.728981
685	2	Medium	68	2018-02-15 01:50:54.369587	2018-02-15 01:50:54.369587
686	5	Medium	68	2018-02-15 01:50:54.377585	2018-02-15 01:50:54.377585
687	7	Medium	68	2018-02-15 01:50:54.382955	2018-02-15 01:50:54.382955
688	20	Medium	68	2018-02-15 01:50:54.389739	2018-02-15 01:50:54.389739
689	2	Post	52	2018-02-15 04:05:46.65317	2018-02-15 04:05:46.65317
690	5	Post	52	2018-02-15 04:05:46.698657	2018-02-15 04:05:46.698657
691	20	Post	52	2018-02-15 04:05:46.70864	2018-02-15 04:05:46.70864
692	5	Medium	5	2018-02-15 04:43:07.062231	2018-02-15 04:43:07.062231
693	7	Medium	5	2018-02-15 04:43:07.088375	2018-02-15 04:43:07.088375
694	5	Post	225	2018-02-15 04:46:02.601028	2018-02-15 04:46:02.601028
695	7	Post	225	2018-02-15 04:46:02.606764	2018-02-15 04:46:02.606764
696	5	Medium	70	2018-02-15 04:50:38.716085	2018-02-15 04:50:38.716085
697	1	Medium	58	2018-02-15 05:21:03.113754	2018-02-15 05:21:03.113754
698	7	Post	187	2018-02-15 05:26:50.012382	2018-02-15 05:26:50.012382
699	10	Post	187	2018-02-15 05:26:50.023694	2018-02-15 05:26:50.023694
700	7	Post	208	2018-02-15 05:30:32.204379	2018-02-15 05:30:32.204379
701	6	Post	160	2018-02-15 20:18:11.387042	2018-02-15 20:18:11.387042
702	7	Post	226	2018-02-15 20:33:36.517613	2018-02-15 20:33:36.517613
703	24	Post	226	2018-02-15 20:33:36.538681	2018-02-15 20:33:36.538681
704	25	Post	226	2018-02-15 20:33:36.548062	2018-02-15 20:33:36.548062
705	6	Post	227	2018-02-15 23:56:39.614025	2018-02-15 23:56:39.614025
706	7	Post	227	2018-02-15 23:56:39.623983	2018-02-15 23:56:39.623983
707	10	Post	227	2018-02-15 23:56:39.626293	2018-02-15 23:56:39.626293
\.


--
-- Data for Name: tags; Type: TABLE DATA; Schema: public; Owner: jacklee
--

COPY tags (id, name, created_at, updated_at) FROM stdin;
1	Cardiology	2018-02-02 01:12:21.986196	2018-02-02 01:12:21.986196
2	Endocrinology	2018-02-02 01:12:35.030517	2018-02-02 01:12:35.030517
3	Emergency	2018-02-07 19:42:27.233307	2018-02-07 19:42:27.233307
4	Pediatrics	2018-02-07 19:42:27.293042	2018-02-07 19:42:27.293042
5	Internal Medicine	2018-02-07 19:42:27.301036	2018-02-07 19:42:27.301036
6	Public Health	2018-02-07 19:42:28.651212	2018-02-07 19:42:28.651212
7	Family Medicine	2018-02-07 19:42:28.661784	2018-02-07 19:42:28.661784
8	Surgery	2018-02-07 19:42:28.668916	2018-02-07 19:42:28.668916
10	Psychiatry	2018-02-07 19:42:28.686532	2018-02-07 19:42:28.686532
11	Cardiothoracic	2018-02-07 20:31:48.999595	2018-02-07 20:31:48.999595
20	Diabetes Mellitus	2018-02-07 21:05:27.181681	2018-02-07 21:05:27.181681
9	Obstetrics & Gynecology	2018-02-07 19:42:28.676284	2018-02-07 19:42:28.676284
24	Respirology	2018-02-13 22:30:32.28235	2018-02-13 22:30:32.28235
25	Asthma	2018-02-13 22:31:25.513884	2018-02-13 22:31:25.513884
26	Epidemiology	2018-02-13 23:40:43.497139	2018-02-13 23:40:43.497139
27	Technology	2018-02-13 23:41:14.761793	2018-02-13 23:41:14.761793
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: jacklee
--

COPY users (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, created_at, updated_at, provider, uid, first_name, last_name, api_key, user_id, profile_image_id, profile_image_filename, profile_image_size, profile_image_content_type, slug, location, latitude, longitude, default_image, is_admin) FROM stdin;
24	jovan.connelly@example.com	$2a$11$111q5xMj70tyMABSxUZRRO.Zdq0pdetNwZ7zTkix6vW6LAMFWgwVi	\N	\N	\N	0	\N	\N	\N	\N	2018-02-03 03:17:28.850024	2018-02-03 04:34:35.839318	\N	\N	Jovan	Connelly	067fc090388b5394c2dde91d685a42e57636218be3bd663d094465a323b5bba5	\N	\N	\N	\N	\N	jovan	Vancouver, BC	49.2952016999999998	-123.070652100000004	/user_profile_images/image03.jpg	f
23	amani.stracke@example.com	$2a$11$WfVRJOaU0kl6BO9GqPpnJ.p7eLiZDCeodZM55a3OUFBepukfL5zja	\N	\N	\N	0	\N	\N	\N	\N	2018-02-03 03:17:28.677151	2018-02-03 04:34:35.815463	\N	\N	Amani	Stracke	1d65e0a3deb59d68452de75b09a5aa444d0c94a92e8ca4480fdb4c13946714c3	\N	\N	\N	\N	\N	amani	Vancouver, BC	49.3393017	-123.0358521	/user_profile_images/image07.jpg	f
14	jaydon.ondricka@example.com	$2a$11$d500y44BEePpWdfseBVoQut9C9tANvhcROc74zAjzooH44nQib902	\N	\N	\N	0	\N	\N	\N	\N	2018-02-03 03:17:27.089246	2018-02-03 04:34:35.919886	\N	\N	Jaydon	Ondricka	e71390874996518b4fef3f9e273a4cf54b0dbeadece0434ea604eef509c3f9e4	\N	\N	\N	\N	\N	jaydon	Vancouver, BC	49.3590017000000003	-123.054352100000003	/user_profile_images/image17.jpg	f
13	domenica.bernier@example.com	$2a$11$QEZRTNYWgaPfldonAaFAk.Tt4tFJs0ab397DSpK7OR4xAnwg.pLFK	\N	\N	\N	0	\N	\N	\N	\N	2018-02-03 03:17:26.907831	2018-02-03 04:34:35.910208	\N	\N	Domenica	Bernier	d73317e0509c659a4ee3b6b6d4892a236c9ff40d9cbbe3c0631956e6d91a0713	\N	\N	\N	\N	\N	domenica	Vancouver, BC	49.2980017000000004	-123.056552100000005	/user_profile_images/image02.jpg	f
26	wallace.torphy@example.com	$2a$11$XsM53uN3ubZV9C1RJ6LmS.1kCo0FucDA/YsBf5PqZ4zrM7wW8yxAu	\N	\N	\N	0	\N	\N	\N	\N	2018-02-03 03:17:29.215444	2018-02-03 04:34:35.858038	\N	\N	Wallace	Torphy	072bf5d27b54ace00e58992829d0d95979b9efafd2fb5a5d677240207f2beede	\N	\N	\N	\N	\N	wallace	Vancouver, BC	49.3598016999999984	-123.069852100000006	/user_profile_images/image03.jpg	f
8	giovani.anderson@example.com	$2a$11$b28QUQMXXfUEQSTeskUVBOGFYU50P2G5yh81StyRAenxMvObVMu2u	\N	\N	\N	0	\N	\N	\N	\N	2018-02-03 03:17:25.857926	2018-02-03 04:34:35.86801	\N	\N	Giovani	Anderson	cd86d40b9a86b027ae332162521e1bfbc8f73aa91dff4ce8647a2e6a70c2dba9	\N	\N	\N	\N	\N	giovani	Vancouver, BC	49.3675016999999983	-123.035752100000011	/user_profile_images/image11.jpg	f
10	joanny.armstrong@example.com	$2a$11$5WMCtFSXjOPjRk3u26sJQ./RD8n0Ww4F70AEGYTAul1ClrT99TA8a	\N	\N	\N	0	\N	\N	\N	\N	2018-02-03 03:17:26.385922	2018-02-03 04:34:35.878748	\N	\N	Joanny	Armstrong	859260cb66449836f30a8b5984ff3f4d2d0e1c472e3fc11b9c449b2f5cd99f10	\N	\N	\N	\N	\N	joanny	Vancouver, BC	49.3120016999999962	-123.052952099999999	/user_profile_images/image15.jpg	f
11	felix.ritchie@example.com	$2a$11$ZkV8rLWi1fklJLlATL.CoO7Y3eGzeREZzG5QT7rYdVLi80XiRhXX.	\N	\N	\N	0	\N	\N	\N	\N	2018-02-03 03:17:26.567336	2018-02-03 04:34:35.887951	\N	\N	Felix	Ritchie	814d466bc6f700b193f12bd31750bec061415e3853b50c82f17a310abd4f255c	\N	\N	\N	\N	\N	felix	Vancouver, BC	49.3106016999999994	-123.081852100000006	/user_profile_images/image12.jpg	f
28	sterling.klocko@example.com	$2a$11$ViiG89zwSe9qYkY81XLHvOkCCi5/uGb0smvgUhmZKenY/BVhyajKO	\N	\N	\N	0	\N	\N	\N	\N	2018-02-03 03:17:29.5761	2018-02-03 04:34:35.955334	\N	\N	Sterling	Klocko	943678043d273144cf83ae0dcbad6eafac9eafcd3bd5fd6ab330bfb57ae4d27f	\N	\N	\N	\N	\N	sterling	La Ronge, SK	55.1182999999999979	-105.239100000000008	/user_profile_images/image01.jpg	f
15	tyshawn.willms@example.com	$2a$11$Ihl.uxdFOrP4ePj5D5Oyz.lEPiw1Fm1l3dTFXcnxliIivtYIhrV8G	\N	\N	\N	0	\N	\N	\N	\N	2018-02-03 03:17:27.253311	2018-02-03 04:34:35.931798	\N	\N	Tyshawn	Willms	8464d73d27afd744e84ba1cb82e5961034e0c34e1840ec56e1af22331d530259	\N	\N	\N	\N	\N	tyshawn	Vancouver, BC	49.3264016999999981	-123.102152100000012	/user_profile_images/image06.jpg	f
27	vincent.mayert@example.com	$2a$11$xNV7POj3hWSBPh1KSPvh7OCQrQ3JinB6UwooZhk.qnBTt12lBHFPe	\N	\N	\N	0	\N	\N	\N	\N	2018-02-03 03:17:29.410859	2018-02-03 04:34:35.945287	\N	\N	Vincent	Mayert	657dddb1cff1ef4f0f4a63d4abc8821bfcd9d7a27eaa67f1eece81cd90dee45c	\N	\N	\N	\N	\N	vincent	Vancouver, BC	49.309701699999998	-123.051652099999998	/user_profile_images/image18.jpg	f
17	rollin.bahringer@example.com	$2a$11$1gwx86WHtS7yEwLGJ2EGBeMxRe9xtMW82Yft4RjRrtZ6X4uw5mR3O	\N	\N	\N	0	\N	\N	\N	\N	2018-02-03 03:17:27.583078	2018-02-03 04:34:35.966234	\N	\N	Rollin	Bahringer	1ed0d0bc146410e2bbec0baf98a6347a63b7c71659068f166080cfbe96111cb1	\N	\N	\N	\N	\N	rollin	Vancouver, BC	49.3731016999999994	-123.061752100000007	/user_profile_images/image14.jpg	f
20	emilio.torp@example.com	$2a$11$LcaUU5q/LqIcpe139R2aOOlRjOIrOPoX1pa9cJexnmpqRTtSW5aDK	\N	\N	\N	0	\N	\N	\N	\N	2018-02-03 03:17:28.128748	2018-02-03 04:34:35.994156	\N	\N	Emilio	Torp	1847f8c17a79d6167f762ff7f95a7b9e17bb98a396541f10eee28ed824e79cdb	\N	\N	\N	\N	\N	emilio	Vancouver, BC	49.312301699999999	-123.041352100000012	/user_profile_images/image18.jpg	f
21	abe.gislason@example.com	$2a$11$H/BahGCV1ID2oiNjMTVsCOwXABtAJnx1VFbADxPMh/J0iDPH4gi.a	\N	\N	\N	0	\N	\N	\N	\N	2018-02-03 03:17:28.307603	2018-02-03 04:34:36.005801	\N	\N	Abe	Gislason	a87136581d8393ca6d2a52110ad51bf7931f444fa3c5883b726be83ac5f96a51	\N	\N	\N	\N	\N	abe	Vancouver, BC	49.3061016999999993	-123.0996521	/user_profile_images/image15.jpg	f
22	kyler.schultz@example.com	$2a$11$Mit/vO7uurqdwO5wdbmDkenOjwrLxEh1WI1abuMLeluORsLHLBnDi	\N	\N	\N	0	\N	\N	\N	\N	2018-02-03 03:17:28.495025	2018-02-03 04:34:35.735962	\N	\N	Kyler	Schultz	982b8b14267617335f878d6da93f1d674ca7cf8bae8deb106969297971abce4c	\N	\N	\N	\N	\N	kyler	Vancouver, BC	49.3492016999999947	-123.060752100000002	/user_profile_images/image10.jpg	f
36	larue.keeling@example.com	$2a$11$za6e.aPAYe/OsAZTXD6AtOTwPG.eoAJ5T43JaObncy6OrGl7NA59a	\N	\N	\N	0	\N	\N	\N	\N	2018-02-03 03:17:30.974882	2018-02-03 04:34:36.024384	\N	\N	Larue	Keeling	0473d0b54b9c3df5f6c134ec8f02328a670e0a9e9dc6dae5f3ec58c07e23b882	\N	\N	\N	\N	\N	larue	La Ronge, SK	55.1836999999999946	-105.209199999999996	/user_profile_images/image06.jpg	f
37	gloria.kuphal@example.com	$2a$11$B4B.jAzojh9XMFTKUYCwDuf22RPX.6fLG616aA9K2B7lPAJeY/YTy	\N	\N	\N	0	\N	\N	\N	\N	2018-02-03 03:17:31.152339	2018-02-03 04:34:36.035306	\N	\N	Gloria	Kuphal	7ee5e462fd4a093c729e147c668267831d979506d8068ec00efbe678b311cb12	\N	\N	\N	\N	\N	gloria	La Ronge, SK	55.115399999999994	-105.199799999999996	/user_profile_images/image02.jpg	f
38	delilah.paucek@example.com	$2a$11$7WbdnUyDZ6eh3wXN5MhuwewuDbAUSpvr1FRV4xvycZ3MhKoDszqZO	\N	\N	\N	0	\N	\N	\N	\N	2018-02-03 03:17:31.334038	2018-02-03 04:34:36.043962	\N	\N	Delilah	Paucek	86d3badfa601fba160f2bd4fb1cc73d263027eab25c8e898ff02bba3aaa292b9	\N	\N	\N	\N	\N	delilah	New York, NY	40.802500000000002	-74.004800000000003	/user_profile_images/image19.jpg	f
40	rachael.cronin@example.com	$2a$11$kzURvjR1lneboNVrjjO.MOAupSmcAO6xlpSefBfaAOvE86MZCMZBy	\N	\N	\N	0	\N	\N	\N	\N	2018-02-03 03:17:31.669656	2018-02-03 04:34:36.053479	\N	\N	Rachael	Cronin	f751b97d1ce85a7baa36a73f7902bc3ac28ff7237c24da672055e38ca0b61b8c	\N	\N	\N	\N	\N	rachael	New York, NY	40.7601000000000013	-73.9878000000000071	/user_profile_images/image13.jpg	f
18	shannon.windler@example.com	$2a$11$vGcc/vXpgarw/wGQc1BEZu5h3Ys2WeMgCedppFX3My/2IFeUSwpee	\N	\N	\N	0	\N	\N	\N	\N	2018-02-03 03:17:27.757382	2018-02-03 04:34:35.97519	\N	\N	Shannon	Windler	7dea479d05f0426f7f58a1f56dd3bdeba3dd3eff2e202d232a7396253280a6a4	\N	\N	\N	\N	\N	shannon	Vancouver, BC	49.3182016999999959	-123.067052100000012	/user_profile_images/image06.jpg	f
3	c@c.com	$2a$11$nJD/Kv3XJwzjYCRFcO.KxekgfVKwx0y/Kh2WnSoyCE69M./kJ9oPG	\N	\N	\N	25	2018-02-15 22:21:24.424301	2018-02-15 00:58:14.662195	127.0.0.1	127.0.0.1	2018-01-23 08:23:41.672205	2018-02-15 22:21:24.435635	\N	\N	CeeCee	Conrad	71d2f4510a604ed7d1e7d96efe1f5ed87f7d03a7599c05722a3d958e6d7a5484	\N	\N	\N	\N	\N	ceecee-conrad	\N	\N	\N	/user_profile_images/image16.jpg	f
12	beckett.herman@example.com	$2a$11$QPC5jMQY9to9GeavVkXaJu.iJ4bc5F4J2UX12GzcVmsrq618TGBlO	\N	\N	\N	0	\N	\N	\N	\N	2018-02-03 03:17:26.741112	2018-02-03 04:34:35.900349	\N	\N	Beckett	Herman	f7c49a17b9cfe8e3126174cafba4472079a50971e53966d4df089e9ce2bfee11	\N	\N	\N	\N	\N	beckett	Vancouver, BC	49.3764016999999953	-123.063052100000007	/user_profile_images/image18.jpg	f
19	aali.king@example.com	$2a$11$GdnFrDC/cy/G5yUCrGSRcucRXomqIrVmJIKmyKI6IuzKZDxHfBrrG	\N	\N	\N	0	\N	\N	\N	\N	2018-02-03 03:17:27.939705	2018-02-03 04:34:35.98422	\N	\N	Aali	King	b4b6d54536f974cd796a253535b6b385bb2878204e0d155ac6ed8fef6fe6244a	\N	\N	\N	\N	\N	aali-king	Vancouver, BC	49.319701699999996	-123.026252100000008	/user_profile_images/image17.jpg	f
2	b@b.com	$2a$11$De8ykvCFt6diU9i0d/J6ju3VwOJJR2bbOXytaWWg0dVAw/Js0q1M.	\N	\N	\N	7	2018-02-13 22:25:04.959874	2018-02-08 03:00:11.9283	127.0.0.1	127.0.0.1	2018-01-23 07:33:24.055545	2018-02-13 22:25:04.9658	\N	\N	Ben	Brown	c3b3622b6c864bf50c93c8783198757623c0749bf059edb9ee778eb5fd86f970	\N	\N	\N	\N	\N	billy-bob-brown	\N	\N	\N	/user_profile_images/image17.jpg	f
41	vidal.parisian@example.com	$2a$11$OoSP9/N.9aHpFNppEk9udutxaZ5HXHNjzRZCMZdkovyAy5qCd6hTW	\N	\N	\N	0	\N	\N	\N	\N	2018-02-03 03:17:31.840813	2018-02-03 04:34:36.06221	\N	\N	Vidal	Parisian	0b638e62fcaeb6862d2d91dc4d09a8cf41399f88e4eab655646eaeb5bd9a0919	\N	\N	\N	\N	\N	vidal	New York, NY	40.7563000000000031	-73.9732000000000056	/user_profile_images/image07.jpg	f
42	lavada.frami@example.com	$2a$11$Rda9xAHj2xLhGQav6X3a8OJyhutc2st0BVqnc7Ug3svdlxgzZUXqO	\N	\N	\N	0	\N	\N	\N	\N	2018-02-03 03:17:32.026326	2018-02-03 04:34:36.072226	\N	\N	Lavada	Frami	815dbb8156a182764665ea5c858540700e516427777a3e2f2e19c3176116ecba	\N	\N	\N	\N	\N	lavada	New York, NY	40.7831000000000046	-73.9368999999999943	/user_profile_images/image09.jpg	f
44	gregoria.tremblay@example.com	$2a$11$QNsJdt3moJDmlUxiltmw5uNxo0n6Dags71Tddpl5wkuv12BzVrVKW	\N	\N	\N	0	\N	\N	\N	\N	2018-02-03 03:17:32.364838	2018-02-03 04:34:36.090944	\N	\N	Gregoria	Tremblay	02ba11473b9aee5d33052ca311c342cfc8abe2073590ba9c048df24aa62b30ea	\N	\N	\N	\N	\N	gregoria	New York, NY	40.7779999999999987	-73.9611000000000018	/user_profile_images/image05.jpg	f
45	lyric.hane@example.com	$2a$11$/kMWKy0pbT8snC6Rou/v1OsYa8emZHh6iQjDGF4XPhcRryrzCajSi	\N	\N	\N	0	\N	\N	\N	\N	2018-02-03 03:17:32.54509	2018-02-03 04:34:36.099551	\N	\N	Lyric	Hane	845a3dc4f976a50b2258e1cc7f2872fc0c02aceb9d7e0d7e9d5168d0e30324dc	\N	\N	\N	\N	\N	lyric	New York, NY	40.8123000000000005	-73.9393000000000029	/user_profile_images/image08.jpg	f
46	cassie.hettinger@example.com	$2a$11$aw4ZeKGNgbszIknCqn27heIf/pn1Dwzh5rohrvRboQbKbbDFmjdpO	\N	\N	\N	0	\N	\N	\N	\N	2018-02-03 03:17:32.710468	2018-02-03 04:34:36.108544	\N	\N	Cassie	Hettinger	7911d40d3f89f7dadd8d1fb8851c76cac22ca678bf00d8d6d387f35ac20f1e52	\N	\N	\N	\N	\N	cassie	New York, NY	40.8049000000000035	-73.9247000000000014	/user_profile_images/image07.jpg	f
47	deangelo.crooks@example.com	$2a$11$k0DIBsS31f8q9Lx272K5UONrNK54s.NzBQn9/WPpHTpunGlBkhr4O	\N	\N	\N	0	\N	\N	\N	\N	2018-02-03 03:17:32.872122	2018-02-03 04:34:36.118767	\N	\N	Deangelo	Crooks	d9abac8d5595920c7f4bbcb6299facbf5d545ee42521f279a3bc8bdebcd09467	\N	\N	\N	\N	\N	deangelo	New York, NY	40.7438000000000002	-73.9980000000000047	/user_profile_images/image15.jpg	f
48	deonte.harber@example.com	$2a$11$IAhZnPty/rdzjhN8kVPVvO3SDexiE2WUhlH0WYhTD5fB2BbZHc22W	\N	\N	\N	0	\N	\N	\N	\N	2018-02-03 03:17:33.037593	2018-02-03 04:34:36.127466	\N	\N	Deonte	Harber	d85a2ace3791fb8a87b6ed32dbcc1b6f23713797dfa2f89f6926ac6a8d6eb00f	\N	\N	\N	\N	\N	deonte	New York, NY	40.8102000000000018	-73.981899999999996	/user_profile_images/image09.jpg	f
49	dillon.nader@example.com	$2a$11$t9DxOSuFReksPdCBQ4ukzOaxHj.e4RKgn2VTKPSu6V1hi.LmAS2YO	\N	\N	\N	0	\N	\N	\N	\N	2018-02-03 03:17:33.208269	2018-02-03 04:34:36.137852	\N	\N	Dillon	Nader	50006ffde6e3519ef291fc43f84d7d33bf575043fba9e81572a635cb41289467	\N	\N	\N	\N	\N	dillon	New York, NY	40.7346000000000004	-73.965999999999994	/user_profile_images/image02.jpg	f
50	jaylen.lemke@example.com	$2a$11$tBAtXxyqmVTNjucgUz621.2FaIKngXf4SjNPPAWX1x3cDJ1qCV51G	\N	\N	\N	0	\N	\N	\N	\N	2018-02-03 03:17:33.379499	2018-02-03 04:34:36.14661	\N	\N	Jaylen	Lemke	86e3d8ef54f408bc7c1a4773a77487c701698fd144bff55f00b83819a75b73f4	\N	\N	\N	\N	\N	jaylen	New York, NY	40.8122000000000043	-73.9664999999999964	/user_profile_images/image08.jpg	f
51	marjory.rosenbaum@example.com	$2a$11$NIuT59BIqeCGtENzuyKxUuOhMsGvIE8Cc..GHi1mp7W9TqS0wv4UC	\N	\N	\N	0	\N	\N	\N	\N	2018-02-03 03:17:33.566353	2018-02-03 04:34:36.156962	\N	\N	Marjory	Rosenbaum	9698589f6e362629d63355775ecc41521084c244c54e40fb645202fbd8b80c89	\N	\N	\N	\N	\N	marjory	New York, NY	40.7661000000000016	-73.9191000000000003	/user_profile_images/image15.jpg	f
52	jennings.nitzsche@example.com	$2a$11$G92/pM2cGXv/gAIG4ddftO/fPbsoOM5TnAzmVmUxoq9g26TQH24rO	\N	\N	\N	0	\N	\N	\N	\N	2018-02-03 03:17:33.727271	2018-02-03 04:34:36.167368	\N	\N	Jennings	Nitzsche	b2ddf49fcd550dcdab362093110f53be541bdecf9547eac6b893cf7bae3dfc11	\N	\N	\N	\N	\N	jennings	New York, NY	40.7482000000000042	-73.9500000000000028	/user_profile_images/image15.jpg	f
54	abdul.harvey@example.com	$2a$11$VOBTZ0L9WDXEC8anZWkQp.MKoGXPMEl6oBqabsEB5BmLHTusgC3q2	\N	\N	\N	0	\N	\N	\N	\N	2018-02-03 03:17:34.077487	2018-02-03 04:34:36.18444	\N	\N	Abdul	Harvey	4909780e5bbb1444d6f5f84ecd0fe9ff023dfd4e3003e609d998542883c56bbe	\N	\N	\N	\N	\N	abdul	New York, NY	40.7828999999999979	-73.9851000000000028	/user_profile_images/image08.jpg	f
30	sage.hickle@example.com	$2a$11$YmYXVjPdnXoOig5QC0IqO.V7vcbqS5rRpEfLEShPytVjnffp9dpni	\N	\N	\N	0	\N	\N	\N	\N	2018-02-03 03:17:29.908893	2018-02-03 04:34:36.192773	\N	\N	Sage	Hickle	5d143d6c3e8e9234a7ff64252d4832ad754044260591be28c0970f454bbbe043	\N	\N	\N	\N	\N	sage	La Ronge, SK	55.1515999999999948	-105.206199999999995	/user_profile_images/image04.jpg	f
31	brandon.cassin@example.com	$2a$11$bybOBNSGuMH0ElDcoiAvxOcy8GcKTVmo2je3r9Mg865g0Hfi.OU/W	\N	\N	\N	0	\N	\N	\N	\N	2018-02-03 03:17:30.081411	2018-02-03 04:34:36.202757	\N	\N	Brandon	Cassin	34a75981c08441f0dfbd766d16483efa42908a9e2a0616d9e1c0e7456274e6ca	\N	\N	\N	\N	\N	brandon	La Ronge, SK	55.1519999999999939	-105.277600000000007	/user_profile_images/image07.jpg	f
32	elvis.sauer@example.com	$2a$11$rNB83BiBUUfNsccHjjrNCOD9oj0ZAjzxc0WzvtVr5h9VbOWD/TGPS	\N	\N	\N	0	\N	\N	\N	\N	2018-02-03 03:17:30.260177	2018-02-03 04:34:36.211009	\N	\N	Elvis	Sauer	2c60e3bde1fa32138c3657d59eed9692b4e1a682117a271dce85c8852c9ff0e4	\N	\N	\N	\N	\N	elvis	La Ronge, SK	55.1818999999999988	-105.269199999999998	/user_profile_images/image14.jpg	f
33	layla.padberg@example.com	$2a$11$6aJc5nGaJrRIP5vlIJpb4.yRD2fGUrx5LAEWslP3PFeebUOyUUqQW	\N	\N	\N	0	\N	\N	\N	\N	2018-02-03 03:17:30.447436	2018-02-03 04:34:36.221978	\N	\N	Layla	Padberg	b2c56736ea165e4e13e588fa1c5861f25127237aa1d4189b058a53d4e26bc2de	\N	\N	\N	\N	\N	layla	La Ronge, SK	55.2036999999999978	-105.230800000000002	/user_profile_images/image11.jpg	f
34	katrina.tillman@example.com	$2a$11$mq6qUNUE/v/qvQOchwD0aus.GlLXvGGhkJ5VAeNmG0atFKgyByLU.	\N	\N	\N	0	\N	\N	\N	\N	2018-02-03 03:17:30.625238	2018-02-03 04:34:36.231244	\N	\N	Katrina	Tillman	a423908ad4dd06e3c7f9a35b7aa38b0470c530df030ab674cc818d7c88b5f576	\N	\N	\N	\N	\N	katrina	La Ronge, SK	55.1598999999999933	-105.259600000000006	/user_profile_images/image10.jpg	f
61	petra.gerlach@example.com	$2a$11$KlIVlB4z.1GVtJ1XmfHlwuzBWJyQA9pBCcHoUYxIqasshSmSVhoty	\N	\N	\N	0	\N	\N	\N	\N	2018-02-03 03:17:35.286821	2018-02-03 04:34:36.251301	\N	\N	Petra	Gerlach	d6831008c1a4039be509f5e56cf9b9716f8c6b2997322be63e6a7a261c027d38	\N	\N	\N	\N	\N	petra	Kampala, Uganda	0.366500000000000048	32.6358000000000033	/user_profile_images/image12.jpg	f
62	anabel.boyle@example.com	$2a$11$TgmmFzQu/OASWm2X69THs.Zu3ehUobYgO3TpyEdtGaQOjZyCqR2/y	\N	\N	\N	0	\N	\N	\N	\N	2018-02-03 03:17:35.45227	2018-02-03 04:34:36.26014	\N	\N	Anabel	Boyle	cb2851c7d18958838c9ee9ede399ca966945e1d82226f05614a500fb584fee8d	\N	\N	\N	\N	\N	anabel	Kampala, Uganda	0.377600000000000047	32.6662999999999997	/user_profile_images/image02.jpg	f
63	brielle.grant@example.com	$2a$11$nrC5FNcH5UvyDc35mEszgeni5wkmp/8cggBKmU/qUsZ0pB1Xkf.Y.	\N	\N	\N	0	\N	\N	\N	\N	2018-02-03 03:17:35.629561	2018-02-03 04:34:36.268934	\N	\N	Brielle	Grant	df3881314224687032c3217df753b0247430f4c126dcfd9fa7c744fa078b6dfd	\N	\N	\N	\N	\N	brielle	Kampala, Uganda	0.403700000000000003	32.6543000000000063	/user_profile_images/image05.jpg	f
65	korey.lind@example.com	$2a$11$YZEu4j6ZFicCFxbpO9yhe.Og/DqpDkayIANw3Rq/yHv6O9HzYq3IC	\N	\N	\N	0	\N	\N	\N	\N	2018-02-03 03:17:35.966651	2018-02-03 04:34:36.287048	\N	\N	Korey	Lind	e065b98b1a6aa28f3973b03d93065f73e7d07a36ba3a8251603d13939c680772	\N	\N	\N	\N	\N	korey	Kampala, Uganda	0.416200000000000014	32.6217000000000041	/user_profile_images/image19.jpg	f
66	dayna.waters@example.com	$2a$11$jQ9wNEMzpS7v1Z2szwb3duuU8EEjq9N2Z8LioXw56DnLEVWzbBnSi	\N	\N	\N	0	\N	\N	\N	\N	2018-02-03 03:17:36.164375	2018-02-03 04:34:36.29552	\N	\N	Dayna	Waters	ac3d1d8112868edb6631e36bf54db6e03ecb23bbf22b8a42cf286ddbd1de2680	\N	\N	\N	\N	\N	dayna	Kampala, Uganda	0.391700000000000048	32.6330000000000027	/user_profile_images/image19.jpg	f
68	darius.walter@example.com	$2a$11$lBDsGvNnfpFvrPVGsQRXaONPERdTf2WAy6SYTE9OU8pYNjKm3H996	\N	\N	\N	0	\N	\N	\N	\N	2018-02-03 03:17:36.520606	2018-02-03 04:34:36.306377	\N	\N	Darius	Walter	b742a291ec98c6b4a0aedbeba0d5ff5809edbc28e83f28c5a8ba9a7a52bb1fea	\N	\N	\N	\N	\N	darius	Kampala, Uganda	0.4123	32.6012000000000057	/user_profile_images/image17.jpg	f
69	nyah.batz@example.com	$2a$11$RxFbTIryJ01XBNon3GoogOZL66pRSGpVnQMGLqd7XC9RP02SgufVO	\N	\N	\N	0	\N	\N	\N	\N	2018-02-03 03:17:36.685385	2018-02-03 04:34:36.317183	\N	\N	Nyah	Batz	c6d4a51b06a316bbd2cfc3bc069a93fac4d43e0a26df5cc7fe6dff09c952ea07	\N	\N	\N	\N	\N	nyah	Kampala, Uganda	0.362100000000000033	32.6606000000000023	/user_profile_images/image16.jpg	f
53	jack.smith@example.com	$2a$11$Eot9kOS.2.dw3uHxrVwyOuFkP8gEIgkdWb.MNJOlQJj9TUBPRxlm.	\N	\N	\N	0	\N	\N	\N	\N	2018-02-03 03:17:33.899479	2018-02-03 04:34:36.1758	\N	\N	Jack	Smith	b79e46b057c5c034462ff7fa43e62d7fe003e6bbd4e476b73084fb8ad3e8a2b4	\N	\N	\N	\N	\N	jack-smith	New York, NY	40.763300000000001	-73.9253000000000071	/user_profile_images/image07.jpg	f
71	johnpaul.jenkins@example.com	$2a$11$Rm.3mgzvSjSHaWe/MzB9.Owh0wcwDsJMU0hRfEeekAiXxLdewjYi6	\N	\N	\N	0	\N	\N	\N	\N	2018-02-03 03:17:37.013582	2018-02-03 04:34:36.345961	\N	\N	Johnpaul	Jenkins	d2c366e5cc168a56c0f40a97adcdae484deebfe9696e540dc04d11f271482836	\N	\N	\N	\N	\N	johnpaul	Kampala, Uganda	0.418500000000000039	32.6255000000000024	/user_profile_images/image17.jpg	f
72	johann.denesik@example.com	$2a$11$xCk7NXLpQG0hhWhrhLR/cO.PLt8OkqktaE6cmPfO41uzZaCcpLXsS	\N	\N	\N	0	\N	\N	\N	\N	2018-02-03 03:17:37.176303	2018-02-03 04:34:36.35921	\N	\N	Johann	Denesik	6a84a17f497326e19be1eb11b11864b13a5383edce92a0aae9fb2ab1ccbb6b28	\N	\N	\N	\N	\N	johann	Kampala, Uganda	0.370800000000000018	32.600200000000001	/user_profile_images/image06.jpg	f
73	asa.schaefer@example.com	$2a$11$dN3HoA1BMyZ9YFmvp4NYduy/RHToicszPqBC9M2jc6ANyc2ym6mJu	\N	\N	\N	0	\N	\N	\N	\N	2018-02-03 03:17:37.357232	2018-02-03 04:34:36.370709	\N	\N	Asa	Schaefer	06aa405891b259f0cc70da03c80b476832fe61af63a1ea249bc5006ea2cc20f1	\N	\N	\N	\N	\N	asa	Kampala, Uganda	0.34760000000000002	32.6424000000000021	/user_profile_images/image14.jpg	f
74	terrill.koss@example.com	$2a$11$LMgxWPAzBow3e/Gy0fb4juxUjd7u7P3bQeBeTN5h3pJ1dstEEvGB.	\N	\N	\N	0	\N	\N	\N	\N	2018-02-03 03:17:37.525412	2018-02-03 04:34:36.379789	\N	\N	Terrill	Koss	74c740155868d212636e4bb1b560096dcce71d54109c350daee38c519a63399a	\N	\N	\N	\N	\N	terrill	Kampala, Uganda	0.358399999999999996	32.6485000000000056	/user_profile_images/image18.jpg	f
75	kale.tromp@example.com	$2a$11$0YlkHl6tpRcukcJa1M9JV.P8dn.i5ecVyNwd6pRbhfqtydzonp9XC	\N	\N	\N	0	\N	\N	\N	\N	2018-02-03 03:17:37.697913	2018-02-03 04:34:36.390245	\N	\N	Kale	Tromp	891942d7df206bf98318b0954520960415c5c9e63ad9521272a87cc21a85b416	\N	\N	\N	\N	\N	kale	Kampala, Uganda	0.371400000000000008	32.6655000000000015	/user_profile_images/image19.jpg	f
76	adolfo.kris@example.com	$2a$11$Sk15w6vAgbvk8m7.LvLgcuTpWD/Gw42nulIbOcdIjqbMDwBsby5La	\N	\N	\N	0	\N	\N	\N	\N	2018-02-03 03:17:37.863494	2018-02-03 04:34:36.398962	\N	\N	Adolfo	Kris	057224846799eab2f30abc22754de108870191ea5e5348e02599267f531bf768	\N	\N	\N	\N	\N	adolfo	Kampala, Uganda	0.412500000000000033	32.6092000000000013	/user_profile_images/image05.jpg	f
64	andie.hermann@example.com	$2a$11$VRbTRapzL8rdSEABwEm6j.uCHyx/MBKwIu5n82/ad.gaUqGHU6yUe	\N	\N	\N	0	\N	\N	\N	\N	2018-02-03 03:17:35.793611	2018-02-03 04:34:36.277174	\N	\N	Andie	Hermann	9d14b8062d4396082c91de381b0997db9fedfb108fbc716ca73522564d9236ac	\N	\N	\N	\N	\N	andie-hermann	Kampala, Uganda	0.398500000000000021	32.6156000000000006	/user_profile_images/image09.jpg	f
16	serena.orn@example.com	$2a$11$y6IlcbHRkLRGg4bEX2G2uOCBA7F8aeW65dwligomvM6K/Tn5I193S	\N	\N	\N	0	\N	\N	\N	\N	2018-02-03 03:17:27.413109	2018-02-03 04:34:36.417918	\N	\N	Serena	Orn	560c7b1427807f7807af28f1a220e23d9c20350fe5350314efde0092448840cc	\N	\N	\N	\N	\N	serena	Vancouver, BC	49.3723016999999942	-123.095952100000005	/user_profile_images/image15.jpg	f
29	wyatt.senger@example.com	$2a$11$gys9ZwyNdAfpoHMZltgOhOAtyEp4ikZBoWaKnofrDbYeXGXgd8IC.	\N	\N	\N	0	\N	\N	\N	\N	2018-02-03 03:17:29.740822	2018-02-03 04:34:36.427338	\N	\N	Wyatt	Senger	d9f1d788da07576616de4cb482ff96f3842729d90158c603352d37af1d27b6c0	\N	\N	\N	\N	\N	wyatt	La Ronge, SK	55.1790999999999983	-105.253500000000003	/user_profile_images/image11.jpg	f
9	terrance.lowe@example.com	$2a$11$ubBMt.97B0wb6.h7f1qcKeEzK1YCDVkQhsxmSfURYwPvMbUHp5Rxi	\N	\N	\N	0	\N	\N	\N	\N	2018-02-03 03:17:26.210681	2018-02-03 04:34:36.437064	\N	\N	Terrance	Lowe	a6770cd9a73128fcc1427ea730cce849a47376c10315301a91ea89d899ae2b80	\N	\N	\N	\N	\N	terrance	Vancouver, BC	49.3414016999999987	-123.022952100000012	/user_profile_images/image08.jpg	f
57	margret.bartell@example.com	$2a$11$Bz1ryX2ihL.QkykpWKMruee0DWwotweZL1O0UVDYMZh1lKoX5qqmm	\N	\N	\N	0	\N	\N	\N	\N	2018-02-03 03:17:34.614813	2018-02-03 04:34:36.446077	\N	\N	Margret	Bartell	5dc2f924d7f17801600f2b9acdb600b820c9c1d7d13db61572c7d00dad191154	\N	\N	\N	\N	\N	margret	New York, NY	40.7944000000000031	-73.9189999999999969	/user_profile_images/image16.jpg	f
58	ernestine.mohr@example.com	$2a$11$YJG/CImVxn1Dd8Te88UK8esTL0b5TaVAzNnTI04Iy9eVvdyyNwhDe	\N	\N	\N	0	\N	\N	\N	\N	2018-02-03 03:17:34.79102	2018-02-03 04:34:36.45595	\N	\N	Ernestine	Mohr	760ab8783e7145715839bd83cdbcc7301ab438ef9dbaeee4ad85a551486cd45b	\N	\N	\N	\N	\N	ernestine	Kampala, Uganda	0.353600000000000025	32.6415000000000006	/user_profile_images/image07.jpg	f
55	lucio.runte@example.com	$2a$11$RrOw/YHxI7VHIrSKvH4aUeks5j1XUxMOr1eIfu9Luw/JlpIJsdVRy	\N	\N	\N	0	\N	\N	\N	\N	2018-02-03 03:17:34.245156	2018-02-03 04:34:36.466069	\N	\N	Lucio	Runte	d617a0b86cc1bfff2a7f45f0b76b666a069acea21daefe69e9c38eef4ec8113c	\N	\N	\N	\N	\N	lucio	New York, NY	40.740000000000002	-73.968599999999995	/user_profile_images/image07.jpg	f
59	boyd.mohr@example.com	$2a$11$PDazwEtwrbJkXJJUrt3qTe8bjNRPgDFCMF7H3UV2ZVn0Dzs63rLD.	\N	\N	\N	0	\N	\N	\N	\N	2018-02-03 03:17:34.961414	2018-02-03 04:34:36.475022	\N	\N	Boyd	Mohr	62d27ae899254dde06498e49187ff2f43b81581272272b354910d95e11f3675c	\N	\N	\N	\N	\N	boyd	Kampala, Uganda	0.349900000000000044	32.664200000000001	/user_profile_images/image08.jpg	f
60	cristian.blick@example.com	$2a$11$cRO2/CBcLXi/K/XiWOseSeNnWB.uM258uvpku3gIOnNft13qYTz1W	\N	\N	\N	0	\N	\N	\N	\N	2018-02-03 03:17:35.128156	2018-02-03 04:34:36.240818	\N	\N	Cristian	Blick	d50e1da81abbc760175d5951447321246f87dfc7de1f63a4371f4857ae012aac	\N	\N	\N	\N	\N	cristian	Kampala, Uganda	0.381300000000000028	32.5868000000000038	/user_profile_images/image05.jpg	f
77	keshawn.fadel@example.com	$2a$11$zGrZq1Hxp8nwAlmlhkBUcO1OIpEUD5wfobdFqD86nvs10IJ8TwFT2	\N	\N	\N	0	\N	\N	\N	\N	2018-02-03 03:17:38.021906	2018-02-03 04:34:36.407132	\N	\N	Keshawn	Fadel	36084d4040d47fbc4638bf8f2105e8a4ca3c122dd1300266eb84442836df45c2	\N	\N	\N	\N	\N	keshawn	Kampala, Uganda	0.363700000000000023	32.607200000000006	/user_profile_images/image20.jpg	f
56	alysson.koch@example.com	$2a$11$qVNQdBVTLbY7MuLgJuYX9eh9HVnBzuSnRBDvzCdTgpSaIfS49pNam	\N	\N	\N	0	\N	\N	\N	\N	2018-02-03 03:17:34.428549	2018-02-03 04:34:36.501534	\N	\N	Alysson	Koch	371c68a4b2941afb0fbce64a70e6ea257e16faf949272dde897dac677a0f9e51	\N	\N	\N	\N	\N	alysson	New York, NY	40.7987000000000037	-73.9697000000000031	/user_profile_images/image06.jpg	f
67	margaret.daniel@example.com	$2a$11$fHoRk.NBM0s/ZpSSLX02iOb9gPxjNhNs/.tc0JtJPxZzQf2blqrZ.	\N	\N	\N	0	\N	\N	\N	\N	2018-02-03 03:17:36.343058	2018-02-03 04:34:36.510112	\N	\N	Margaret	Daniel	cbea4e5c40c9b9122c929b681dd7b1b944fb2f46c0a6a1aff08d5ef1bec065ea	\N	\N	\N	\N	\N	margaret	Kampala, Uganda	0.357200000000000017	32.6015000000000015	/user_profile_images/image13.jpg	f
35	agustin.wolff@example.com	$2a$11$Yojub8TBKRM9dzV/rt6jtOWBib.r9SHyV09EagY6tpm015s4gSRUi	\N	\N	\N	0	\N	\N	\N	\N	2018-02-03 03:17:30.805257	2018-02-03 04:34:36.015662	\N	\N	Agustin	Wolff	cf0fed88698d8087e415f5338175e03a6927fe616e19b97c96fdbfc6c1a568ce	\N	\N	\N	\N	\N	agustin	La Ronge, SK	55.1845999999999961	-105.235299999999995	/user_profile_images/image18.jpg	f
39	ayana.barrows@example.com	$2a$11$8cowWBv1Xs/cMQgNosNg5.bKRoJSBPtGLKCwmYpMiJPyGspQylgXi	\N	\N	\N	0	\N	\N	\N	\N	2018-02-03 03:17:31.506484	2018-02-03 04:34:36.487965	\N	\N	Ayana	Barrows	b11c9826d1d3723917ae8deb08b807680bec6594da27fefd98d547dac10352c3	\N	\N	\N	\N	\N	ayana	New York, NY	40.7201999999999984	-73.9665999999999997	/user_profile_images/image04.jpg	f
25	macy.zboncak@example.com	$2a$11$k9iFGx8u70uGCNthhE6OhOcx4xPRa14t5xGU0WDzKrRbLw.Q6RpN.	\N	\N	\N	0	\N	\N	\N	\N	2018-02-03 03:17:29.036604	2018-02-03 04:34:35.848052	\N	\N	Macy	Zboncak	31665e2adbe5f7f5a2aec79aad771fd959d776369a5d89cc79f2177552fb3d90	\N	\N	\N	\N	\N	macy	Vancouver, BC	49.3482016999999971	-123.097652100000005	/user_profile_images/image19.jpg	f
43	rafael.littel@example.com	$2a$11$uUWspRbLgJNTydWeWSVrwePfJ8RkKxHHCo0wQs5b9m0yciNYjqaWW	\N	\N	\N	0	\N	\N	\N	\N	2018-02-03 03:17:32.200539	2018-02-03 04:34:36.081351	\N	\N	Rafael	Littel	ad6643d2c61298649b9c973a2c3ec2449661eef5057b159a1d7fabe81205fa66	\N	\N	\N	\N	\N	rafael	New York, NY	40.7764000000000024	-74.0009000000000015	/user_profile_images/image01.jpg	f
70	carley.marvin@example.com	$2a$11$yYqksF5pz3kZmXTi6awar.u29h./vCyXVZxIm9WsD611HyTtQAAUW	\N	\N	\N	0	\N	\N	\N	\N	2018-02-03 03:17:36.849131	2018-02-03 04:34:36.331951	\N	\N	Carley	Marvin	e12b37a2554c0b7e2dcc8b3a2526000834058150af93496ffcff381d2bf08a08	\N	\N	\N	\N	\N	carley	Kampala, Uganda	0.369200000000000028	32.642000000000003	/user_profile_images/image04.jpg	f
1	a@a.com	$2a$11$o9z2uBu8.d6B7P2dLv5zLu8lcKuCXfsNBjttbb5tuV7mIVokZpq8a	\N	\N	\N	6	2018-02-15 04:40:28.516104	2018-02-09 00:15:01.596886	127.0.0.1	127.0.0.1	2018-01-19 07:26:10.78823	2018-02-15 04:40:28.52295	\N	\N	Aaron	Ackroyd	a8c0a7da4d4a727f85ac970505aef8eeae8286d91f67f8a4d501d2b4c8460c00	\N	\N	\N	\N	\N	aaron-ackroyd	\N	\N	\N	/user_profile_images/image03.jpg	t
6	d@d.com	$2a$11$o9emi2Hib3zNszsFH4DEF./1c7D8pXdf8kSC5v9eb5LsmtJMmtQ/m	\N	\N	\N	13	2018-02-16 00:50:59.657637	2018-02-15 22:20:13.236039	127.0.0.1	127.0.0.1	2018-01-24 03:51:11.422468	2018-02-16 00:50:59.66118	\N	\N	Darlene	Davis	0569f98f3e779010283d21e79e046cd9890a406f3809740dd403e2247ce7bead	\N	\N	\N	\N	\N	darlene-davis	\N	\N	\N	/user_profile_images/image04.jpg	f
7	jack.chili.lee@gmail.com	$2a$11$5MVYx2GBVqwNG9pIUVD3uO.7Mo4t5C3183X1bVjRZr7fkGa5DG0Ha	\N	\N	\N	49	2018-02-28 02:38:33.246276	2018-02-16 02:14:23.793553	127.0.0.1	127.0.0.1	2018-01-24 07:13:23.302436	2018-02-28 02:38:33.26631	\N	\N	Jack	Lee	1c44906c9fb7269bb90a516a93a772c471c483ff599dd8a47e7abbbecccedd61	\N	9d74807e75ad06064e80ef19b136f31696deab5d5f5535421ef60d2d9e4a	facetune.jpg	801577	image/jpeg	jack-lee	\N	\N	\N	\N	f
81	e@e.com	$2a$11$EX8XPdXP6SyniNBVYCand.zL3/vFabinV5b/8Bj6mK7obQcAlicIi	\N	\N	\N	3	2018-02-28 02:42:37.730707	2018-02-28 02:37:19.56445	127.0.0.1	127.0.0.1	2018-02-28 02:30:41.147482	2018-02-28 02:42:37.756843	\N	\N	Eric	Earl	980c77ca760752f401cd9ba5a300e4f8492b942488f30a80dcbc9cea84f1ea2a	\N	\N	\N	\N	\N	eric	\N	\N	\N	\N	f
\.


--
-- Data for Name: votes; Type: TABLE DATA; Schema: public; Owner: jacklee
--

COPY votes (id, user_id, comment_id, is_up, created_at, updated_at) FROM stdin;
1	77	556	t	2018-02-04 19:12:26.768287	2018-02-04 19:12:26.768287
2	6	7	t	2018-02-04 19:35:16.897166	2018-02-04 19:35:16.897166
5	6	9	t	2018-02-04 19:37:38.74418	2018-02-04 19:37:42.541381
7	6	3	t	2018-02-04 19:48:57.313322	2018-02-04 19:48:57.313322
8	6	6	f	2018-02-04 19:49:03.662903	2018-02-04 19:49:03.662903
9	6	32	t	2018-02-04 19:57:02.744853	2018-02-04 19:57:02.744853
10	6	14	t	2018-02-04 19:57:06.526403	2018-02-04 19:57:06.526403
11	6	11	t	2018-02-04 19:58:12.414956	2018-02-04 19:58:12.414956
12	6	15	t	2018-02-05 00:07:41.840261	2018-02-05 00:07:41.840261
14	3	556	t	2018-02-08 18:20:10.990454	2018-02-08 18:20:10.990454
15	3	554	t	2018-02-08 18:20:51.538187	2018-02-08 18:20:51.538187
16	6	568	t	2018-02-15 22:19:30.099349	2018-02-15 22:19:30.099349
17	6	567	t	2018-02-15 22:19:41.307795	2018-02-15 22:19:41.307795
18	6	573	t	2018-02-15 22:20:54.434763	2018-02-15 22:20:54.434763
19	3	573	t	2018-02-15 22:22:34.171636	2018-02-15 22:22:34.171636
20	3	574	t	2018-02-15 22:22:40.560244	2018-02-15 22:22:40.560244
\.


--
-- Name: ckeditor_assets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jacklee
--

SELECT pg_catalog.setval('ckeditor_assets_id_seq', 1, false);


--
-- Name: comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jacklee
--

SELECT pg_catalog.setval('comments_id_seq', 665, true);


--
-- Name: friendly_id_slugs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jacklee
--

SELECT pg_catalog.setval('friendly_id_slugs_id_seq', 236, true);


--
-- Name: likes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jacklee
--

SELECT pg_catalog.setval('likes_id_seq', 393, true);


--
-- Name: media_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jacklee
--

SELECT pg_catalog.setval('media_id_seq', 73, true);


--
-- Name: posts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jacklee
--

SELECT pg_catalog.setval('posts_id_seq', 227, true);


--
-- Name: references_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jacklee
--

SELECT pg_catalog.setval('references_id_seq', 94, true);


--
-- Name: relationships_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jacklee
--

SELECT pg_catalog.setval('relationships_id_seq', 1263, true);


--
-- Name: reviewlists_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jacklee
--

SELECT pg_catalog.setval('reviewlists_id_seq', 35, true);


--
-- Name: taggings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jacklee
--

SELECT pg_catalog.setval('taggings_id_seq', 707, true);


--
-- Name: tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jacklee
--

SELECT pg_catalog.setval('tags_id_seq', 27, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jacklee
--

SELECT pg_catalog.setval('users_id_seq', 81, true);


--
-- Name: votes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jacklee
--

SELECT pg_catalog.setval('votes_id_seq', 20, true);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: jacklee
--

ALTER TABLE ONLY ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: ckeditor_assets ckeditor_assets_pkey; Type: CONSTRAINT; Schema: public; Owner: jacklee
--

ALTER TABLE ONLY ckeditor_assets
    ADD CONSTRAINT ckeditor_assets_pkey PRIMARY KEY (id);


--
-- Name: comments comments_pkey; Type: CONSTRAINT; Schema: public; Owner: jacklee
--

ALTER TABLE ONLY comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (id);


--
-- Name: friendly_id_slugs friendly_id_slugs_pkey; Type: CONSTRAINT; Schema: public; Owner: jacklee
--

ALTER TABLE ONLY friendly_id_slugs
    ADD CONSTRAINT friendly_id_slugs_pkey PRIMARY KEY (id);


--
-- Name: likes likes_pkey; Type: CONSTRAINT; Schema: public; Owner: jacklee
--

ALTER TABLE ONLY likes
    ADD CONSTRAINT likes_pkey PRIMARY KEY (id);


--
-- Name: media media_pkey; Type: CONSTRAINT; Schema: public; Owner: jacklee
--

ALTER TABLE ONLY media
    ADD CONSTRAINT media_pkey PRIMARY KEY (id);


--
-- Name: posts posts_pkey; Type: CONSTRAINT; Schema: public; Owner: jacklee
--

ALTER TABLE ONLY posts
    ADD CONSTRAINT posts_pkey PRIMARY KEY (id);


--
-- Name: references references_pkey; Type: CONSTRAINT; Schema: public; Owner: jacklee
--

ALTER TABLE ONLY "references"
    ADD CONSTRAINT references_pkey PRIMARY KEY (id);


--
-- Name: relationships relationships_pkey; Type: CONSTRAINT; Schema: public; Owner: jacklee
--

ALTER TABLE ONLY relationships
    ADD CONSTRAINT relationships_pkey PRIMARY KEY (id);


--
-- Name: reviewlists reviewlists_pkey; Type: CONSTRAINT; Schema: public; Owner: jacklee
--

ALTER TABLE ONLY reviewlists
    ADD CONSTRAINT reviewlists_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: jacklee
--

ALTER TABLE ONLY schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: taggings taggings_pkey; Type: CONSTRAINT; Schema: public; Owner: jacklee
--

ALTER TABLE ONLY taggings
    ADD CONSTRAINT taggings_pkey PRIMARY KEY (id);


--
-- Name: tags tags_pkey; Type: CONSTRAINT; Schema: public; Owner: jacklee
--

ALTER TABLE ONLY tags
    ADD CONSTRAINT tags_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: jacklee
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: votes votes_pkey; Type: CONSTRAINT; Schema: public; Owner: jacklee
--

ALTER TABLE ONLY votes
    ADD CONSTRAINT votes_pkey PRIMARY KEY (id);


--
-- Name: index_ckeditor_assets_on_type; Type: INDEX; Schema: public; Owner: jacklee
--

CREATE INDEX index_ckeditor_assets_on_type ON ckeditor_assets USING btree (type);


--
-- Name: index_comments_on_commentable_type_and_commentable_id; Type: INDEX; Schema: public; Owner: jacklee
--

CREATE INDEX index_comments_on_commentable_type_and_commentable_id ON comments USING btree (commentable_type, commentable_id);


--
-- Name: index_comments_on_user_id; Type: INDEX; Schema: public; Owner: jacklee
--

CREATE INDEX index_comments_on_user_id ON comments USING btree (user_id);


--
-- Name: index_friendly_id_slugs_on_slug_and_sluggable_type; Type: INDEX; Schema: public; Owner: jacklee
--

CREATE INDEX index_friendly_id_slugs_on_slug_and_sluggable_type ON friendly_id_slugs USING btree (slug, sluggable_type);


--
-- Name: index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope; Type: INDEX; Schema: public; Owner: jacklee
--

CREATE UNIQUE INDEX index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope ON friendly_id_slugs USING btree (slug, sluggable_type, scope);


--
-- Name: index_friendly_id_slugs_on_sluggable_id; Type: INDEX; Schema: public; Owner: jacklee
--

CREATE INDEX index_friendly_id_slugs_on_sluggable_id ON friendly_id_slugs USING btree (sluggable_id);


--
-- Name: index_friendly_id_slugs_on_sluggable_type; Type: INDEX; Schema: public; Owner: jacklee
--

CREATE INDEX index_friendly_id_slugs_on_sluggable_type ON friendly_id_slugs USING btree (sluggable_type);


--
-- Name: index_likes_on_likeable_type_and_likeable_id; Type: INDEX; Schema: public; Owner: jacklee
--

CREATE INDEX index_likes_on_likeable_type_and_likeable_id ON likes USING btree (likeable_type, likeable_id);


--
-- Name: index_likes_on_user_id; Type: INDEX; Schema: public; Owner: jacklee
--

CREATE INDEX index_likes_on_user_id ON likes USING btree (user_id);


--
-- Name: index_media_on_post_id; Type: INDEX; Schema: public; Owner: jacklee
--

CREATE INDEX index_media_on_post_id ON media USING btree (post_id);


--
-- Name: index_media_on_user_id; Type: INDEX; Schema: public; Owner: jacklee
--

CREATE INDEX index_media_on_user_id ON media USING btree (user_id);


--
-- Name: index_posts_on_user_id; Type: INDEX; Schema: public; Owner: jacklee
--

CREATE INDEX index_posts_on_user_id ON posts USING btree (user_id);


--
-- Name: index_references_on_referenceable_type_and_referenceable_id; Type: INDEX; Schema: public; Owner: jacklee
--

CREATE INDEX index_references_on_referenceable_type_and_referenceable_id ON "references" USING btree (referenceable_type, referenceable_id);


--
-- Name: index_relationships_on_followed_id; Type: INDEX; Schema: public; Owner: jacklee
--

CREATE INDEX index_relationships_on_followed_id ON relationships USING btree (followed_id);


--
-- Name: index_relationships_on_follower_id; Type: INDEX; Schema: public; Owner: jacklee
--

CREATE INDEX index_relationships_on_follower_id ON relationships USING btree (follower_id);


--
-- Name: index_relationships_on_follower_id_and_followed_id; Type: INDEX; Schema: public; Owner: jacklee
--

CREATE UNIQUE INDEX index_relationships_on_follower_id_and_followed_id ON relationships USING btree (follower_id, followed_id);


--
-- Name: index_reviewlists_on_reviewable_type_and_reviewable_id; Type: INDEX; Schema: public; Owner: jacklee
--

CREATE INDEX index_reviewlists_on_reviewable_type_and_reviewable_id ON reviewlists USING btree (reviewable_type, reviewable_id);


--
-- Name: index_reviewlists_on_user_id; Type: INDEX; Schema: public; Owner: jacklee
--

CREATE INDEX index_reviewlists_on_user_id ON reviewlists USING btree (user_id);


--
-- Name: index_taggings_on_tag_id; Type: INDEX; Schema: public; Owner: jacklee
--

CREATE INDEX index_taggings_on_tag_id ON taggings USING btree (tag_id);


--
-- Name: index_taggings_on_taggable_type_and_taggable_id; Type: INDEX; Schema: public; Owner: jacklee
--

CREATE INDEX index_taggings_on_taggable_type_and_taggable_id ON taggings USING btree (taggable_type, taggable_id);


--
-- Name: index_users_on_api_key; Type: INDEX; Schema: public; Owner: jacklee
--

CREATE INDEX index_users_on_api_key ON users USING btree (api_key);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: jacklee
--

CREATE UNIQUE INDEX index_users_on_email ON users USING btree (email);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: jacklee
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON users USING btree (reset_password_token);


--
-- Name: index_users_on_slug; Type: INDEX; Schema: public; Owner: jacklee
--

CREATE UNIQUE INDEX index_users_on_slug ON users USING btree (slug);


--
-- Name: index_users_on_user_id; Type: INDEX; Schema: public; Owner: jacklee
--

CREATE INDEX index_users_on_user_id ON users USING btree (user_id);


--
-- Name: index_votes_on_comment_id; Type: INDEX; Schema: public; Owner: jacklee
--

CREATE INDEX index_votes_on_comment_id ON votes USING btree (comment_id);


--
-- Name: index_votes_on_user_id; Type: INDEX; Schema: public; Owner: jacklee
--

CREATE INDEX index_votes_on_user_id ON votes USING btree (user_id);


--
-- Name: comments fk_rails_03de2dc08c; Type: FK CONSTRAINT; Schema: public; Owner: jacklee
--

ALTER TABLE ONLY comments
    ADD CONSTRAINT fk_rails_03de2dc08c FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: likes fk_rails_1e09b5dabf; Type: FK CONSTRAINT; Schema: public; Owner: jacklee
--

ALTER TABLE ONLY likes
    ADD CONSTRAINT fk_rails_1e09b5dabf FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: votes fk_rails_2e88a155f7; Type: FK CONSTRAINT; Schema: public; Owner: jacklee
--

ALTER TABLE ONLY votes
    ADD CONSTRAINT fk_rails_2e88a155f7 FOREIGN KEY (comment_id) REFERENCES comments(id);


--
-- Name: media fk_rails_3e7fe89c9c; Type: FK CONSTRAINT; Schema: public; Owner: jacklee
--

ALTER TABLE ONLY media
    ADD CONSTRAINT fk_rails_3e7fe89c9c FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: posts fk_rails_5b5ddfd518; Type: FK CONSTRAINT; Schema: public; Owner: jacklee
--

ALTER TABLE ONLY posts
    ADD CONSTRAINT fk_rails_5b5ddfd518 FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: users fk_rails_6d0b8b3c2f; Type: FK CONSTRAINT; Schema: public; Owner: jacklee
--

ALTER TABLE ONLY users
    ADD CONSTRAINT fk_rails_6d0b8b3c2f FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: taggings fk_rails_9fcd2e236b; Type: FK CONSTRAINT; Schema: public; Owner: jacklee
--

ALTER TABLE ONLY taggings
    ADD CONSTRAINT fk_rails_9fcd2e236b FOREIGN KEY (tag_id) REFERENCES tags(id);


--
-- Name: media fk_rails_a1c61473cd; Type: FK CONSTRAINT; Schema: public; Owner: jacklee
--

ALTER TABLE ONLY media
    ADD CONSTRAINT fk_rails_a1c61473cd FOREIGN KEY (post_id) REFERENCES posts(id);


--
-- Name: votes fk_rails_c9b3bef597; Type: FK CONSTRAINT; Schema: public; Owner: jacklee
--

ALTER TABLE ONLY votes
    ADD CONSTRAINT fk_rails_c9b3bef597 FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: reviewlists fk_rails_ea07684da8; Type: FK CONSTRAINT; Schema: public; Owner: jacklee
--

ALTER TABLE ONLY reviewlists
    ADD CONSTRAINT fk_rails_ea07684da8 FOREIGN KEY (user_id) REFERENCES users(id);


--
-- PostgreSQL database dump complete
--

