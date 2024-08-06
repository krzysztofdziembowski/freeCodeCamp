--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    user_id integer NOT NULL,
    guess_count integer NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(22) NOT NULL
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (1, 1, 11);
INSERT INTO public.games VALUES (2, 2, 536);
INSERT INTO public.games VALUES (3, 2, 481);
INSERT INTO public.games VALUES (4, 3, 183);
INSERT INTO public.games VALUES (5, 3, 481);
INSERT INTO public.games VALUES (6, 2, 282);
INSERT INTO public.games VALUES (7, 2, 881);
INSERT INTO public.games VALUES (8, 2, 995);
INSERT INTO public.games VALUES (9, 4, 527);
INSERT INTO public.games VALUES (10, 4, 426);
INSERT INTO public.games VALUES (11, 5, 437);
INSERT INTO public.games VALUES (12, 5, 675);
INSERT INTO public.games VALUES (13, 4, 989);
INSERT INTO public.games VALUES (14, 4, 671);
INSERT INTO public.games VALUES (15, 4, 700);
INSERT INTO public.games VALUES (16, 6, 503);
INSERT INTO public.games VALUES (17, 6, 811);
INSERT INTO public.games VALUES (18, 7, 335);
INSERT INTO public.games VALUES (19, 7, 177);
INSERT INTO public.games VALUES (20, 6, 543);
INSERT INTO public.games VALUES (21, 6, 243);
INSERT INTO public.games VALUES (22, 6, 944);
INSERT INTO public.games VALUES (23, 8, 210);
INSERT INTO public.games VALUES (24, 8, 677);
INSERT INTO public.games VALUES (25, 9, 990);
INSERT INTO public.games VALUES (26, 9, 263);
INSERT INTO public.games VALUES (27, 8, 479);
INSERT INTO public.games VALUES (28, 8, 869);
INSERT INTO public.games VALUES (29, 8, 478);
INSERT INTO public.games VALUES (30, 10, 572);
INSERT INTO public.games VALUES (31, 10, 75);
INSERT INTO public.games VALUES (32, 11, 557);
INSERT INTO public.games VALUES (33, 11, 771);
INSERT INTO public.games VALUES (34, 10, 589);
INSERT INTO public.games VALUES (35, 10, 390);
INSERT INTO public.games VALUES (36, 10, 60);
INSERT INTO public.games VALUES (37, 1, 5);
INSERT INTO public.games VALUES (38, 12, 895);
INSERT INTO public.games VALUES (39, 12, 175);
INSERT INTO public.games VALUES (40, 13, 129);
INSERT INTO public.games VALUES (41, 13, 17);
INSERT INTO public.games VALUES (42, 12, 139);
INSERT INTO public.games VALUES (43, 12, 547);
INSERT INTO public.games VALUES (44, 12, 37);
INSERT INTO public.games VALUES (45, 15, 695);
INSERT INTO public.games VALUES (46, 15, 300);
INSERT INTO public.games VALUES (47, 16, 145);
INSERT INTO public.games VALUES (48, 16, 325);
INSERT INTO public.games VALUES (49, 15, 838);
INSERT INTO public.games VALUES (50, 15, 391);
INSERT INTO public.games VALUES (51, 15, 260);
INSERT INTO public.games VALUES (52, 17, 349);
INSERT INTO public.games VALUES (53, 17, 576);
INSERT INTO public.games VALUES (54, 18, 151);
INSERT INTO public.games VALUES (55, 18, 484);
INSERT INTO public.games VALUES (56, 17, 809);
INSERT INTO public.games VALUES (57, 17, 597);
INSERT INTO public.games VALUES (58, 17, 546);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (1, 'ja');
INSERT INTO public.users VALUES (2, 'user_1722959394831');
INSERT INTO public.users VALUES (3, 'user_1722959394830');
INSERT INTO public.users VALUES (4, 'user_1722959437135');
INSERT INTO public.users VALUES (5, 'user_1722959437134');
INSERT INTO public.users VALUES (6, 'user_1722959468799');
INSERT INTO public.users VALUES (7, 'user_1722959468798');
INSERT INTO public.users VALUES (8, 'user_1722959485458');
INSERT INTO public.users VALUES (9, 'user_1722959485457');
INSERT INTO public.users VALUES (10, 'user_1722959500324');
INSERT INTO public.users VALUES (11, 'user_1722959500323');
INSERT INTO public.users VALUES (12, 'user_1722959817504');
INSERT INTO public.users VALUES (13, 'user_1722959817503');
INSERT INTO public.users VALUES (14, 'not me');
INSERT INTO public.users VALUES (15, 'user_1722960077733');
INSERT INTO public.users VALUES (16, 'user_1722960077732');
INSERT INTO public.users VALUES (17, 'user_1722960425894');
INSERT INTO public.users VALUES (18, 'user_1722960425893');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 58, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 18, true);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- PostgreSQL database dump complete
--


