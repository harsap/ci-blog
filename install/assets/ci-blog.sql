--
-- PostgreSQL database dump
--

-- Dumped from database version 9.4.6
-- Dumped by pg_dump version 9.5.4

-- Started on 2016-12-29 13:28:15

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE tsc_cms;
--
-- TOC entry 2134 (class 1262 OID 48699)
-- Name: tsc_cms; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE tsc_cms WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'English_United States.1252' LC_CTYPE = 'English_United States.1252';


ALTER DATABASE tsc_cms OWNER TO postgres;

\connect tsc_cms

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 1 (class 3079 OID 11855)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2137 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 173 (class 1259 OID 48700)
-- Name: assets; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE assets (
    id serial    NOT NULL,
    type character varying(255) NOT NULL,
    primary_key integer NOT NULL,
    mime character varying(255) NOT NULL,
    extension character varying(100) NOT NULL,
    size character varying(255) DEFAULT NULL::character varying,
    description character varying(255) NOT NULL,
    path text NOT NULL,
    user_id integer,
    created date NOT NULL,
    modified date NOT NULL
);


ALTER TABLE assets OWNER TO postgres;

--
-- TOC entry 174 (class 1259 OID 48709)
-- Name: assets_posts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE assets_posts (
    id serial    NOT NULL,
    post_id integer NOT NULL,
    asset_id integer NOT NULL
);


ALTER TABLE assets_posts OWNER TO postgres;

--
-- TOC entry 175 (class 1259 OID 48718)
-- Name: categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE categories (
    id serial    NOT NULL,
    name character varying(255) NOT NULL,
    slug character varying(255) NOT NULL,
    status integer NOT NULL
);


ALTER TABLE categories OWNER TO postgres;

--
-- TOC entry 176 (class 1259 OID 48726)
-- Name: groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE groups (
    id serial    NOT NULL,
    name character varying(20) NOT NULL,
    description character varying(100) NOT NULL
);


ALTER TABLE groups OWNER TO postgres;

--
-- TOC entry 177 (class 1259 OID 48731)
-- Name: login_attempts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE login_attempts (
    ip_address character varying(15) NOT NULL,
    login character varying(100) NOT NULL,
    "time" integer,
    id serial    NOT NULL
);


ALTER TABLE login_attempts OWNER TO postgres;

 

--
-- TOC entry 178 (class 1259 OID 48736)
-- Name: menus; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE menus (
    id serial    NOT NULL,
    name character varying(255) NOT NULL,
    url character varying(255) NOT NULL,
    parent_id integer DEFAULT 0 NOT NULL,
    status integer NOT NULL,
    "position" integer NOT NULL,
    type character varying(255) DEFAULT NULL::character varying
);


ALTER TABLE menus OWNER TO postgres;

--
-- TOC entry 179 (class 1259 OID 48746)
-- Name: methods; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE methods (
    id serial    NOT NULL,
    name character varying(255) NOT NULL,
    path character varying(255) NOT NULL,
    parent_id integer DEFAULT 0 NOT NULL
);


ALTER TABLE methods OWNER TO postgres;

--
-- TOC entry 180 (class 1259 OID 48755)
-- Name: methods_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE methods_groups (
    id serial    NOT NULL,
    method_id integer DEFAULT 0 NOT NULL,
    group_id integer DEFAULT 0 NOT NULL,
    allow_access integer DEFAULT 0 NOT NULL
);


ALTER TABLE methods_groups OWNER TO postgres;

--
-- TOC entry 181 (class 1259 OID 48767)
-- Name: posts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE posts (
    id serial    NOT NULL,
    title character varying(255) NOT NULL,
    slug character varying(255) NOT NULL,
    body text,
    type character varying(100) NOT NULL,
    featured_image character varying(255) DEFAULT NULL::character varying,
    status integer NOT NULL,
    published_at date DEFAULT now() NOT NULL,
    user_id integer NOT NULL,
    created date NOT NULL,
    modified date NOT NULL
);


ALTER TABLE posts OWNER TO postgres;

--
-- TOC entry 182 (class 1259 OID 48776)
-- Name: posts_categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE posts_categories (
    id serial    NOT NULL,
    post_id integer NOT NULL,
    category_id integer NOT NULL
);


ALTER TABLE posts_categories OWNER TO postgres;

--
-- TOC entry 183 (class 1259 OID 48785)
-- Name: posts_tags; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE posts_tags (
    id serial    NOT NULL,
    post_id integer NOT NULL,
    tag_id integer NOT NULL
);


ALTER TABLE posts_tags OWNER TO postgres;

--
-- TOC entry 184 (class 1259 OID 48792)
-- Name: settings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE settings (
    id serial    NOT NULL,
    key character varying(255) NOT NULL,
    value text NOT NULL,
    description character varying(255) NOT NULL
);


ALTER TABLE settings OWNER TO postgres;

--
-- TOC entry 185 (class 1259 OID 48800)
-- Name: tags; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE tags (
    id serial    NOT NULL,
    name character varying(255) NOT NULL,
    slug character varying(255) NOT NULL,
    status integer NOT NULL
);


ALTER TABLE tags OWNER TO postgres;

--
-- TOC entry 186 (class 1259 OID 48808)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE users (
    id serial    NOT NULL,
    ip_address character varying(15) NOT NULL,
    username character varying(100) NOT NULL,
    password character varying(255) NOT NULL,
    salt character varying(255) DEFAULT NULL::character varying,
    email character varying(100) NOT NULL,
    activation_code character varying(40) DEFAULT NULL::character varying,
    forgotten_password_code character varying(40) DEFAULT NULL::character varying,
    forgotten_password_time integer,
    remember_code character varying(40) DEFAULT NULL::character varying,
    created_on integer NOT NULL,
    last_login integer,
    active integer,
    first_name character varying(50) DEFAULT NULL::character varying,
    last_name character varying(50) DEFAULT NULL::character varying,
    company character varying(100) DEFAULT NULL::character varying,
    phone character varying(20) DEFAULT NULL::character varying
);


ALTER TABLE users OWNER TO postgres;

--
-- TOC entry 187 (class 1259 OID 48824)
-- Name: users_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE users_groups (
    id serial    NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE users_groups OWNER TO postgres;

--
-- TOC entry 1946 (class 2604 OID 48874)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY login_attempts ALTER COLUMN id SET DEFAULT nextval('login_attempts_id_seq'::regclass);


--
-- TOC entry 2114 (class 0 OID 48700)
-- Dependencies: 173
-- Data for Name: assets; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO assets (id, type, primary_key, mime, extension, size, description, path, user_id, created, modified) VALUES (1, 'post', 0, 'image/jpeg', '.jpg', '190.48', '10', 'assets/uploads/10.jpg', 1, '2015-12-24', '2015-12-24');
INSERT INTO assets (id, type, primary_key, mime, extension, size, description, path, user_id, created, modified) VALUES (2, 'post', 0, 'image/jpeg', '.jpg', '305.92', '6', 'assets/uploads/6.jpg', 1, '2015-12-24', '2015-12-24');
INSERT INTO assets (id, type, primary_key, mime, extension, size, description, path, user_id, created, modified) VALUES (3, 'post', 0, 'image/jpeg', '.jpg', '340.45', '9', 'assets/uploads/9.jpg', 1, '2015-12-24', '2015-12-24');
INSERT INTO assets (id, type, primary_key, mime, extension, size, description, path, user_id, created, modified) VALUES (4, 'post', 0, 'image/jpeg', '.jpg', '190.48', '10', 'assets/uploads/10.jpg', 1, '2015-12-24', '2015-12-24');
INSERT INTO assets (id, type, primary_key, mime, extension, size, description, path, user_id, created, modified) VALUES (5, 'post', 0, 'image/jpeg', '.jpg', '467.65', 'hero', 'assets/uploads/hero.jpg', 1, '2015-12-24', '2015-12-24');
INSERT INTO assets (id, type, primary_key, mime, extension, size, description, path, user_id, created, modified) VALUES (6, 'post', 0, 'image/jpeg', '.jpg', '552.86', 'blur', 'assets/uploads/blur.jpg', 1, '2015-12-24', '2015-12-24');
INSERT INTO assets (id, type, primary_key, mime, extension, size, description, path, user_id, created, modified) VALUES (7, 'post', 0, 'image/jpeg', '.jpg', '305.92', '6', 'assets/uploads/6.jpg', 1, '2015-12-24', '2015-12-24');
INSERT INTO assets (id, type, primary_key, mime, extension, size, description, path, user_id, created, modified) VALUES (8, 'post', 0, 'image/jpeg', '.jpg', '186.94', '8', 'assets/uploads/8.jpg', 1, '2015-12-24', '2015-12-24');
INSERT INTO assets (id, type, primary_key, mime, extension, size, description, path, user_id, created, modified) VALUES (9, 'post', 0, 'image/jpeg', '.jpg', '552.86', 'blur', 'assets/uploads/blur.jpg', 1, '2015-12-24', '2015-12-24');
INSERT INTO assets (id, type, primary_key, mime, extension, size, description, path, user_id, created, modified) VALUES (10, 'post', 0, 'image/jpeg', '.jpg', '186.94', '8', 'assets/uploads/8.jpg', 1, '2015-12-24', '2015-12-24');
INSERT INTO assets (id, type, primary_key, mime, extension, size, description, path, user_id, created, modified) VALUES (11, 'post', 0, 'image/jpeg', '.jpg', '190.48', '10', 'assets/uploads/10.jpg', 1, '2015-12-24', '2015-12-24');
INSERT INTO assets (id, type, primary_key, mime, extension, size, description, path, user_id, created, modified) VALUES (12, 'post', 0, 'image/jpeg', '.jpg', '340.45', '9', 'assets/uploads/9.jpg', 1, '2015-12-24', '2015-12-24');
INSERT INTO assets (id, type, primary_key, mime, extension, size, description, path, user_id, created, modified) VALUES (13, 'post', 0, 'image/jpeg', '.jpg', '305.92', '6', 'assets/uploads/6.jpg', 1, '2015-12-25', '2015-12-25');
INSERT INTO assets (id, type, primary_key, mime, extension, size, description, path, user_id, created, modified) VALUES (14, 'post', 0, 'image/jpeg', '.jpg', '209.27', '7', 'assets/uploads/7.jpg', 1, '2015-12-25', '2015-12-25');
INSERT INTO assets (id, type, primary_key, mime, extension, size, description, path, user_id, created, modified) VALUES (15, 'post', 0, 'image/jpeg', '.jpg', '209.27', '7', 'assets/uploads/7.jpg', 9, '2015-12-26', '2015-12-26');
INSERT INTO assets (id, type, primary_key, mime, extension, size, description, path, user_id, created, modified) VALUES (16, 'post', 0, 'image/jpeg', '.jpg', '268.98', '5', 'assets/uploads/5.jpg', 9, '2015-12-26', '2015-12-26');
INSERT INTO assets (id, type, primary_key, mime, extension, size, description, path, user_id, created, modified) VALUES (17, 'post', 0, 'image/jpeg', '.jpg', '238.62', '3', 'assets/uploads/3.jpg', 9, '2015-12-26', '2015-12-26');
INSERT INTO assets (id, type, primary_key, mime, extension, size, description, path, user_id, created, modified) VALUES (18, 'post', 0, 'image/jpeg', '.jpg', '161.11', 'leaf', 'assets/uploads/leaf.jpg', 1, '2015-12-27', '2015-12-27');
INSERT INTO assets (id, type, primary_key, mime, extension, size, description, path, user_id, created, modified) VALUES (19, 'post', 0, 'image/png', '.png', '0.96', 'header_bg', 'assets/uploads/header_bg.png', 1, '2015-12-27', '2015-12-27');
INSERT INTO assets (id, type, primary_key, mime, extension, size, description, path, user_id, created, modified) VALUES (20, 'post', 0, 'image/jpeg', '.jpg', '32.27', 'bridge', 'assets/uploads/bridge.jpg', 1, '2015-12-27', '2015-12-27');


--
-- TOC entry 2115 (class 0 OID 48709)
-- Dependencies: 174
-- Data for Name: assets_posts; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2116 (class 0 OID 48718)
-- Dependencies: 175
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO categories (id, name, slug, status) VALUES (1, 'Web Programming', 'web-programming', 1);
INSERT INTO categories (id, name, slug, status) VALUES (2, 'Web Design', 'web-design', 1);
INSERT INTO categories (id, name, slug, status) VALUES (3, 'Network  & Security', 'network-security', 1);
INSERT INTO categories (id, name, slug, status) VALUES (4, 'Search Engine Optimation (SEO)', 'search-engine-optimation-seo', 1);
INSERT INTO categories (id, name, slug, status) VALUES (5, 'Tutorial Web', 'tutorial-web', 0);
INSERT INTO categories (id, name, slug, status) VALUES (8, 'Test kategori', 'test-kategori', 0);


--
-- TOC entry 2117 (class 0 OID 48726)
-- Dependencies: 176
-- Data for Name: groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO groups (id, name, description) VALUES (1, 'admin', 'Administrator');
INSERT INTO groups (id, name, description) VALUES (2, 'members', 'General User');


--
-- TOC entry 2118 (class 0 OID 48731)
-- Dependencies: 177
-- Data for Name: login_attempts; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO login_attempts (ip_address, login, "time", id) VALUES ('::1', 'admin', 1482986394, 1);


 

--
-- TOC entry 2119 (class 0 OID 48736)
-- Dependencies: 178
-- Data for Name: menus; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO menus (id, name, url, parent_id, status, "position", type) VALUES (12, 'Home', 'home', 0, 1, 12, NULL);
INSERT INTO menus (id, name, url, parent_id, status, "position", type) VALUES (13, 'About', 'read/about-us', 0, 1, 13, NULL);
INSERT INTO menus (id, name, url, parent_id, status, "position", type) VALUES (14, 'Blog', 'posts', 0, 1, 14, NULL);
INSERT INTO menus (id, name, url, parent_id, status, "position", type) VALUES (15, 'Sign In', 'signin', 0, 1, 15, NULL);


--
-- TOC entry 2120 (class 0 OID 48746)
-- Dependencies: 179
-- Data for Name: methods; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2121 (class 0 OID 48755)
-- Dependencies: 180
-- Data for Name: methods_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2122 (class 0 OID 48767)
-- Dependencies: 181
-- Data for Name: posts; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO posts (id, title, slug, body, type, featured_image, status, published_at, user_id, created, modified) VALUES (1, 'Justice Department Sets Sights on Wall Street Executives', 'justice-department-sets-sights-on-wall-street-executives', '<p> Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. </p> <p> Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. <br></p><p> Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. </p> <p> Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. <br></p><img src=\"/product/ci-blog/assets/uploads/9.jpg\" height=\"331\" width=\"789\"><br><br><br>', 'post', 'assets/uploads/blur.jpg', 0, '2015-12-30', 1, '2015-12-25', '2015-12-26');
INSERT INTO posts (id, title, slug, body, type, featured_image, status, published_at, user_id, created, modified) VALUES (2, 'Uis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla ', 'uis-aute-irure-dolor-in-reprehenderit-in-voluptate-velit-esse-cillum-dolore-eu-fugiat-nulla', '<p> Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. </p> <p> Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. <br></p><br><img src=\"/product/ci-blog/assets/uploads/8.jpg\" height=\"388\" width=\"749\"><br><br><p> Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. </p> <p> Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. <br></p><p> Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. </p> <p> Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. </p><br>', 'post', 'assets/uploads/blur.jpg', 1, '2015-12-17', 1, '2015-12-25', '2015-12-26');
INSERT INTO posts (id, title, slug, body, type, featured_image, status, published_at, user_id, created, modified) VALUES (3, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit', 'lorem-ipsum-dolor-sit-amet-consectetur-adipisicing-elit', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.<br><br>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. <br><br>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. <br><br><img src=\"/product/ci-blog/assets/uploads/3.jpg\" height=\"512\" width=\"805\"><br><br>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. <br><br>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. <br><br>', 'post', 'assets/uploads/3.jpg', 1, '2015-12-26', 9, '2015-12-26', '2015-12-26');
INSERT INTO posts (id, title, slug, body, type, featured_image, status, published_at, user_id, created, modified) VALUES (6, 'About Us', 'about-us', '<img src=\"/product/ci-blog/assets/uploads/3.jpg\"><br>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Proin nibh augue, suscipit a, scelerisque sed, lacinia in, mi. Cras vel lorem. Etiam pellentesque aliquet tellus. Phasellus pharetra nulla ac diam. Quisque semper justo at risus. Donec venenatis, turpis vel hendrerit interdum, dui ligula ultricies purus, sed posuere libero dui id orci. Nam congue, pede vitae dapibus aliquet, elit magna vulputate arcu, vel tempus metus leo non est. Etiam sit amet lectus quis est congue mollis. Phasellus congue lacus eget neque. Phasellus ornare, ante vitae consectetuer consequat, purus sapien ultricies dolor, et mollis pede metus eget nisi. Praesent sodales velit quis augue.<br><br><br>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Proin nibh augue, suscipit a, scelerisque sed, lacinia in, mi. Cras vel lorem. Etiam pellentesque aliquet tellus. Phasellus pharetra nulla ac diam. Quisque semper justo at risus. Donec venenatis, turpis vel hendrerit interdum, dui ligula ultricies purus, sed posuere libero dui id orci. Nam congue, pede vitae dapibus aliquet, elit magna vulputate arcu, vel tempus metus leo non est. Etiam sit amet lectus quis est congue mollis. Phasellus congue lacus eget neque. Phasellus ornare, ante vitae consectetuer consequat, purus sapien ultricies dolor, et mollis pede metus eget nisi. Praesent sodales velit quis augue. <br><br><br>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Proin nibh augue, suscipit a, scelerisque sed, lacinia in, mi. Cras vel lorem. Etiam pellentesque aliquet tellus. Phasellus pharetra nulla ac diam. Quisque semper justo at risus. Donec venenatis, turpis vel hendrerit interdum, dui ligula ultricies purus, sed posuere libero dui id orci. Nam congue, pede vitae dapibus aliquet, elit magna vulputate arcu, vel tempus metus leo non est. Etiam sit amet lectus quis est congue mollis. Phasellus congue lacus eget neque. Phasellus ornare, ante vitae consectetuer consequat, purus sapien ultricies dolor, et mollis pede metus eget nisi. Praesent sodales velit quis augue. <br><br>', 'page', '', 1, '2015-12-26', 1, '2015-12-26', '2015-12-27');


--
-- TOC entry 2123 (class 0 OID 48776)
-- Dependencies: 182
-- Data for Name: posts_categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO posts_categories (id, post_id, category_id) VALUES (5, 1, 5);
INSERT INTO posts_categories (id, post_id, category_id) VALUES (6, 1, 4);
INSERT INTO posts_categories (id, post_id, category_id) VALUES (7, 2, 3);
INSERT INTO posts_categories (id, post_id, category_id) VALUES (8, 2, 8);
INSERT INTO posts_categories (id, post_id, category_id) VALUES (10, 3, 1);
INSERT INTO posts_categories (id, post_id, category_id) VALUES (15, 3, 3);
INSERT INTO posts_categories (id, post_id, category_id) VALUES (16, 3, 5);


--
-- TOC entry 2124 (class 0 OID 48785)
-- Dependencies: 183
-- Data for Name: posts_tags; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO posts_tags (id, post_id, tag_id) VALUES (5, 3, 1);
INSERT INTO posts_tags (id, post_id, tag_id) VALUES (6, 3, 6);
INSERT INTO posts_tags (id, post_id, tag_id) VALUES (7, 3, 7);
INSERT INTO posts_tags (id, post_id, tag_id) VALUES (8, 1, 7);
INSERT INTO posts_tags (id, post_id, tag_id) VALUES (9, 1, 5);


--
-- TOC entry 2125 (class 0 OID 48792)
-- Dependencies: 184
-- Data for Name: settings; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO settings (id, key, value, description) VALUES (1, 'email_contact', 'sugiarto@gie-art.com', 'Email kontak form');
INSERT INTO settings (id, key, value, description) VALUES (2, 'image_max_size', '2000', 'Ukuran image dalam kb (kilo byte)');
INSERT INTO settings (id, key, value, description) VALUES (3, 'file_max_size', '3000', 'Ukuran file maksimal dalam kb (kilobyte)');
INSERT INTO settings (id, key, value, description) VALUES (4, 'file_type', 'doc|zip|pdf|xlsx|xls|ppt|docx|pptx', 'Tipe file yang di ijinkan untk di upload');
INSERT INTO settings (id, key, value, description) VALUES (5, 'image_type', 'gif|jpg|png', 'Tipe image yang diperbolehkan untuk di upload');
INSERT INTO settings (id, key, value, description) VALUES (6, 'pagination_limit', '10', 'Batas list /record (artikel, file, dll) per halaman');
INSERT INTO settings (id, key, value, description) VALUES (7, 'main_office', 'Company Address', '');
INSERT INTO settings (id, key, value, description) VALUES (8, 'site_title', 'CI Blog - Basic CMS based on CodeIgniter 3', '');
INSERT INTO settings (id, key, value, description) VALUES (18, 'pagination_limit_directory', '50', '');


--
-- TOC entry 2126 (class 0 OID 48800)
-- Dependencies: 185
-- Data for Name: tags; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO tags (id, name, slug, status) VALUES (1, 'CodeIgniter', 'codeigniter', 1);
INSERT INTO tags (id, name, slug, status) VALUES (2, 'Responsive', 'responsive', 1);
INSERT INTO tags (id, name, slug, status) VALUES (3, 'basic cms', 'basic-cms', 1);
INSERT INTO tags (id, name, slug, status) VALUES (4, 'tag baru', 'tag-baru', 1);
INSERT INTO tags (id, name, slug, status) VALUES (5, 'Simple CMS', 'simple-cms', 1);
INSERT INTO tags (id, name, slug, status) VALUES (6, 'Security Tips', 'security-tips', 1);
INSERT INTO tags (id, name, slug, status) VALUES (7, 'Hack & DDOS', 'hack-ddos', 1);


--
-- TOC entry 2127 (class 0 OID 48808)
-- Dependencies: 186
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO users (id, ip_address, username, password, salt, email, activation_code, forgotten_password_code, forgotten_password_time, remember_code, created_on, last_login, active, first_name, last_name, company, phone) VALUES (9, '127.0.0.1', 'members', '$2y$08$0TTfatwN6dXgJzX6RpYBzeRIrVsTEUs8ao7ldGewEyCywq4VoMXC.', NULL, 'members@website.com', '6d73486c9d4f501a24c7d9c9bfa3b47d68c471c0', NULL, NULL, NULL, 1451071829, 1451071890, 1, 'My', 'Member', '', '');
INSERT INTO users (id, ip_address, username, password, salt, email, activation_code, forgotten_password_code, forgotten_password_time, remember_code, created_on, last_login, active, first_name, last_name, company, phone) VALUES (1, '127.0.0.1', 'administrator', '$2a$07$SeBknntpZror9uyftVopmu61qg0ms8Qv1yV6FG.kQOSM.9QhmTo36', '', 'admin@admin.com', '', NULL, NULL, NULL, 1268889823, 1482986798, 1, 'Admin', 'istrator', 'ADMIN', '0');


--
-- TOC entry 2128 (class 0 OID 48824)
-- Dependencies: 187
-- Data for Name: users_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO users_groups (id, user_id, group_id) VALUES (9, 1, 1);
INSERT INTO users_groups (id, user_id, group_id) VALUES (10, 1, 2);
INSERT INTO users_groups (id, user_id, group_id) VALUES (13, 9, 2);


--
-- TOC entry 1966 (class 2606 OID 48715)
-- Name: fk_assets_posts_posts1; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY assets_posts
    ADD CONSTRAINT fk_assets_posts_posts1 UNIQUE (post_id);


--
-- TOC entry 1984 (class 2606 OID 48791)
-- Name: fk_posts_tags_tags1; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY posts_tags
    ADD CONSTRAINT fk_posts_tags_tags1 UNIQUE (tag_id, post_id);


--
-- TOC entry 1964 (class 2606 OID 48708)
-- Name: pk_assets; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY assets
    ADD CONSTRAINT pk_assets PRIMARY KEY (id);


--
-- TOC entry 1968 (class 2606 OID 48713)
-- Name: pk_assets_posts; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY assets_posts
    ADD CONSTRAINT pk_assets_posts PRIMARY KEY (id);


--
-- TOC entry 1970 (class 2606 OID 48725)
-- Name: pk_categories; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY categories
    ADD CONSTRAINT pk_categories PRIMARY KEY (id);


--
-- TOC entry 1972 (class 2606 OID 48730)
-- Name: pk_groups; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY groups
    ADD CONSTRAINT pk_groups PRIMARY KEY (id);


--
-- TOC entry 1974 (class 2606 OID 48745)
-- Name: pk_menus; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY menus
    ADD CONSTRAINT pk_menus PRIMARY KEY (id);


--
-- TOC entry 1976 (class 2606 OID 48754)
-- Name: pk_methods; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY methods
    ADD CONSTRAINT pk_methods PRIMARY KEY (id);


--
-- TOC entry 1978 (class 2606 OID 48762)
-- Name: pk_methods_groups; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY methods_groups
    ADD CONSTRAINT pk_methods_groups PRIMARY KEY (id);


--
-- TOC entry 1980 (class 2606 OID 48775)
-- Name: pk_posts; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY posts
    ADD CONSTRAINT pk_posts PRIMARY KEY (id);


--
-- TOC entry 1982 (class 2606 OID 48780)
-- Name: pk_posts_categories; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY posts_categories
    ADD CONSTRAINT pk_posts_categories PRIMARY KEY (id);


--
-- TOC entry 1986 (class 2606 OID 48789)
-- Name: pk_posts_tags; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY posts_tags
    ADD CONSTRAINT pk_posts_tags PRIMARY KEY (id);


--
-- TOC entry 1988 (class 2606 OID 48799)
-- Name: pk_settings; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY settings
    ADD CONSTRAINT pk_settings PRIMARY KEY (id);


--
-- TOC entry 1990 (class 2606 OID 48807)
-- Name: pk_tags; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tags
    ADD CONSTRAINT pk_tags PRIMARY KEY (id);


--
-- TOC entry 1992 (class 2606 OID 48823)
-- Name: pk_users; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users
    ADD CONSTRAINT pk_users PRIMARY KEY (id);


--
-- TOC entry 1994 (class 2606 OID 48828)
-- Name: pk_users_groups; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users_groups
    ADD CONSTRAINT pk_users_groups PRIMARY KEY (id);


--
-- TOC entry 1996 (class 2606 OID 48830)
-- Name: uc_users_groups; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users_groups
    ADD CONSTRAINT uc_users_groups UNIQUE (user_id, group_id);


--
-- TOC entry 1997 (class 2606 OID 48831)
-- Name: fk_assets_posts_assets1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY assets_posts
    ADD CONSTRAINT fk_assets_posts_assets1 FOREIGN KEY (asset_id) REFERENCES assets(id) ON DELETE CASCADE;


--
-- TOC entry 1998 (class 2606 OID 48836)
-- Name: fk_methods_groups_groups1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY methods_groups
    ADD CONSTRAINT fk_methods_groups_groups1 FOREIGN KEY (group_id) REFERENCES groups(id) ON DELETE CASCADE;


--
-- TOC entry 1999 (class 2606 OID 48841)
-- Name: fk_methods_groups_methods1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY methods_groups
    ADD CONSTRAINT fk_methods_groups_methods1 FOREIGN KEY (method_id) REFERENCES methods(id) ON DELETE CASCADE;


--
-- TOC entry 2000 (class 2606 OID 48846)
-- Name: fk_posts_categories_categories1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY posts_categories
    ADD CONSTRAINT fk_posts_categories_categories1 FOREIGN KEY (category_id) REFERENCES categories(id) ON DELETE CASCADE;


--
-- TOC entry 2001 (class 2606 OID 48851)
-- Name: fk_posts_categories_posts1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY posts_categories
    ADD CONSTRAINT fk_posts_categories_posts1 FOREIGN KEY (post_id) REFERENCES posts(id) ON DELETE CASCADE;


--
-- TOC entry 2002 (class 2606 OID 48856)
-- Name: fk_posts_tags_posts1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY posts_tags
    ADD CONSTRAINT fk_posts_tags_posts1 FOREIGN KEY (post_id) REFERENCES posts(id) ON DELETE CASCADE;


--
-- TOC entry 2003 (class 2606 OID 48861)
-- Name: fk_users_groups_groups1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users_groups
    ADD CONSTRAINT fk_users_groups_groups1 FOREIGN KEY (group_id) REFERENCES groups(id) ON DELETE CASCADE;


--
-- TOC entry 2004 (class 2606 OID 48866)
-- Name: fk_users_groups_users1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users_groups
    ADD CONSTRAINT fk_users_groups_users1 FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE;


--
-- TOC entry 2136 (class 0 OID 0)
-- Dependencies: 6
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2016-12-29 13:28:16

--
-- PostgreSQL database dump complete
--

