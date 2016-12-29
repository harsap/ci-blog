/*==============================================================*/
/* DBMS name:      PostgreSQL 9                                 */
/* Created on:     29-Dec-16 10:18:29 AM                        */
/*==============================================================*/

/*DROP DATABASE product_ciblogdb;

CREATE DATABASE product_ciblogdb
  WITH OWNER = postgres
       ENCODING = 'UTF8'
       TABLESPACE = pg_default
       LC_COLLATE = 'English_United States.1252'
       LC_CTYPE = 'English_United States.1252'
       CONNECTION LIMIT = -1;*/
 /*

drop table assets;

drop table assets_posts;

drop table categories;

drop table groups;

drop table login_attempts;

drop table menus;

drop table methods;

drop table methods_groups;

drop table posts;

drop table posts_categories;

drop table posts_tags;

drop table settings;

drop table tags;

drop table users;

drop table users_groups; 
 
 */
 
 

/*==============================================================*/
/* Table: assets                                                */
/*==============================================================*/
create table assets (
   id                   int                 not null,
   type                 character varying(255)         not null,
   primary_key          int                 not null,
   mime                 character varying(255)         not null,
   extension            character varying(100)         not null,
   size                 character varying(255)         null default NULL,
   description          character varying(255)         not null,
   path                 TEXT                 not null,
   user_id              int                 null default NULL,
   created              DATE                 not null,
   modified             DATE                 not null,
   constraint PK_ASSETS primary key (id)
);

/*==============================================================*/
/* Table: assets_posts                                          */
/*==============================================================*/
create table assets_posts (
   id                   int                 not null,
   post_id              int                 not null,
   asset_id             int                 not null,
   constraint PK_ASSETS_POSTS primary key (id),
   constraint fk_assets_posts_posts1 unique (post_id),
   constraint fk_assets_posts_assets1 unique (asset_id)
);

/*==============================================================*/
/* Table: categories                                            */
/*==============================================================*/
create table categories (
   id                   int                 not null,
   name                 character varying(255)         not null,
   slug                 character varying(255)         not null,
   status               int                 not null,
   constraint PK_CATEGORIES primary key (id)
);

/*==============================================================*/
/* Table: groups                                                */
/*==============================================================*/
create table groups (
   id                   int                 not null,
   name                 character varying(20)          not null,
   description          character varying(100)         not null,
   constraint PK_GROUPS primary key (id)
);

/*==============================================================*/
/* Table: login_attempts                                        */
/*==============================================================*/
create table login_attempts (
   id                   int                 not null,
   ip_address           character varying(15)          not null,
   login                character varying(100)         not null,
   "time"               int                 null default NULL,
   constraint PK_LOGIN_ATTEMPTS primary key (id)
);

/*==============================================================*/
/* Table: menus                                                 */
/*==============================================================*/
create table menus (
   id                   int                 not null,
   name                 character varying(255)         not null,
   url                  character varying(255)         not null,
   parent_id            int                 not null default 0,
   status               int                 not null,
   "position"           int                 not null,
   type                 character varying(255)         null default NULL,
   constraint PK_MENUS primary key (id)
);

/*==============================================================*/
/* Table: methods                                               */
/*==============================================================*/
create table methods (
   id                   int                 not null,
   name                 character varying(255)         not null,
   path                 character varying(255)         not null,
   parent_id            int                 not null default 0,
   constraint PK_METHODS primary key (id)
);

/*==============================================================*/
/* Table: methods_groups                                        */
/*==============================================================*/
create table methods_groups (
   id                   int                 not null,
   method_id            int                 not null default 0,
   group_id             int                 not null default 0,
   allow_access         int                 not null default 0,
   constraint PK_METHODS_GROUPS primary key (id),
   constraint fk_methods_groups_groups1 unique (group_id),
   constraint fk_methods_groups_methods1 unique (method_id)
);

/*==============================================================*/
/* Table: posts                                                 */
/*==============================================================*/
create table posts (
   id                   int                 not null,
   title                character varying(255)         not null,
   slug                 character varying(255)         not null,
   body                 TEXT                 null,
   type                 character varying(100)         not null,
   featured_image       character varying(255)         null default NULL,
   status               int                 not null,
   published_at         DATE                 not null,
   user_id              int                 not null,
   created              DATE                 not null,
   modified             DATE                 not null,
   constraint PK_POSTS primary key (id)
);

/*==============================================================*/
/* Table: posts_categories                                      */
/*==============================================================*/
create table posts_categories (
   id                   int                 not null,
   post_id              int                 not null,
   category_id          int                 not null,
   constraint PK_POSTS_CATEGORIES primary key (id),
   constraint fk_posts_categories_categories1 unique (category_id),
   constraint fk_posts_categories_posts1 unique (post_id)
);

/*==============================================================*/
/* Table: posts_tags                                            */
/*==============================================================*/
create table posts_tags (
   id                   int                 not null,
   post_id              int                 not null,
   tag_id               int                 not null,
   constraint PK_POSTS_TAGS primary key (id),
   constraint fk_posts_tags_tags1 unique (tag_id,post_id) 
);

/*==============================================================*/
/* Table: settings                                              */
/*==============================================================*/
create table settings (
   id                   int                 not null,
   key                  character varying(255)         not null,
   value                TEXT                 not null,
   description          character varying(255)         not null,
   constraint PK_SETTINGS primary key (id)
);

/*==============================================================*/
/* Table: tags                                                  */
/*==============================================================*/
create table tags (
   id                   int                 not null,
   name                 character varying(255)         not null,
   slug                 character varying(255)         not null,
   status               int                 not null,
   constraint PK_TAGS primary key (id)
);

/*==============================================================*/
/* Table: users                                                 */
/*==============================================================*/
create table users (
   id                   int                 not null,
   ip_address           character varying(15)          not null,
   username             character varying(100)         not null,
   password             character varying(255)         not null,
   salt                 character varying(255)         null default NULL,
   email                character varying(100)         not null,
   activation_code      character varying(40)          null default NULL,
   forgotten_password_code character varying(40)          null default NULL,
   forgotten_password_time int                 null default NULL,
   remember_code        character varying(40)          null default NULL,
   created_on           int                 not null,
   last_login           int                 null default NULL,
   active               int                 null default NULL,
   first_name           character varying(50)          null default NULL,
   last_name            character varying(50)          null default NULL,
   company              character varying(100)         null default NULL,
   phone                character varying(20)          null default NULL,
   constraint PK_USERS primary key (id)
);

/*==============================================================*/
/* Table: users_groups                                          */
/*==============================================================*/
create table users_groups (
   id                   int                 not null,
   user_id              int                 not null,
   group_id             int                 not null,
   constraint PK_USERS_GROUPS primary key (id),
   constraint uc_users_groups unique (user_id, group_id),
   constraint fk_users_groups_users1_idx unique (user_id,group_id) 
);

alter table assets_posts
DROP CONSTRAINT fk_assets_posts_assets1,
   add constraint fk_assets_posts_assets1 foreign key (asset_id)
      references assets (id)
      on delete cascade;

alter table methods_groups
DROP CONSTRAINT fk_methods_groups_groups1,
   add constraint fk_methods_groups_groups1 foreign key (group_id)
      references groups (id)
      on delete cascade;

alter table methods_groups
DROP CONSTRAINT fk_methods_groups_methods1,
   add constraint fk_methods_groups_methods1 foreign key (method_id)
      references methods (id)
      on delete cascade;

alter table posts_categories
DROP CONSTRAINT fk_posts_categories_categories1,
   add constraint fk_posts_categories_categories1 foreign key (category_id)
      references categories (id)
      on delete cascade;

alter table posts_categories
DROP CONSTRAINT fk_posts_categories_posts1,
   add constraint fk_posts_categories_posts1 foreign key (post_id)
      references posts (id)
      on delete cascade;

alter table posts_tags 
   add constraint fk_posts_tags_posts1 foreign key (post_id)
      references posts (id)
      on delete cascade;

alter table users_groups 
   add constraint fk_users_groups_groups1 foreign key (group_id)
      references groups (id)
      on delete cascade;

alter table users_groups 
   add constraint fk_users_groups_users1 foreign key (user_id)
      references users (id)
      on delete cascade;

INSERT INTO  assets  VALUES (1,'post',0,'image/jpeg','.jpg','190.48','10','assets/uploads/10.jpg',1,'2015-12-24 23:43:29','2015-12-24 23:43:29'),(2,'post',0,'image/jpeg','.jpg','305.92','6','assets/uploads/6.jpg',1,'2015-12-24 23:48:00','2015-12-24 23:48:00'),(3,'post',0,'image/jpeg','.jpg','340.45','9','assets/uploads/9.jpg',1,'2015-12-24 23:48:29','2015-12-24 23:48:29'),(4,'post',0,'image/jpeg','.jpg','190.48','10','assets/uploads/10.jpg',1,'2015-12-24 23:48:45','2015-12-24 23:48:45'),(5,'post',0,'image/jpeg','.jpg','467.65','hero','assets/uploads/hero.jpg',1,'2015-12-24 23:49:10','2015-12-24 23:49:10'),(6,'post',0,'image/jpeg','.jpg','552.86','blur','assets/uploads/blur.jpg',1,'2015-12-24 23:49:42','2015-12-24 23:49:42'),(7,'post',0,'image/jpeg','.jpg','305.92','6','assets/uploads/6.jpg',1,'2015-12-24 23:55:13','2015-12-24 23:55:13'),(8,'post',0,'image/jpeg','.jpg','186.94','8','assets/uploads/8.jpg',1,'2015-12-24 23:57:38','2015-12-24 23:57:38'),(9,'post',0,'image/jpeg','.jpg','552.86','blur','assets/uploads/blur.jpg',1,'2015-12-24 23:57:50','2015-12-24 23:57:50'),(10,'post',0,'image/jpeg','.jpg','186.94','8','assets/uploads/8.jpg',1,'2015-12-24 23:57:56','2015-12-24 23:57:56'),(11,'post',0,'image/jpeg','.jpg','190.48','10','assets/uploads/10.jpg',1,'2015-12-24 23:58:33','2015-12-24 23:58:33'),(12,'post',0,'image/jpeg','.jpg','340.45','9','assets/uploads/9.jpg',1,'2015-12-24 23:58:58','2015-12-24 23:58:58'),(13,'post',0,'image/jpeg','.jpg','305.92','6','assets/uploads/6.jpg',1,'2015-12-25 00:00:54','2015-12-25 00:00:54'),(14,'post',0,'image/jpeg','.jpg','209.27','7','assets/uploads/7.jpg',1,'2015-12-25 00:02:24','2015-12-25 00:02:24'),(15,'post',0,'image/jpeg','.jpg','209.27','7','assets/uploads/7.jpg',9,'2015-12-26 02:35:57','2015-12-26 02:35:57'),(16,'post',0,'image/jpeg','.jpg','268.98','5','assets/uploads/5.jpg',9,'2015-12-26 02:37:39','2015-12-26 02:37:39'),(17,'post',0,'image/jpeg','.jpg','238.62','3','assets/uploads/3.jpg',9,'2015-12-26 02:40:10','2015-12-26 02:40:10'),(18,'post',0,'image/jpeg','.jpg','161.11','leaf','assets/uploads/leaf.jpg',1,'2015-12-27 01:31:27','2015-12-27 01:31:27'),(19,'post',0,'image/png','.png','0.96','header_bg','assets/uploads/header_bg.png',1,'2015-12-27 01:31:59','2015-12-27 01:31:59'),(20,'post',0,'image/jpeg','.jpg','32.27','bridge','assets/uploads/bridge.jpg',1,'2015-12-27 01:32:12','2015-12-27 01:32:12');

INSERT INTO  categories  VALUES (1,'Web Programming','web-programming',1),(2,'Web Design','web-design',1),(3,'Network  & Security','network-security',1),(4,'Search Engine Optimation (SEO)','search-engine-optimation-seo',1),(5,'Tutorial Web','tutorial-web',0),(8,'Test kategori','test-kategori',0);

INSERT INTO  groups  VALUES (1,'admin','Administrator'),(2,'members','General User');

INSERT INTO  menus  VALUES (12,'Home','home',0,1,12,NULL),(13,'About','read/about-us',0,1,13,NULL),(14,'Blog','posts',0,1,14,NULL),(15,'Sign In','signin',0,1,15,NULL);

INSERT INTO  posts  VALUES (1,'Justice Department Sets Sights on Wall Street Executives','justice-department-sets-sights-on-wall-street-executives','<p> Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. </p> <p> Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. <br></p><p> Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. </p> <p> Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. <br></p><img src=\"/product/ci-blog/assets/uploads/9.jpg\" height=\"331\" width=\"789\"><br><br><br>','post','assets/uploads/blur.jpg',0,'2015-12-30',1,'2015-12-25 01:29:57','2015-12-26 20:40:38'),(2,'Uis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla ','uis-aute-irure-dolor-in-reprehenderit-in-voluptate-velit-esse-cillum-dolore-eu-fugiat-nulla','<p> Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. </p> <p> Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. <br></p><br><img src=\"/product/ci-blog/assets/uploads/8.jpg\" height=\"388\" width=\"749\"><br><br><p> Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. </p> <p> Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. <br></p><p> Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. </p> <p> Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. </p><br>','post','assets/uploads/blur.jpg',1,'2015-12-17',1,'2015-12-25 02:11:57','2015-12-26 02:22:06'),(3,'Lorem ipsum dolor sit amet, consectetur adipisicing elit','lorem-ipsum-dolor-sit-amet-consectetur-adipisicing-elit','Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.<br><br>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. <br><br>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. <br><br><img src=\"/product/ci-blog/assets/uploads/3.jpg\" height=\"512\" width=\"805\"><br><br>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. <br><br>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. <br><br>','post','assets/uploads/3.jpg',1,'2015-12-26',9,'2015-12-26 02:42:38','2015-12-26 16:37:03'),(6,'About Us','about-us','<img src=\"/product/ci-blog/assets/uploads/3.jpg\"><br>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Proin nibh augue, suscipit a, scelerisque sed, lacinia in, mi. Cras vel lorem. Etiam pellentesque aliquet tellus. Phasellus pharetra nulla ac diam. Quisque semper justo at risus. Donec venenatis, turpis vel hendrerit interdum, dui ligula ultricies purus, sed posuere libero dui id orci. Nam congue, pede vitae dapibus aliquet, elit magna vulputate arcu, vel tempus metus leo non est. Etiam sit amet lectus quis est congue mollis. Phasellus congue lacus eget neque. Phasellus ornare, ante vitae consectetuer consequat, purus sapien ultricies dolor, et mollis pede metus eget nisi. Praesent sodales velit quis augue.<br><br><br>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Proin nibh augue, suscipit a, scelerisque sed, lacinia in, mi. Cras vel lorem. Etiam pellentesque aliquet tellus. Phasellus pharetra nulla ac diam. Quisque semper justo at risus. Donec venenatis, turpis vel hendrerit interdum, dui ligula ultricies purus, sed posuere libero dui id orci. Nam congue, pede vitae dapibus aliquet, elit magna vulputate arcu, vel tempus metus leo non est. Etiam sit amet lectus quis est congue mollis. Phasellus congue lacus eget neque. Phasellus ornare, ante vitae consectetuer consequat, purus sapien ultricies dolor, et mollis pede metus eget nisi. Praesent sodales velit quis augue. <br><br><br>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Proin nibh augue, suscipit a, scelerisque sed, lacinia in, mi. Cras vel lorem. Etiam pellentesque aliquet tellus. Phasellus pharetra nulla ac diam. Quisque semper justo at risus. Donec venenatis, turpis vel hendrerit interdum, dui ligula ultricies purus, sed posuere libero dui id orci. Nam congue, pede vitae dapibus aliquet, elit magna vulputate arcu, vel tempus metus leo non est. Etiam sit amet lectus quis est congue mollis. Phasellus congue lacus eget neque. Phasellus ornare, ante vitae consectetuer consequat, purus sapien ultricies dolor, et mollis pede metus eget nisi. Praesent sodales velit quis augue. <br><br>','page','',1,'2015-12-26',1,'2015-12-26 19:08:39','2015-12-27 01:44:35');

INSERT INTO  posts_categories  VALUES (5,1,5),(6,1,4),(7,2,3),(8,2,8),(10,3,1),(15,3,3),(16,3,5);

INSERT INTO  posts_tags  VALUES (5,3,1),(6,3,6),(7,3,7),(8,1,7),(9,1,5);

INSERT INTO  settings  VALUES (1,'email_contact','sugiarto@gie-art.com','Email kontak form'),(2,'image_max_size','2000','Ukuran image dalam kb (kilo byte)'),(3,'file_max_size','3000','Ukuran file maksimal dalam kb (kilobyte)'),(4,'file_type','doc|zip|pdf|xlsx|xls|ppt|docx|pptx','Tipe file yang di ijinkan untk di upload'),(5,'image_type','gif|jpg|png','Tipe image yang diperbolehkan untuk di upload'),(6,'pagination_limit','10','Batas list /record (artikel, file, dll) per halaman'),(7,'main_office','Company Address',''),(8,'site_title','CI Blog - Basic CMS based on CodeIgniter 3',''),(18,'pagination_limit_directory','50','');

INSERT INTO  tags  VALUES (1,'CodeIgniter','codeigniter',1),(2,'Responsive','responsive',1),(3,'basic cms','basic-cms',1),(4,'tag baru','tag-baru',1),(5,'Simple CMS','simple-cms',1),(6,'Security Tips','security-tips',1),(7,'Hack & DDOS','hack-ddos',1);

INSERT INTO  users  VALUES (1,'127.0.0.1','administrator','$2a$07$SeBknntpZror9uyftVopmu61qg0ms8Qv1yV6FG.kQOSM.9QhmTo36','','admin@admin.com','',NULL,NULL,NULL,1268889823,1451155670,1,'Admin','istrator','ADMIN','0'),(9,'127.0.0.1','members','$2y$08$0TTfatwN6dXgJzX6RpYBzeRIrVsTEUs8ao7ldGewEyCywq4VoMXC.',NULL,'members@website.com','6d73486c9d4f501a24c7d9c9bfa3b47d68c471c0',NULL,NULL,NULL,1451071829,1451071890,1,'My','Member','','');

INSERT INTO  users_groups  VALUES (9,1,1),(10,1,2),(13,9,2);





