--
-- PostgreSQL database dump
--

-- Dumped from database version 14.17 (Ubuntu 14.17-0ubuntu0.22.04.1)
-- Dumped by pg_dump version 14.17 (Ubuntu 14.17-0ubuntu0.22.04.1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: heidless
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.ar_internal_metadata OWNER TO heidless;

--
-- Name: friendships; Type: TABLE; Schema: public; Owner: heidless
--

CREATE TABLE public.friendships (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    friend_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.friendships OWNER TO heidless;

--
-- Name: friendships_id_seq; Type: SEQUENCE; Schema: public; Owner: heidless
--

CREATE SEQUENCE public.friendships_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.friendships_id_seq OWNER TO heidless;

--
-- Name: friendships_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: heidless
--

ALTER SEQUENCE public.friendships_id_seq OWNED BY public.friendships.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: heidless
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO heidless;

--
-- Name: stocks; Type: TABLE; Schema: public; Owner: heidless
--

CREATE TABLE public.stocks (
    id bigint NOT NULL,
    ticker character varying,
    name character varying,
    last_price numeric,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.stocks OWNER TO heidless;

--
-- Name: stocks_id_seq; Type: SEQUENCE; Schema: public; Owner: heidless
--

CREATE SEQUENCE public.stocks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.stocks_id_seq OWNER TO heidless;

--
-- Name: stocks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: heidless
--

ALTER SEQUENCE public.stocks_id_seq OWNED BY public.stocks.id;


--
-- Name: user_stocks; Type: TABLE; Schema: public; Owner: heidless
--

CREATE TABLE public.user_stocks (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    stock_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.user_stocks OWNER TO heidless;

--
-- Name: user_stocks_id_seq; Type: SEQUENCE; Schema: public; Owner: heidless
--

CREATE SEQUENCE public.user_stocks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_stocks_id_seq OWNER TO heidless;

--
-- Name: user_stocks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: heidless
--

ALTER SEQUENCE public.user_stocks_id_seq OWNED BY public.user_stocks.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: heidless
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp(6) without time zone,
    remember_created_at timestamp(6) without time zone,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    first_name character varying,
    last_name character varying
);


ALTER TABLE public.users OWNER TO heidless;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: heidless
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO heidless;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: heidless
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: friendships id; Type: DEFAULT; Schema: public; Owner: heidless
--

ALTER TABLE ONLY public.friendships ALTER COLUMN id SET DEFAULT nextval('public.friendships_id_seq'::regclass);


--
-- Name: stocks id; Type: DEFAULT; Schema: public; Owner: heidless
--

ALTER TABLE ONLY public.stocks ALTER COLUMN id SET DEFAULT nextval('public.stocks_id_seq'::regclass);


--
-- Name: user_stocks id; Type: DEFAULT; Schema: public; Owner: heidless
--

ALTER TABLE ONLY public.user_stocks ALTER COLUMN id SET DEFAULT nextval('public.user_stocks_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: heidless
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: heidless
--

COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	development	2025-03-19 12:05:20.650302	2025-03-19 12:05:20.650311
schema_sha1	832705ec9c728fc9d5414c0f80a477990d050d31	2025-03-19 12:05:20.711097	2025-03-19 12:05:20.711141
\.


--
-- Data for Name: friendships; Type: TABLE DATA; Schema: public; Owner: heidless
--

COPY public.friendships (id, user_id, friend_id, created_at, updated_at) FROM stdin;
1	1	2	2025-03-19 12:09:19.076801	2025-03-19 12:09:19.076801
15	4	2	2025-03-19 17:04:49.039931	2025-03-19 17:04:49.039931
16	4	3	2025-03-19 17:31:45.487546	2025-03-19 17:31:45.487546
19	2	1	2025-03-19 23:08:55.927293	2025-03-19 23:08:55.927293
20	2	2	2025-03-19 23:09:30.711791	2025-03-19 23:09:30.711791
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: heidless
--

COPY public.schema_migrations (version) FROM stdin;
20250316040458
20250315160710
20250314181303
20250313140906
20250312145006
\.


--
-- Data for Name: stocks; Type: TABLE DATA; Schema: public; Owner: heidless
--

COPY public.stocks (id, ticker, name, last_price, created_at, updated_at) FROM stdin;
6	GOOG	Alphabet Inc	164.33	2025-03-19 14:24:07.425932	2025-03-19 14:24:07.425932
7	NKE	Nike Inc	73.26	2025-03-19 14:24:23.205758	2025-03-19 14:24:23.205758
8	MSFT	Microsoft Corp	387.14	2025-03-19 14:25:18.198465	2025-03-19 14:25:18.198465
9	AMZN	Amazon.com Inc	192.58	2025-03-19 17:04:00.008021	2025-03-19 17:04:00.008021
10	AAPL	Apple Inc	215.24	2025-03-19 23:54:26.716557	2025-03-19 23:54:26.716557
\.


--
-- Data for Name: user_stocks; Type: TABLE DATA; Schema: public; Owner: heidless
--

COPY public.user_stocks (id, user_id, stock_id, created_at, updated_at) FROM stdin;
14	4	6	2025-03-19 14:24:07.432468	2025-03-19 14:24:07.432468
15	4	7	2025-03-19 14:24:23.211812	2025-03-19 14:24:23.211812
16	2	8	2025-03-19 14:25:18.205316	2025-03-19 14:25:18.205316
19	2	7	2025-03-19 14:29:10.122237	2025-03-19 14:29:10.122237
20	4	9	2025-03-19 17:04:00.081821	2025-03-19 17:04:00.081821
21	4	8	2025-03-19 17:42:50.291964	2025-03-19 17:42:50.291964
24	2	9	2025-03-19 23:07:34.969118	2025-03-19 23:07:34.969118
25	2	10	2025-03-19 23:54:26.786289	2025-03-19 23:54:26.786289
27	2	6	2025-03-20 06:58:42.201298	2025-03-20 06:58:42.201298
28	5	6	2025-03-20 08:48:01.830876	2025-03-20 08:48:01.830876
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: heidless
--

COPY public.users (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, created_at, updated_at, first_name, last_name) FROM stdin;
1	arjuna@test.com	$2a$12$9iIRu0/Q/MvWEXNwzHTLMuAkeGbnw57OfgUffeiD2T3nMoSHZT8Je	\N	\N	\N	2025-03-19 12:06:19.697329	2025-03-19 12:06:19.697329	arj 	una
2	test_1@test.com	$2a$12$rpCLRJqCXkUTbVD5HYkG6u2GtvMPW0SQwLEbGW0HgjkXBVsNxB8Q2	\N	\N	\N	2025-03-19 12:06:51.711213	2025-03-19 12:06:51.711213	test	one
3	test_2@test.com	$2a$12$Ngq0Ask0Do.4nrulnRBT8eKamBYc4SddjaNdK3XdfXW.CilHqxsVO	\N	\N	\N	2025-03-19 12:46:34.835558	2025-03-19 12:46:34.835558	test	two
4	aurjuna@test.com	$2a$12$CmXEVAKbsi6Uf4ppIgqkdugxzpwIyaVazNN4J10jvFH/LSHHHsxba	\N	\N	\N	2025-03-19 14:23:51.857606	2025-03-19 14:23:51.857606	arj	una
5	jsnow@test.com	$2a$12$y0K6oY9dWQtUB.yw0ECCYugtMgT9L1Zi5gsmqj/VDm.qYkWJHFA6e	\N	\N	\N	2025-03-20 08:12:37.531139	2025-03-20 08:12:37.531139	Jon	Snow
\.


--
-- Name: friendships_id_seq; Type: SEQUENCE SET; Schema: public; Owner: heidless
--

SELECT pg_catalog.setval('public.friendships_id_seq', 20, true);


--
-- Name: stocks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: heidless
--

SELECT pg_catalog.setval('public.stocks_id_seq', 10, true);


--
-- Name: user_stocks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: heidless
--

SELECT pg_catalog.setval('public.user_stocks_id_seq', 28, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: heidless
--

SELECT pg_catalog.setval('public.users_id_seq', 5, true);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: heidless
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: friendships friendships_pkey; Type: CONSTRAINT; Schema: public; Owner: heidless
--

ALTER TABLE ONLY public.friendships
    ADD CONSTRAINT friendships_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: heidless
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: stocks stocks_pkey; Type: CONSTRAINT; Schema: public; Owner: heidless
--

ALTER TABLE ONLY public.stocks
    ADD CONSTRAINT stocks_pkey PRIMARY KEY (id);


--
-- Name: user_stocks user_stocks_pkey; Type: CONSTRAINT; Schema: public; Owner: heidless
--

ALTER TABLE ONLY public.user_stocks
    ADD CONSTRAINT user_stocks_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: heidless
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_friendships_on_friend_id; Type: INDEX; Schema: public; Owner: heidless
--

CREATE INDEX index_friendships_on_friend_id ON public.friendships USING btree (friend_id);


--
-- Name: index_friendships_on_user_id; Type: INDEX; Schema: public; Owner: heidless
--

CREATE INDEX index_friendships_on_user_id ON public.friendships USING btree (user_id);


--
-- Name: index_user_stocks_on_stock_id; Type: INDEX; Schema: public; Owner: heidless
--

CREATE INDEX index_user_stocks_on_stock_id ON public.user_stocks USING btree (stock_id);


--
-- Name: index_user_stocks_on_user_id; Type: INDEX; Schema: public; Owner: heidless
--

CREATE INDEX index_user_stocks_on_user_id ON public.user_stocks USING btree (user_id);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: heidless
--

CREATE UNIQUE INDEX index_users_on_email ON public.users USING btree (email);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: heidless
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON public.users USING btree (reset_password_token);


--
-- Name: user_stocks fk_rails_15a036aef2; Type: FK CONSTRAINT; Schema: public; Owner: heidless
--

ALTER TABLE ONLY public.user_stocks
    ADD CONSTRAINT fk_rails_15a036aef2 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: user_stocks fk_rails_62699afff5; Type: FK CONSTRAINT; Schema: public; Owner: heidless
--

ALTER TABLE ONLY public.user_stocks
    ADD CONSTRAINT fk_rails_62699afff5 FOREIGN KEY (stock_id) REFERENCES public.stocks(id);


--
-- Name: friendships fk_rails_d78dc9c7fd; Type: FK CONSTRAINT; Schema: public; Owner: heidless
--

ALTER TABLE ONLY public.friendships
    ADD CONSTRAINT fk_rails_d78dc9c7fd FOREIGN KEY (friend_id) REFERENCES public.users(id);


--
-- Name: friendships fk_rails_e3733b59b7; Type: FK CONSTRAINT; Schema: public; Owner: heidless
--

ALTER TABLE ONLY public.friendships
    ADD CONSTRAINT fk_rails_e3733b59b7 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

